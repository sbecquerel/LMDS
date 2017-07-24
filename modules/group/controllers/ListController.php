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

class Group_ListController extends Core_Library_Controller_Action
{
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
	 * Action en charge de renvoyer le dataset demandé
	 */
	public function getdatasetAction()
	{
		parent::_getDataset();
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
		$oForm->LoadFromFile( sprintf( '%s/modules/group/resources/list/form.get.xml', APPLICATION_PATH ) );
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
	
		
	/**
	 * Delete group(s)
	 * @todo: supprimer les utilisateurs qui sont dans le groupe voozanoo lié
	 * @todo: supprimer le groupe voozanoo
	 * @todo: supprimer les vidéos liées au groupe dans le varset "Group - Movie"
	 */
	public function deleteAction()
	{
		$this->_helper->viewRenderer->setNoRender(true);
		
		$aData = $this->getRequest()->getParam('data', NULL);
		if ( $aData == null ) {
			throw new Exception('Bad parameters, data and id_varset must be fill to process to delete');
		}

		$oResourceJSON = new Core_Library_Resource_JSON();
		$oResourceJSON->SetContent( $this->getRequest()->getParam( 'data' ) );
		$aRecordsIds = $oResourceJSON->GetJSON( true );

		if ( is_array( $aRecordsIds ) == false || count( $aRecordsIds ) == 0 ) {
			throw new Exception('Ids not found');
		}
		
		$aJsonReturn = array( 'success' => true, 'records' => array() );
		$oLmdsGroupManager = new Lmds_Group_Manager( array( 'project' => $this->GetProject() ) );
		foreach ( $aRecordsIds as $iIdGroup ) {
			$oLmdsGroupManager->DeleteGroup( $iIdGroup );
			$aJsonReturn[ 'records' ] = array( $iIdGroup => array( 'success' => true ) );
		}
		
		header('Content-type: application/json');
		echo Zend_Json::encode( $aJsonReturn );
	}
}
