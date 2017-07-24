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
YUI.add("widgetmovies", function(Y)
{
	/**
	 * Layout
	 *
	 * @module layout
	 * @submodule widget
	 */

	/**
	 * Widget Movies
	 * @class WidgetMovies
	 * @extends WidgetBase
	 * @constructor
	 */
	function	WidgetMovies()
	{
		WidgetMovies.superclass.constructor.apply(this, arguments);
	}

	WidgetMovies.NAME = 'WidgetMovies';
	WidgetMovies.ATTRS =
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
			value: '<div id={id} class="{class}" role="tabpanel"></div>'
		},				
				
		/**
		 * @attribute sTemplate
		 * @description widget template
		 * @type {string}
		 */
		sTemplate:
		{
			value: [
				'<ul class="nav nav-tabs" role="tablist">',
					'<li role="presentation">',
						'<a href="#accueil" aria-controls="accueil" role="tab" data-toggle="tab">',
						Y.Translate._( 'Accueil' ),
						'</a>',
					'</li>',
					'{tabs}',
				'</ul>',
				'<div class="tab-content">',
					'<div role="tabpanel" class="tab-pane" id="accueil">',
						'<ul class="nav nav-tabs" role="tablist">',
							'<li role="presentation" class="active">',
								'<a href="#info" aria-controls="info" role="tab" data-toggle="tab">',
									Y.Translate._( 'Info.' ),
								'</a>',
							'</li>',
							'<li role="presentation">',
								'<a href="#faq" aria-controls="faq" role="tab" data-toggle="tab">',
									Y.Translate._( 'FAQ' ),
								'</a>',
							'</li>',								
						'</ul>',
						'<div class="tab-content">',																
							'<div role="tabpanel" class="tab-pane active" id="info">{infoTabContent}</div>',
							'<div role="tabpanel" class="tab-pane" id="faq">{faqTabContent}</div>',
						'</div>',
					'</div>',
					'{tabsContent}',
				'</div>',
			].join( ' ' )
		},
		
		/**
		 * @attribute sTabTemplate
		 * @description tab template
		 * @type {string}
		 */
		sTabTemplate:
		{
			value: [
				'<li role="presentation" class="{class}">',
					'<a href="#{id}" aria-controls="{id}" role="tab" data-toggle="tab">',
						'{label}',
						'<span id="{unplayedCounterId}" class="label label-info label-unplayedCounter" style="{unplayedStyle}">',
							'{unplayedCounter}',
						'</span>',
					'</a>',
				'</li>'
			].join( ' ' )
		},
		
		/**
		 * @attribute sTabContentTemplate
		 * @description tab content template
		 * @type {string}
		 */
		sTabContentTemplate:
		{
			value: [ 
				'<div role="tabpanel" class="tab-pane {class}" id="{id}">',
					'<div id={idSubTab} role="tabpanel">',
						'<div id={id} role="tabpanel">',
							'<ul class="nav nav-tabs" role="tablist">',
								'<li role="presentation">',
									'<a href="#{groupId}" aria-controls="{groupId}" role="tab" data-toggle="tab">',
										Y.Translate._( 'Morceaux' ),
										'<span id="{unplayedGroupCounterId}" class="label label-info label-unplayedCounter" style="{unplayedGroupStyle}">',
											'{unplayedGroupCounter}',
										'</span>',
									'</a>',
								'</li>',
								'<li role="presentation" class="active">',
									'<a href="#{globalId}" aria-controls="{globalId}" role="tab" data-toggle="tab">',
										Y.Translate._( 'Pédago.' ),
										'<span id="{unplayedGlobalCounterId}" class="label label-info label-unplayedCounter" style="{unplayedGlobalStyle}">',
											'{unplayedGlobalCounter}',
										'</span>',
									'</a>',
								'</li>',								
							'</ul>',
							'<div class="tab-content">',																
								'<div role="tabpanel" class="tab-pane" id="{groupId}">{groupContent}</div>',
								'<div role="tabpanel" class="tab-pane active" id="{globalId}">{globalContent}</div>',
							'</div>',
						'</div>',
					'</div>',
				'</div>'
			].join( ' ' )
		},
				
		/**
		 * @attribute sMovieTemplate
		 * @description movie template
		 * @type {string}
		 */
		sMovieTemplate: 
		{
			//<div class="clearfix visible-lg-col"></div>
			value: [
				'<div class="col-sm-12 col-md-6 col-lg-4 {class}">',
					'<div id="{id}" class="videoSticker {stickerClass}">',
						'<span id="{idFavorite}" style="{favoriteStyle}" class="glyphicon {favoriteClass}"></span>',
						'<h4>{label}</h4>',
						'<h5 class="subLabel" style="{subLabelStyle}">{subLabel}</h5>',
						'{tags}',
						'<p class="description">{description}</p>',						
						'<div class="videoSticker-footer">',
						'<div class="difficulty" style="{difficultyStyle}">',
						Y.Translate._( 'Difficulté' ) + ': ',
						'<span class="difficultyValue">{difficulty}/10</span>',
						'</div>',
						'<div class="author">',
						Y.Translate._( 'Auteur' ) + ': ',
						'<span class="teacher">{teacher}</span>',
						'</div>',
//						'{pdf}',
						'</div>',
					'</div>',
				'</div>'
			].join( '' )
		},
		
		/**
		 * @attribute sPdfTemplate
		 * @description PDF template
		 * @type {string}
		 */
		sPdfTemplate:
		{
			value: [
				'<span id="{idPdf}"  class="fa fa-file-pdf-o pdf-icon"></span>',
			].join( '' )
		},
//		sPdfTemplate:
//		{
//			value: [
//				'<div class="pdf">',
//					Y.Translate._( 'Grille' ) + ': ',
//					'<span id="{idPdf}"  class="fa fa-file-pdf-o pdf-icon"></span>',
//				'</div>',
//			].join( '' )
//		},
		
		/**
		 * @attribute sFaqTemplate
		 * @description FAQ template
		 * @type {string}
		 */
		sFaqTemplate: 
		{
			value: [
				'<div class="col-sm-12 col-md-12 col-lg-12 {class}">',
					'<div id="{id}" class="videoSticker {stickerClass} faq">',
						'{label}',
					'</div>',
				'</div>'
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
		 * @attribute sUnplayedClassName
		 * @type {String}
		 * @value 'unplayed'
		 */
		sUnplayedClassName: {
			value : 'unplayed'
		},

		/**
		 * Class to use when movie is essential
		 *
		 * @attribute sEssentialClassName
		 * @type {String}
		 * @value 'essential'
		 */
		sEssentialClassName: {
			value : 'essential'
		},
		
		/**
		 * Class to use for funny movie
		 *
		 * @attribute sFunnyClassName
		 * @type {String}
		 * @value 'funny'
		 */
		sFunnyClassName: {
			value : 'funny'
		},
		
		/**
		 * Filter list (favorite, unplayed)
		 *
		 * @attribute sFilter
		 * @type {String}
		 * @value null
		 */
		sFilter : {
			value: null
		}
	};
	
	Y.WidgetMovies = Y.extend(WidgetMovies, Y.WidgetBase,
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
		 * Add div clearfix
		 * @param {arra} aMovies
		 * @returns {String}
		 */
		_getTabContent : function( aMovies )
		{
			var sTabContent = '';
			for ( var i = 0; i < aMovies.length; i++ ) {
				if ( i % 2 == 0 && i != 0 ) {
					sTabContent += '<div class="clearfix visible-md-block"></div>';
				}
				if ( i % 3 == 0 && i != 0 ) {
					sTabContent += '<div class="clearfix visible-lg-block"></div>';
				}
				sTabContent += aMovies[ i ];
			}
			
			return sTabContent;
		},
		
		/**
		 * Get counters value
		 *
		 * @method _getCounters
		 * @protected
		 */
		_getCounters : function()
		{
			var oDataset = this.get('oDataset'),
				oCounters = {};
			
			oDataset.RowData().BackupCursor();
			oDataset.RowData().First();
			
			while ( oDataset.RowData().EoF( true ) == false ) {
				
				var iMovieType = Number( oDataset.Field( 'movie_type' ).GetValue() ),
					sLevel = oDataset.Field( 'level' ).GetValue();
				
				// iMovieType = 13 => info, 45 => FAQ
				if ( iMovieType != 13  && iMovieType != 45 ) {

					if ( Y.Lang.isUndefined( oCounters[ sLevel ] ) ) {
						oCounters[ sLevel ] = {
							group: 0,
							global: 0
						};
					}

					if ( oDataset.Field( 'played' ).GetValue() != 1 ) {
						// = "Global"/"Pédago"
						if ( iMovieType == 12 ) {
							oCounters[ sLevel ].global++;
						// = "Std"/"Morceaux"
						} else {
							oCounters[ sLevel ].group++;
						}
					}
				}
				
				oDataset.RowData().Next();
			}
			
			return oCounters;
		},

		/**
		 * Set counter value
		 *
		 * @method _setCounter
		 * @protected
		 * @param sNodeId {string} Node ID
		 * @param iCounter {integer} counter
		 */
		_setCounter : function( sNodeId, iCounter ) 
		{
			if ( ! iCounter ) {
				Y.one( '#' + sNodeId ).hide();
			} else {
				Y.one( '#' + sNodeId ).setContent( iCounter );
				Y.one( '#' + sNodeId ).show();
			}
		},
		
		/**
		 * Update counters
		 *
		 * @method UpdateCounter
		 * @public
		 */
		UpdateCounter : function()
		{
			var oCounters = this._getCounters(),
				iTotal = 0;
			
			for ( var sLevel in oCounters ) {
				
				this._setCounter( 'unplayedGlobalCounter-' + sLevel, oCounters[ sLevel ].global );
				this._setCounter( 'unplayedGroupCounter-' + sLevel, oCounters[ sLevel ].group );
				this._setCounter( 'unplayedCounter-' + sLevel, oCounters[ sLevel ].global + oCounters[ sLevel ].group );
				
				iTotal += oCounters[ sLevel ].global + oCounters[ sLevel ].group;
			}
			
			var oMainUnplayedCounter = Y.one( '#unplayedCounter-main' );
			if ( oMainUnplayedCounter ) {
				oMainUnplayedCounter.setContent( iTotal );
			}
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
			Y.one( document.getElementById( sNodeId ) ).append( Y.Lang.sub(
				this.get( 'sRootTemplate' ), {
					id: this.UniqId(),
					class: this.GetClass()
				} )
			);
	
			var oNode = Y.one( document.getElementById( this.UniqId() ) );
	
			oNode.delegate( 
				'click', 
				this._onFavoriteClick, 
				'.favorite-icon', 
				this
			);
	
			oNode.delegate( 
				'click', 
				this._onPdfClick, 
				'.pdf-icon', 
				this
			);
	
			oNode.delegate( 
				'click', 
				this._onNoFavoriteClick, 
				'.noFavorite-icon', 
				this
			);
	
			oNode.delegate( 
				'click', 
				this._onMovieClick, 
				'.videoSticker', 
				this
			);
		},
		
		/**
		 * Build widget content
		 *
		 * @method _buildWidgetContent
		 * @public
		 */
		_buildWidgetContent : function()
		{
			var oDataset = this.get('oDataset'),
				sMovieTemplate = this.get( 'sMovieTemplate' ),
				sFaqTemplate = this.get( 'sFaqTemplate' ),
				sTagTemplate = this.get( 'sTagTemplate' ),
				sPdfTemplate = this.get( 'sPdfTemplate' ),
				oWidgetContent = {},
				sUnplayedClassName = this.get( 'sUnplayedClassName' ),
				sEssentialClassName = this.get( 'sEssentialClassName' ),
				sFunnyClassName = this.get( 'sFunnyClassName' ),
				aInfoTabContent = [],
				aFaqTabContent = [],
				sFilter = this.get( 'sFilter' ),
				sStickerClass,
				sLastLevel = 0;
		
			oDataset.RowData().BackupCursor();
			oDataset.RowData().First();
			
			while ( oDataset.RowData().EoF( true ) == false ) {

				var sTags = oDataset.Field( 'tags' ).GetValue(),
					aTags = [],
					sLevel = oDataset.Field( 'level' ).GetValue(),
					iMovieType = Number( oDataset.Field( 'movie_type' ).GetValue() ),
					sMovie,
					sTagClass,
					sPdf = '',
					bNext = false,
					sLabel = oDataset.Field( 'label' ).GetValue();
			
				if ( sFilter != null ) {
					if ( sFilter == 'favorite' ) {
						if ( oDataset.Field( 'favorite' ).GetValue() != 1 ) {
							bNext = true;
						}
					}
					if ( sFilter == 'unplayed' ) {
						if ( oDataset.Field( 'played' ).GetValue() == 1 ) {
							bNext = true;
						}
					}
				}

				// @see filter
				if ( ! bNext ) {
					
					sStickerClass = '';
					
					if ( sTags && sTags.length ) {
						var aWords = oDataset.Field( 'tags' ).GetValue().split( ' ' );
						for ( var i = 0; i < aWords.length; i++ ) {
							switch ( aWords[ i ].toLowerCase() ) {
								case 'difficile':
									sTagClass = 'label-difficile';
									break;
								case 'exercice':
									sTagClass = 'label-exercice';
									break;
								case 'caged':
									// Passage en majuscules
									aWords[ i ] = 'CAGED';
									sTagClass = 'label-caged';
									break;
								case 'théorie':
								case 'theorie':
									sTagClass = 'label-theorie';
									break;	
								default:
									sTagClass = 'label-primary';
							}

							aTags.push( Y.Lang.sub(
								sTagTemplate, {
									tag: aWords[ i ],
									class: sTagClass
								}
							) );
						}
					
						if ( sTags.toLowerCase().match( /(essentiel)/g ) != null ) {
							sStickerClass = sEssentialClassName;
						} else if ( sTags.toLowerCase().match( /(bêtisier|betisier)/g ) != null ) {
							sStickerClass = sFunnyClassName;
						}
					}

					if ( sStickerClass == '' ) {
						if ( oDataset.Field( 'played' ).GetValue() != 1 ) {
							sStickerClass = sUnplayedClassName;
						}
					}
					
					// Les pdfs sont affichés avec dans le libellé de la vidéo
					if ( oDataset.Field( 'id_pdf_file' ).GetValue() != null ) {
						sLabel += Y.Lang.sub( sPdfTemplate, {
							idPdf : this.UniqId() + '-' + oDataset.Field( 'id_pdf_file' ).GetValue()
						} );
					}

					sMovie = Y.Lang.sub(
						// 45 = FAQ
						( iMovieType != 45 ? sMovieTemplate : sFaqTemplate ), {
							id: this.UniqId() + '-' + oDataset.Field( 'id_data' ).GetValue(),
							label: sLabel,
							subLabelStyle: ( ! oDataset.Field( 'sub_label' ).GetValue() ? 'display:none' : '' ),
							subLabel: oDataset.Field( 'sub_label' ).GetValue(),
							description: oDataset.Field( 'description' ).GetValue() || '',
							class: '',
							stickerClass: sStickerClass,
							favoriteClass: ( oDataset.Field( 'favorite' ).GetValue() == 1 ? 'glyphicon-star favorite-icon' : 'glyphicon-star-empty noFavorite-icon' ),
							favoriteStyle: ( oDataset.Field( 'played' ).GetValue() == 1 ? '' : 'display:none;' ),
							idFavorite: this.UniqId() + '-' + oDataset.Field( 'id_data' ).GetValue() + '-favorite',
							teacher: oDataset.Field( 'teacher' ).GetValue(),
							tags: aTags.join( ' ' ),
							difficultyStyle: ( ! oDataset.Field( 'difficulty' ).GetValue() ? 'display:none' : '' ),
							difficulty: oDataset.Field( 'difficulty' ).GetValue(),
//							pdf: sPdf
						}
					);

					// iMovieType = 13 => info, 45 => FAQ
					if ( Y.Lang.isUndefined( oWidgetContent[ sLevel ] ) && iMovieType != 13  && iMovieType != 45 ) {
						oWidgetContent[ sLevel ] = {
							id : oDataset.Field( 'level' ).GetValue(),
							label : Y.Translate._( "Level #{0}" ).format( oDataset.Field( 'level' ).GetValue() ),
							groupMovies : [],
							globalMovies : [],
							unplayedCounter : {
								group: 0,
								global: 0
							}
						};
					}

					if ( iMovieType != 13  && iMovieType != 45 ) {
						
						// Mise à jour des compteurs
						if ( oDataset.Field( 'played' ).GetValue() != 1 ) {

							if ( iMovieType == 12 ) {
								oWidgetContent[ sLevel ].unplayedCounter.global++;
							} else {
								oWidgetContent[ sLevel ].unplayedCounter.group++;
							}
						}
						
						// Calcul niveau max pour déterminer l'onglet actif (= dernier niveau)
						if ( sLevel > sLastLevel ) {
							sLastLevel = sLevel;
						}
					}
					
					switch ( iMovieType ) {					
						case 12: // = "Global"/"Pédago"
							oWidgetContent[ sLevel ].globalMovies.push( sMovie );
							break;					
						case 13: // = "Info"
							aInfoTabContent.push( sMovie );
							break;
						case 45: // = FAQ
							aFaqTabContent.push( sMovie );
							break;
						default: // = "Std"/"Morceaux"
							oWidgetContent[ sLevel ].groupMovies.push( sMovie );
					}
				}

				oDataset.RowData().Next();
			}
			
			var aTabs = [],
				sTabTemplate = this.get( 'sTabTemplate' ),
				aTabsContent = [],
				sTabContentTemplate = this.get( 'sTabContentTemplate');

			for ( var sCurrentLevel in oWidgetContent ) {
				
				var iUnplayedCount = 
					oWidgetContent[ sCurrentLevel ].unplayedCounter.global +
					oWidgetContent[ sCurrentLevel ].unplayedCounter.group,
					sClass = '';

				// On rend l'onglet représentant le niveau le plus haut actif
				if ( ! Y.Lang.isUndefined( sLastLevel ) && sCurrentLevel == sLastLevel ) {
					sClass = "active";
				}
				

				aTabs.push( 
					Y.Lang.sub(
						sTabTemplate, {
							id: 'tab-' + oWidgetContent[ sCurrentLevel ].id,
							label : oWidgetContent[ sCurrentLevel ].label,
							class: sClass,
							unplayedCounterId : 'unplayedCounter-' + oWidgetContent[ sCurrentLevel ].id,
							unplayedCounter : iUnplayedCount,
							unplayedStyle : ( iUnplayedCount ? '' : 'display:none' )
						}
					)
				);

				aTabsContent.push(
					Y.Lang.sub(
						sTabContentTemplate, {
							id : 'tab-' + oWidgetContent[ sCurrentLevel ].id,
							class: sClass,
							idSubTab : 'subTab-' + oWidgetContent[ sCurrentLevel ].id,
							globalId : 'global-' + oWidgetContent[ sCurrentLevel ].id,
							groupId : 'group-' + oWidgetContent[ sCurrentLevel ].id,
							groupContent : this._getTabContent( oWidgetContent[ sCurrentLevel ].groupMovies ),
							globalContent : this._getTabContent( oWidgetContent[ sCurrentLevel ].globalMovies ),
							unplayedGlobalStyle : ( oWidgetContent[ sCurrentLevel ].unplayedCounter.global ? '' : 'display:none' ),
							unplayedGroupStyle : ( oWidgetContent[ sCurrentLevel ].unplayedCounter.group ? '' : 'display:none' ),
							unplayedGlobalCounterId : 'unplayedGlobalCounter-' + oWidgetContent[ sCurrentLevel ].id,
							unplayedGroupCounterId : 'unplayedGroupCounter-' + oWidgetContent[ sCurrentLevel ].id,
							unplayedGlobalCounter : oWidgetContent[ sCurrentLevel ].unplayedCounter.global,
							unplayedGroupCounter : oWidgetContent[ sCurrentLevel ].unplayedCounter.group
						}
					)	
				);
			}
							
			Y.one( document.getElementById( this.UniqId() ) ).append( Y.Lang.sub(
				this.get( 'sTemplate' ), {
					tabs: aTabs.join( '' ),
					tabsContent: aTabsContent.join( '' ),					
					class: this.GetClass(),
					infoTabContent: this._getTabContent( aInfoTabContent ),
					faqTabContent : this._getTabContent( aFaqTabContent )
				} )
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
			var sIdMovie = e.currentTarget.get( 'id' ).split( '-' )[ 1 ],
				sUnplayedClassName = this.get( 'sUnplayedClassName' );
			
			e.preventDefault();
			if ( e.currentTarget.hasClass( sUnplayedClassName ) ) {
				e.currentTarget.removeClass( sUnplayedClassName );				
			}
			
			// On affiche l'étoile et on met à jour les compteurs
			var oStarNode = Y.one( '#' + e.currentTarget.get( 'id' ) + ' .noFavorite-icon' );
			if ( oStarNode ) {
				oStarNode.setStyle( 'display', 'block' );
				
				var oDataset = this.get('oDataset'),
					iMovieType; 

				oDataset.SelectRowFromPrimaryKey( sIdMovie );
				iMovieType = oDataset.Field( 'movie_type' ).GetValue();

				if ( iMovieType != 13  && iMovieType != 45  ) {
						oDataset.Field( 'played' ).SetValue( 1 );

						this.UpdateCounter();
				}
			}
		
			this.Layout().get( 'oWidgets' )[ 'videoPlayer' ].Update( sIdMovie );
			this.Layout().get( 'oWidgets' )[ 'videoPlayer-dialog' ].Show();
		},
		
		/**
		 * Set movie as no favorite
		 * @param {Y.Event} e
		 * @param {Object} args
		 * @returns {void}
		 */
		_onFavoriteClick : function( e, args )
		{
			var sIdMovie = e.currentTarget.get( 'id' ).split( '-' )[ 1 ];
			
			e.preventDefault();
			e.stopImmediatePropagation();
			
//			this.Layout().ShowLoading();
			this.Layout().Frame().IOManager().Execute(	
				Y.Voozanoo.properties.project_url + '/student/movies/unset-favorite/id_movie/' + sIdMovie,
				this,
				null,
				'IOUnsetFavoriteSuccess',
				e.currentTarget
			);
		},
		
		/**
		 * Show PDF
		 * @param {Y.Event} e
		 * @param {Object} args
		 * @returns {void}
		 */
		_onPdfClick : function( e, args )
		{
			var sIdPdf = e.currentTarget.get( 'id' ).split( '-' )[ 1 ];
			
			e.preventDefault();
			e.stopImmediatePropagation();
			
			this.Layout().Frame().Redirect( {
				module : 'student',
				ctrl : 'movies',
				action: 'get-pdf',
				type: 'window',
				params: [
					{
						type: 'value',
						value: sIdPdf,
						alias: 'id_pdf'
					}
				]
			});
		},
		
		/**
		 * Set movie as favorite
		 * @param {Y.Event} e
		 * @param {Object} args
		 * @returns {void}
		 */
		_onNoFavoriteClick : function( e, args )
		{
			var sIdMovie = e.currentTarget.get( 'id' ).split( '-' )[ 1 ];
			
			e.preventDefault();
			e.stopImmediatePropagation();
			
//			this.Layout().ShowLoading();
			this.Layout().Frame().IOManager().Execute(	
				Y.Voozanoo.properties.project_url + '/student/movies/set-favorite/id_movie/' + sIdMovie,
				this,
				null,
				'IOSetFavoriteSuccess',
				e.currentTarget
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
			Y.one( document.getElementById( this.UniqId() ) ).setContent( '' );
			this._buildWidgetContent();
		},
		
		/**
		 * Method called by the query manager when request response fires
		 *
		 * @method IO
		 * @param fcallback {function}
		 * @param id {String}
		 * @param o {Object}
		 * @param args {Array}
		 */
		IO : function(fcallback, id, o, args)
		{
			switch (fcallback)
			{
				case 'IOSetFavoriteSuccess':
					var oNode = args.aParams;
					if ( oNode.hasClass( 'glyphicon-star-empty' ) ) {
						oNode.removeClass( 'glyphicon-star-empty' );				
					}
					if ( oNode.hasClass( 'noFavorite-icon' ) ) {
						oNode.removeClass( 'noFavorite-icon' );				
					}
					if ( ! oNode.hasClass( 'glyphicon-star' ) ) {
						oNode.addClass( 'glyphicon-star' );				
					}
					if ( ! oNode.hasClass( 'favorite-icon' ) ) {
						oNode.addClass( 'favorite-icon' );				
					}	
//					this.Layout().HideLoading();
					this._animateStar( oNode );
					break;

				case 'IOUnsetFavoriteSuccess':
					var oNode = args.aParams;
					if ( oNode.hasClass( 'glyphicon-star' ) ) {
						oNode.removeClass( 'glyphicon-star' );				
					}
					if ( oNode.hasClass( 'favorite-icon' ) ) {
						oNode.removeClass( 'favorite-icon' );				
					}
					if ( ! oNode.hasClass( 'glyphicon-star-empty' ) ) {
						oNode.addClass( 'glyphicon-star-empty' );				
					}
					if ( ! oNode.hasClass( 'noFavorite-icon' ) ) {
						oNode.addClass( 'noFavorite-icon' );				
					}
//					this.Layout().HideLoading();
					
					break;
			}
		},
		
		/**
		 * Animate star after click
		 * @param {Object} oNode
		 * @returns {void}
		 */
		_animateStar : function( oNode )
		{
			var oAnimStart,
				oAnimEnd;
			
			// Animation pour attirer le regard sur l'élément qui a été tranformé
			// (voir déplacé)
			oAnimStart = new Y.Anim({
				node: oNode,
				to: {
					fontSize: '35px'
				},
				duration: 0.2
			});				
			oAnimStart.run();				
			oAnimStart.on( 'end', function(){
				oAnimEnd = new Y.Anim({
					node: oNode,
					to: {
						fontSize: '25px'						
					},
					duration: 0.2
				});
				oAnimEnd.run();
			});
		}
	});
}, '0.0.1', {
	requires: ['widgetbase']
});