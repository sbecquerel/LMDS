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

class Lmds_Utils extends Core_Library_Project_BaseObject
{
	const	ROOT_GROUP_ID = 1;
	const	ROOT_GROUP_AXIS = 1;	
	
	const	ROLE_ADMIN = 1;
	const	ROLE_TEACHER = 2;
	const	ROLE_STUDENT = 3;

	const	TEACHER_STEPHANE_ID_DATA = 10;
	const	TEACHER_SIMON_ID_DATA = 20;


	/**
	 * Check if record is in voozanoo group
	 * @param string $sVarsetPrefix
	 * @param integer $iIdData
	 * @param integer $iVznIdGroup
	 * @return boolean
	 */
	public function IsRecordInVznGroup( $sVarsetPrefix, $iIdData, $iVznIdGroup )
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from( Core_Library_TName::GetVarsetDataGroup( $sVarsetPrefix ) )
			->where( 'id_data=?', $iIdData )
			->where( 'id_group=?', $iVznIdGroup );
		
		return ( $oSelect->query()->rowCount() == 1 );
	}
	
	/**
	 * Set record into voozanoo group
	 * @param string $sVarsetPrefix
	 * @param integer $iIdData
	 * @param integer $iVznIdGroup
	 * @param boolean $bForce if false check if record is already in group (default false)
	 */
	public function SetRecordInVznGroup( $sVarsetPrefix, $iIdData, $iVznIdGroup, $bForce = false )
	{
		// Record is already in voozanoo group ?
		if ( ! $bForce && $this->IsRecordInVznGroup( $sVarsetPrefix, $iIdData, $iVznIdGroup ) ) {
			return;
		}
		
		$oDb = $this->GetProject()->Db();
		
		$oDb->insert( 
			Core_Library_TName::GetVarsetDataGroup( $sVarsetPrefix ), 
			array( 'id_data' => $iIdData, 'id_group' => $iVznIdGroup )
		);
	}
	
	/**
	 * Unset record grom voozanoo group
	 * @param string $sVarsetPrefix
	 * @param integer $iIdData
	 * @param integer $iVznIdGroup
	 * @param boolean $bForce if false check if record is already unsetted (default false)
	 */
	public function UnsetRecordFromVznGroup( $sVarsetPrefix, $iIdData, $iVznIdGroup, $bForce = false )
	{
		// Record is already unsetted ?
		if ( ! $bForce && ! $this->IsRecordInVznGroup( $sVarsetPrefix, $iIdData, $iVznIdGroup ) ) {
			return;
		}
		
		$oDb = $this->GetProject()->Db();
		
		$oDb->delete( 
			Core_Library_TName::GetVarsetDataGroup( $sVarsetPrefix ), 
			array( 'id_data=?' => $iIdData, 'id_group=?' => $iVznIdGroup ) );
	}
}