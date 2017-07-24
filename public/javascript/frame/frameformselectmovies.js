YUI.add("frameformselectmovies", function(Y)
{
	/**
	 * Frame
	 *
	 * @module frame
	 * @submodule form
	 */

	/**
	 * FrameFormSelectMovies
	 *
	 * Frame propre a Edit afin de :
	 * - Entrer des informations de connexion a un webservice
	 *
	 * @class FrameFormSelectMovies
	 * @extends FrameForm
	 * @constructor
	 */
	function FrameFormSelectMovies()
	{
		FrameFormSelectMovies.superclass.constructor.apply( this, arguments );
	}

	FrameFormSelectMovies.NAME = 'FrameFormSelectMovies';
	FrameFormSelectMovies.ATTRS = {
		
		iIdGroup : {
			value : null
		} 		
	};

	Y.FrameFormSelectMovies = Y.extend(FrameFormSelectMovies, Y.FrameForm, {
		/**
		 * Get URL for saving data. Extend parent method to add id group as parameter
		 *
		 * @method SaveFileURL
		 * @public
		 * @return {String} URL
		 */
		SaveFileURL : function()
		{
			return FrameFormSelectMovies.superclass.SaveFileURL.apply( this, arguments ) + '/id_group/' + this.get( 'iIdGroup' );
		}
	});
}, '0.0.1', {
	requires: [ 'frameform' ]
});