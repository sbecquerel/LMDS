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
YUI.add("widgetvideoplayerhtml5", function(Y)
{
	/**
	 * Layout
	 *
	 * @module layout
	 * @submodule widget
	 */

	/**
	 * Widget Movies
	 * @class WidgetVideoPlayerHtml5
	 * @extends WidgetBase
	 * @constructor
	 */
	function	WidgetVideoPlayerHtml5()
	{
		WidgetVideoPlayerHtml5.superclass.constructor.apply(this, arguments);
	}

	WidgetVideoPlayerHtml5.NAME = 'WidgetVideoPlayerHtml5';
	WidgetVideoPlayerHtml5.ATTRS =
	{			
		/**
		 * @attribute sRootTemplate
		 * @description root template
		 * @type {string}
		 */
		sRootTemplate:
		{
			value: '<div id="{id}"></div>'
		},
		
		/**
		 * @attribute sPlayerTemplate
		 * @description player template
		 * @type {string}
		 */
		sPlayerTemplate:
		{
			value: [
				'<video id="{id}" width="100%" controls="controls" oncontextmenu="return false;">',
					'<source src="{src}" type="video/mp4">  ',
					Y.Translate._( 'Your browser does not support the video tag.' ),
				'</video> ',
			].join( '' )
		},
		
		/**
		 * @attribute sVideoNodeId
		 * @description video node id
		 * @type {string}
		 */
		sVideoNodeId: {
			value: 'video',
			getter: function( sValue ) {
				return this.UniqId() + '-' + sValue;
			}
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
		 * Video source
		 *
		 * @attribute sVideoSource
		 * @type {String}
		 * @value null
		 */
		sVideoSource : 
		{
			value: null
		}
	};
	
	Y.WidgetVideoPlayerHtml5 = Y.extend(WidgetVideoPlayerHtml5, Y.WidgetBase,
	{
		/**
		 * Construction logic executed during object instantiation.
		 *
		 * @method initializer
		 * @protected
		 */
		initializer : function()
		{
		},
		
		/**
		 * Destroy Widget
		 *
		 * @method Destroy
		 * @public
		 */
		Destroy : function()
		{
			var oVideoNode = Y.one( document.getElementById( this.get( 'sVideoNodeId' ) ) );
						
			oVideoNode.pause();
//			oVideoNode.src = "";
//			oVideoNode.load();
			
//			delete( oVideoNode );
			
			Y.one( this.get( 'sVideoNodeId') ).remove().destroy();
			Y.one( this.UniqId() ).remove().destroy();
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
				})
			);
		},
		
		/**
		 * Video pause
		 * @method Pause
		 * @public
		 */
		Pause : function()
		{
			var oVideoNode = Y.one( document.getElementById( this.get( 'sVideoNodeId' ) ) );
			
			if ( oVideoNode ) {
				oVideoNode.getDOMNode().pause();
			}
		},
		
		/**
		 * Video play
		 * @method Play
		 * @public
		 */
		Play : function()
		{
			var oVideoNode = Y.one( document.getElementById( this.get( 'sVideoNodeId' ) ) );
			
			if ( oVideoNode ) {
				oVideoNode.getDOMNode().play();
			}
		},

		/**
		 * Update widget
		 *
		 * @method Update
		 * @public
		 */
		Update: function( sIdMovie )
		{
			if ( Y.Lang.isUndefined( sIdMovie ) ) {
				return;
			}

			var oVideoNode = Y.one( document.getElementById( this.get( 'sVideoNodeId' ) ) ),
				sVideoSource = Y.Voozanoo.properties.project_url + 'player/index/index/id_movie/' + sIdMovie;
			
			if ( ! oVideoNode ) {
				var oRootNode = Y.one( document.getElementById( this.UniqId() ) ),
					sVideoHtmlCode = Y.Lang.sub(
						this.get( 'sPlayerTemplate' ), {
							id: this.get( 'sVideoNodeId'),
							src: sVideoSource
						} 
					);
						
				oRootNode.appendChild( sVideoHtmlCode )
				this.set( 'sVideoSource', sVideoSource );

			} else if ( this.get( 'sVideoSource' ) !== sVideoSource ) {
				oVideoNode.setAttribute( 'src', sVideoSource );
				this.set( 'sVideoSource', sVideoSource );
			}
			
			this.Play();
		}
	});
}, '0.0.1', {
	requires: ['widgetbase']
});