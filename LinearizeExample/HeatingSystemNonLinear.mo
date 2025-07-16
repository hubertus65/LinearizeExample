within LinearizeExample;
model HeatingSystemNonLinear "Nonlinear heating system model"
  extends .LinearizeExample.Template.HeatingSystem(
    redeclare replaceable package Medium = .Modelica.Media.Water.WaterIF97_R1pT);

  parameter Integer nu=2 "Number of inputs";
  parameter Integer ny=2 "Number of outputs";
  parameter Real u_scale[nu]={1600,1} "For scaling inputs: external inputs are all from 0.0 to 1.0";
  parameter Real u0[nu]={1.0,0.1} "start value for inputs";
    
  .Modelica.Blocks.Interfaces.RealInput[nu] u(start = u0) annotation (Placement(transformation(
        extent={{-118.0,-22.0},{-78.0,18.0}},
        origin={0.0,0.0},
        rotation=0.0)));
  .Modelica.Blocks.Interfaces.RealOutput y[ny] annotation (Placement(transformation(
        extent={{102.0,-10.0},{122.0,10.0}},
        origin={0.0,0.0},
        rotation=0.0)));
    .Modelica.Blocks.Math.Gain burner_scale(k = u_scale[1]) annotation(Placement(transformation(extent = {{-30.0,40.0},{-10.0,60.0}},origin = {0.0,0.0},rotation = 0.0)));
    .Modelica.Blocks.Math.Gain valve_scale(k = u_scale[2]) annotation(Placement(transformation(extent = {{25.18,-40.82},{42.82,-23.18}},origin = {0.0,0.0},rotation = 0.0)));

equation
  connect(sensor_T_return.T, y[2]) annotation (Line(points={{-37,-50},{-45.16,-50},{-45.16,0},{112,0}},
                              color={0,0,127}));
  connect(sensor_T_forward.T, y[1]) annotation (Line(points={{67,40},{92,40},{92,0},{112,0}}, color={0,0,127}));
    connect(burner_scale.u,u[1]) annotation(Line(points = {{-32,50},{-58,50},{-58,-2},{-98,-2}},color = {0,0,127}));
    connect(valve_scale.y,valve.opening) annotation(Line(points = {{43.7,-32},{50,-32},{50,-62}},color = {0,0,127}));
    connect(valve_scale.u,u[2]) annotation(Line(points = {{23.42,-32},{-58,-32},{-58,-2},{-98,-2}},color = {0,0,127}));
    connect(burner_scale.y,burner.Q_flow) annotation(Line(points = {{-9,50},{5.5,50},{5.5,40},{20,40}},color = {0,0,127}));
  annotation (experiment(
      StopTime=10000,
      Tolerance=1e-006,
      __Dymola_Algorithm="Radau"), Documentation(info="<html><p><em>Modelica.Fluid.Examples.HeatingSystem</em>&nbsp;with input/output interfaces to analyze&nbsp;the impact of the burner heat rate and  valve opening on the forward 
and return temperatures. The modification are required to make&nbsp;linearization of the dynamics possible.</p><p>Note that without further changes, and without model reduction, this model is not useful for control design. It can, however, be used for understaning the mechanics of linearization.&nbsp;</p><p><br></p></html>"));
end HeatingSystemNonLinear;
