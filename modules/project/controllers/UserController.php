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

class Project_UserController extends Core_Library_Controller_Project_User
{
	/**
     * Event appelé après l'exécution des dataquery du formulaire par le ModelManager
     *
     * En charge de remplir le dataset 'groups' qui doit contenir les groups autorisés pour l'utilisateur courant avec
     * l'information 'level' concernant l'imbrication des groupes
     *
     * @param Core_Library_Event_Context $oContext
     */
    protected function _getusers_get_afterExecute(Core_Library_Event_Context $oContext) {
		
		 parent::_getusers_get_afterExecute( $oContext );
		
        $aDatasets = $oContext->get('aDatasets');
		$oGroupManager = new Lmds_Group_Manager( array( 'project' => $this->GetProject() ) );
		
        foreach( $aDatasets as $oDataset ) {
            /* @var $oDataset Core_Library_Resource_XML_DataSet */
            if ( 'groups' === $oDataset->Id() ) {
				$aRecords = $oDataset->GetRowData()->ToArray();
				$aSelectedRecords = array();
				foreach ( $aRecords as $aRecord ) {
					try {
						/* @var $oGroup Lmds_Group */
						$iLmdsGroup = $oGroupManager->GetGroupFromVznIdGroup( $aRecord[ 'id_group' ] );
						$oGroup = $oGroupManager->CreateGroupFromDb( $iLmdsGroup );
						if ( ! $oGroup->GetDisabled() ) {
							$aSelectedRecords[] = $aRecord;
						}
					} catch ( Core_Library_Exception $e ) {
						$aSelectedRecords[] = $aRecord;
					}
				}
				$oDataset->GetRowData()->RmRecords();
				$oDataset->GetRowData()->AddRecords( $aSelectedRecords );
            }
        }
    }
}
