within LinearizeExample.ModelReduction;

model HeatingSystem_nonlinearMOR
    extends .LinearizeExample.Workshop.HeatingSystem_interface;
    extends .LinearizeExample.ModelReduction.HeatingSystemMSLReduced;
equation
    connect(add.y,burner.Q_flow) annotation(Line(points = {{-61,74},{-23.5,74},{-23.5,62},{14,62}},color = {0,0,127}));
    connect(add2.y,valve.opening) annotation(Line(points = {{-57,-74},{-50,-74},{-50,-62},{50,-62}},color = {0,0,127}));
    connect(sensor_T_return.T,T_return) annotation(Line(points = {{-37,-50},{-43,-50},{-43,-90},{86,-90},{86,-80},{110,-80}},color = {0,0,127}));
    connect(sensor_T_forward.T,T_forward) annotation(Line(points = {{67,40},{88.5,40},{88.5,80},{110,80}},color = {0,0,127}));
    annotation(Icon(coordinateSystem(preserveAspectRatio = false,extent = {{-100.0,-100.0},{100.0,100.0}}),graphics = {Rectangle(lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid,extent={{-100.0,-100.0},{100.0,100.0}}),Text(lineColor={0,0,255},extent={{-150,150},{150,110}},textString="%name")}));

end HeatingSystem_nonlinearMOR;
