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
YUI.add("widgetselectionlist", function(Y)
{
	/**
	 * Layout
	 *
	 * @module layout
	 * @submodule widget
	 */

	/**
	 * Widget Tabs
	 * @class WidgetSelectionList
	 * @extends WidgetBase
	 * @constructor
	 */
	function	WidgetSelectionList()
	{
		WidgetSelectionList.superclass.constructor.apply(this, arguments);
	}

	WidgetSelectionList.NAME = 'WidgetSelectionList';
	WidgetSelectionList.ATTRS =
	{
		/**
		 * @attribute oDataSet
		 * @description table data set
		 * @type {DataSet}
		 */
		oDataSet:
		{
			writeOnce : true,
			getter: function( sValue ) {
				return this.Layout().Frame().DataSetManager().DataSet( sValue );
			}
		},
		
		/**
		 * @attribute sUri
		 * @description redirection uri after selection
		 * @type {String}
		 */
		sUri:
		{
			writeOnce : true
		},
		
		/**
		 * @attribute sRootTemplate
		 * @description root template
		 * @type {string}
		 */
		sRootTemplate:
		{
			value: '<div id={id} class="{eltClass}"><ul class="simple-list list-group" >{items}</ul></div>'
		},
		
		/**
		 * @attribute sItemTemplate
		 * @description template used for each item
		 * @type {string}
		 */
		sItemTemplate:
		{
			value	: [
				'<li id="{id}" class="list-group-item">',
					'<div class="row">',
						'<div class="col-xs-12">',
							'<label>{label}</label>',
						'</div>',
					'</div>',
				'</li>',
			].join( '' )
		},
		
		/**
		 * Default class to set regarding grid positioning 
		 *
		 * @attribute sDefaultGridClass
		 * @type {String}
		 * @value 'col-md-3 col-lg-4'
		 */
		sDefaultGridClass:
		{
			value: 'col-md-6 col-lg-8'
		}
	};
	
	Y.WidgetSelectionList = Y.extend(WidgetSelectionList, Y.WidgetBase,
	{
		/**
		 * Construction logic executed during object instantiation.
		 *
		 * @method initializer
		 * @protected
		 */
		initializer : function()
		{
			var	oWidgetDef = this.get('oWidgetDef');

			this.set('oDataSet', oWidgetDef.d );
			
			// uri option is required
			if ( Y.Lang.isUndefined( oWidgetDef.options ) || Y.Lang.isUndefined( oWidgetDef.options.uri ) ) {
				throw new Y.VznException(null, 'Option uri is mandatory', 'initializer', 'Y.WidgetSelectionList');				
			}
			
			this.set( 'sUri', oWidgetDef.options.uri );					
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
			var oPrimaryKey  = this.get('oDataSet').PrimaryKey(),
				oLabel = oPrimaryKey.DataSet().Field('label'),
				aItems = [],
				sItems = '',
				sItemTemplate = this.get( 'sItemTemplate' ),
				sRootTemplate = this.get( 'sRootTemplate' );
			
			oPrimaryKey.DataSet().RowData().BackupCursor();
			
			oPrimaryKey.DataSet().RowData().First();
			while ( oPrimaryKey.DataSet().RowData().EoF( true ) == false ) {
				
				aItem = {
					id: this.UniqId() + '-' + oPrimaryKey.GetValue(),
					value: oPrimaryKey.GetValue(),
					label: oLabel.GetValue()
				};
				
				aItems.push( aItem );
								
				oPrimaryKey.DataSet().RowData().Next();
			}

			for ( i = 0; i < aItems.length; i++ ) {								
				sItems += Y.Lang.sub( sItemTemplate, { 
					id: aItems[ i ].id, 
					label: aItems[ i ][ 'label' ]
				} );				
			}

			Y.one(document.getElementById(sNodeId)).append( Y.Lang.sub(
				sRootTemplate,
				{
					id: this.UniqId(),
					items: sItems,
					eltClass: this.GetClass()
				})
			);
	
			this._addEvents( aItems );
		},
		
		/**
		 * Add events on DOM
		 * @returns {void}
		 */
		_addEvents : function( aItems )
		{
			var i, eltId;
			
			for ( i = 0; i < aItems.length; i++ ) {
				
				eltId = this.get( 'sType') + '-' + aItems[ i ].id;
			
				// On met l'event uniquement sur l'élément LI. 
				Y.one( '#' + aItems[ i ].id ).on(
					'click', 
					this._selectItem, 
					this,  
					{ id: aItems[i].id }
				);
			}	
		},				
		
		/**
		 * Select / Unselect item
		 * @param {Y.Event} e
		 * @param {Object} args
		 * @returns {void}
		 */
		_selectItem : function(e, args) 
		{			
			var sIdData = args.id.split( '-' )[ 1 ];

			Y.Voozanoo.oMainFrame.ReplaceFrame( 
				this.Layout().Frame().Id(), 
				Y.Voozanoo.properties.project_url + this.get( 'sUri' ).replace( '{id_data}', sIdData ) 
			);
		},		

		/**
		 * Update widget
		 *
		 * @method Update
		 * @public
		 */
		Update: function()
		{
			
		}
	});
}, '0.0.1', {
	requires: ['widgetbase']
});