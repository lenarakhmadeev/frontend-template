requirejs.config
	baseUrl: 'scripts'

	paths:
		# Libraries
		jquery: 'lib/jquery/jquery-2.0.0'
		lodash: 'lib/lodash-1.2.1'
		backbone: 'lib/backbone-1.0.0'
		Handlebars: 'lib/handlebars-1.0.0-rc.3'

		# Requirejs's plugins
		text: 'lib/requirejs/text-2.0.6'
		tpl: 'lib/requirejs/tpl'

		# jQuery's plugins
		jquery_role: 'lib/jquery/jquery.role'

		# Templates path
		templates: '../templates'


	map:
		# Aliases
		'*':
			_: 'lodash'
			underscore: 'lodash'
			Backbone: 'backbone'
			$: 'jquery'
			Collection: 'core/collection'
			View: 'core/view'
			Model: 'core/model'


	# Not AMD modules
	shim:
		backbone:
			deps: ['$', '_']
			exports: 'Backbone'

		Handlebars:
			exports: 'Handlebars'