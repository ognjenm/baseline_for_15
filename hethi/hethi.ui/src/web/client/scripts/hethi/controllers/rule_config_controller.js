'use strict';


hethi.controller('rule_config_controller', ['$http','$scope','$filter','$location','$rootScope','logger', function ($http,$scope,$filter,$location,$rootScope,logger) {

    //$scope.menuItems = [
    //    { menu_name: 'Business Demography',isActive: ' '},
    //    { menu_name: 'Configure Data Service',isActive: ''},
    //    { menu_name: 'Customise Workflows',isActive: 'btn-success'},
    //    { menu_name: 'Define Output',isActive: ''},
    //    { menu_name: 'Define ERP Integration',isActive: ''},
    //    { menu_name: 'Define Analytics',isActive: ''},
    //    { menu_name: 'Define Storage',isActive: ' '},
    //    { menu_name: 'Service level agreement',isActive: ''}
    //];

    //$scope.processes=[{type:"Process",name:"Process1",id:1},{type:"Process",name:"Process2",id:2},{type:"Process",name:"Process3",id:3}];
    //$scope.Rules=[{type:"Rule",name:"Rule1",id:1},{type:"Rule",name:"Rule2",id:2},{type:"Rule",name:"Rule3",id:3}];
    var myDiagram,myPalette;
    $scope.init=function() {
        //if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this
        var $ = go.GraphObject.make;  // for conciseness in defining templates

        myDiagram =
            $(go.Diagram, "myDiagram",// must name or refer to the DIV HTML element
                {
                    initialContentAlignment: go.Spot.Center,
                    allowDrop: true,  // must be true to accept drops from the Palette
                    "LinkDrawn": showLinkLabel,  // this DiagramEvent listener is defined below
                    "LinkRelinked": showLinkLabel,
                    "animationManager.duration": 800, // slightly longer than default (600ms) animation
                    "undoManager.isEnabled": true  // enable undo & redo
                });


        window.PIXELRATIO = myDiagram.computePixelRatio(); // constant needed to determine mouse coordinates on the canvas

        // define a simple Node template


        // when the document is modified, add a "*" to the title and enable the "Save" button
        myDiagram.addDiagramListener("Modified", function(e) {
            var button = document.getElementById("SaveButton");
            //if (button) button.disabled = !myDiagram.isModified;
            var idx = document.title.indexOf("*");
            if (myDiagram.isModified) {
                if (idx < 0) document.title += "*";
            } else {
                if (idx >= 0) document.title = document.title.substr(0, idx);
            }
        });

        // helper definitions for node templates

        function nodeStyle() {
            return [
                // The Node.location comes from the "loc" property of the node data,
                // converted by the Point.parse static method.
                // If the Node.location is changed, it updates the "loc" property of the node data,
                // converting back using the Point.stringify static method.
                new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
                {
                    // the Node.location is at the center of each node
                    locationSpot: go.Spot.Center,
                    //isShadowed: true,
                    //shadowColor: "#888",
                    // handle mouse enter/leave events to show/hide the ports
                    mouseEnter: function (e, obj) { showPorts(obj.part, true); },
                    mouseLeave: function (e, obj) { showPorts(obj.part, false); }
                }
            ];
        }

        // Define a function for creating a "port" that is normally transparent.
        // The "name" is used as the GraphObject.portId, the "spot" is used to control how links connect
        // and where the port is positioned on the node, and the boolean "output" and "input" arguments
        // control whether the user can draw links from or to the port.
        function makePort(name, spot, output, input) {
            // the port is basically just a small circle that has a white stroke when it is made visible
            return $(go.Shape, "Circle",
                {
                    fill: "transparent",
                    stroke: null,  // this is changed to "white" in the showPorts function
                    desiredSize: new go.Size(15, 15),
                    alignment: spot, alignmentFocus: spot,  // align the port on the main Shape
                    portId: name,  // declare this object to be a "port"
                    fromSpot: spot, toSpot: spot,  // declare where links may connect at this port
                    fromLinkable: output, toLinkable: input,  // declare whether the user may draw links to/from here
                    cursor: "pointer"  // show a different cursor to indicate potential link point
                });
        }


        // define the Node templates for regular nodes

        var lightText = 'whitesmoke';

        myDiagram.nodeTemplateMap.add("",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Properties"),
                            { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                            }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                            })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Rectangle",
                        { fill: "lightgray", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));

        myDiagram.nodeTemplateMap.add("Rectangle",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Properties"),
                            { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                            }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                            })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Rectangle",
                        { fill: "#3B8686", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));
        myDiagram.nodeTemplateMap.add("Rectangleaaas",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Properties"),
                            { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                            }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                            })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Rectangle",
                        { fill: "#3B8686", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));

        myDiagram.nodeTemplateMap.add("Rectangleiaas",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Properties"),
                            { click: function(e, obj) {
                                $scope.selected_workflow_process=obj.part.data;
                                $scope.loadRulesByProcess();
                                jQuery('#ruleModel').modal('show');}
                            }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                            })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Rectangle",
                        { fill: "#AB4819", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));

        myDiagram.nodeTemplateMap.add("Rectangleoaas",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Properties"),
                            { click: function(e, obj) {
                                $scope.selected_workflow_process=obj.part.data;
                                $scope.loadRulesByProcess();
                                jQuery('#ruleModel').modal('show');}
                            }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                            })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Rectangle",
                        { fill: "#33C7C8", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));

        myDiagram.nodeTemplateMap.add("Rectanglebaas",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Properties"),
                            { click: function(e, obj) {
                                $scope.selected_workflow_process=obj.part.data;
                                $scope.loadRulesByProcess();
                                jQuery('#ruleModel').modal('show');}
                            }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                            })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Rectangle",
                        { fill: "#FE8F47", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));

        myDiagram.nodeTemplateMap.add("Rectangledaas",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Rule-Properties"),
                            { click: function(e, obj) {
                                //save rule here
                                $scope.selected_workflow_process=obj.part.data;
                                $scope.loadRulesByProcess();
                                jQuery('#ruleModel').modal('show');}
                            }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {
                                //save rule here
                                $scope.selected_workflow_process=obj.part.data;
                                $scope.loadRulesByProcess();
                                jQuery('#ruleModel').modal('show');}
                            })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Rectangle",
                        { fill: "#F5C600", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));
        myDiagram.nodeTemplateMap.add("Diamonddaas",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Properties"),
                            { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                            }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                            })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Diamond",
                        { fill: "#92646D", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));
        myDiagram.nodeTemplateMap.add("Diamondbaas",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Properties"),
                            { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                            }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                            })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Diamond",
                        { fill: "#20981F", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));
        myDiagram.nodeTemplateMap.add("Diamondoaas",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Properties"),
                            { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                            }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                            })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Diamond",
                        { fill: "#A29B16", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));
        myDiagram.nodeTemplateMap.add("Diamondiaas",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Properties"),
                            { click: function(e, obj) {  jQuery('#myModal').modal('show');}
                            }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {  jQuery('#myModal1').modal('show'); }
                            })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Diamond",
                        { fill: "#FF4819", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));

        myDiagram.nodeTemplateMap.add("Diamond",  // the default category
            $(go.Node, "Spot",
                { contextMenu:
                    $(go.Adornment, "Vertical",
                        $("ContextMenuButton",
                            $(go.TextBlock, "Properties"),
                            { click: function(e, obj) {  jQuery('#myModal').modal('show');
                                 } }),
                        $("ContextMenuButton",
                            $(go.TextBlock, "Settings"),
                            { click: function(e, obj) {  jQuery('#myModal1').modal('show'); } })
                    ) },
                nodeStyle(),
                // the main object is a Panel that surrounds a TextBlock with a rectangular Shape
                $(go.Panel, "Auto",
                    $(go.Shape, "Diamond",
                        { fill: "#86863B", stroke: null },
                        new go.Binding("figure", "figure")),
                    $(go.TextBlock,
                        {
                            font: "bold 11pt Helvetica, Arial, sans-serif",
                            stroke: lightText,
                            margin: 8,
                            maxSize: new go.Size(160, NaN),
                            wrap: go.TextBlock.WrapFit,
                            editable: true
                        },
                        new go.Binding("text").makeTwoWay())
                ),
                // four named ports, one on each side:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, true, true),
                makePort("R", go.Spot.Right, true, true),
                makePort("B", go.Spot.Bottom, true, false)
            ));

        myDiagram.nodeTemplateMap.add("Start",
            $(go.Node, "Spot", nodeStyle(),
                $(go.Panel, "Auto",
                    $(go.Shape, "Circle",
                        { minSize: new go.Size(40, 40), fill: "#37BC9B", stroke: null }),
                    $(go.TextBlock, "Start",
                        { font: "bold 11pt Helvetica, Arial, sans-serif", stroke: lightText },
                        new go.Binding("text"))
                ),
                // three named ports, one on each side except the top, all output only:
                makePort("L", go.Spot.Left, true, false),
                makePort("R", go.Spot.Right, true, false),
                makePort("B", go.Spot.Bottom, true, false)
            ));

        myDiagram.nodeTemplateMap.add("End",
            $(go.Node, "Spot", nodeStyle(),
                $(go.Panel, "Auto",
                    $(go.Shape, "Circle",
                        { minSize: new go.Size(40, 40), fill: "#DA4453", stroke: null }),
                    $(go.TextBlock, "End",
                        { font: "bold 11pt Helvetica, Arial, sans-serif", stroke: lightText },
                        new go.Binding("text"))
                ),
                // three named ports, one on each side except the bottom, all input only:
                makePort("T", go.Spot.Top, false, true),
                makePort("L", go.Spot.Left, false, true),
                makePort("R", go.Spot.Right, false, true)
            ));

        myDiagram.nodeTemplateMap.add("Comment",
            $(go.Node, "Auto", nodeStyle(),
                $(go.Shape, "File",
                    { fill: "#EFFAB4", stroke: null }),
                $(go.TextBlock,
                    {
                        margin: 5,
                        maxSize: new go.Size(200, NaN),
                        wrap: go.TextBlock.WrapFit,
                        textAlign: "center",
                        editable: true,
                        font: "bold 12pt Helvetica, Arial, sans-serif",
                        stroke: '#454545'
                    },
                    new go.Binding("text").makeTwoWay())
                // no ports, because no links are allowed to connect with a comment
            ));


        // replace the default Link template in the linkTemplateMap
        myDiagram.linkTemplate =
            $(go.Link,  // the whole link panel
                {
                    routing: go.Link.AvoidsNodes,
                    curve: go.Link.JumpOver,
                    corner: 5, toShortLength: 4,
                    relinkableFrom: true,
                    relinkableTo: true,
                    reshapable: true,
                    resegmentable: true,
                    // mouse-overs subtly highlight links:
                    mouseEnter: function(e, link) { link.findObject("HIGHLIGHT").stroke = "rgba(30,144,255,0.2)"; },
                    mouseLeave: function(e, link) { link.findObject("HIGHLIGHT").stroke = "transparent"; }
                },
                new go.Binding("points").makeTwoWay(),
                $(go.Shape,  // the highlight shape, normally transparent
                    { isPanelMain: true, strokeWidth: 8, stroke: "transparent", name: "HIGHLIGHT" }),
                $(go.Shape,  // the link path shape
                    { isPanelMain: true, stroke: "gray", strokeWidth: 2 }),
                $(go.Shape,  // the arrowhead
                    { toArrow: "standard", stroke: null, fill: "gray"}),
                $(go.Panel, "Auto",  // the link label, normally not visible
                    { visible: false, name: "LABEL", segmentIndex: 2, segmentFraction: 0.5},
                    new go.Binding("visible", "visible").makeTwoWay(),
                    $(go.Shape, "RoundedRectangle",  // the label shape
                        { fill: "#F8F8F8", stroke: null }),
                    $(go.TextBlock, "Yes",  // the label
                        {
                            textAlign: "center",
                            font: "10pt helvetica, arial, sans-serif",
                            stroke: "#333333",
                            editable: true
                        },
                        new go.Binding("text", "text").makeTwoWay())
                )
            );

        // Make link labels visible if coming out of a "conditional" node.
        // This listener is called by the "LinkDrawn" and "LinkRelinked" DiagramEvents.
        function showLinkLabel(e) {
            var label = e.subject.findObject("LABEL");
            if (label !== null) label.visible = (e.subject.fromNode.data.figure === "Diamond");
        }

        // temporary links used by LinkingTool and RelinkingTool are also orthogonal:
        myDiagram.toolManager.linkingTool.temporaryLink.routing = go.Link.Orthogonal;
        myDiagram.toolManager.relinkingTool.temporaryLink.routing = go.Link.Orthogonal;


        // initialize the Palette that is on the left side of the page
        //myPalette =
        //    $(go.Palette, "myPalette",  // must name or refer to the DIV HTML element
        //        {
        //            "animationManager.duration": 800, // slightly longer than default (600ms) animation
        //            nodeTemplateMap: myDiagram.nodeTemplateMap  // share the templates used by myDiagram
        //        });

        myDiagram.addDiagramListener("ObjectSingleClicked",
            function(e) {
                var part = e.subject.part;
                if (!(part instanceof go.Link)) $scope.showMessage(part);
            });
        myDiagram.addDiagramListener("BackgroundSingleClicked",
            function(e) {
                $scope.$apply(function(){
                    $scope.rulesList=[];
                });
            });
        //myDiagram.model = go.Model.fromJson('{ "class": "go.GraphLinksModel","linkFromPortIdProperty": "fromPort","linkToPortIdProperty": "toPort"}');  // load an initial diagram from some JSON text
        //myDiagram.model = go.Model.fromJson(JSON.stringify({ "class": "go.GraphLinksModel",
        //    "linkFromPortIdProperty": "fromPort",
        //    "linkToPortIdProperty": "toPort",
        //    "nodeDataArray": [
        //        {"category":"Start", "text":"Start", "key":"Start", "loc":"-342.828125 -454"},
        //        {"category":"Rectangle", "figure":"Rectangle", "text":"Process1", "key":"Process1", "loc":"-342.828125 -354"},
        //        {"category":"Diamond", "figure":"Diamond", "text":"Rule1", "key":"Rule1", "loc":"-329.828125 -259"},
        //        {"category":"Rectangle", "figure":"Rectangle", "text":"Process3", "key":"Process3", "loc":"-326.828125 -154"},
        //        {"category":"Rectangle", "figure":"Rectangle", "text":"Process4", "key":"Process4", "loc":"-326.828125 -54"},
        //        {"category":"End", "text":"End", "key":"End", "loc":"-326.828125 54"}
        //    ],
        //    "linkDataArray": [
        //        {"from":"Start", "to":"Process1", "fromPort":"B", "toPort":"T"},
        //        {"from":"Process1", "to":"Rule1", "fromPort":"B", "toPort":"T"},
        //        {"from":"Rule1", "to":"Process3", "fromPort":"B", "toPort":"T", "visible":true},
        //        {"from":"Rule1", "to":"Process4", "fromPort":"R", "toPort":"T", "visible":true ,text:"No"},
        //        {"from":"Process4", "to":"End", "fromPort":"B", "toPort":"T"}
        //    ]}));


    }

    function cxcommand(val) {
        var diagram = myDiagram;
        if (!(diagram.currentTool instanceof go.ContextMenuTool)) return;
        switch (val) {
            case "Cut": diagram.commandHandler.cutSelection(); break;
            case "Copy": diagram.commandHandler.copySelection(); break;
            case "Paste": diagram.commandHandler.pasteSelection(diagram.lastInput.documentPoint); break;
            case "Delete": diagram.commandHandler.deleteSelection(); break;
            case "Color": changeColor(diagram); break;
        }
        diagram.currentTool.stopTool();
    }
// A custom command, for changing the color of the selected node(s).
    function changeColor(diagram) {
        // the object with the context menu, in this case a Node, is accessible as:
        var cmObj = diagram.toolManager.contextMenuTool.currentObject;
        // but this function operates on all selected Nodes, not just the one at the mouse pointer.
        // Always make changes in a transaction, except when initializing the diagram.
        diagram.startTransaction("change color");
        diagram.selection.each(function(node) {
            if (node instanceof go.Node) {  // ignore any selected Links and simple Parts
                // Examine and modify the data, not the Node directly.
                var data = node.data;
                if (data.color === "red") {
                    // Call setDataProperty to support undo/redo as well as
                    // automatically evaluating any relevant bindings.
                    diagram.model.setDataProperty(data, "color", go.Brush.randomColor());
                } else {
                    diagram.model.setDataProperty(data, "color", "red");
                }
            }
        });
        diagram.commitTransaction("change color");
    }
    // Make all ports on a node visible when the mouse is over the node
    function showPorts(node, show) {
        var diagram = node.diagram;
        if (!diagram || diagram.isReadOnly || !diagram.allowLink) return;
        node.ports.each(function(port) {
            port.stroke = (show ? "white" : null);
        });
    }


    // Show the diagram's model in JSON format that the user may edit
    $scope.save=function() {
        //document.getElementById("mySavedModel").value = myDiagram.model.toJson();
        $scope.mySavedModel = myDiagram.model.toJson();
        myDiagram.isModified = false;
    };
    $scope.load=function() {
        myDiagram.model=go.Model.fromJson($scope.mySavedModel);
        //myDiagram.model = go.Model.fromJson(document.getElementById("mySavedModel").value);

    };

    // add an SVG rendering of the diagram at the end of this page
    $scope.makeSVG=function() {
        var svg = myDiagram.makeSvg({
            scale: 0.5
        });
        svg.style.border = "1px solid black";
        var obj = document.getElementById("SVGArea");
        obj.appendChild(svg);
        if (obj.children.length > 0) {
            obj.replaceChild(svg, obj.children[0]);
        }
    };

    $scope.showMessage= function(s) {

        $scope.selected_workflow_process=s.data;

        if(s.data.category=="Diamond") {
            var temp=$rootScope.Rules_grouped[s.data.demokey];
            var temp1=temp;
            $scope.data=s;
            $scope.demoRulesList=temp1;
            $scope.$apply(function(){
                $scope.rulesList=temp;
                $scope.demoRules={demoRulesList:temp};
                $scope.selectedProcessName= temp1[0].sfs_uin;
                $scope.ruleName=[];
                $scope.ruleCondition=[];
                $scope.ruleAction=[];
                $scope.ruleWorksetName=[];
                temp1.forEach(function(rows){
                    $scope.ruleName.push(rows.rule_name);
                    $scope.ruleCondition.push(rows.rule_condition);
                    $scope.ruleAction.push(rows.rule_action);
                    $scope.ruleWorksetName.push(rows.rule_workset_name);
                });
            });

            //alert(JSON.stringify(temp));
        }else{
            $scope.$apply(function(){
                $scope.rulesList=[];
            });
        }
    }
    $scope.rulesList=[];


    $scope.init();
    //myPalette.model=new go.GraphLinksModel([{ category: "Start", text: "Start" },
    //    { text: "Process" , figure: "Rectangle" },
    //    { text: "Rule", figure: "Diamond" },
    //    { category: "End", text: "End" },
    //    { category: "Comment", text: "Comment" }]);



    $scope.palette=function() {
        var dragged = null; // A reference to the element currently being dragged

        // This event should only fire on the drag targets.
        // Instead of finding every drag target,
        // we can add the event to the document and disregard
        // all elements that are not of class "draggable"
        var paletteDIV=document.getElementById('palettezone');
        paletteDIV.addEventListener("dragstart", function (event) {


            //if (event.target.className !== "draggable") return;
            //if (document.getElementById(event.target.id).getAttribute('drag-value') !== "null") return;
            // Some data must be set to allow drag
            event.dataTransfer.setData("text", document.getElementById(event.target.id).getAttribute('drag-value'));
            // store a reference to the dragged element
            dragged = event.target;
            // Objects during drag will have a red border
            event.target.style.border = "2px solid red";
        }, false);

        // This event resets styles after a drag has completed (successfully or not)
        paletteDIV.addEventListener("dragend", function (event) {
            // reset the border of the dragged element
            dragged.style.border = "";
        }, false);

        // Next, events intended for the drop target - the Diagram div

        var div = document.getElementById('myDiagram');
        div.addEventListener("dragenter", function (event) {
            // Here you could also set effects on the Diagram,
            // such as changing the background color to indicate an acceptable drop zone

            // Requirement in some browsers, such as Internet Explorer
            event.preventDefault();
        }, false);

        div.addEventListener("dragover", function (event) {
            // We call preventDefault to allow a drop
            // But on divs that already contain an element,
            // we want to disallow dropping

            if (event.target.className === "dropzone") {
                // Disallow a drop by returning before a call to preventDefault:
                return;
            }

            // Allow a drop on everything else
            event.preventDefault();
        }, false);

        div.addEventListener("dragleave", function (event) {
            // reset background of potential drop target
            if (event.target.className == "dropzone") {
                event.target.style.background = "";
            }
        }, false);

        var remove = document.getElementById('remove');
        //remove.checked=true;

        div.addEventListener("drop", function (event) {
            // prevent default action
            // (open as link for some elements in some browsers)
            event.preventDefault();


            // Dragging onto a Diagram
            if (this === myDiagram.div) {
                var can = event.target;
                var pixelratio = window.PIXELRATIO;

                // if the target is not the canvas, we may have trouble, so just quit:
                if (!(can instanceof HTMLCanvasElement)) return;

                var bbox = can.getBoundingClientRect();
                var mx = event.clientX - bbox.left * ((can.width / pixelratio) / bbox.width);
                var my = event.clientY - bbox.top * ((can.height / pixelratio) / bbox.height);
                var point = myDiagram.transformViewToDoc(new go.Point(mx, my));
                myDiagram.startTransaction('new node');
                if(event.dataTransfer.getData("text")=="Start"){
                    myDiagram.model.addNodeData({"category":"Start", "text":"Start", "key":"Start",loc: point.x + " " + point.y});
                }else if(event.dataTransfer.getData("text")=="End"){
                    myDiagram.model.addNodeData({"category":"End", "text":"End", "key":"End",loc: point.x + " " + point.y});
                }else {
                    var value = JSON.parse(event.dataTransfer.getData("text"));
                    var figure,key,category;
                    if (value.type == "Process") {
                        //value.hethi_servicecode=="Das"
                        figure = "Rectangle"
                        category="Rectangle"+value.hethi_servicecode.toLowerCase();
                        key=value.sfs_uin;
                    } else if (value.type == "Rule") {
                        figure = "Diamond";
                        category = "Diamond";
                        key=value.rule_workset;
                    }
                    myDiagram.model.addNodeData({
                        category: category,
                        //figure: figure,
                        text: value.name,
                        key: key,
                        demokey: key,
                        loc: point.x + " " + point.y
                    });
                }
                myDiagram.commitTransaction('new node');

                // remove dragged element from its old location
                if (remove.checked) dragged.parentNode.removeChild(dragged);
            }


            // If we were using drag data, we could get it here, ie:
            // var data = event.dataTransfer.getData('text');
        }, false);

    };

    $scope.palette();

    var input = {
        'efs_uin': 'cefs100101',
        'customer_id': '1'
    };
    $http({
        method: 'POST',
        url: $rootScope.spring_rest_service + '/load_form_rules_process',
        dataType: 'jsonp',
        data: input
    }).success(function (data) {
        $rootScope.processes = [];
        $rootScope.Rules = [];
        $rootScope.flowData = [];
        if(data[0][0].result!="No Data") {
            //$scope.processes -= data[0];
            //$scope.Rules = data[1];
            $rootScope.Process_grouped = _.groupBy(data[0], function (elemet) {
                return elemet.hethi_servicecode;
            });
            for (var key in $rootScope.Process_grouped) {
                $rootScope.processes.push({expand:false});
                $rootScope.Process_grouped[key].forEach(function (rows) {
                    rows.type = "Process";
                    rows.name = rows.hethi_subservicecode;
                });
            }
            //$scope.processes.forEach(function (rows) {
            //    rows.type = "Process";
            //    rows.name = rows.hethi_subservicecode;
            //});
            //$scope.Rules.forEach(function(rows){
            //    rows.type="Rule";
            //    rows.name=rows.rule_workset_name;
            //});
            $rootScope.Rules_grouped = _.groupBy(data[1], function (elemet) {
                return elemet.rule_workset;
            });
            //console.log(JSON.stringify($rootScope.Rules_grouped));
            for (var key in $rootScope.Rules_grouped) {
                var newRow = {rule_workset: key, type: "Rule"};
                $rootScope.Rules_grouped[key].forEach(function (row) {
                    newRow.name = row.rule_workset_name;
                });
                $scope.Rules.push(newRow);
            }
            $scope.flowData = data[2];
                var data=$scope.flowData[0].flow_data;

            myDiagram.model = go.Model.fromJson(data);
        }
    });
    $scope.ruleChanged=function(i,s,type){
        if($scope.ruleWorksetName[i]!==$scope.demoRules.demoRulesList[i].rule_workset_name||
            $scope.ruleName[i]!==$scope.demoRules.demoRulesList[i].rule_name||
            $scope.ruleCondition[i]!==$scope.demoRules.demoRulesList[i].rule_condition||
            $scope.ruleAction[i]!==$scope.demoRules.demoRulesList[i].rule_action){
            var a=$scope.rulesList[i].rule_workset_name,
                b=$scope.rulesList[i].rule_name,
                c=$scope.rulesList[i].rule_condition,
                d=$scope.rulesList[i].rule_action;
            $scope.rulesList[i].rule_workset_name=$scope.ruleWorksetName[i];
            $scope.rulesList[i].rule_name= $scope.ruleName[i];
            $scope.rulesList[i].rule_condition= $scope.ruleCondition[i];
            $scope.rulesList[i].rule_action= $scope.ruleAction[i];
            $scope.data.data.updated=1;
            if($scope.data.data.rules==undefined)
            {
                $scope.data.data.rules=[];
                $scope.rulesList.forEach(function(rows,c){
                    $scope.data.data.rules.push(rows)
                   if(c==i){
                       $scope.data.data.rules[c].rule_workset_name=$scope.ruleWorksetName[c],
                       $scope.data.data.rules[c].rule_name=$scope.ruleName[c],
                       $scope.data.data.rules[c].rule_condition=$scope.ruleCondition[c],
                       $scope.data.data.rules[c].rule_action=$scope.ruleAction[c]
                   }
                });
            }
            else
            {
                $scope.data.data.rules[i].rule_workset_name=$scope.ruleWorksetName[i],
                $scope.data.data.rules[i].rule_name=$scope.ruleName[i],
                $scope.data.data.rules[i].rule_condition=$scope.ruleCondition[i],
                $scope.data.data.rules[i].rule_action=$scope.ruleAction[i]
            };
            $scope.rulesList[i].rule_workset_name=a;
            $scope.rulesList[i].rule_name=b;
            $scope.rulesList[i].rule_condition=c;
            $scope.rulesList[i].rule_action=d;
        }else{
            $scope.data.data.updated=0;
            delete $scope.data.data.rules;
        }
    };
    $scope.saveFlow=function(){
        var rules=[];
        $scope.mySavedModel=JSON.parse(myDiagram.model.toJson());
        $scope.mySavedModel.linkDataArray.forEach(function(rows){
            $scope.mySavedModel.nodeDataArray.forEach(function(row){
                if(rows.to==row.key){
                    if(row.category=="Diamond") {
                        row.updated ?
                            row.rules.forEach(function(data){
                                rules.push({rule_workset:data.rule_workset,rule_workset_name:data.rule_workset_name,rule_id:data.rule_id,rule_name:data.rule_name,rule_condition:data.rule_condition,rule_action:data.rule_action,sfs_uin:data.sfs_uin})
                            }):
                            $rootScope.Rules_grouped[row.demokey].forEach(function(data){
                                rules.push({rule_workset:data.rule_workset,rule_workset_name:data.rule_workset_name,rule_id:data.rule_id,rule_name:data.rule_name,rule_condition:data.rule_condition,rule_action:data.rule_action,sfs_uin:data.sfs_uin})
                            });
                    }
                }
            });
        });

        var process_flow=[];
        $scope.mySavedModel.linkDataArray.forEach(function(rows,i){

            if((rows.from !='Start') && (rows.to !='End') ){
                var data={};
                data.current_queue=rows.from;
                data.next_queue=rows.to;
                data.exception_queue="csfs10000";
                process_flow.push(data);
            }
            delete $scope.mySavedModel.linkDataArray[i].points;
        });
        $scope.mySavedModel.nodeDataArray.forEach(function(rows,i){
            delete $scope.mySavedModel.nodeDataArray[i].rules;
            delete $scope.mySavedModel.nodeDataArray[i].updated;
        });
        var x2js =new X2JS();
        var xml=x2js.json2xml_str({"root":{"data":rules}});
        var process_flow_xml=x2js.json2xml_str({"root":{"data":process_flow}});
        alert(xml);
        var input={
            'customer_id': 1,
            'user_id':1,
            'tfs_uin':'cefs100101',
            'efs_uin':'cefs100101',
            'rule_data': xml,
            'process_flow':process_flow_xml,
            'flow_data':JSON.stringify($scope.mySavedModel)
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/save_custom_rules',
            dataType:'jsonp',
            data: input
        }).success(function(data) {
            alert(JSON.stringify(data));
        });
    };
    $scope.ruleChanged=function(i,s,type){
        if($scope.ruleWorksetName[i]!==$rootScope.Rules_grouped[$scope.data.data.demokey][i].rule_workset_name||
            $scope.ruleName[i]!==$rootScope.Rules_grouped[$scope.data.data.demokey][i].rule_name||
            $scope.ruleCondition[i]!==$rootScope.Rules_grouped[$scope.data.data.demokey][i].rule_condition||
            $scope.ruleAction[i]!==$rootScope.Rules_grouped[$scope.data.data.demokey][i].rule_action){
            var a=$scope.rulesList[i].rule_workset_name,
                b=$scope.rulesList[i].rule_name,
                c=$scope.rulesList[i].rule_condition,
                d=$scope.rulesList[i].rule_action;
            $scope.rulesList[i].rule_workset_name=$scope.ruleWorksetName[i];
            $scope.rulesList[i].rule_name= $scope.ruleName[i];
            $scope.rulesList[i].rule_condition= $scope.ruleCondition[i];
            $scope.rulesList[i].rule_action= $scope.ruleAction[i];
            $scope.data.data.updated=1;
            if($scope.data.data.rules)
            {
                $scope.data.data.rules[i].rule_workset_name=$scope.ruleWorksetName[i],
                $scope.data.data.rules[i].rule_name=$scope.ruleName[i],
                $scope.data.data.rules[i].rule_condition=$scope.ruleCondition[i],
                $scope.data.data.rules[i].rule_action=$scope.ruleAction[i]
            }
            else
            {
                $scope.data.data.rules=$scope.rulesList;
                $scope.data.data.rules[i].rule_workset_name=$scope.ruleWorksetName[i],
                $scope.data.data.rules[i].rule_name=$scope.ruleName[i],
                $scope.data.data.rules[i].rule_condition=$scope.ruleCondition[i],
                $scope.data.data.rules[i].rule_action=$scope.ruleAction[i]
           };
            //$rootScope.Rules_grouped[$scope.data.data.demokey][i].rule_workset_name=a;
            //$rootScope.Rules_grouped[$scope.data.data.demokey][i].rule_name=b;
            //$rootScope.Rules_grouped[$scope.data.data.demokey][i].rule_condition=c;
            //$rootScope.Rules_grouped[$scope.data.data.demokey][i].rule_action=d;
        }else{
            $scope.data.data.updated=0;
            delete $scope.data.data.rules;
        }
    };
    $scope.loadRulesByProcess=function(){
       var sfs_uin=$scope.selected_workflow_process.key;
        var input={
            'customer_id': 1,
            'user_id':1,
            'tfs_uin':'ctfs100101',
            'efs_uin':'cefs100101',
            'sfs_uin': sfs_uin
        };
        $http({
            method: 'POST',
            url: $rootScope.spring_rest_service+'/load_rules_by_sfs',
            dataType:'jsonp',
            data: input
        }).success(function(resp) {
            if(resp[0][0].result!="No Data"){
                $scope.cruleworkset_list=resp[0];
            } else{
                $scope.cruleworkset_list=false;
            }
            if(resp[1][0].result!="No Data"){
                $scope.cruleset_list=resp[1];
            }
            else{
                $scope.cruleset_list=false;
            }
            if(resp[2][0].result!="No Data"){
                $scope.rules_for_process=resp[2];
            }
            else{
                $scope.rules_for_process=false;
            }

            if(resp[3][0].result!="No Data"){
                $scope.rules_for_selected_process=resp[3];
            }
             else{
                $scope.rules_for_selected_process=false;
            }

         });
    };
    $scope.selected_process_changed=function(){
        if($scope.selected_efs_uin!=undefined){
            var selected_P=JSON.parse($scope.selected_efs_uin);
            $scope.selected_workflow_process={"category":selected_P.hethi_servicecode,"text":selected_P.hethi_subservicecode,"key":selected_P.sfs_uin,"demokey":selected_P.sfs_uin};
            $scope.loadRulesByProcess();
        }
        else{

            logger.logError('please select a process')
        }

    }
    $scope.addNewRuleForProcess=function(){
        if(($scope.selected_ruleset !=undefined) && ($scope.selected_workset !=undefined)){

            var sfs_uin=$scope.selected_workflow_process.key;
            var input={
                'customer_id': 1,
                'user_id':1,
                'tfs_uin':'ctfs100101',
                'efs_uin':'cefs100101',
                'sfs_uin': sfs_uin,
                'rule_workset':$scope.selected_workset,
                'rule_ruleset':$scope.selected_ruleset
            };

            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/add_new_rules_for_sfs',
                dataType:'jsonp',
                data: input
            }).success(function(resp) {

                $scope.loadRulesByProcess();
                logger.log('added new rule')
            });
        }
        else{
            logger.logError('please select a workset')
        }

    };
    $scope.deleteRuleForProcess=function(rule){  var sfs_uin=$scope.selected_workflow_process.key;
            var input={
                'customer_id': 1,
                'user_id':1,
                'tfs_uin':'ctfs100101',
                'efs_uin':'cefs100101',
                'sfs_uin': sfs_uin,
                'rule_workset':rule_workset
            };

            $http({
                method: 'POST',
                url: $rootScope.spring_rest_service+'/delete_rules_for_sfs',
                dataType:'jsonp',
                data: input
            }).success(function(resp) {

                $scope.loadRulesByProcess();
                logger.log(rule.workset_name +' rule has been deleted')
            });


    }
}]);