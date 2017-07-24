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
YUI.add("widgetselectmovies", function(Y)
{
	/**
	 * Layout
	 *
	 * @module layout
	 * @submodule widget
	 */

	/**
	 * Widget select movies
	 * @class WidgetSelectMovies
	 * @extends WidgetBase
	 * @constructor
	 */
	function	WidgetSelectMovies()
	{
		WidgetSelectMovies.superclass.constructor.apply(this, arguments);
	}

	WidgetSelectMovies.NAME = 'WidgetSelectMovies';
	WidgetSelectMovies.ATTRS =
	{
		/**
		 * @attribute oDataset
		 * @description table data set
		 * @type {DataSet}
		 */
		oDataset:
		{
			writeOnce : true,
			getter: function( sValue ) {
				return this.Layout().Frame().DataSetManager().DataSet( sValue );
			}
		},
				
		/**
		 * @attribute sRootTemplate
		 * @description root template
		 * @type {string}
		 */
		sRootTemplate:
		{
			value: '<div id={id} class="{eltClass}">{levels}</div>'
		},
		
		/**
		 * @attribute sLevelTemplate
		 * @description level template
		 * @type {string}
		 */
		sLevelTemplate:
		{
			value: [
				'<div id="{levelId}" class="panel panel-default">',
					'<div class="panel-heading">',
						'<h3 class="panel-title">{levelTitle}</h3>',
					'</div>',
					'<div class="panel-body">',
						'<div class="col-xs-12 col-sm-6">',
							'<div class="movie-count text-center">',
								'<h4>{teacherMoviesCount}</h4>',
							'</div>',
							'<div class="list-group list-std">',
								'{teacherMovies}',
							'</div>',
						'</div>',
						'<div class="col-xs-12 col-sm-6">',
							'<div class="movie-count text-center">',
								'<h4>{globalMoviesCount}</h4>',
							'</div>',
							'<div class="list-group list-std">',
								'{globalMovies}',
							'</div>',
						'</div>',
					'</div>',
				'</div>'
			].join( '' )
		},
		
		/**
		 * @attribute sMovieListItem
		 * @description movie list item
		 * @type {string}
		 */
		sMovieListItem:
		{
			value: [
				'<a id="{id}" href="#" class="list-group-item {class} movie-item">',
					'<div class="title">',
						'<span class="label label-primary">',
						'{teacher}',
						'</span>',
						'{tags}',
						'{label}',
					'</div>',
					'<span class="glyphicon glyphicon-play movie-play-icon" aria-hidden="true"></span>',
				'</a>'
			].join( '' )
		},
		
		/**
		 * @attribute sTagTemplate
		 * @description tag template
		 * @type {string}
		 */
		sTagTemplate:
		{
			value: [
				'<span class="label {class}">',
					'{tag}',
				'</span>'
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
		},
		
		/**
		 * Class to use when movie is selected
		 *
		 * @attribute sSelectedClassName
		 * @type {String}
		 * @value 'list-group-item-info'
		 */
		sSelectedClassName: {
			value : 'list-group-item-info'
		}
	};
	
	Y.WidgetSelectMovies = Y.extend(WidgetSelectMovies, Y.WidgetBase,
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

			this.set('oDataset', oWidgetDef.d );			
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
				sMovieListItemTpl = this.get( 'sMovieListItem'),
				sTagTemplate = this.get( 'sTagTemplate' ),
				oWidgetContent = {},
				sSelectedClassName = this.get( 'sSelectedClassName' ),
				iLastLevel = 1;
		
			oDataset.RowData().BackupCursor();
			oDataset.RowData().First();
			
			while ( oDataset.RowData().EoF( true ) == false ) {
				
				var sLevel = oDataset.Field( 'level' ).GetValue(),
					sMovieListItem,
					aTags = [],
					sTags = oDataset.Field( 'tags' ).GetValue();

				if ( sTags ) {
					var aWords = sTags.split( ' ' );
					
					for ( var i = 0; i < aWords.length; i++ ) {
						switch ( aWords[ i ].toLowerCase() ) {
							case 'difficile':
								aTags.push( Y.Lang.sub(
									sTagTemplate, {
										class: 'label-danger',
										tag: aWords[ i ].toLowerCase()
									} )
								);
								break;
							case 'essentiel':
								aTags.push( Y.Lang.sub(
									sTagTemplate, {
										class: 'label-info',
										tag: aWords[ i ].toLowerCase()
									} )
								);
								break;
						}
					}
				}
				
				sMovieListItem = Y.Lang.sub(
					sMovieListItemTpl, {
						id: this.UniqId() + '-' + oDataset.Field( 'id_data' ).GetValue(),
						label: oDataset.Field( 'label' ).GetValue(),
						teacher: oDataset.Field( 'teacher' ).GetValue(),
						class: ( oDataset.Field( 'selected' ).GetValue() ? sSelectedClassName : '' ),
						tags: aTags.join( '' )
					}
				);
				
				if ( oDataset.Field( 'selected' ).GetValue() && oDataset.Field( 'level' ).GetValue() > iLastLevel ) {
					iLastLevel = oDataset.Field( 'level' ).GetValue();
				}
				
				if ( Y.Lang.isUndefined( oWidgetContent[ sLevel ] ) ) {
					oWidgetContent[ sLevel ] = {
						label : Y.Translate._( "Level #{0}" ).format( oDataset.Field( 'level' ).GetValue() ),
						teacherMovies : [],
						globalMovies : []
					};
				}
				
				// 12 = "Global"
				if ( oDataset.Field( 'movie_type' ).GetValue() == 12 ) {
					oWidgetContent[ sLevel ].globalMovies.push( sMovieListItem );
				} else {
					oWidgetContent[ sLevel ].teacherMovies.push( sMovieListItem );					
				}

				oDataset.RowData().Next();
			}
			
			var aLevels = [],
				sLevelTemplate = this.get( 'sLevelTemplate');
			
			for ( var sCurrentLevel in oWidgetContent ) {
				aLevels.push(
					Y.Lang.sub(
						sLevelTemplate, {
							levelId : 'level-' + sCurrentLevel,
							levelTitle: oWidgetContent[ sCurrentLevel ].label,
							teacherMovies : oWidgetContent[ sCurrentLevel ].teacherMovies.join( '' ),
							teacherMoviesCount : oWidgetContent[ sCurrentLevel ].teacherMovies.length,
							globalMovies: oWidgetContent[ sCurrentLevel ].globalMovies.join( '' ),
							globalMoviesCount: oWidgetContent[ sCurrentLevel ].globalMovies.length
						}
					)
				);
			}
							
			Y.one( document.getElementById( sNodeId ) ).append( Y.Lang.sub(
				this.get( 'sRootTemplate' ), {
					id: this.UniqId(),
					levels: aLevels.join( '' ),
					eltClass: this.GetClass()
				})
			);
	
			var oNode = Y.one( document.getElementById( this.UniqId() ) );
			
			// Scroll to last level
			window.location = '#level-' + iLastLevel;
	
			// Important: keep this order, _onMoviePlayClick must be called in first
			oNode.delegate( 
				'click', 
				this._onMoviePlayClick, 
				'.movie-play-icon', 
				this
			);
	
			oNode.delegate( 
				'click', 
				this._onMovieClick, 
				'.movie-item', 
				this
			);
		},		

		/**
		 * Select / Unselect movie
		 * @param {Y.Event} e
		 * @param {Object} args
		 * @returns {void}
		 */
		_onMovieClick : function( e, args )
		{
			var sSelectedClassName = this.get( 'sSelectedClassName' ),
				sId = e.currentTarget.get( 'id' ).split( '-' )[ 1 ],
				oDataset = this.get( 'oDataset' );

			e.preventDefault();
			oDataset.RowData().BackupCursor();
			oDataset.SelectRowFromPrimaryKey( sId );
			if ( e.currentTarget.hasClass( sSelectedClassName ) ) {
				e.currentTarget.removeClass( sSelectedClassName );
				oDataset.Field( 'selected' ).SetValue( 0 );
			} else {
				e.currentTarget.addClass( sSelectedClassName );
				oDataset.Field( 'selected' ).SetValue( 1 );
			}
			oDataset.RowData().RestoreCursor();
		},

		/**
		 * Select / Unselect movie
		 * @param {Y.Event} e
		 * @param {Object} args
		 * @returns {void}
		 */
		_onMoviePlayClick : function( e, args )
		{
			var oNode = Y.one( e.currentTarget ),
				sIdMovie = oNode.ancestor().get( 'id' ).split( '-' )[ 1 ];
			
			e.preventDefault();
			e.stopImmediatePropagation();
			this.Layout().get( 'oWidgets' )[ 'videoPlayer' ].Update( sIdMovie );
			this.Layout().get( 'oWidgets' )[ 'videoPlayer-dialog' ].Show();
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