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

class Selectmovies_MoviesController extends Core_Library_Controller_Action
{
	const	MOVIE_DATASET_ID = 'movie';
	
	/**
	 * Add teacher id in request parameter, found with id_group
	 * @throws InvalidArgumentException
	 */
	protected function _setTeacherParam()
	{
		$iIdGroup = $this->getRequest()->getParam( 'id_group', false );
		if ( ! $iIdGroup ) {
			throw new InvalidArgumentException( 'Parameter "id_group" not found' );
		}
		
		$oLmdsGroupManager = new Lmds_Group_Manager( array( 'project' => $this->GetProject() ) );
		
		$this->getRequest()->setParam( 'teacher', $oLmdsGroupManager->GetGroupTeacher( $iIdGroup ) );
	}
	
	/**
	 * Action en charge de retourner la configuration du formulaire permettant
	 * la création / la modification d'un mailing model
	 */
	public function getAction()
	{
		$this->_setTeacherParam();
		
		//Sécurité pour éviter qu'un prof voit les vidéos d'un autre
		$oUser = $this->GetProject()->GetCurrentUser();
		$iTeacherIdData = $this->getRequest()->getParam( 'teacher' );
		if ( ! $oUser->HasRole( Lmds_Utils::ROLE_ADMIN ) && $iTeacherIdData != $oUser->GetUserIdData() ) {
			throw new Core_Library_Exception( 'Forbidden access' );
		}
		
		// On détermine quelles vidéos pédago on affiche, celles de Simon, ou celles de Stéphane.
		// Si Prof = Stéphane, alors on affiche les vidéos Pédago de Stéphane
		// Dans tous les autres cas on affiche les vidéos de Simon
		if ( $iTeacherIdData == Lmds_Utils::TEACHER_STEPHANE_ID_DATA ) {
			$this->getRequest()->setParam( 'teacher_pedago', Lmds_Utils::TEACHER_STEPHANE_ID_DATA );
		} else {
			$this->getRequest()->setParam( 'teacher_pedago', Lmds_Utils::TEACHER_SIMON_ID_DATA );
		}
		
		parent::_getFormConfiguration();
	}
	
	/**
	 * Set "selected" column in dataset movie
	 * @param \Core_Library_Event_Context $oContext
	 */
	protected function _get_get_afterExecute(\Core_Library_Event_Context $oContext) 
	{
		$aDatasets = $oContext->get( 'aDatasets' );
		
		/* @var $oDataset Core_Library_Resource_XML_DataSet */
		foreach ( $aDatasets as $oDataset ) {
			if ( $oDataset->Id() == self::MOVIE_DATASET_ID ) {
				$oMovieManager = new Lmds_Movie_Manager( array( 'project' => $this->GetProject() ) );
				$iIdGroup = $this->getRequest()->getParam( 'id_group' );
				
				$oDataset->First();
				while ( $oDataset->EoF() === false ) {
					$oRowData = $oDataset->GetRowData();
					$iIdMovie = $oRowData->GetFieldValue( 'id_data' );
					if ( $oMovieManager->IsMovieInGroup( $iIdGroup, $iIdMovie ) ) {
						$oDataset->GetRowData()->SetFieldValue( 'selected', 1 );
					} else {
						$oDataset->GetRowData()->SetFieldValue( 'selected', 0 );
					}
					$oDataset->Next();
				}
				// Reset cursor 
				$oDataset->First();
				break;
			}
		}
	}

	/**
	 * Action en charge de renvoyer le dataset demandé
	 */
//	public function getdatasetAction()
//	{		
//		$this->_setTeacherParam();
//		
//		parent::_getDataset();
//	}

	/**
	 * Get movie dataset rowdata in request
	 * @return array
	 */
	protected function _getRowData( ) 
	{
		$oDataJson = new Core_Library_Resource_JSON();
		$oDataJson->SetContent( $this->getRequest()->getParam('data' ) );
		$aData = $oDataJson->GetJSON();
		
		foreach ( $aData[ 'data' ] as $aDataset ) {
			if ( $aDataset[ 'id' ] == self::MOVIE_DATASET_ID ) {
				return $aDataset[ 'rowdata' ];
			}
		}
		
		throw new Core_Library_Exception( sprintf( 'Dataset %s not found', self::MOVIE_DATASET_ID ) );
	}

	/**
	 * Save user selection
	 */
	public function saveAction()
	{
		$this->_helper->viewRenderer->setNoRender(true);

		$iIdGroup = $this->getRequest()->getParam( 'id_group', false );
		if ( $iIdGroup === false ) {
			throw new InvalidArgumentException( 'Parameter "id_group" is required' );
		}
		
		$oMovieManager = new Lmds_Movie_Manager( array( 'project' => $this->GetProject() ) );		
		$aRowData = $this->_getRowData();
		
		foreach ( $aRowData as $aRow ) {
			$iIdMovie = $aRow[ 'id_data' ];
			if ( $aRow[ 'selected' ] ) {
				$oMovieManager->SetGroupMovie( $iIdGroup, $iIdMovie );
			} else {
				$oMovieManager->UnsetGroupMovie( $iIdGroup, $iIdMovie );
			}
		}
		
		$aReturn = array(	
			'key_list' => array(),
			'notifier' => array( 'warnings' => array() )
		);
		
		header('Content-type: application/json');
		echo Zend_Json::encode( $aReturn );
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
		$oForm->LoadFromFile( sprintf( '%s/modules/selectmovies/resources/movies/form.get.xml', APPLICATION_PATH ) );
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
//	protected function _getdataset_retrieveForm( Core_Library_Event_Context $oContext )
//	{
//		$this->_commonRetrieveForm( $oContext );
//	}	
	
	/**
	 * Send form JSON. 
	 * Add id group in JSON, and set teacher id in exit button redirection
	 *
	 * @param Core_Library_Event_Context $oContext
	 */
	protected function _get_get_render(Core_Library_Event_Context $oContext)
	{
		/* @var $oResourceJSON Core_Library_Resource_JSON */
		$oResourceJSON = $oContext->get('oResourceJSON');
		$aData = $oResourceJSON->GetJSON();
		
		// Add id group in array
		$aData[ 'iIdGroup' ] = $this->getRequest()->getParam( 'id_group' );
		
		// Set teacher ID for redirection on group select page
		for ( $i = 0; $i < count( $aData[ 'oLayout' ][ 'content' ] ); $i++ ) {
			if ( 
				$aData[ 'oLayout' ][ 'content' ][ $i ][ 'w' ] == 'WidgetButton' &&
				isset( $aData[ 'oLayout' ][ 'content' ][ $i ][ 'redirection' ][ 'params' ][ 'value' ] ) &&
				$aData[ 'oLayout' ][ 'content' ][ $i ][ 'redirection' ][ 'params' ][ 'value' ][ 'alias' ] == 'teacher'
			) {
				$aData[ 'oLayout' ][ 'content' ][ $i ][ 'redirection' ][ 'params' ][ 'value' ][ 'value' ] = 
					$this->getRequest()->getParam( 'teacher' );
			}
		}
				
		header('Content-type: application/json');
		echo Zend_Json::encode( $aData );
	}
}
