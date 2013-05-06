define (require) ->
	$ = require '$'
	_ = require '_'
	Backbone = require 'Backbone'
	Handlebars = require 'Handlebars'

	console.log [$, _, Backbone, Handlebars]

	template = require 'tpl!test'
	console.log template(userName: 'LENAR')