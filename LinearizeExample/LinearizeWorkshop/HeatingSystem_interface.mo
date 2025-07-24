within LinearizeExample.LinearizeWorkshop;

partial model HeatingSystem_interface
    .Modelica.Blocks.Interfaces.RealInput dQ_flow annotation(Placement(transformation(extent = {{-140.0,60.0},{-100.0,100.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealInput du annotation(Placement(transformation(extent = {{-140.0,-100.0},{-100.0,-60.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Interfaces.RealOutput T_forward annotation(Placement(transformation(extent = {{100,70},{120,90}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Interfaces.RealOutput T_return annotation(Placement(transformation(extent = {{100,-90},{120,-70}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Math.Add add annotation(Placement(transformation(extent = {{-82,64},{-62,84}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Sources.Constant Q0(k = Qflow0) annotation(Placement(transformation(extent = {{-120.0,40.0},{-100.0,60.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Add add2 annotation(Placement(transformation(extent = {{-78.0,-84.0},{-58.0,-64.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant u_0(k = u0) annotation(Placement(transformation(extent = {{-120.0,-60.0},{-100.0,-40.0}},origin = {0.0,0.0},rotation = 0.0)));
    parameter Real u0=0.1 "Nominal valve opening";
    parameter Real Qflow0 = 300 "Nominal heat flowrate";
equation
    connect(add.u1,dQ_flow) annotation(Line(points = {{-84,80},{-120,80}},color = {0,0,127}));
    connect(add2.u2,du) annotation(Line(points = {{-80,-80},{-120,-80}},color = {0,0,127}));
    connect(u_0.y,add2.u1) annotation(Line(points = {{-99,-50},{-89.5,-50},{-89.5,-68},{-80,-68}},color = {0,0,127}));
    connect(Q0.y,add.u2) annotation(Line(points = {{-99,50},{-91.5,50},{-91.5,68},{-84,68}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end HeatingSystem_interface;
