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
YUI.add("widgetinfomovies", function(Y)
{
	/**
	 * Layout
	 *
	 * @module layout
	 * @submodule widget
	 */

	/**
	 * Widget Movies
	 * @class WidgetInfoMovies
	 * @extends WidgetBase
	 * @constructor
	 */
	function	WidgetInfoMovies()
	{
		WidgetInfoMovies.superclass.constructor.apply(this, arguments);
	}

	var sRootTemplate = [
		'<div id={id} class="{eltClass}">',
			'<div class="panel panel-default">',
				'<div class="panel-heading">',
					'<h3 class="panel-title">{title}</h3>',
				'</div>',
				'<div class="panel-body">',
					'<div class="col-xs-12">',
						'<div class="list-group">',
							'{movies}',
						'</div>',
					'</div>',
				'</div>',
			'</div>',
		'</div>'
	].join( '' );

	WidgetInfoMovies.NAME = 'WidgetInfoMovies';
	WidgetInfoMovies.ATTRS =
	{
	};
	
	Y.WidgetInfoMovies = Y.extend(WidgetInfoMovies, Y.WidgetMovies,
	{
		/**
		 * Construction logic executed during object instantiation.
		 *
		 * @method initializer
		 * @protected
		 */
		initializer : function()
		{
			this.set( 'sRootTemplate', sRootTemplate );
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
			var oDataset = this.get('oDataset'),
				sMovieListItemTpl = this.get( 'sMovieListItem' ),
				aMovies = [],
				sUnviewedClassName = this.get( 'sUnviewedClassName' );
		
			oDataset.RowData().BackupCursor();
			oDataset.RowData().First();
			
			while ( oDataset.RowData().EoF( true ) == false ) {				
				var sMovieListItem = Y.Lang.sub(
						sMovieListItemTpl, {
							id: this.UniqId() + '-' + oDataset.Field( 'id_data' ).GetValue(),
							label: oDataset.Field( 'label' ).GetValue(),
							class: ( oDataset.Field( 'played' ).GetValue() == 1 ? '' : sUnviewedClassName )
						}
					);
				
				aMovies.push( sMovieListItem );
				oDataset.RowData().Next();
			}
							
			Y.one( document.getElementById( sNodeId ) ).append( Y.Lang.sub(
				this.get( 'sRootTemplate' ), {
					id: this.UniqId(),
					title: Y.Translate._( 'Info' ),
					movies: aMovies.join( '' ),
					eltClass: this.GetClass()
				})
			);
	
			var oNode = Y.one( document.getElementById( this.UniqId() ) );
	
			oNode.delegate( 
				'click', 
				this._onMovieClick, 
				'.movie-item', 
				this
			);
		},		

	});
}, '0.0.1', {
	requires: ['widgetmovies']
});