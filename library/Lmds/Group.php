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

class Lmds_Group extends Core_Library_Project_BaseObject
{	
	const	GROUP_VARSET_NAME = 'group';
	const	GROUP_VARSET_PREFIX = 'grp';
	
	/**
	 * Label
	 * @var string
	 */
	protected $_sLabel;
	
	/**
	 * Level
	 * @var string
	 */
	protected $_sLevel;
	
	/**
	 * Is disabled ?
	 * @var boolean
	 */
	protected $_bDisabled = false;
	
	/**
	 * Label setter
	 * @param string $sLabel
	 */
	public function SetLabel( $sLabel )
	{
		$this->_sLabel = $sLabel;
	}
	
	/**
	 * Label getter
	 * @return string
	 */
	public function GetLabel()
	{
		return $this->_sLabel;
	}
	
	/**
	 * Level setter
	 * @param integer $iLevel
	 */
	public function SetLevel( $iLevel )
	{
		if ( $iLevel === null ) {
			$this->_sLevel = null;
		} else {
			$this->_sLevel = $this->GetProject()->DicoManager()->id2Code( 'group_detailed_level', $iLevel );			
		}		
	}
	
	/**
	 * Level getter
	 * @return string
	 */
	public function GetLevel()
	{
		return $this->_sLevel;
	}
	
	/**
	 * Set disabled
	 * @param integer $iDisabled yorn dico id_data
	 */
	public function SetDisabled( $iDisabled )
	{
		if ( $iDisabled == null ) {
			$this->_bDisabled = false;
			return;
		}
		
		if ( $this->GetProject()->DicoManager()->id2Code( 'yorn', $iDisabled, true ) == 'y' ) {
			$this->_bDisabled = true;
		} else {
			$this->_bDisabled = false;
		}
	}
	
	/**
	 * Is disabled ?
	 * @return boolean
	 */
	public function GetDisabled()
	{
		return $this->_bDisabled;
	}
}