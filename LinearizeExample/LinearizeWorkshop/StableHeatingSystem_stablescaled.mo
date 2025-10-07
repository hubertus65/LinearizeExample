within LinearizeExample.LinearizeWorkshop;

model StableHeatingSystem_stablescaled
    extends .LinearizeExample.LinearizeWorkshop.ModelReduction.StableHeatingSystem(pump(m_flow_nominal = 0.2,checkValve = true),system(massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState),redeclare replaceable package Medium = .Modelica.Media.Water.ConstantPropertyLiquidWater);
    extends .LinearizeExample.LinearizeWorkshop.HeatingSystem_scaledinterface;
 //   Real radiator_p(stateSelect=StateSelect.always, nominal=1.0) "Scaled radiator pressure states";  
 //   Real heater_p(stateSelect=StateSelect.always,nominal=1.0) "Scaled heater pressure states";  
 //   Real[2] pipe_p(stateSelect=StateSelect.always,nominal=1.0) "Scaled pipe pressure states"; 
    Real radiator_T(stateSelect=StateSelect.always, nominal=1.0) "Scaled radiator enthalpy states";  
    Real heater_T(stateSelect=StateSelect.always,nominal=1.0) "Scaled heater temperature states";  
    Real[2] pipe_T(stateSelect=StateSelect.always,nominal=1.0) "Scaled pipe temperature states";        

   parameter .Modelica.Units.SI.Pressure p_scale = 1.0e5 "scaling parameter for pressures"; 
   parameter .Modelica.Units.SI.TemperatureDifference T_scale = 300.0 "scaling parameter for temperatures"; 
equation
//  radiator_p = radiator.mediums[1].p/p_scale;  
//  pipe_p = pipe.mediums.p/p_scale;  
//  heater_p = heater.mediums[1].p/p_scale;
  radiator_T = radiator.mediums[1].T/T_scale;  
  pipe_T = pipe.mediums.T/T_scale;  
  heater_T = heater.mediums[1].T/T_scale;
    connect(qScale.y,burner.Q_flow) annotation(Line(points = {{-27,74},{-6.5,74},{-6.5,62},{14,62}},color = {0,0,127}));
    connect(sensor_T_forward.T,T_forward) annotation(Line(points = {{67,40},{88.5,40},{88.5,80},{110,80}},color = {0,0,127}));
    connect(add2.y,valve.opening) annotation(Line(points = {{-57,-74},{-51,-74},{-51,-32},{50,-32},{50,-62}},color = {0,0,127}));
    connect(sensor_T_return.T,T_return) annotation(Line(points = {{-37,-50},{-43,-50},{-43,-80},{110,-80}},color = {0,0,127}));
end StableHeatingSystem_stablescaled;
