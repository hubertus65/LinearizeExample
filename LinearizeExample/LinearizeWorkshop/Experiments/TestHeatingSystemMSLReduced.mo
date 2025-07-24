within LinearizeExample.LinearizeWorkshop.Experiments;
model TestHeatingSystemMSLReduced
    extends .LinearizeExample.LinearizeWorkshop.ModelReduction.HeatingSystemMSLReduced;
    .Modelica.Blocks.Sources.Constant Qflow(k = 300) annotation(Placement(transformation(extent = {{-26.0,52.0},{-6.0,72.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Sources.Constant Valve_u(k = 0.1) annotation(Placement(transformation(extent = {{20.0,-38.0},{40.0,-18.0}},origin = {0.0,0.0},rotation = 0.0)));
equation
    connect(Qflow.y,burner.Q_flow) annotation(Line(points = {{-5,62},{14,62}},color = {0,0,127}));
    connect(Valve_u.y,valve.opening) annotation(Line(points = {{41,-28},{50,-28},{50,-62}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));
end TestHeatingSystemMSLReduced;
