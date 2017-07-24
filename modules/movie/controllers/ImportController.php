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

class Movie_ImportController extends Core_Library_Controller_Action
{
	/**
	 * Directory where to find videos
	 * @var string
	 */
	protected $_sMoviesDirectory;
	
	/**
	 * Handle sur le fichier csv d'import. Non setté s'il n'existe pas
	 * @var resource 
	 */
	protected $_rImportFile;
	
	/**
	 * Position des colonnes dans le fichier d'import où trouver les informations 
	 * relatives au fichier
	 */
	protected $_aImportFileStr = array(
		'filename' => 0,
 		'label' => 1,
		'sub_label' => 2,
		'teacher' => 6,
		'level'	=> 7,
		'movie_type' => 9,
		'description' => 3,
		'tags' => 4,
		'difficulty' => 8,
		'position' => 5	
	);
	
	/**
	 * Setté dans l'action robot, utilisé pour retrouver l'id_data d'un prof
	 * @var Core_Library_Resource_XML_DataSet
	 */
	protected $_oTeacherDataSet;

	/**
	 * Init method
	 */
	public function init() 
	{
		parent::init();
		$this->_sMoviesDirectory = sprintf( "%s/resources/videos", APPLICATION_PATH );
		
		$sImportFile = sprintf( "%s/resources/csv/import.csv", APPLICATION_PATH );
		if ( file_exists( $sImportFile ) ) {
			$handle = fopen( $sImportFile, 'r' );
			if ( $handle !== false ) {
				$this->_rImportFile = $handle;
			}
		}
	}

	/**
	 * Action en charge de retourner la configuration du formulaire permettant
	 * la création / la modification d'un mailing model
	 */
	public function getAction()
	{
		parent::_getFormConfiguration();
	}

	/**
	 * Retourne la valeur correspondant à un nom de variable dans le fichier 
	 * d'import.
	 * 
	 * @param array $aData
	 * @param string $sName
	 * @return string
	 */
	protected function _getValueInImportFile( array $aData, $sName )
	{
		if ( ! isset( $this->_aImportFileStr[ $sName ] ) ) {
			throw new Core_Library_Exception( sprintf( "Column %s not found in import file structure", $sName ) );
		}
		
		$sColNumber = $this->_aImportFileStr[ $sName ];
		
		if ( ! isset( $aData[ $sColNumber ] ) ) {
			throw new Core_Library_Exception( sprintf( "Column %s doesn't exists in CSV", $sName ) );
		}
		
		if ( $sName == 'tags' ) {
			$aTags = split( ',', $aData[ $sColNumber ] );
			for ( $i = 0; $i < count( $aTags ); $i++ ) {
				$sTag = trim( $aTags[ $i ] );
				if ( strlen( $sTag ) ) {
					$aTags[ $i ] = $sTag;
				}				
			}
			$aData[ $sColNumber ] = implode( ' ', $aTags );
		} else if ( $sName == 'teacher' ) {
			$iTeacherId = false;
			$sRequestedTeacher = strtolower( $aData[ $sColNumber ] );
			while ( ! $this->_oTeacherDataSet->EoF() ) {
				$sTeacher = strtolower( $this->_oTeacherDataSet->GetFieldValue( 'firstname' ) );
				if ( $sTeacher == $sRequestedTeacher ) {
					$iTeacherId = $this->_oTeacherDataSet->GetFieldValue( 'id_data' );
					break;
				}
				$this->_oTeacherDataSet->Next();
			}
			$this->_oTeacherDataSet->First();
			if ( $iTeacherId == false ) {
				throw new Core_Library_Exception( sprintf( "Teacher not found %s", $aData[ $sColNumber ] ) );
			}
			$aData[ $sColNumber ] = $iTeacherId;
		} else if ( $sName == 'level' ) {
			$aData[ $sColNumber ] = 
				$this->GetProject()->DicoManager()->code2Id( 'level', $aData[ $sColNumber ] );
		} else if ( $sName == 'movie_type' ) {
			$aData[ $sColNumber ] = 
				$this->GetProject()->DicoManager()->code2Id( 'movie_type', $aData[ $sColNumber ] );
		}
		
		return $aData[ $sColNumber ];
	}
	
	/**
	 * Renvoi le descriptif du fichier si trouvé dans le fichier d'import,
	 * ou false (renvoi aussi false si le fichier d'import n'existe pas)
	 * @param string $sRequestedFileName
	 * @return boolean
	 */
	protected function _getMovieDetailInImportFile( $sRequestedFileName )
	{
		if ( ! isset( $this->_rImportFile ) ) {
			return false;
		}
		
		rewind( $this->_rImportFile );
		
		while ( ( $aData = fgetcsv( $this->_rImportFile, 4096, ";" ) ) !== false ) {
			try {
				$sFileName = $this->_getValueInImportFile( $aData, 'filename' );
				if ( $sFileName == $sRequestedFileName || ( $sFileName . '.mp4' ) == $sRequestedFileName ) {
					return array(
						'label' => $this->_getValueInImportFile( $aData, 'label' ),
						'sub_label' => $this->_getValueInImportFile( $aData, 'sub_label' ),
						'teacher' => $this->_getValueInImportFile( $aData, 'teacher' ),
						'level' => $this->_getValueInImportFile( $aData, 'level' ),
						'movie_type' => $this->_getValueInImportFile( $aData, 'movie_type' ),
						'description' => $this->_getValueInImportFile( $aData, 'description' ),
						'tags' => $this->_getValueInImportFile( $aData, 'tags' ),
						'difficulty' => $this->_getValueInImportFile( $aData, 'difficulty' ),
						'position' => $this->_getValueInImportFile( $aData, 'position' )
					);
				}
			} catch ( Core_Library_Exception $e ) {

			}
		}
		
		return false;
	}


	/**
	 * Import de vidéos en se basant sur un fichier csv
	 */
	public function robotAction()
	{
		$this->_helper->viewRenderer->setNoRender(true);
		
		$oModelManager = Core_Library_Account::GetInstance()->GetCurrentProject()->ModelManager();

		$oForm = $this->_getForm();
		
		//Extract the <data_structure> part
		$oDataStructure = $oForm->ExtractDataStructureXML();
		
		$aDataSets = $oModelManager->Execute( $oDataStructure );
		
		// On set le dataset teacher, il servira ensuite pour récupérer l'id du prof
		// à la place de son prénom.
		foreach ( $aDataSets as $oDataSet ) {
			/* @var $oDataSet Core_Library_Resource_XML_DataSet */
			if ( $oDataSet->Id() == 'teachers' ) {
				$oDataSet->GetZendDbSelect()
					->where( 'l.id_group_parent=?', Lmds_Utils::ROOT_GROUP_ID )
					->where( 'l.id_role=?', Lmds_User_Teacher::ROLE_ID );
				$this->_oTeacherDataSet = $oDataSet;
				break;
			}
		}
		
		foreach ( $aDataSets as $oDataSet ) {
			/* @var $oDataSet Core_Library_Resource_XML_DataSet */
			if ( $oDataSet->Id() == 'movie' ) {
				$this->_scanDir( $this->_sMoviesDirectory, $oDataSet );
				
				$aRowData = $oDataSet->GetRowData()->ToArray();
				
				//Parsing
				for ( $i = 0; $i < count( $aRowData ); $i++ ) {
					$aMovieDetails = $this->_getMovieDetailInImportFile( $aRowData[ $i ][ 'filename' ] );
					if ( $aMovieDetails !== false ) {
						$aRowData[ $i ] = array_merge( $aRowData[ $i ], $aMovieDetails );	
						$aRowData[ $i ][ 'import' ] = 1;
					}
				}
				
				//Import
				$this->_importFromRowData( $aRowData );
				
				break;
			}
		}
	}

	/**
	 * Import movies from row data content
	 * @param array $aRowData
	 * @throws Core_Library_Exception
	 */
	protected function _importFromRowData( array $aRowData ) 
	{
		$oProject = $this->GetProject();
		
		foreach ( $aRowData as $aRow ) {
					
			if ( $aRow[ 'import' ] == 1 ) {
				$sFileFullPath = $aRow[ 'path' ];

				if ( ! file_exists( $sFileFullPath ) ) {
					throw new Core_Library_Exception( sprintf( 
						"File not found: %s", $sFileFullPath
					) );
				}
				
				// On vérifie si le fichier n'est pas déjà en base pour éviter les doublons
				$oSelect = $oProject->Db()
					->select()
					->from( $oProject->GetVarSet( 'movie' )->DataTableName(), new Zend_Db_Expr( 'count(*)') )
					->where( 'label = ?', $aRow[ 'label' ] )
					->where( 'teacher = ?', $aRow[ 'teacher' ] )
					->where( 'level = ?', $aRow[ 'level' ] )
					->where( 'movie_type = ?', $aRow[ 'movie_type' ] );
				
				if ( $oSelect->query()->fetchColumn() == 1 ) {
					unlink( $sFileFullPath );
				} else {
					$oManager = Core_Library_File_Manager::Factory();
					$oFile = $oManager->CreateFromUploadData( array(
						'filename' => $aRow[ 'filename' ],
						'filetype' => filetype( $sFileFullPath ),
						'filesize' => filesize( $sFileFullPath ),
						'filepath' => $sFileFullPath,
						'status' => 0
					) );
					$iFileId = $oManager->SaveFile( $oFile );

					$sFinalDest = $oFile->GetFileFullPath();		
					if ( ! rename( $sFileFullPath, $sFinalDest ) ) {
						throw new Core_Library_Exception( sprintf(
							"Can't move file %s to %s", $sFileFullPath, $sFinalDest
						) );
					}

					$aReturn = $oProject->GetVarSet( 'movie' )->SimpleInsertData( array(
						'label' => $aRow[ 'label' ],
						'sub_label' => $aRow[ 'sub_label' ],
						'teacher' => $aRow[ 'teacher' ],
						'level' => $aRow[ 'level' ],
						'movie_type' => $aRow[ 'movie_type' ],
						'description' => $aRow[ 'description' ],
						'tags' => $aRow[ 'tags' ],
						'difficulty' => $aRow[ 'difficulty' ],
						'position' => $aRow[ 'position' ]
					) );

					$oProject->GetVarSet( 'movie_file' )->SimpleInsertData( array(
						'id_movie' => $aReturn[ 'insert_id' ],
						'id_file' => $iFileId
					) );	
				}
			}
		}
	}


	/**
	 * Action en charge de sauvegarder les données liées à un mailing model
	 * (création ou mise à jours)
	 */
	public function saveAction()
	{
		$this->_helper->viewRenderer->setNoRender(true);
		
		$oDataJson = new Core_Library_Resource_JSON();
		$oDataJson->SetContent( $this->getRequest()->getParam( 'data' ) );
		
		$aData = $oDataJson->GetJSON();
		
		foreach ( $aData[ 'data' ] as $aDataSet ) {
			if ( $aDataSet[ 'id' ] == 'movie' ) {
				
				$aRowData = $aDataSet[ 'rowdata' ];
				
				$this->_importFromRowData( $aRowData );
				
				break;
			}
		}		
		
		header('Content-type: application/json');
		echo Zend_Json::encode( array(	
			'key_list' => array(),
			'notifier' => array( 'warnings' => array() ) )		
		);
	}

	/**
	 * Action en charge de renvoyer le dataset demandé
	 */
	public function getdatasetAction()
	{		
		parent::_getDataset();
	}

	/**
	 * Renvoi le formulaire
	 * @return \Core_Library_Resource_XML_Frame_Form
	 */
	protected function _getForm()
	{
		// Récupération du XML de formulaire
		$oForm = new Core_Library_Resource_XML_Frame_Form();
		$oForm->LoadFromFile( sprintf( '%s/modules/movie/resources/import/form.get.xml', APPLICATION_PATH ) );
		$oForm->SetProject( Core_Library_Account::GetInstance()->GetCurrentProject() );
		
		return $oForm;
	}


	/**
	 * Méthode commune de récupération du xml de formulaire, utilisé par les actions
	 * get et getdataset
	 * @param Core_Library_Event_Context $oContext
	 */
	protected function _commonRetrieveForm( Core_Library_Event_Context $oContext )
	{
		$oForm = $this->_getForm();
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
	 * 
	 * @param string $sDirectory
	 * @param Core_Library_Resource_XML_DataSet $oDataSet
	 * @throws Core_Library_Exception
	 */
	protected function _scanDir( $sDirectory, Core_Library_Resource_XML_DataSet $oDataSet )
	{
		$rDir = opendir( $sDirectory );
		if ( ! $rDir ) {
			throw new Core_Library_Exception( sprintf( 
				"Can't open directory %s", $sDirectory ) );
		}
		
		while ( false !== ( $sEntry = readdir( $rDir ) ) ) {
			if ( $sEntry != '.' && $sEntry != '..' && $sEntry != '.DS_Store' ) {
				if ( is_file( $sDirectory . DIRECTORY_SEPARATOR . $sEntry ) ) {
					$oDataSet->AddRecord( array(
						'id_data' => uniqid(),
						'filename' => $sEntry,
						'path' => $sDirectory . DIRECTORY_SEPARATOR . $sEntry,
						'label' => $sEntry,
						'sub_label' => null,
						'teacher' => null,
						'level'	=> null,
						'movie_type' => null,
						'description' => null,
						'import' => null,
						'tags' => null,
						'difficulty' => null,
						'position' => null
					) );
				} else if ( is_dir( $sDirectory . DIRECTORY_SEPARATOR . $sEntry ) ) {
					$this->_scanDir( $sDirectory . DIRECTORY_SEPARATOR . $sEntry, $oDataSet );
				}
			}
		}
		
		closedir( $rDir );
	}
	
	/**
	 * Add condition to dataquery search to get only teachers from user varset
	 * @param Core_Library_Event_Context $oCtxt
	 */
	protected function _get_get_afterExecute( Core_Library_Event_Context $oCtxt )
	{
		/* @var $oDataSet Core_Library_Resource_XML_DataSet */
		$aDataSets = $oCtxt->get( 'aDatasets' );
		
		foreach ( $aDataSets as $oDataSet ) {
			if ( $oDataSet->Id() == 'movie' ) {
				$this->_scanDir( $this->_sMoviesDirectory, $oDataSet );
			// Add condition to get only teachers from user varset
			} else if ( $oDataSet->Id() == 'teachers' ) {
				$oDataSet->GetZendDbSelect()
					->where( 'l.id_group_parent=?', Lmds_Utils::ROOT_GROUP_ID )
					->where( 'l.id_role=?', Lmds_User_Teacher::ROLE_ID );
			}
		}
	}
}
