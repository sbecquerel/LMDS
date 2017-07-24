<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * This is VOOZANOO, a program. Contact voozanoo@epiconcept.fr, or   *
 * see http://www.voozanoo.net/ for more information.                *
 *                                                                   *
 * Copyright 2001-2010 Epiconcept                                    *
 *                                                                   *
 * This program is free software; you can redistribute it and/or     *
 * modify it under the terms of the GNU General Public License as    *
 * published by the Free Software Foundation - version 2             *
 *                                                                   *
 * This program is distributed in the hope that it will be useful,   *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of    *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the     *
 * GNU General Public License in file COPYING for more details.      *
 *                                                                   *
 * You should have received a copy of the GNU General Public         *
 * License along with this program; if not, write to the Free        *
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor,       *
 * Boston, MA 02111, USA.                                            *
 *                                                                   *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

class Group_EditController extends Core_Library_Controller_Action
{
	const	GROUP_DATASET_ID = 'group';
	
	/**
	 * Action en charge de retourner la configuration du formulaire permettant
	 * la création / la modification d'un mailing model
	 */
	public function getAction()
	{
		parent::_getFormConfiguration();
	}

	/**
	 * Action en charge de sauvegarder les données liées à un mailing model
	 * (création ou mise à jours)
	 */
	public function saveAction()
	{
		parent::_saveForm();
	}

	/**
	 * Return dataset "group" row data
	 * @param Core_Library_Resource_JSON $oDataJson
	 * @return array
	 */
	protected function _getRowData( Core_Library_Resource_JSON $oDataJson )
	{
		$aData = $oDataJson->GetJSON();

		if ( ! isset( $aData[ 'data' ][ 0 ][ 'id' ] ) || $aData[ 'data' ][ 0 ][ 'id' ] != self::GROUP_DATASET_ID ) {
			throw new Core_Library_Exception( sprintf( 'Dataset "%s" not found', self::GROUP_DATASET_ID ) );
		}

		if ( ! isset( $aData[ 'data' ][ 0 ][ 'rowdata' ][ 0 ] ) ) {
			throw new Core_Library_Exception( sprintf( 'Row data not found in dataset "%s"', self::GROUP_DATASET_ID ) );
		}
		
		return $aData[ 'data' ][ 0 ][ 'rowdata' ][ 0 ];
	}
	
	/**
	 * Create or update group
	 * @param Core_Library_Event_Context $oCtxt
	 */
	public function _save_save_render( Core_Library_Event_Context $oCtxt )
	{				
		/* @var oOutputJson Core_Library_Resource_JSON */		
		$oOutputJson = $oCtxt->get( 'oOutputJson' );
		/* @var $oDataJson Core_Library_Resource_JSON */		
		$oDataJson = $oCtxt->get( 'oDataJson' );
		
		$aOutput = $oOutputJson->GetJSON();
		
		// if no error create or update voozanoo group
		if ( ! count( $aOutput[ 'notifier' ][ 'warnings' ] ) ) {
			
			$oLmdsGroupManager = new Lmds_Group_Manager( array( 'project' => $this->GetProject() ) );
			$aRowData = $this->_getRowData( $oDataJson );
			
			// Key found => insert mode
			if ( isset( $aOutput[ 'key_list' ][ self::GROUP_DATASET_ID ][ 'id_data' ] ) ) {

				$iIdData = current( $aOutput[ 'key_list' ][ self::GROUP_DATASET_ID ][ 'id_data' ] );
				
				// Create group
				$iVznIdGroup = $oLmdsGroupManager->CreateVznGroup( $aRowData[ 'label' ] );
				
				// Link record to new group
				$oLmdsGroupManager->SaveGroupInVznGroup( $iIdData, $iVznIdGroup );
				
				// Move teacher in group
				$oLmdsGroupManager->MoveTeacherInVznGroup( $aRowData[ 'teacher' ], $iVznIdGroup );
				
			} else {
				$iIdData = $aRowData[ 'id_data' ];
				
				// Get group ID
				$iVznIdGroup = $oLmdsGroupManager->GetGroupVznIdGroup( $iIdData );
				
				// Update group
				$oLmdsGroupManager->UpdateVznGroup( $iVznIdGroup, $aRowData[ 'label' ] );
				
				if ( ! $oLmdsGroupManager->IsTeacherInVznGroup( $aRowData[ 'teacher' ], $iVznIdGroup ) ) {
					// Delete all teachers from group
					$oLmdsGroupManager->RemoveTeachersFromVznGroup( $iVznIdGroup );
					
					// Move teacher in group
					$oLmdsGroupManager->MoveTeacherInVznGroup( $aRowData[ 'teacher' ], $iVznIdGroup );
				}
				
			}
		}

		parent::_save_render( $oCtxt );
	}

	/**
	 * Action en charge de renvoyer le dataset demandé
	 */
	public function getdatasetAction()
	{		
		parent::_getDataset();
	}

	/**
	 * Add condition to dataquery search to get only teachers from user varset
	 * @param Core_Library_Event_Context $oCtxt
	 */
	protected function _getdataset_getdataset_afterExecute( Core_Library_Event_Context $oCtxt )
	{
		/* @var $oDataSet Core_Library_Resource_XML_DataSet */
		$oDataSet = $oCtxt->get( 'oDataSet' );
		if ( $oDataSet->Id() == 'search' ) {
			// Add condition to get only teachers. (@depends join part in XML form for dataquery search).
			$oDataSet->GetZendDbSelect()
				->where( 'l.id_group_parent=?', Lmds_Utils::ROOT_GROUP_ID )
				->where( 'l.id_role=?', Lmds_User_Teacher::ROLE_ID );
		}
	}

	/**
	 * Méthode commune de récupération du xml de formulaire, utilisé par les actions
	 * get et getdataset
	 * @param Core_Library_Event_Context $oContext
	 */
	protected function _commonRetrieveForm( Core_Library_Event_Context $oContext )
	{
		// Récupération du XML de formulaire
		$oForm = new Core_Library_Resource_XML_Frame_Form();
		$oForm->LoadFromFile( sprintf( '%s/modules/group/resources/edit/form.get.xml', APPLICATION_PATH ) );
		$oForm->SetProject( Core_Library_Account::GetInstance()->GetCurrentProject() );
		$oContext->add( 'oForm', $oForm );
	}

	/**
	 * Hook propre à l'action "getAction" :
	 *
	 * En charge d'instancier un objet Core_Library_Resource_XML_Frame_Form
	 * depuis le Xml contenu dans les ressources de ce module
	 *
	 * @param Core_Library_Event_Context $oContext
	 */
	protected function _get_retrieveForm( Core_Library_Event_Context $oContext )
	{
		$this->_commonRetrieveForm( $oContext );
	}

	/**
	 * Hook propre à l'action "getdatasetAction":
	 *
	 * En charge d'instancier un objet Core_Library_Resource_XML_Frame_Form
	 * depuis le Xml contenu dans les ressources de ce module
	 *
	 * @param Core_Library_Event_Context $oContext
	 */
	protected function _getdataset_retrieveForm( Core_Library_Event_Context $oContext )
	{
		$this->_commonRetrieveForm( $oContext );
	}	
}
