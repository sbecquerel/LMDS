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

class Selectmovies_GroupListController extends Core_Library_Controller_Action
{
	/**
	 * Action en charge de retourner la configuration du formulaire permettant
	 * la création / la modification d'un mailing model
	 */
	public function getAction()
	{
		$oUser = $this->GetProject()->GetCurrentUser();
		$iTeacherIdData = $this->getRequest()->getParam( 'teacher' );
		if ( ! $oUser->HasRole( Lmds_Utils::ROLE_ADMIN ) && $iTeacherIdData != $oUser->GetUserIdData() ) {
			throw new Core_Library_Exception( 'Forbidden access' );
		}
		
		parent::_getFormConfiguration();
	}
	
	/**
	 * If id_data parameter, show teacher group
	 * @param Core_Library_Event_Context $oCtx
	 */
//	protected function _get_get_afterExecute( Core_Library_Event_Context $oCtx )
//	{
//		$iIdTeacher = $this->getRequest()->getParam( 'id_data' );
//		if ( $iIdTeacher ) {
//			$oTeacherManager = new Lmds_Teacher_Manager( array( 'project' => $this->GetProject() ) );
//			$aIdGroup = $oTeacherManager->GetTeacherGroups( $iIdTeacher );
//			
//			if ( count( $aIdGroup ) ) {
//				$aDatasets = $oCtx->get( 'aDatasets' );
//			
//				/* @var $oDataset Core_Library_Resource_XML_DataSet */
//				foreach ( $aDatasets as $oDataset ) {
//					if ( $oDataset->Id() == 'group' ) {
//						$oDataset->GetZendDbSelect()->where( sprintf( 'g.id_data in (%s)', implode( ',', $aIdGroup ) ) );
//						break;
//					}
//				}
//			}
//		}
//	}


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
		$oForm->LoadFromFile( sprintf( '%s/modules/selectmovies/resources/groupList/form.get.xml', APPLICATION_PATH ) );
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
	 * Suppression du bouton retour pour les profs, et déconnexion pour l'admin
	 * @param \Core_Library_Event_Context $oContext
	 */
	protected function _get_get_render(\Core_Library_Event_Context $oContext) {
		
		$sElementToRemove = 'disconnect';
		if ( $this->GetProject()->GetCurrentUser()->HasRole( Lmds_Utils::ROLE_TEACHER ) ) {
			$sElementToRemove = 'back';
		}

		/* @var $oResourceJSON Core_Library_Resource_JSON */
		$oResourceJSON = $oContext->get( 'oResourceJSON' );

		$aJSON = $oResourceJSON->GetJSON();

		$aNewContent = array();
		for ( $i = 0; $i < count( $aJSON[ 'oLayout' ][ 'content' ] ); $i++ ) {
			if ( $aJSON[ 'oLayout' ][ 'content' ][ $i ][ 'id' ] != $sElementToRemove ) {
				$aNewContent[] = $aJSON[ 'oLayout' ][ 'content' ][ $i ];					
			}
		}
		$aJSON[ 'oLayout' ][ 'content' ] = $aNewContent;

		$oResourceJSON->SetJSON( $aJSON );
		
		parent::_get_render($oContext);
	}
}