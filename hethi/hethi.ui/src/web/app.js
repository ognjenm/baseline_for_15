
var express = require('express'),
    path = require('path'),
    http = require('http'),
    bodyParser = require("body-parser")
    fs= require('fs');




var app = exports.app = express();
app.use(bodyParser());
var multer  = require('multer');

//start

//var string="52d2d638b69409b2a679216e6e572578|18172|palakkad|2.00|0|palakkad|IND|INR|devaayanam puja booking|santhaoshp@gmail.com|TEST|santhosh|2346|1234567890|678012|1562_2|http://www.sreepariyanampattadevaswom.in/pg|kerala";
//var key="52d2d638b69409b2a679216e6e572578";
//var crypto = require('crypto');
//var shasum = crypto.createHash('sha512',key);
//shasum.update(string);
//var hash=shasum.digest('hex');
//hash=hash.toUpperCase();
//console.log("hash :"+hash);


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
var env=app.get('env')=='development'?'configuration':app.get('env');
var dbConfigFile=__dirname+'/server/appConfig/appconfig.json';
var data=fs.readFileSync(dbConfigFile,'utf8');
var dbConfig=JSON.parse(data)[env];
var portno=dbConfig.portno;
app.use(express.static(path.join(__dirname, 'client')));
app.set('port', process.env.PORT || portno);


var upload = multer({dest: 'client/images/uploads'});
var easyimg = require('easyimage');
var type=upload.single('file');

app.post('/imageUpload',type,function(req,res,next) {
    console.log('save file  request');
    var tmp_path = req.file.path;
    var varDate = Date.now();

    var file_name = req.file.originalname;
    var file_size = req.file.size;
    var file_type = file_name.substring(file_name.lastIndexOf('.') + 1,
        file_name.length);

    //console.log(file_type+" "+file_name+" "+file_size);
    /** The original name of the uploaded file
     stored in the variable "originalname". **/
    var target_path = 'client/images/upload/' + varDate + "_" + req.file.originalname;

    /** A better way to copy the uploaded file. **/
    var src = fs.createReadStream(tmp_path);
    var dest = fs.createWriteStream(target_path);
    src.pipe(dest);
    fs.unlink(tmp_path);
    var host = req.headers.host;
    var i = target_path.indexOf('/');
    var file_uri = "http://" + host + target_path.substring(i, target_path.length);
    console.log('file saved @' + file_uri);
    src.on('end', function () {
        res.end('{"status":"complete","url":"' + file_uri + '",' +
        '"file_name":"' + file_name + '","file_type":"' + file_type + '","file_size":"' + file_size + '"}');
    });
    src.on('error', function (err) {
        res.end('{"status":"error","url":"' + file_uri + '"}');
    });
});

    app.post('/get_form_metadata', type, function (req, res, next) {
        var xml = req.body.xml;
        var documentpath = req.body.documentpath;
        console.log('xml :' + xml);
        console.log('documentpath :' + documentpath);
        var parseString = require('xml2js').parseString;
        parseString(xml, function (err, result) {
            result.root.field.forEach(function (field) {
                //{"name":["ShipToCompanyName"],"form_coords":[{"top":["344"],"left":["145"],"width":["276"],"height":["112"]}]}

                var field_name, t, l, w, h, img_name, i, file_uri;
                field_name = field.name[0];
                t = field.form_coords[0].top[0];
                l = field.form_coords[0].left[0];
                w = field.form_coords[0].width[0];
                h = field.form_coords[0].height[0];
                img_name = field_name + "_" + w + "_" + h + "_" + t + "_" + l;
                i = documentpath.indexOf('/images/');
                file_uri = documentpath.substring(i, documentpath.length);
                file_uri = '/client' + file_uri;
                console.log(file_uri);
                easyimg.crop({
                    src: file_uri, dst: 'client/images/' + img_name,
                    cropwidth: w, cropheight: h,
                    x: t, y: l
                }).then(
                    function (image) {
                        console.log('Resized and cropped: ' + image.width + ' x ' + image.height);
                    },
                    function (err) {
                        console.log(err);
                    }
                );

                console.log(field_name, t, l, w, h);


            })
        });
        res.end();
    });
    app.all('/*', function (req, res, next) {
        res.sendfile('client/index.html', {route: __dirname});
    });
    http.createServer(app).listen(app.get('port'), function () {
        console.log('Express server listening on port ' + app.get('port'));
    });

