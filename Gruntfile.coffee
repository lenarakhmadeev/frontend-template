minimatch = require 'minimatch'

module.exports = (grunt) ->

	grunt.initConfig
		clean:
			build: ['build/']
			dist: ['dist/']

		copy:
			build:
				files: [
					{cwd: 'app/', src: ['scripts/**/*.js'], dest: 'build/', expand: true}
					{cwd: 'app/', src: ['**/*.html'], dest: 'build/', expand: true}
					{cwd: 'app/', src: ['**/*.hbs'], dest: 'build/', expand: true}
				]

			dist:
				files: [
					{cwd: 'build/', src: ['*.html'], dest: 'dist/', expand: true}
				]

		coffee:
			build:
				options:
					bare: true
					sourceMap: true

				expand: true
				flatten: false
				cwd: 'app/'
				src: ['scripts/**/*.coffee']
				dest: 'build'
				ext: '.js'

		watch:
			coffee:
				files: ['app/**/*.coffee']
				tasks: ['coffee:build']
				options:
					nospawn: true

		connect:
			build:
				options:
					port: 8000
					base: 'build/'

		requirejs:
			dist:
				options:
					optimize: 'none'
					baseUrl: 'build/scripts'
					name: 'main'
					mainConfigFile: 'build/scripts/config.js'
					out: 'dist/optimized.js'

					optimizeAllPluginResources: true


	# Матчим массиву
	match = (filepath, patternsArr) ->
		patternsArr.some (el) -> minimatch(filepath, el)


	# Компиляция только отдельных файлов
	grunt.event.on 'watch', (action, filepath) ->
		if match filepath, grunt.config('watch.coffee.files')
			src = filepath.replace grunt.config('coffee.build.cwd'), ''
			grunt.config 'coffee.build.src', [src]


	# Load tasks
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-requirejs'


	# Register tasks
	grunt.registerTask 'build', ['clean:build', 'copy:build', 'coffee:build']
	grunt.registerTask 'dist', ['clean:dist', 'copy:dist', 'requirejs:dist']
	grunt.registerTask 'run', ['build', 'connect:build', 'watch']
	grunt.registerTask 'default', ['run']
