
var express = require('express'),
    path = require('path'),
    http = require('http');





var app = exports.app = express();



//end

app.use(function(req, res, next) {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
    res.header('Access-Control-Allow-Headers', 'application/hal+json,application/json,Content-Type,image/jpeg,multipart/form-data,application/x-www-form-urlencoded');
    res.header('Access-Control-Max-Age', '3600');
    if ('OPTIONS' === req.method) {
        res.send(200);
    } else {
        next();
    }
});

var portno=5050;


app.use(express.static(path.join(__dirname, 'client')));
app.set('port', process.env.PORT || portno);



    app.all('/*', function (req, res, next) {
        res.sendfile('client/index.html', {route: __dirname});
    });
    http.createServer(app).listen(app.get('port'), function () {
        console.log('Express server listening on port ' + app.get('port'));
    });

