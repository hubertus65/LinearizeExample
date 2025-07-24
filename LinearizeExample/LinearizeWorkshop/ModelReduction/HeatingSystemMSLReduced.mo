within LinearizeExample.LinearizeWorkshop.ModelReduction;
model HeatingSystemMSLReduced
    extends .LinearizeExample.HeatingSystemMSL(system(
    massDynamics = .Modelica.Fluid.Types.Dynamics.SteadyState),
    redeclare replaceable package Medium = .Modelica.Media.Water.ConstantPropertyLiquidWater);
end HeatingSystemMSLReduced;
