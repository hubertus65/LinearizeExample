within LinearizeExample.LinearizeWorkshop.Experiments;
model Experiment_nonlinear
    replaceable .LinearizeExample.LinearizeWorkshop.HeatingSystem_nonlinear plant constrainedby 
    LinearizeExample.LinearizeWorkshop.HeatingSystem_interface annotation(Placement(transformation(extent = {{-20.0,-10.0},{0.0,10.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Step dQflow(height = 30,startTime = 1000) annotation(Placement(transformation(extent = {{-60,20},{-40,40}},origin = {0,0},rotation = 0)));
    .Modelica.Blocks.Sources.Step du(startTime = 6000,height = 0.1) annotation(Placement(transformation(extent = {{-60.0,-40.0},{-40.0,-20.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(dQflow.y,plant.dQ_flow) annotation(Line(points = {{-39,30},{-34,30},{-34,8},{-22,8}},color = {0,0,127}));
    connect(du.y,plant.du) annotation(Line(points = {{-39,-30},{-34,-30},{-34,-8},{-22,-8}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end Experiment_nonlinear;
