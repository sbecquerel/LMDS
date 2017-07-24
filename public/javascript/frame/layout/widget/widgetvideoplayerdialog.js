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
YUI.add( "widgetvideoplayerdialog", function( Y )
{
	/**
	 * Layout
	 *
	 * @module layout
	 * @submodule widget
	 */

	var sVideoPlayerTemplate =  [
		'<div id="{sFieldsetUniqId}" class="disabled-background" style="{sGroupStyle}">',
			'<fieldset id="{sFieldsetUniqId}-dialog" class="groupdialog">',
				//'<div class="dialog-footer row text-right">',				
					'<button id="{sButtonUniqId}" class="btn btn-default btn-xs">', 
						'<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>',		
					'</button>',
				//'</div>',
				'<div class="dialog-body row" style="{sBodyStyle}">',
					'<div id="{sUniqId}" class="{sClass}"></div>',
				'</div>',
				
			'</fieldset>',
		'</div>'
	].join( '' );

	/**
	 * WidgetVideoPlayerDialog
	 *
	 * @class WidgetVideoPlayerDialog
	 * @extends WidgetBase
	 * @constructor
	 */
	function WidgetVideoPlayerDialog()
	{
		WidgetVideoPlayerDialog.superclass.constructor.apply( this, arguments );
	}

	WidgetVideoPlayerDialog.NAME = 'WidgetVideoPlayerDialog';
	WidgetVideoPlayerDialog.ATTRS =
	{
	}

	Y.WidgetVideoPlayerDialog = Y.extend( WidgetVideoPlayerDialog, Y.WidgetGroupDialog,
	{
		/**
		 * Construction logic executed during object instantiation.
		 *
		 * @method initializer
		 * @protected
		 */
		initializer: function()
		{
			this.set( 'sTemplate', sVideoPlayerTemplate );
		},
		
		/**
		 * Hide group
		 *
		 * @method Hide
		 * @public
		 */
		Hide: function()
		{
			var oNode = Y.one( document.getElementById( this.get( 'sUniqId' ) + this.get( 'FIELDSET_SUFFIX' ) ) );
			var oThis = this;

			oNode.transition( {
				opacity: {
					value: 0,
					duration: 0.5,
					delay: 0,
					easing: 'ease-in'
				} 
			}, function() {
				this.setStyle( 'display', 'none' );
				oThis.set( 'bVisible', false );
//				oThis.Layout().get( 'oWidgets' )[ 'videoPlayer' ].Pause();
				oThis.Layout().get( 'oWidgets' )[ 'videoPlayer' ].Destroy();
			});
		},
		
		/**
		 * Render widget
		 *
		 * @method Render
		 * @public
		 * @param sNodeId {string} Node ID to select for append
		 */
		Render : function( sNodeId ) 
		{
			WidgetVideoPlayerDialog.superclass.Render.apply( this, arguments );
			
			var sDivId = this.UniqId() + this.get('FIELDSET_SUFFIX')
				sFieldsetId = sDivId + '-dialog';
			
			// Close dialog on click outside of fieldset
			Y.on( 'click', function( e ) {
				this.Hide();
			}, '#' + sDivId, this);
			
			// Prevent close if click inside fieldset
			Y.on( 'click', function( e ) {
				e.preventDefault();				
				e.stopPropagation();
			}, '#' + sFieldsetId, this);
		}
		
	} );
}, '0.0.1', {
	requires: [ 'widgetgroupdialog' ]
} );