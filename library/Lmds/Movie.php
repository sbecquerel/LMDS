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

class Lmds_Movie extends Core_Library_Project_BaseObject
{	
	const	MOVIE_VARSET_PREFIX = 'movie';
	const	TYPE_STANDARD		= '1';	
	const	TYPE_GLOBAL			= '2';
	const	TYPE_INFO			= '3';
	const	TYPE_FAQ			= '4';
	
	/**
	 *
	 * @var integer
	 */
	protected $_iIdData;
	
	/**
	 *
	 * @var string
	 */
	protected $_sLabel;
	
	/**
	 *
	 * @var Lmds_User_Teacher
	 */
	protected $_oTeacher;
	
	/**
	 *
	 * @var string
	 */
	protected $_sLevel;
	
	/**
	 *
	 * @var string
	 */
//	protected $_sSubLevel;
	
	/**
	 *
	 * @var string
	 */
	protected $_sMovieType;
	
	/**
	 * Movie file
	 * @var Core_Library_File
	 */
	protected $_oFile;
	
	/**
	 * Movie Pdf file (grid)
	 * @var Core_Library_File
	 */
	protected $_oPdfFile;

	/**
	 * Id data setter
	 * @param integer $iIdData
	 */
	public function SetIdData( $iIdData )
	{
		$this->_iIdData = (int) $iIdData;
	}
	
	/**
	 * Id data getter
	 * @return type
	 */
	public function GetIdData()
	{
		return $this->_iIdData;
	}
	
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
	 * Teacher setter
	 * @param integer $iTeacher
	 */
	public function SetTeacher( $iTeacher )
	{
		$this->_oTeacher = new Lmds_User_Student( array( 'id_data' => $iTeacher ) );
	}
	
	/**
	 * Teacher getter
	 * @return Lmds_User_Teacher
	 */
	public function GetTeacher()
	{
		return $this->_oTeacher;
	}
	
	/**
	 * Level setter
	 * @param integer $iLevel Level code id
	 */
	public function SetLevel( $iLevel )
	{
		if ( ! $iLevel ) {
			$this->_sLevel = null;
			return;
		}
		
		$this->_sLevel = $this->GetProject()->DicoManager()->id2Code( 'level', $iLevel );
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
	 * Sub level setter
	 * @param integer $iSubLevel Sub level code id
	 */
//	public function SetSubLevel( $iSubLevel )
//	{
//		$this->_sSubLevel = $this->GetProject()->DicoManager()->id2Code( 'sub_level', $iSubLevel );
//	}
	
	/**
	 * Sub level getter
	 * @return string
	 */
//	public function GetSubLevel()
//	{
//		return $this->_sSubLevel;
//	}
	
	/**
	 * Movie type setter
	 * @param integer $iMovieType Movie type code id
	 */
	public function SetMovieType( $iMovieType )
	{
		$this->_sMovieType = $this->GetProject()->DicoManager()->id2Code( 'movie_type', $iMovieType );
	}
	
	/**
	 * Movie type getter
	 * @return string
	 */
	public function GetMovieType()
	{
		return $this->_sMovieType;
	}
	
	/**
	 * File setter
	 * @param integer $iIdFile
	 */
	public function SetIdFile( $iIdFile ) 
	{
		if ( $iIdFile == null ) {
			$this->_oFile = null;
			return;
		}
		$oFileManager = Core_Library_File_Manager::Factory();
		$this->_oFile = $oFileManager->CreateFileFromDb( $iIdFile );
	}

	/**
	 * File getter
	 * @return Core_Library_File
	 */
	public function GetFile()
	{
		return $this->_oFile;
	}
	
	/**
	 * Id pdf file setter
	 * @param integer $iIdPdfFile
	 */
	public function SetIdPdfFile( $iIdPdfFile )
	{
		if ( $iIdPdfFile == null ) {
			$this->_oFile = null;
			return;
		}
		$oFileManager = Core_Library_File_Manager::Factory();
		$this->_oPdfFile = $oFileManager->CreateFileFromDb( $iIdPdfFile );
	}
	
	/**
	 * Pdf file getter
	 * @return Core_Library_File
	 */
	public function GetPdfFile()
	{
		return $this->_oPdfFile;
	}
}