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
YUI.add("widgetchart", function(Y)
{
	/**
	 * Layout
	 *
	 * @module layout
	 * @submodule widget
	 */

	/**
	 * Widget Chart
	 *
	 * @class WidgetChart
	 * @extends WidgetBase
	 * @constructor
	 */
	function	WidgetChart()
	{
		WidgetChart.superclass.constructor.apply(this, arguments);
	}

	WidgetChart.NAME = 'WidgetChart';
	WidgetChart.ATTRS =
	{
		/**
		 * @attribute oChart
		 * @description Chart
		 * @type {Y.Chart}
		 */
		oChart:
		{

		},

		/**
		 * @attribute sDataSetId
		 * @description Dataset used for chart
		 * @type {String}
		 */
		sDataSetId:
		{
			
		},

		/**
		 * @attribute sType
		 * @description Char type
		 * @type {String}
		 */
		sType:
		{

		}
	};
	
	Y.WidgetChart = Y.extend(WidgetChart, Y.WidgetBase,
	{
		// ----- Methods -----
		/**
		 * Construction logic executed during object instantiation.
		 *
		 * @method initializer
		 * @protected
		 */
		initializer : function()
		{
			var	oWidgetDef = this.get('oWidgetDef');

			this.set( 'sDataSetId', oWidgetDef.d );
			
//			var sType = this.GetWidgetDefValue( 'options.type', false )
//			if ( sType !== false ) {
//				this.set( 'sType', sType );
//			}
			
//			this.set( 'sType', this.GetWidgetDefValue( 'options.type' ) );
		},

		/**
		 * Destroy Widget
		 *
		 * @method Destroy
		 * @public
		 */
		Destroy : function()
		{

		},

		/**
		 * Create chart and render it
		 *
		 * @method _createChart
		 * @protected
		 */
		_createChart : function()
		{
			var oChartOptions = { 				
				render: "#" + this.UniqId()
			};

			var oDataSet = this.Layout().Frame().DataSetManager().DataSet( this.get( 'sDataSetId' ) );
			oChartOptions[ 'dataProvider' ] = oDataSet.RowData().get( 'aRowData' );
			
//			var sType = this.get( 'sType' );
//			if ( Y.Lang.isUndefined( sType ) === false ) {
//				oChartOptions[ 'type' ] = sType;
//			}			
			
			var oChart = new Y.Chart( oChartOptions );
			
			this.set( 'oChart', oChart ); 
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
			Y.one( '#' + sNodeId ).append( '<div id="' + this.UniqId() + '"></div>' );
			this._createChart();
		},

		/**
		 * Update listing (change data table content if data set changed)
		 *
		 * @method Update
		 * @public
		 *
		 * @param bCursorMoved {Boolean} true = Update user interface for selected row
		 */
		Update: function()
		{
			this.get( 'oChart' ).destroy();
			this._createChart();
		},
		
		/**
		 * Method called when a dataset changes (new record or new dataset). If Dataset is used by widget, widget is updated.
		 *
		 * @method DataSetChangeEvent
		 * @param oDataSet {DataSet} updated dataset
		 */
		DataSetChangeEvent : function( oDataSet )
		{
			var oCurrentDataSet = 
				this.Layout().Frame().DataSetManager().DataSet( this.get( 'sDataSetId' ) );
			
			if ( oDataSet.Id() == oCurrentDataSet.Id() ) {
				this.Update();
			}
		},
	});
}, '0.0.1', {
	requires: ['widgetbase', 'charts']
});