model LinearizeLoopCloser "Simple reference pressure node with inlet/outlet ports. Use in a loop only!"


  extends .Modelica.Fluid.Interfaces.PartialTwoPort(
    final port_a_exposesState=false,
    final port_b_exposesState=false);
  // Reference Pressure
  parameter .Modelica.Units.SI.Pressure reference_p = 1.0e5 "Reference Pressure";


equation

  // Pressure design point
  port_a.p = reference_p;
  port_b.p = reference_p; //have to break loop

  // Mass balance equation (no storage) not necessary for fully incompressible fluid!
  // port_a.m_flow + port_b.m_flow = 0;

  // Transport of energy and substances
  port_a.h_outflow = inStream(port_b.h_outflow);
  port_b.h_outflow = inStream(port_a.h_outflow);

  port_a.Xi_outflow = inStream(port_b.Xi_outflow);
  port_b.Xi_outflow = inStream(port_a.Xi_outflow);

  port_a.C_outflow = inStream(port_b.C_outflow);
  port_b.C_outflow = inStream(port_a.C_outflow);


    annotation (defaultComponentName="referencePressure",
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          initialScale=0.2), graphics={Rectangle(extent={{-100,100},{100,-100}},fillColor={255,255,255},fillPattern=FillPattern.VerticalCylinder,pattern=LinePattern.None),Line(points={{-100,100},{-100,-100},{100,-100},{100,100}}),Text(extent={{-95,60},{95,40}},textString="pressure =",origin={2,-36}),Text(extent={{-95,-24},{95,-44}},textString="100000",origin={0,16})}),
      Documentation(info="<html>
<p>
Model of a component providing a fixed reference pressure. This allows to have closed loop circuits of fluids that result in an asymptotically stable system model for linearization. It is especially useful for incompressible fluids, and temperature control. The reference Pressure is set through the parameter <code>p_reference</code>.
</p>
<p>
The vector of connectors <strong>ports</strong> represents fluid ports.
Fluid can flow either out of or in to each port. The sum of all flows is always zero.
</p>

</html>", revisions="<html>
<ul>
<li><em>September 30, 2025</em> Initial version by Hubertus Tummescheit</li>

</ul>
</html>"));
end LinearizeLoopCloser;
