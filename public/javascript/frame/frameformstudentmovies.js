YUI.add("frameformstudentmovies", function(Y)
{
	/**
	 * Frame
	 *
	 * @module frame
	 * @submodule form
	 */

	/**
	 * FrameFormStudentMovies
	 *
	 * Frame propre a Edit afin de :
	 * - Entrer des informations de connexion a un webservice
	 *
	 * @class FrameFormStudentMovies
	 * @extends FrameForm
	 * @constructor
	 */
	function FrameFormStudentMovies()
	{
		FrameFormStudentMovies.superclass.constructor.apply( this, arguments );
	}

	FrameFormStudentMovies.NAME = 'FrameFormStudentMovies';
	FrameFormStudentMovies.ATTRS = {
		
	};

	Y.FrameFormStudentMovies = Y.extend(FrameFormStudentMovies, Y.FrameForm, {
		/**
		 * Construction logic executed during object instantiation.
		 *
		 * @method initializer
		 * @param oFrameCfg {Object}
		 * @protected
		 */
		initializer : function()
		{
			Y.on( 'list:favoriteFilter', this._filter, this, 'favorite' );
			Y.on( 'list:unplayedFilter', this._filter, this, 'unplayed' );
		},
		
		/**
		 * Filter movie list
		 *
		 * @method _favoriteFilter
		 * @protected
		 * @param sFilter {String}
		 */
		_filter : function( sFilter )
		{
			var oWidgetList = this.Layout().get( 'oWidgets' )[ 'movieList' ],
				oWidgetFavorite = this.Layout().get( 'oWidgets' )[ 'favorite-btn' ],
				oWidgetUnplayed = this.Layout().get( 'oWidgets' )[ 'unplayed-btn' ],
				sSelectedClass = 'btn-info';
			
			Y.one( '#' + oWidgetFavorite.UniqId() ).removeClass( sSelectedClass );
			Y.one( '#' + oWidgetUnplayed.UniqId() ).removeClass( sSelectedClass );
			
			console.log( 'filter = ', sFilter );
			
			if ( oWidgetList.get( 'sFilter' ) == sFilter ) {
				oWidgetList.set( 'sFilter', null );
			} else {
				oWidgetList.set( 'sFilter', sFilter );

				if ( sFilter == 'favorite' ) {
					Y.one( '#' + oWidgetFavorite.UniqId() ).addClass( sSelectedClass );
				} else if ( sFilter == 'unplayed' ) {
					Y.one( '#' + oWidgetUnplayed.UniqId() ).addClass( sSelectedClass );
				}
			}
			
			oWidgetList.Update();
		},
		
		/**
		 * Destroy Frame
		 *
		 * @method Destroy
		 * @public
		 */
		Destroy : function()
		{
			FrameFormEditAmap.superclass.Destroy.apply(this, arguments);
			
			// Destruction des événements customs de la frame
			Y.detach( 'list:favoriteFilter' );
			Y.detach( 'list:unplayedFilter' );
		}
	});
}, '0.0.1', {
	requires: [ 'frameform' ]
});