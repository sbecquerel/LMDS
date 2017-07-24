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

class Lmds_Group_Manager extends Core_Library_Project_BaseObject
{
	/**
	 * Return Lmds group from vzn id group
	 * @param integer $iVznIdGroup
	 * @return id group
	 */
	public function GetGroupFromVznIdGroup( $iVznIdGroup )
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from(
				array( 'd' => Core_Library_TName::GetVarsetDataGroup( Lmds_Group::GROUP_VARSET_PREFIX ) ),
				'id_data'
			)
			->where( 'd.id_group=?', $iVznIdGroup );

		$oResultSet = $oSelect->query();
		
		if ( $oResultSet->rowCount() != 1 ) {
			throw new Core_Library_Exception( 
				sprintf( 'Uniq group not found (found %d group(s))', $oResultSet->rowCount() ) 
			);
		}
		
		return $oResultSet->fetchColumn();
	}


	/**
	 * Return dataset record group ID
	 * @param integer $iIdGroup
	 * @return integer group ID
	 */
	public function GetGroupVznIdGroup( $iIdGroup )
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from( 
				array( 'd' => Core_Library_TName::GetVarsetDataGroup( Lmds_Group::GROUP_VARSET_PREFIX ) ),
				'id_group' 
			)
			->join( array( 'l' => Core_Library_TName::GetPjGroupLink() ), 'd.id_group=l.id_group' )
			// Used to check if group is not a user
			->join( array( 'g' => Core_Library_TName::GetPjGroup() ), 'l.id_group=g.id_group' )
			->where( 'd.id_data=?', $iIdGroup )
			->where( 'l.id_group_parent=?', Lmds_Utils::ROOT_GROUP_ID )
			->where( 'g.id_axis IS NOT NULL');
		
		$oResultSet = $oSelect->query();
		
		if ( $oResultSet->rowCount() != 1 ) {
			throw new Core_Library_Exception( 
				sprintf( 'Uniq group for record not found (found %d group(s))', $oResultSet->rowCount() ) 
			);
		}
		
		return $oResultSet->fetchColumn();
	}

	/**
	 * Move teacher in group
	 * @param integer $iIdTeacher
	 * @param integer $iVznIdGroup
	 */
	public function MoveTeacherInVznGroup( $iIdTeacher, $iVznIdGroup )
	{
		$iTeacherVznIdGroup = $this->_getTeacherVznIdGroup( $iIdTeacher );
		
		$oDb = $this->GetProject()->Db();
		
		$oDb
			->insert( 
				Core_Library_TName::GetPjGroupLink(), 
				array( 
					'id_group' => $iTeacherVznIdGroup, 
					'id_group_parent' => $iVznIdGroup, 
					'id_role' => Lmds_User_Teacher::ROLE_ID 
				) 
			);
	}
	
	/**
	 * Save group (varset group) into voozanoo group
	 * @param integer $iIdGroup
	 * @param integer $iVznIdGroup
	 */
	public function SaveGroupInVznGroup( $iIdGroup, $iVznIdGroup )
	{
		$oDb = $this->GetProject()->Db();
		
		// Check if record is in group
		$oSelect = $oDb
			->select()
			->from( Core_Library_TName::GetVarsetDataGroup( Lmds_Group::GROUP_VARSET_PREFIX ) )
			->where( 'id_data = ?', $iIdGroup )
			->where( 'id_group = ?', $iVznIdGroup );
		
		if ( $oSelect->query()->rowCount() != 0 ) {
			throw new Core_Library_Exception( sprintf( 'Record ID %s is already in group ID %s', $iIdGroup, $iVznIdGroup ) );
		}
		
		$oDb->insert(
			Core_Library_TName::GetVarsetDataGroup( Lmds_Group::GROUP_VARSET_PREFIX ),
			array( 'id_data' => $iIdGroup, 'id_group' => $iVznIdGroup )
		);
	}
	
	/**
	 * Create Voozanoo group
	 * @param string $sLabel
	 * @return integer Created group ID
	 */
	public function CreateVznGroup( $sLabel )
	{
		$oGroupManager = $this->GetProject()->GroupManager();
		
		return $oGroupManager->Add( $sLabel, Lmds_Utils::ROOT_GROUP_ID, Lmds_Utils::ROOT_GROUP_AXIS );
	}
	
	/**
	 * Update group (= rename)
	 * @param integer $iVznIdGroup
	 * @param string $sLabel
	 */
	public function UpdateVznGroup( $iVznIdGroup, $sLabel )
	{
		$oGroupManager = $this->GetProject()->GroupManager();
		
		$oGroupManager->Rename( $iVznIdGroup, $sLabel );
	}
	
	/**
	 * Test if teacher is in group
	 * @param integer $iIdTeacher
	 * @param integer $iVznIdGroup
	 * @return boolean true if found 
	 */
	public function IsTeacherInVznGroup( $iIdTeacher, $iVznIdGroup )
	{
		$iTeacherVznIdGroup = $this->_getTeacherVznIdGroup( $iIdTeacher );
		
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from( Core_Library_TName::GetPjGroupLink() )
			->where( 'id_group = ?', $iTeacherVznIdGroup )
			->where( 'id_group_parent = ?', $iVznIdGroup )
			->where( 'id_role = ?', Lmds_User_Teacher::ROLE_ID );

		$iRowCount = $oSelect->query()->rowCount();
		
		if ( $iRowCount > 1 ) {
			throw new Core_Library_Exception( sprintf( 'Teacher found %s in group Id %s', $iRowCount, $iVznIdGroup ) );
		}
		
		return ( $iRowCount == 1 );
	}
	
	/**
	 * Get group teacher
	 * @param integer $iIdGroup
	 * @return integer Teacher id
	 */
	public function GetGroupTeacher( $iIdGroup )
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from( Core_Library_TName::GetVarsetData( Lmds_Group::GROUP_VARSET_PREFIX ), 'teacher' )
			->where( 'id_data = ?', $iIdGroup );

		$oResultSet = $oSelect->query();
		
		if ( $oResultSet->rowCount() != 1 ) {
			throw new Core_Library_Exception( sprintf( 'Grroup ID %s not found', $iIdGroup ) );
		}
		
		return $oResultSet->fetchColumn();
	}
	
	/**
	 * Return students groups (lmds groups)
	 * @param Core_Library_User $oUser
	 * @return array of id group
	 */
	public function GetStudentGroups( Core_Library_User $oUser )
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from( array( 'g' => Core_Library_TName::GetPjGroupLink() ), 'id_group_parent' )
			->where( 'id_role=?', Lmds_User_Student::ROLE_ID )
			->where( 'id_group = ?', $oUser->GetUserId() );
		
		$oResultSet = $oSelect->query();
		
		$aStudentGroups = array();
		while ( ( $aResult = $oResultSet->fetch() ) ) {
			$aStudentGroups[] = $this->GetGroupFromVznIdGroup( $aResult[ 'id_group_parent' ] );
		}
		
		return $aStudentGroups;
	}
	
	/**
	 * Remove all users from group. If $iIdRole is setted, only users with $iIdRole
	 * @param integer $iVznIdGroup
	 * @param integer $iIdRole
	 */
	public function RemoveUsersFromVznGroup( $iVznIdGroup, $iIdRole = null )
	{
		$oDb = $this->GetProject()->Db();
		
		$aWhere = array( 'id_group_parent=?' => $iVznIdGroup );
		
		if ( $iIdRole != null ) {
//			$aWhere[] = array( 'id_role=?' => $iIdRole );
			$aWhere[ 'id_role=?' ] = $iIdRole;
		}
		
		$oDb->delete( 
			Core_Library_TName::GetPjGroupLink(),  
			$aWhere
		);
	}

	/**
	 * Remove all teachers from group
	 * @param integer $iVznIdGroup
	 */
	public function RemoveTeachersFromVznGroup( $iVznIdGroup )
	{
		$this->RemoveUsersFromVznGroup( $iVznIdGroup, Lmds_User_Teacher::ROLE_ID );
	}
	
	/**
	 * Delete Group and:
	 *  - Remove all users in voozanoo group
	 *	- Remove all movies (in varset "Group - Movie")
	 *  - Remove voozanoo group
	 * @param integer $iIdGroup
	 */
	public function DeleteGroup( $iIdGroup )
	{
		$iVznIdGroup = $this->GetGroupVznIdGroup( $iIdGroup );
		$oGroupVarset = $this->GetProject()->GetVarSet( Lmds_Group::GROUP_VARSET_NAME );
		$oMovieManager = new Lmds_Movie_Manager( array( 'project' => $this->GetProject() ) );
		$oGroupManager = $this->GetProject()->GroupManager();
		
		// Delete group in varset
		$oUnusedNotifier = new Core_Library_Project_Notifier( array( 'project' => $this->GetProject() ) );
		$oGroupVarset->SimpleDeleteData( $oUnusedNotifier, array( $iIdGroup ) );

		// Remove all users from group
		$this->RemoveUsersFromVznGroup( $iVznIdGroup );
			
		// Remove all movies
		$oMovieManager->UnsetGroupMovies( $iIdGroup );
		
		// Remove Voozanoo group
		$oGroupManager->Rm( $iVznIdGroup );
	}
	
	/**
	 * Get teacher group ID
	 * @param integer $iIdTeacher (=id_data in user varset)
	 * @return integer
	 */
	protected function _getTeacherVznIdGroup( $iIdTeacher )
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from( Core_Library_TName::GetVarsetData( 'user' ), 'id_group' )
			->where( 'id_data=?', $iIdTeacher );
		
		$oResultSet = $oSelect->query();
		
		if ( $oResultSet->rowCount() != 1 ) {
			throw new Core_Library_Exception( sprintf( 'User with ID %s not found', $iIdTeacher ) );
		}
		
		return $oResultSet->fetchColumn();
	}
	
	/**
	 * Instanatiate group from db
	 * @param integer $iIdGroup
	 * @return Lmds_Group
	 */
	public function CreateGroupFromDb( $iIdGroup ) 
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from(
				array( 'd' => Core_Library_TName::GetVarsetData( Lmds_Group::GROUP_VARSET_PREFIX ) )
			)
			->where( 'd.id_data=?', $iIdGroup );
		
		$oResultSet = $oSelect->query();
		
		if ( $oResultSet->rowCount() != 1 ) {
			throw new Core_Library_Exception( 
				sprintf( 'Uniq group not found (found %d group(s))', $oResultSet->rowCount() ) 
			);
		}
		
		$aGroup = array_merge( array( 'project' => $this->GetProject() ), $oResultSet->fetch() );
		
		return new Lmds_Group( $aGroup );
	}
}