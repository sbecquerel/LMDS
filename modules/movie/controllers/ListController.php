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

class Movie_ListController extends Core_Library_Controller_Action
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
	 * Récupère toutes les rows du varset played_movie correspondant aux id_movie
	 * contenus dans $aMoviesIds
	 * @param array $aMoviesIds
	 * @return array
	 */
	protected function _getRowsInPlayedVarset( array $aMoviesIds )
	{
		return $this->_getRowsInVarsetLinkedToMovies(
			$aMoviesIds, 
			$this->GetProject()->GetVarSet( Lmds_Movie_Manager::PLAYED_MOVIE_VARSET_PREFIX )
		);
	}

	/**
	 * Récupère toutes les rows du varset grp_movie correspondant aux id_movie
	 * contenus dans $aMoviesIds
	 * @param array $aMoviesIds
	 * @return array
	 */
	protected function _getRowsInGrpMovieVarset( array $aMoviesIds )
	{
		return $this->_getRowsInVarsetLinkedToMovies(
			$aMoviesIds, 
			$this->GetProject()->GetVarSet( Lmds_Movie_Manager::GROUP_MOVIE_VARSET_NAME )
		);
	}	
	
	/**
	 * 
	 * @param array $aMoviesIds
	 * @param Core_Library_Resource_XML_VarSet $oVarset
	 * @return type
	 */
	protected function _getRowsInVarsetLinkedToMovies( array $aMoviesIds, Core_Library_Resource_XML_VarSet $oVarset )
	{
		$oSelect = $this->GetProject()->Db()
			->select()
			->from( 
				$oVarset->DataTableName(),
				'id_data'
			)
			->where( new Zend_Db_Expr( sprintf( "id_movie in (%s)", implode( ',', $aMoviesIds ) ) ) );
			
		$oStatement = $oSelect->query();
		$aRows = array();
		while ( $iIdData = $oStatement->fetchColumn() ) {
			$aRows[] = $iIdData;
		}
		
		return $aRows;
	}

	/**
	 * Get files in join varset (movie_file, movie_pdf_file)
	 * @param string $sJoinVarsetTable
	 * @param array $aRecordsIds
	 * @return array
	 */
	protected function _getFilesFromJoinVarset( $sJoinVarsetTable, $aRecordsIds )
	{
		$oSelect = $this->GetProject()->Db()
			->select()
			->from( $sJoinVarsetTable, 'id_file' )
			->where( new Zend_Db_Expr( sprintf( "id_movie in (%s)", implode( ',', $aRecordsIds ) ) ) );
			
		$oStatement = $oSelect->query();
		
		$oFileMgr = Core_Library_File_Manager::Factory();
		$aFiles = array();
		while ( $iIdData = $oStatement->fetchColumn() ) {
			$aFiles[] = $oFileMgr->CreateFileFromDb( $iIdData );
		}
		
		return $aFiles;
	}
	
	/**
	 * Retourne une instance de Core_Library_File pour chaque film contenu dans $aRecordsIds, 
	 * ainsi que les PDF
	 * @param array $aRecordsIds
	 * @return array of Core_Library_File
	 */
	protected function _getMoviesFiles( $aRecordsIds )
	{
		return array_merge(
			$this->_getFilesFromJoinVarset( 
				Core_Library_TName::GetVarsetData( Lmds_Movie_Manager::MOVIE_FILE_VARSET_PREFIX ),
				$aRecordsIds
			),
			$this->_getFilesFromJoinVarset( 
				Core_Library_TName::GetVarsetData( Lmds_Movie_Manager::MOVIE_PDF_FILE_VARSET_PREFIX ),
				$aRecordsIds
			)
		);
	}
	
	/**
	 *
	 * @var array
	 */
	protected $_aPlayedMovieRows;
	
	/**
	 *
	 * @var array
	 */
	protected $_aGrpMoviesRows;


	/**
	 *
	 * @var array
	 */
	protected $_aFiles;
	
	/**
	 * Récupération du contenu du varset movie_played et des fichiers qui seront
	 * à supprimer dans l'event afterDelete
	 * @param Core_Library_Event_Context $oContext
	 */
	protected function _delete_delete_beforeDelete( Core_Library_Event_Context $oContext )
	{
		$aMoviesIds = $oContext->get( 'aRecordsIds' );
		$this->_aPlayedMovieRows = $this->_getRowsInPlayedVarset( $aMoviesIds );
		$this->_aGrpMoviesRows = $this->_getRowsInGrpMovieVarset( $aMoviesIds );
		$this->_aFiles = $this->_getMoviesFiles( $aMoviesIds );
	}
	

	/**
	 * Nettoyage des données restantes
	 * @param Core_Library_Event_Context $oContext
	 */
	protected function _delete_delete_afterDelete( Core_Library_Event_Context $oContext )
	{
		/* @var $oNotifier Core_Library_Project_Notifier */
		$oNotifier = $oContext->get( 'oNotifier' );
		if ( ! count( $oNotifier->GetWarnings() ) ) {

			// Suppression du contenu du varset played_movie
			$this->GetProject()->GetVarSet( 
				Lmds_Movie_Manager::PLAYED_MOVIE_VARSET_PREFIX 
			)->SimpleDeleteData( $oNotifier, $this->_aPlayedMovieRows );
			
			// Suppression du contenu du varset grp_movie
			$this->GetProject()->GetVarSet( 
				Lmds_Movie_Manager::GROUP_MOVIE_VARSET_NAME
			)->SimpleDeleteData( $oNotifier, $this->_aGrpMoviesRows );
			
			// Suppression des fichiers sur le disque
			/* @var $oFile Core_Library_File */
			foreach ( $this->_aFiles as $oFile ) {
				unlink( $oFile->GetFileFullPath() );
			}
		}
	}
	
	/**
	 * Suppression d'une vidéo
	 */
	public function deleteAction()
	{
		parent::_deleteRecords();
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
		$oForm->LoadFromFile( sprintf( '%s/modules/movie/resources/list/form.get.xml', APPLICATION_PATH ) );
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
