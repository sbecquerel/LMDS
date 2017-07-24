<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * This is VOOZANOO, a program. Contact voozanoo@epiconcept.fr, or   *
 * see http://www.voozanoo.net/ for more information.                *
 *                                                                   *
 * Copyright 2001-2013 Epiconcept                                    *
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

class Home_IndexController extends Core_Library_Controller_Home_Index
{
	/**
     * Called to get home frame in JSON
     */
	public function frameAction()
	{
		$oProject = Core_Library_Account::GetInstance()->GetCurrentProject();
		$oUser = $oProject->GetCurrentUser();

		// Show default page for admin and teacher
		if ( $oUser->HasRole( Lmds_Utils::ROLE_TEACHER ) ) {
			// action - controller - module
			// selectmovies/group-list/get/teacher/{id_data}
			$this->_forward( 'get', 'group-list', 'selectmovies', array( 'teacher' => $oUser->GetUserIdData() ) );
			return;
			
		} else if ( $oUser->HasRole( Lmds_Utils::ROLE_ADMIN ) ) {
			
			// action - controller - module
			$this->_forward( 'get', 'teacher-list', 'selectmovies' );
			return;
		
		// Student & teacher
		} else if ( $oUser->HasRole( Lmds_Utils::ROLE_STUDENT ) ) {
			
			// action - controller - module
			$this->_forward( 'get', 'movies', 'student' );
			return;
			
		} else {
			throw new Core_Library_Exception( 'Role unknown, can\'t determine home page' );
		}
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
		$oForm->LoadFromFile( sprintf( '%s/modules/home/resources/index/homepage.xml', APPLICATION_PATH ) );
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
	protected function _frame_retrieveForm( Core_Library_Event_Context $oContext )
	{
		$this->_commonRetrieveForm( $oContext );
	}
}
