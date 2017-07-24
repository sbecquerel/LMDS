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

//@todo classe non testée


class MainFrame_IndexController extends Core_Library_Controller_MainFrame_Index
{
	public function init() {
		
		parent::init();
		
		$sAppUrl = rtrim( $this->GetProject()->Account()->GetURL(), '/' );
		$oView = $this->view;			

		// <link href="//example.com/path/to/video-js.css" rel="stylesheet">
		$oView->headLink()->prependStylesheet( $sAppUrl . '/javascript/video-js/video-js.css', 'screen, print');

		// <script src="//example.com/path/to/video.js"></script>
		$oView->headScript()->appendFile( $sAppUrl . '/javascript/video-js/video.js' );
	}
}