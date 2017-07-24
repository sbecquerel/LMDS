YUI.add("frameformimportmovies", function(Y)
{
	/**
	 * Frame
	 *
	 * @module frame
	 * @submodule form
	 */

	/**
	 * FrameFormImportMovies
	 *
	 * Frame propre a Edit afin de :
	 * - Entrer des informations de connexion a un webservice
	 *
	 * @class FrameFormImportMovies
	 * @extends FrameForm
	 * @constructor
	 */
	function FrameFormImportMovies()
	{
		FrameFormImportMovies.superclass.constructor.apply( this, arguments );
	}

	FrameFormImportMovies.NAME = 'FrameFormImportMovies';
	FrameFormImportMovies.ATTRS = {
		/**
		 * @attribute iSavedCursor
		 * @description Saved record to get previous values
		 * @type {integer}
		 */
		iSavedCursor :
		{
			value: null
		},
		
		/**
		 * @attribute aVarsToRepeat
		 * @description Variables to repeat
		 * @type {array}
		 */
		aVarsToRepeat : {
			value : [ 'teacher', 'level', 'movie_type' ],
			writeOnce : true
		}
	};

	Y.FrameFormImportMovies = Y.extend(FrameFormImportMovies, Y.FrameForm, {
		/**
		 * Construction logic executed during object instantiation.
		 *
		 * @method initializer
		 * @param oFrameCfg {Object}
		 * @protected
		 */
		initializer : function()
		{
			this.set( 
				'iSavedCursor', 
				this.DataSetManager().DataSet('movie').RowData().GetCursor() 
			);
		},
		
		/**
		 * Method called after dataset modify (new record, deleted record, ...)
		 *
		 * @method DataSetChangeEvent
		 * @public
		 * @param oDataSet {dataset} dataset with new record
		 */
		DataSetChangeEvent : function( oDataSet, bCursorMoved )
		{
			if ( oDataSet.Id() == 'movie' && bCursorMoved ) {
			
				var aVarsToRepeat = this.get( 'aVarsToRepeat' ),
					aPreviousRecord = 
						oDataSet.RowData().get( 'aRowData' )[ this.get( 'iSavedCursor' ) ];

				for ( var i = 0; i < aVarsToRepeat.length; i++ ) {
					
					var sVarName = aVarsToRepeat[ i ];
					
					if ( oDataSet.Field( sVarName ).GetValue() == null ) {
						oDataSet.Field( sVarName ).SetValue( aPreviousRecord[ sVarName ] );
					}
				} 
				
				this.set( 
					'iSavedCursor', 
					oDataSet.RowData().GetCursor() 
				);
			}
			
			FrameFormImportMovies.superclass.DataSetChangeEvent.apply( this, arguments );
		}
	});
}, '0.0.1', {
	requires: [ 'frameform' ]
});