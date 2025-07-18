within LinearizeExample.VectorizedConnectors;

model HeatingSystemNonLinearScaledStates_pT "Nonlinear heating system model"
  extends .LinearizeExample.VectorizedConnectors.HeatingSystemNonLinear(redeclare replaceable package Medium = .Modelica.Media.CompressibleLiquids.LinearWater_pT_Ambient,tank(energyDynamics = .Modelica.Fluid.Types.Dynamics.SteadyState,level(stateSelect=StateSelect.always)));

  Real radiator_p(stateSelect=StateSelect.always, nominal=1.0) "Scaled radiator pressure states";  
  Real heater_p(stateSelect=StateSelect.always,nominal=1.0) "Scaled heater pressure states";  
//  Real[2] pipe_p(stateSelect=StateSelect.always,nominal=1.0) "Scaled pipe pressure states"; 
  Real radiator_T(stateSelect=StateSelect.always, nominal=1.0) "Scaled radiator enthalpy states";  
  Real heater_T(stateSelect=StateSelect.always,nominal=1.0) "Scaled heater temperature states";  
//  Real[2] pipe_T(stateSelect=StateSelect.always,nominal=1.0) "Scaled pipe temperature states";     
  Real tank_T(stateSelect=StateSelect.always,nominal=1.0) "Scaled tank temperature states";      
  parameter .Modelica.Units.SI.Pressure p_scale = 1.0e5 "scaling parameter for pressures"; 
  parameter .Modelica.Units.SI.TemperatureDifference T_scale = 100.0 "scaling parameter for temperatures"; 
    
equation
  radiator_p = radiator.mediums[1].p/p_scale;  
//  pipe_p = pipe.mediums.p/p_scale;  
  heater_p = heater.mediums[1].p/p_scale;
  radiator_T = radiator.mediums[1].T/T_scale;  
//  pipe_T = pipe.mediums.T/T_scale;  
  heater_T = heater.mediums[1].T/T_scale;
  tank_T = tank.medium.T/T_scale; 
  annotation (experiment(
      StopTime=10000,
      Tolerance=1e-006,
      __Dymola_Algorithm="Radau"), Documentation(info="<html><p><em>Modelica.Fluid.Examples.HeatingSystem</em>&nbsp;with input/output interfaces to analyze&nbsp;the impact of the burner heat rate and  valve opening on the forward 
and return temperatures. The modification are required to make&nbsp;linearization of that dynamics possible.</p><p>What we are doing is to ntroduce \"scaled states\" at the top level of the model that&nbsp; we are forcing to be states by using the stateSelect attribute, set to always, and scaling the states by an appropriate scale.&nbsp;</p><p>We also scale the inputs, and possibly supply offsets, such that inputs are between 0 and 1 (or 0% and 100%, if desired).&nbsp;</p><p>The pipe is a discretized model that does not contribute much to the model as well: removing the pipe would reduce the model size, and be better for controls development.</p><p>Note that this model is still not great for controls design: the pressures are irrelevant to the control problem, so the fluid model should be incompressible. While ther are incompressible fluid model, there is none for water in the MSL. Even if there is one, the use of incompresible models triggers index reduction, and index reduction throws an error if one has to differentiate through an input. A really \"good\" model for control design of this example wouold thus require a re-write of a lot of modeling code.&nbsp;</p><p>Another option is to use model order reduction, e.g. using the <a href=\"https://github.com/python-control/python-control\">Python Control</a> package.&nbsp;</p><p>The model is still not optimal for control design, but much better. A fully incomressible model would be even better, since we have no means to control system pressure, and a model with a state that more directly controls the heating power, e.g. valve position.&nbsp;</p><p><br></p></html>"));
end HeatingSystemNonLinearScaledStates_pT;
