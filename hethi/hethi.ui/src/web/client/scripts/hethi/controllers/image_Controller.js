/**
 * Created by haseeb on 11/14/2015.
 */



'use strict';


hethi.controller('image_Controller', ['$http','$scope','$filter','$location','$rootScope', function ($http,$scope,$filter,$location,$rootScope){

//alert("sdf");

    var picture = $('#sample_picture');

    // Make sure the image is completely loaded before calling the plugin
    picture.one('load', function(){
        // Initialize plugin (with custom event)
        picture.guillotine({eventOnChange: 'guillotinechange'});

        // Display inital data
        var data = picture.guillotine('getData');
        for(var key in data) { $('#'+key).html(data[key]); }

        // Bind button actions
        $('#rotate_left').click(function(){ picture.guillotine('rotateLeft'); });
        $('#rotate_right').click(function(){ picture.guillotine('rotateRight'); });
        $('#fit').click(function(){ picture.guillotine('fit'); });
        $('#zoom_in').click(function(){ picture.guillotine('zoomIn'); });
        $('#zoom_out').click(function(){ picture.guillotine('zoomOut'); });

        // Update data on change
        picture.on('guillotinechange', function(ev, data, action) {
            data.scale = parseFloat(data.scale.toFixed(4));
            for(var k in data) { $('#'+k).html(data[k]); }
        });
    });

    // Make sure the 'load' event is triggered at least once (for cached images)
    if (picture.prop('complete')) picture.trigger('load')


}]);

