component accessors=true singleton {

	// DI
	property name="log" inject="logbox:logger:{this}";
	property name="moduleConfig" inject="coldbox:moduleConfig:cbElasticAPM";

	property name='APMEnabled' type='boolean' default='false';
	property name='elasticAPM';

	/**
	* The constructor detects if Elastic APM is present and stores a flag that can short circuit all the methods in this service if it isn't running
	*/
	function onDIComplete() {
		try{
			var libPathList = directoryList( path=moduleConfig.path & '/lib/', recurse=true, filter="*.jar" ).toList();

			// Lucee only because Adobe sucks and I don't want to have to use javalaoder.
			elasticAPMClass = createObject("java","co.elastic.apm.api.ElasticApm", libPathList );
			
			setElasticAPM( elasticAPMClass );
			setAPMEnabled( true );
		} catch( any e ) {
			log.error( 'Unable to load Elastic APM class.  #e.message#   #e.detail#' )
			// If APM isn't present, this will hit the catch and this entire service will be "disabled"
			setAPMEnabled( false );
		}
		
    	return this;
	}
	
	/**
	* Override the name of the current transaction
	* 
	* @name The name of the transaction
	*/
	function setCurrentTransactionName( required string name ) {
		if( !getAPMEnabled() ) {
			return;
		}
		
		getElasticAPM().currentTransaction().setName( arguments.name );
	}	
	
}
