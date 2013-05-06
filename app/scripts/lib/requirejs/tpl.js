define(['Handlebars'], function (Handlebars) {

    var loadResource = function (resourceName, parentRequire, callback, config) {
        parentRequire([('text!templates/' + resourceName + '.hbs')],
            function (templateContent) {
				console.log(Handlebars);

                var template =  Handlebars.compile(templateContent);
                callback(template);
            }
        );
    };

    return {
        load: loadResource
    };

});