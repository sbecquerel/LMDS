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

class Student_MoviesController extends Core_Library_Controller_Action
{
	const	MOVIE_DATASET_ID = 'movie';
	
	const	HOME_IDENTITY_1 = '%1$s %2$s<br>';
	const	HOME_IDENTITY_2 = '%1$s<br>';
	const	HOME_IDENTITY_3 = '%2$s<br>';
	const	HOME_IDENTITY_4 = '';
	
	const	HOME_NIV = '<span class="label %4$s">Niv %3$s</span>';
	
	const	HOME_HELLO_1 = 'Salut %1$s! Tu as <span id="unplayedCounter-main" class="label label-info">%2$s</span> video(s) non lue(s)!';
	const	HOME_HELLO_2 = 'Tu as <span id="unplayedCounter-main" class="label label-info">%2$s</span> video(s) non lue(s)!';
	const	HOME_HELLO_3 = 'Salut %1$s!';
	
	protected $_aLevelLabelClass = array(
		1 => 'label-success',
		2 => 'label-primary',
		3 => 'label-danger',
		4 => 'label-default',
		5 => 'label-warning'
	);
			
	
	/**
	 * Action en charge de retourner la configuration du formulaire permettant
	 * la création / la modification d'un mailing model
	 */
	public function getAction()
	{
		parent::_getFormConfiguration();
	}

	/**
	 * Fill dataset with info_movie
	 * @param \Core_Library_Event_Context $oContext
	 */
	public function _get_afterExecute(\Core_Library_Event_Context $oContext) 
	{
		$aDatasets = $oContext->get( 'aDatasets' );
		/* @var $oDataset Core_Library_Resource_XML_DataSet */
		foreach ( $aDatasets as $oDataset ) {
			if ( $oDataset->Id() == 'movie' ) {
				$oDb = $this->GetProject()->Db();
				
				$oSelect = $oDb
					->select()
					->from( 
						array( 'm' => Core_Library_TName::GetVarsetData( Lmds_Movie::MOVIE_VARSET_PREFIX ) ),
						array( 'id_data', 'label', 'sub_label', 'description', 'movie_type', 'level', 'tags', 'difficulty' )
					)
					->joinLeft(
						array( 'p' => Core_Library_TName::GetVarsetData( Lmds_Movie_Manager::PLAYED_MOVIE_VARSET_PREFIX ) ),
						'm.id_data=p.id_movie',
						array( new Zend_Db_Expr( 
							sprintf( 
								'SUM(if( p.id_data IS NOT NULL AND p.id_owner=%d, 1, 0)) as `played`', 
								$this->GetProject()->GetCurrentUser()->GetUserId() ) ), 
							'favorite' 
						)
					)
					->joinLeft(
						array( 'u' => Core_Library_TName::GetVarsetData( 'user' ) ),
						'm.teacher=u.id_data',
						array( 'teacher' => new Zend_Db_Expr( 'concat_ws( \' \', firstname, lastname)' ) )
					)
					->where( 'movie_type=13 or movie_type=45' )
					->group( 'm.id_data' )
					->order( 'm.position' );
				
				$oResultSet = $oSelect->query();
				
				$oDataset->AddRecords( $oResultSet->fetchAll() );
							
//				for ( $level = 1; $level < 6; $level++ ) {
//					for ( $i = 1; $i < 100; $i++ ) {
//						$oDataset->GetRowData()->AddRecord( array( 
//							'played' => 0,
//							'id_data' => 3,
//							'label' => "Video Group #$i",
//							'description' => "C'est l'histoire d'un gars...",
//							'level' => "$level",
//							'movie_type' => "11"
//						));
//					}
//					for ( $i = 1; $i < 100; $i++ ) {
//						$oDataset->GetRowData()->AddRecord( array( 
//							'played' => 0,
//							'id_data' => 3,
//							'label' => "Video Global #$i",
//							'description' => "C'est l'histoire d'un gars...",
//							'level' => "$level",
//							'movie_type' => "12"
//						));
//					}
//				}
//				for ( $i = 1; $i < 100; $i++ ) {
//					$oDataset->GetRowData()->AddRecord( array( 
//						'played' => 0,
//						'id_data' => 3,
//						'label' => "Video Info. #$i",
//						'description' => "C'est l'histoire d'un gars...",
//						'level' => "$level",
//						'movie_type' => "13"
//					));
//				}
				
				break;
			} 
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
		$oForm->LoadFromFile( sprintf( '%s/modules/student/resources/movies/form.get.xml', APPLICATION_PATH ) );
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
	 * Set identity bloc content
	 * @param \Core_Library_Event_Context $oContext
	 * @throws Core_Library_Exception
	 */
	protected function _get_render(\Core_Library_Event_Context $oContext) {
		/* @var $oResourceJSON Core_Library_Resource_JSON */
		$oResourceJSON = $oContext->get( 'oResourceJSON' );
		$oCurrentUser = $this->GetProject()->GetCurrentUser();
		$sFirstName = $oCurrentUser->GetFirstname();
		$sLastName = $oCurrentUser->GetLastname();
		$aJson = $oResourceJSON->GetJSON();
		
		for ( $i = 0; $i < count( $aJson[ 'oLayout' ][ 'content' ] ); $i++ ) {
			if ( $aJson[ 'oLayout' ][ 'content' ][ $i ][ 'id' ] == 'identity' ) {
				
				$oGroupManager = new Lmds_Group_Manager( array( 'project' => $this->GetProject() ) );
				$aStudentGroups = $oGroupManager->GetStudentGroups( $oCurrentUser );
				
				if ( ! count( $aStudentGroups ) ) {
					throw new Core_Library_Exception( 'No group found for student!' );
				}
				
				$aLevels = array();
				foreach ( $aStudentGroups as $iIdGroup ) {
					/* @var $oGroup Lmds_Group */
					$oGroup = $oGroupManager->CreateGroupFromDb( $iIdGroup );
					$aLevels[] = $oGroup->GetLevel();
				}
				
				// On ne garde qu'un seul niveau
				// @todo: récupérer le plus haut niveau, se baser sur la position ?
				$sLevel = $aLevels[ count( $aLevels ) - 1 ];
				
				if ( $sLastName != null ) {
					$sLastName = strtoupper( $sLastName );
				}
				$sHomeIdentity = self::HOME_IDENTITY_1;
				if ( $sFirstName != null && $sLastName == null ) {
					$sHomeIdentity = self::HOME_IDENTITY_2;
				} else if ( $sFirstName == null && $sLastName != null ) {
					$sHomeIdentity = self::HOME_IDENTITY_3;
				} else if ( $sFirstName == null && $sLastName == null ) {
					$sHomeIdentity = self::HOME_IDENTITY_4;
				}				
				$sHomeIdentity .= self::HOME_NIV;
				
				$sSimpleLevel = (int) substr( $sLevel, 0, 1 );
				if ( ! isset( $this->_aLevelLabelClass[ $sSimpleLevel ] ) ) {
					throw new Core_Library_Exception( sprintf( "Level unknow %s", $sSimpleLevel ) );
				}
				$sLevelClass = $this->_aLevelLabelClass[ $sSimpleLevel ];
				
				$aJson[ 'oLayout' ][ 'content' ][ $i ][ 'value' ] = 
					sprintf( $sHomeIdentity, $sFirstName, $sLastName, $sLevel, $sLevelClass );
			
			} if ( $aJson[ 'oLayout' ][ 'content' ][ $i ][ 'id' ] == 'hello' ) {
				
				$oMovieDataset = false;
				
				$aDatasets = $oContext->get( 'aDatasets' );
				/* @var $oDataset Core_Library_Resource_XML_DataSet */
				foreach ( $aDatasets as $oDataset ) {
					if ( $oDataset->Id() == 'movie' ) {
						$oMovieDataset = $oDataset;
						break;
					}
				}
				
				if ( ! $oMovieDataset ) {
					throw new Core_Library_Exception( 'Movie dataset not found' );
				}
				
				$iUnPlayed = 0;
				
				$oMovieDataset->GetRowData()->First();				
				while ( false === $oMovieDataset->GetRowData()->EoF() ) {
					if ( $oMovieDataset->GetRowData()->GetFieldValue( 'played' ) != 1 &&
						 // On ne prend pas en compte les vidéos "info" (=13) et les "faq" (=45)
						 $oMovieDataset->GetRowData()->GetFieldValue( 'movie_type' ) != 13 &&
						 $oMovieDataset->GetRowData()->GetFieldValue( 'movie_type' ) != 45 ) {
						$iUnPlayed++;
					}
					$oMovieDataset->GetRowData()->Next();
				}				
				$oMovieDataset->GetRowData()->First();
				
				if ( $iUnPlayed > 0 && $sFirstName != null ) {
					$sHomeHello = self::HOME_HELLO_1;
				} else if ( $iUnPlayed > 0 && $sFirstName == null ) {
					$sHomeHello = self::HOME_HELLO_2;
				} else if ( $iUnPlayed == 0 && $sFirstName != null ) {
					$sHomeHello = self::HOME_HELLO_3;
				} else {
					$sHomeHello = '';
				}
				
				$aJson[ 'oLayout' ][ 'content' ][ $i ][ 'value' ] = 
					sprintf( $sHomeHello, $sFirstName, $iUnPlayed );
			}
		}
		
		$oResourceJSON->SetJSON( $aJson );
		
		parent::_get_render( $oContext );
	}
	
	/**
	 * Set video favorite value
	 * @param boolean $bFavorite
	 * @param integer $iIdMovie
	 * @throws Core_Library_Exception
	 */
	protected function _setFavoriteValue( $bFavorite, $iIdMovie )
	{
		$oProject = $this->GetProject();
		$oUser = $oProject->GetCurrentUser();
		$oMovieManager = new Lmds_Movie_Manager( array( 'project' => $oProject ) );
		
		/* @var $oMovie Lmds_Movie */
		$oMovie = $oMovieManager->CreateMovieFromDb( $iIdMovie );
		
		if ( ! $oMovieManager->CheckStudentAuthorization( $oUser, $iIdMovie ) && 
			   $oMovie->GetMovieType() != Lmds_Movie::TYPE_INFO ) {
			throw new Core_Library_Exception( 'Student can\'t access to this movie' );
		}	
			
		if ( $bFavorite ) {
			$oMovieManager->MarkMovieAsFavorite( $oUser, $iIdMovie );
		} else {
			$oMovieManager->UnsetFavorite( $oUser, $iIdMovie );
		}		
	}

	/**
	 * Set video as favorite 
	 * @throws Core_Library_Exception
	 */
	public function setFavoriteAction()
	{
		$this->_helper->viewRenderer->setNoRender(true);
	
		$iIdMovie = $this->getParam( 'id_movie', false );
		if ( $iIdMovie === false ) {
			throw new Core_Library_Exception( 'id_movie parameter is required' );
		}
		
		$this->_setFavoriteValue( true, $iIdMovie );
	}
	
	/**
	 * Unset video as favorite 
	 * @throws Core_Library_Exception
	 */
	public function unsetFavoriteAction()
	{
		$this->_helper->viewRenderer->setNoRender(true);
	
		$iIdMovie = $this->getParam( 'id_movie', false );
		if ( $iIdMovie === false ) {
			throw new Core_Library_Exception( 'id_movie parameter is required' );
		}
		
		$this->_setFavoriteValue( false, $iIdMovie );
	}
	
	/**
	 * Retrieve PDF file
	 * @throws Core_Library_Exception
	 */
	public function getPdfAction()
	{
		$this->_helper->viewRenderer->setNoRender(true);
	
		$iIdPdf = $this->getParam( 'id_pdf', false );
		if ( $iIdPdf === false ) {
			throw new Core_Library_Exception( 'id_pdf parameter is required' );
		}
		
		$oProject = $this->GetProject();
		$oMovieManager = new Lmds_Movie_Manager( array( 'project' => $oProject ) );
		/* @var $oMovie Lmds_Movie */
		$oMovie = $oMovieManager->CreateMovieFromPdf( $iIdPdf );

		$oPdfFile = $oMovie->GetPdfFile();
		if ( $oPdfFile == null ) {
			echo "Pdf not found";
			return;
		}
				
		header( "Content-type:application/pdf" );
		readfile( $oPdfFile->GetFileFullPath() );
	}
}
