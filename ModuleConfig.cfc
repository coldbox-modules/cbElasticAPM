component {

	this.modelNamespace     = "cbElasticAPM";
	this.cfmapping          = "cbElasticAPM";
	this.autoMapModels      = true;

	function configure() {

		settings = {
		};

	}

	function onLoad() {
		variables.elasticAPMService = wirebox.getInstance( 'ElasticAPMService@cbElasticAPM' );
	}

	function preProcess( required struct interceptData ) {
		if( !isNull( elasticAPMService ) ) {
			elasticAPMService.setCurrentTransactionName( event.getCurrentEvent() );
		}
	}

}
