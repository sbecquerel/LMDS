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

class Player_IndexController extends Core_Library_Controller_Action
{
	/**
	 * Lecture de la vidéo
	 */
	public function indexAction()
	{
		$this->_helper->viewRenderer->setNoRender(true);
		
//		$oPlayer = new Lmds_Player( '/Library/WebServer/Documents/movies/video.mp4' );
//		$oPlayer->start();
//		return;
		
		$iIdMovie = $this->getParam( 'id_movie', false );
		if ( $iIdMovie === false ) {
			throw new Core_Library_Exception( 'id_movie parameter is required' );
		}
		
		$oProject = $this->GetProject();
		$oUser = $oProject->GetCurrentUser();
		$oMovieManager = new Lmds_Movie_Manager( array( 'project' => $oProject ) );
		
		/* @var $oMovie Lmds_Movie */
		$oMovie = $oMovieManager->CreateMovieFromDb( $iIdMovie );		
		
		if ( $oMovie->GetFile() == null ) {
			throw new Core_Library_Exception( 'File not found' );
		}
		
		if ( $oUser->HasRole( Lmds_User_Student::ROLE_ID ) ) {
			if ( ! $oMovieManager->CheckStudentAuthorization( $oUser, $iIdMovie ) && 
				   $oMovie->GetMovieType() != Lmds_Movie::TYPE_INFO && 
				   $oMovie->GetMovieType() != Lmds_Movie::TYPE_FAQ	) {
				throw new Core_Library_Exception( 'Student can\'t access to this movie' );
			}	
			$oMovieManager->MarkMovieAsPlayed( $oUser, $iIdMovie );
		}
		
		$oPlayer = new Lmds_Player( $oMovie->GetFile()->GetFileFullPath() );
		$oPlayer->start();
	}
}
