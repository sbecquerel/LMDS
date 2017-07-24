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

class Stats_ConnectionController extends Core_Library_Controller_Action
{
	/**
	 * id_data of date format in dico varset, setted by _setDateFormat()
	 * Default = 6 => %V/%Y
	 * @var integer
	 */
	protected $_iDateFormatDicoId = 6;
	
	/**
	 * Action en charge de retourner la configuration du formulaire permettant
	 * la création / la modification d'un mailing model
	 */
	public function getAction()
	{
		$this->_setDateFormat();
		parent::_getFormConfiguration();
	}

	/**
	 * Action en charge de sauvegarder les données liées à un mailing model
	 * (création ou mise à jours)
	 */
	public function saveAction()
	{
		parent::_saveForm();
	}

	/**
	 * Action en charge de renvoyer le dataset demandé
	 */
	public function getdatasetAction()
	{
		$this->_setDateFormat();
		parent::_getDataset();
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
		$oForm->LoadFromFile( sprintf( '%s/modules/stats/resources/connection/form.get.xml', APPLICATION_PATH ) );
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
	protected function _get_retrieveForm( Core_Library_Event_Context $oContext )
	{
		$this->_commonRetrieveForm( $oContext );
	}

	/**
	 * Hook propre à l'action "getdatasetAction":
	 *
	 * En charge d'instancier un objet Core_Library_Resource_XML_Frame_Form
	 * depuis le Xml contenu dans les ressources de ce module
	 *
	 * @param Core_Library_Event_Context $oContext
	 */
	protected function _getdataset_retrieveForm( Core_Library_Event_Context $oContext )
	{
		$this->_commonRetrieveForm( $oContext );
	}
	
	/**
	 * Set date_format parameter 
	 */
	protected function _setDateFormat()
	{
		$oProject = $this->GetProject();
		$oDicoManager = $oProject->DicoManager();
		$oSession = $oProject->Account()->Session();
		
		$iDateFormatDicoId = $this->getRequest()->getParam( 'date_format' );		
		if ( $iDateFormatDicoId === null ) {			
			// Date format not found in params, get default value:
			// Check session, if not found in session, get _iDateFormatDicoId value			
			if ( isset( $oSession->aCharts[ 'connectionsChart' ][ 'iDateFormat' ] ) ) {
				$iDateFormatDicoId = $oSession->aCharts[ 'connectionsChart' ][ 'iDateFormat' ];
			} else {				
				$iDateFormatDicoId = $oDicoManager->code2Id( 'date_format', '%V/%Y' );
			}						
		} 
		
		// Set _iDateFormatDicoId as current id_date
		$this->_iDateFormatDicoId = $iDateFormatDicoId;
		
		// Save date format in session (initialize session if not)
		$oSession->aCharts[ 'connectionsChart' ][ 'iDateFormat' ] = $this->_iDateFormatDicoId;

		// Set or update date_format parameters to be used in dataquery parsing
		$this->getRequest()->setParam( 
			'date_format',
			$oDicoManager->id2Code( 'date_format', $iDateFormatDicoId ) 
		);
	}
	
	/**
	 * Set default value for format field in settings dataset
	 * @param Core_Library_Event_Context $oContext
	 */
	protected function _get_get_render( Core_Library_Event_Context $oContext )
	{
		/* @var $oJson Core_Library_Resource_Json */
		$oJson = &$oContext->get('oResourceJSON');

		$aJson = $oJson->GetJSON();

		// Set default_value of field format, in dataset settings to current date format
		// (=id_data in varset dico for dico name date_format)
		foreach ( $aJson[ 'aDataSets' ] as &$aDataset ) {
			if ( $aDataset[ 'id' ] == 'settings' ) {
				foreach ( $aDataset[ 'metadata' ][ 'fields' ] as $sFieldName => &$aField ) {
					if ( $sFieldName == 'format') {
						$aField[ 'default_value' ] = $this->_iDateFormatDicoId;
					}
				}
			}
		}

		$oJson->SetJSON( $aJson );

		parent::_get_render( $oContext );
	}
}