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

class Lmds_Teacher_Manager extends Core_Library_Project_BaseObject
{
	/**
	 * 
	 * @param integer $iIdTeacher
	 * @return array
	 */
	public function GetTeacherGroups( $iIdTeacher )
	{
		$oDb = $this->GetProject()->Db();
		
		$oSelect = $oDb
			->select()
			->from( array( 'u' => Core_Library_TName::GetVarsetData( 'user' ) ), null )
			->joinLeft( array( 'g1' => Core_Library_TName::GetPjGroupLink() ), 'u.id_group=g1.id_group', null )
			->joinLeft( array( 'g2' => Core_Library_TName::GetPjGroupLink() ), 'g1.id_group_parent=g2.id_group', null )
			->joinLeft( 
				array( 'd' => Core_Library_TName::GetVarsetDataGroup( Lmds_Group::GROUP_VARSET_PREFIX ) ), 
				'g2.id_group=d.id_group',
				'id_data'
			)
			->where( 'g2.id_group_parent = 1' )
			->where( 'g2.id_role IS NULL' )
			->where( 'd.id_data IS NOT NULL' )
			->where( 'u.id_data=?', $iIdTeacher );
		
		$oResultSet = $oSelect->query();
		
		$aIdGroup = array();
		while ( ($aRowData = $oResultSet->fetch() ) ) {
			$aIdGroup[] = $aRowData[ 'id_data' ];
		}
		
		return $aIdGroup;
	}
}