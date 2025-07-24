within LinearizeExample.LinearizeWorkshop;

model HeatingSystem_linear
    extends LinearizeExample.LinearizeWorkshop.HeatingSystem_interface(final Qflow0=0.0, u0=0.0);
    parameter Integer ny = size(heatingSystemSS.C,1) "number of outputs";
    parameter Real[ny] y0 = {343.32267834748916, 296.48396463877145}  "Output at linearization point" annotation (Evaluate=false);
    replaceable .ControlsBasics.Linearization.HeatingSystemSS heatingSystemSS 
       constrainedby Modelica.Blocks.Interfaces.MIMO annotation(Placement(transformation(extent = {{-40.0,0.0},{-20.0,20.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Routing.Multiplex2 multiplex annotation(Placement(transformation(extent = {{-76.0,0.0},{-56.0,20.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Routing.DeMultiplex2 deMultiplex annotation(Placement(transformation(extent = {{40,0},{60,20}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Sources.Constant[ny] const(k = y0) annotation(Placement(transformation(extent = {{-40.0,-28.0},{-20.0,-8.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Add[ny] add3 annotation(Placement(transformation(extent = {{0.0,-6.0},{20.0,14.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(multiplex.y,heatingSystemSS.u) annotation(Line(points = {{-55,10},{-42,10}},color = {0,0,127}));
    connect(add.y,multiplex.u1[1]) annotation(Line(points = {{-61,74},{-55,74},{-55,45},{-84,45},{-84,16},{-78,16}},color = {0,0,127}));
    connect(add2.y,multiplex.u2[1]) annotation(Line(points = {{-57,-74},{-51,-74},{-51,-35},{-84,-35},{-84,4},{-78,4}},color = {0,0,127}));
    connect(heatingSystemSS.y,add3.u1) annotation(Line(points = {{-19,10},{-2,10}},color = {0,0,127}));
    connect(const.y,add3.u2) annotation(Line(points = {{-19,-18},{-10.5,-18},{-10.5,-2},{-2,-2}},color = {0,0,127}));
    connect(add3.y,deMultiplex.u) annotation(Line(points = {{21,4},{29.5,4},{29.5,10},{38,10}},color = {0,0,127}));
    connect(deMultiplex.y1[1],T_forward) annotation(Line(points = {{61,16},{85.5,16},{85.5,80},{110,80}},color = {0,0,127}));
    connect(deMultiplex.y2[1],T_return) annotation(Line(points = {{61,4},{85.5,4},{85.5,-80},{110,-80}},color = {0,0,127}));
end HeatingSystem_linear;
