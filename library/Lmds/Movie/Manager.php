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
class Lmds_Movie_Manager extends Core_Library_Project_BaseObject
{	
	const GROUP_MOVIE_VARSET_PREFIX = 'grp_movie';
	const GROUP_MOVIE_VARSET_NAME = 'group_movie';
	const MOVIE_FILE_VARSET_PREFIX = 'movie_file';
	const MOVIE_PDF_FILE_VARSET_PREFIX = 'movie_pdf_file';
	const PLAYED_MOVIE_VARSET_PREFIX = 'played_movie';
	
	/**
	 * Instanciate movie object from record in varset movie
	 * @param integer $iIdMovie
	 * @return \Lmds_Movie
	 */
	public function CreateMovieFromDb( $iIdMovie ) 
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from( array( 'm' => Core_Library_TName::GetVarsetData( Lmds_Movie::MOVIE_VARSET_PREFIX ) ) )
			->joinLeft( 
				array( 'f' => Core_Library_TName::GetVarsetData( self::MOVIE_FILE_VARSET_PREFIX ), 'id_file' ), 
				'm.id_data=f.id_movie'
			)
			->where( 'm.id_data=?', $iIdMovie );
		
		$oResultSet = $oSelect->query();
		
		if ( $oResultSet->rowCount() != 1 ) {
			throw new Core_Library_Exception( 'Movie not found' );
		}
		
		$aMovie = array_merge( 
			array( 'project' => $this->GetProject() ),
			$oResultSet->fetch()
		);
		
		return new Lmds_Movie( $aMovie );
	}
	
	/**
	 * Instanciate movie object from record in varset movie
	 * @param integer $iIdPdf
	 * @return \Lmds_Movie
	 */
	public function CreateMovieFromPdf( $iIdPdf ) 
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from( 
				array( 'p' => Core_Library_TName::GetVarsetData( self::MOVIE_PDF_FILE_VARSET_PREFIX) ),
				array( 'id_pdf_file' => 'id_file' )
			)
			->joinLeft( 
				array( 'm' => Core_Library_TName::GetVarsetData( Lmds_Movie::MOVIE_VARSET_PREFIX ) ), 
				'm.id_data=p.id_movie'
			)	
			->joinLeft( 
				array( 'f' => Core_Library_TName::GetVarsetData( self::MOVIE_FILE_VARSET_PREFIX ) ), 
				'm.id_data=f.id_movie',
				'id_file'
			)
			->where( 'p.id_file=?', $iIdPdf );
		
		$oResultSet = $oSelect->query();
		
		if ( $oResultSet->rowCount() != 1 ) {
			throw new Core_Library_Exception( 'Pdf not found' );
		}
		
		$aMovie = array_merge( 
			array( 'project' => $this->GetProject() ),
			$oResultSet->fetch()
		);
		
		return new Lmds_Movie( $aMovie );
	}
	
	/**
	 * Remove link between a group and its movies
	 * @param integer$iIdGroup
	 */
	public function UnsetGroupMovies( $iIdGroup )
	{
		$oDb = $this->GetProject()->Db();
		$oGroupMovieVarset = $this->GetProject()->GetVarSet( self::GROUP_MOVIE_VARSET_NAME );
		
		$oSelect = $oDb
			->select()
			->from( Core_Library_TName::GetVarsetData( self::GROUP_MOVIE_VARSET_PREFIX ), 'id_data' )
			->where( 'id_group=?', $iIdGroup );
		
		$oResultSet = $oSelect->query();
		
		if ( ! $oResultSet->rowCount() ) {
			return;
		}
		
		$oUnsuedNotifier = new Core_Library_Project_Notifier( array( 'project' => $this->GetProject() ) );
		
		$oGroupMovieVarset->SimpleDeleteData( $oUnsuedNotifier, $oResultSet->fetchAll() );
	}
	
	/**
	 * Move movie in group
	 * @param integer $iIdGroup
	 * @param integer $iIdMovie
	 * @return boolean false if movie is already in group
	 */
	public function SetGroupMovie( $iIdGroup, $iIdMovie )
	{
		$iIdGroupMovie = $this->GetGroupMovieIdData( $iIdGroup, $iIdMovie );
		// Movie is already in group, return false
		if ( $iIdGroupMovie !== false ) {
			return false;
		}
		
		$oGroupMovieVarset = $this->GetProject()->GetVarSet( self::GROUP_MOVIE_VARSET_NAME );
		$oGroupMovieVarset->SimpleInsertData( array( 
			'id_group' => $iIdGroup,
			'id_movie' => $iIdMovie
		));
		
		$oUtils = new Lmds_Utils( array( 'project' => $this->GetProject() ) );
		$oLmdsGroupManager = new Lmds_Group_Manager( array( 'project' => $this->GetProject() ) );
		$iVznIdGroup = $oLmdsGroupManager->GetGroupVznIdGroup( $iIdGroup );
		
		// Declare movie and join in movie_group varset as records of group, important to give
		// access to students
		$iIdGroupMovie = $this->GetGroupMovieIdData( $iIdGroup, $iIdMovie );
		if ( ! $oUtils->IsRecordInVznGroup( self::GROUP_MOVIE_VARSET_PREFIX, $iIdGroupMovie, $iVznIdGroup ) ) {
			$oUtils->SetRecordInVznGroup( self::GROUP_MOVIE_VARSET_PREFIX, $iIdGroupMovie, $iVznIdGroup, true );
		}
		
		if ( ! $oUtils->IsRecordInVznGroup( Lmds_Movie::MOVIE_VARSET_PREFIX, $iIdMovie, $iVznIdGroup ) ) {
			$oUtils->SetRecordInVznGroup( Lmds_Movie::MOVIE_VARSET_PREFIX, $iIdMovie, $iVznIdGroup, true );
		}
		
		return true;
	}
	
	/**
	 * Remove movie from group
	 * @param integer $iIdGroup
	 * @param integer $iIdMovie
	 * @return boolean false if movie is not found in group
	 */
	public function UnsetGroupMovie( $iIdGroup, $iIdMovie )
	{
		$iIdGroupMovie = $this->GetGroupMovieIdData( $iIdGroup, $iIdMovie );
		// Movie not found in group, return false
		if ( ! $iIdGroupMovie ) {
			return false;
		}
		
		$oGroupMovieVarset = $this->GetProject()->GetVarSet( self::GROUP_MOVIE_VARSET_NAME );
		$oUnsuedNotifier = new Core_Library_Project_Notifier( array( 'project' => $this->GetProject() ) );
		
		$oGroupMovieVarset->SimpleDeleteData( $oUnsuedNotifier, array( $iIdGroupMovie ) );
		
		$oUtils = new Lmds_Utils( array( 'project' => $this->GetProject() ) );
		$oLmdsGroupManager = new Lmds_Group_Manager( array( 'project' => $this->GetProject() ) );
		$iVznIdGroup = $oLmdsGroupManager->GetGroupVznIdGroup( $iIdGroup );
		
		// Remove movie from group
		if ( $oUtils->IsRecordInVznGroup( Lmds_Movie::MOVIE_VARSET_PREFIX, $iIdMovie, $iVznIdGroup ) ) {			
			$oUtils->UnsetRecordFromVznGroup( Lmds_Movie::MOVIE_VARSET_PREFIX, $iIdMovie, $iVznIdGroup, true );
		}
		
		return true;
	}
	
	/**
	 * Get record in varset "Group Movie" represented by $iIdGroup & $iIdMovie
	 * @param integer $iIdGroup
	 * @param integer $iIdMovie
	 * @return integer or false if not found
	 */
	public function GetGroupMovieIdData( $iIdGroup, $iIdMovie )
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from( Core_Library_TName::GetVarsetData( self::GROUP_MOVIE_VARSET_PREFIX ), 'id_data' )
			->where( 'id_group=?', $iIdGroup )
			->where( 'id_movie=?', $iIdMovie );
		
		$oResultSet = $oSelect->query();
		
		if ( ! $oResultSet->rowCount() ) {
			return false;
		}
		
		return $oResultSet->fetchColumn();
	}
	
	/**
	 * Return true if movie is in group
	 * @param integer $iIdGroup
	 * @param integer $iIdMovie
	 * @return boolean
	 */
	public function IsMovieInGroup( $iIdGroup, $iIdMovie )
	{
		return ( $this->GetGroupMovieIdData( $iIdGroup, $iIdMovie ) !== false );
	}

	/**
	 * Return true of movie is found in groups
	 * @param array $aIdGroup
	 * @param integer $iIdMovie
	 * @return boolean
	 */
	public function IsMovieInGroups( $aIdGroup, $iIdMovie )
	{
		foreach ( $aIdGroup as $iIdGroup ) {
			if ( $this->IsMovieInGroup( $iIdGroup, $iIdMovie ) ) {
				return true;
			}
		}
		
		return false;
	}
	
	/**
	 * Check if student can see the movie
	 * @param Core_Library_User $oUser
	 * @param integer $iIdMovie
	 * @return boolean
	 */
	public function CheckStudentAuthorization( Core_Library_User $oUser, $iIdMovie )
	{
		$oLmdsGroupManager = new Lmds_Group_Manager( array( 'project' => $this->GetProject() ) );
		$aStudentGroups = $oLmdsGroupManager->GetStudentGroups( $oUser );
		
		return $this->IsMovieInGroups( $aStudentGroups, $iIdMovie );
	}
	
	/**
	 * Movie has been played by user ?
	 * @param Core_Library_User $oUser
	 * @param integer $iIdMovie
	 * @return boolean
	 */
	protected function _isMoviePlayed( Core_Library_User $oUser, $iIdMovie )
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb->select()
			->from( Core_Library_TName::GetVarsetData( self::PLAYED_MOVIE_VARSET_PREFIX ) )
			->where( 'id_owner=?', $oUser->GetUserId() )
			->where( 'id_movie=?', $iIdMovie );
		
		return ( $oSelect->query()->rowCount() > 0 );
	}
	
	/**
	 * Return id_data from varset played movie for user and id movie
	 * @param Core_Library_User $oUser
	 * @param integer $iIdMovie
	 * @return integer of false if not found
	 */
	protected function _getMoviePlayedId( Core_Library_User $oUser, $iIdMovie )
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb->select()
			->from( Core_Library_TName::GetVarsetData( self::PLAYED_MOVIE_VARSET_PREFIX ), 'id_data' )
			->where( 'id_owner=?', $oUser->GetUserId() )
			->where( 'id_movie=?', $iIdMovie );
		
		$oResultSet = $oSelect->query();
		
		if ( ! $oResultSet->rowCount() ) {
			return false;
		}
		
		return $oResultSet->fetchColumn();
	}

	/**
	 * Mark movie as played by user
	 * @param Core_Library_User $oUser
	 * @param integer $iIdMovie
	 */
	public function MarkMovieAsPlayed( Core_Library_User $oUser, $iIdMovie )
	{
		if ( $this->_isMoviePlayed( $oUser, $iIdMovie ) ) {			
			return;
		}
			
		$oPlayedMovieVarset = $this->GetProject()->GetVarSet( self::PLAYED_MOVIE_VARSET_PREFIX );
		$oPlayedMovieVarset->SimpleInsertData( array( 
			'id_movie' => $iIdMovie ,
			'marked_date' => date( 'Y-m-d' )
		), $oUser );
	}
	
	protected function _setFavoriteValue( $bFavorite, Core_Library_User $oUser, $iIdMovie ) 
	{
		$iIdData = $this->_getMoviePlayedId( $oUser, $iIdMovie );
		if ( ! $iIdData ) {			
			return;
		}
		
		$oPlayedMovieVarset = $this->GetProject()->GetVarSet( self::PLAYED_MOVIE_VARSET_PREFIX );		
		$oPlayedMovieVarset->SimpleUpdateData( array( 'favorite' => ( $bFavorite ? 1 : 0 ) ), (int) $iIdData );
	}

	/**
	 * 
	 * @param Core_Library_User $oUser
	 * @param integer $iIdMovie
	 * @return void
	 */
	public function MarkMovieAsFavorite( Core_Library_User $oUser, $iIdMovie ) 
	{
		$this->_setFavoriteValue( true, $oUser, $iIdMovie );
	}
	
	/**
	 * 
	 * @param Core_Library_User $oUser
	 * @param integer $iIdMovie
	 */
	public function UnsetFavorite( Core_Library_User $oUser, $iIdMovie )
	{
		$this->_setFavoriteValue( false, $oUser, $iIdMovie );
	}
}