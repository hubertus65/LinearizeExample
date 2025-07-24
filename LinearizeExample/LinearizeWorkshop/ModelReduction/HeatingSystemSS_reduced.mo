within LinearizeExample.LinearizeWorkshop.ModelReduction;

model HeatingSystemSS_reduced "State space model from physics reduced order model"
    extends .Modelica.Blocks.Continuous.StateSpace(
A = {
{-0.00022517946053211382, 0.0, 0.00013767784355226477, 0.0, 0.0, -0.00022107574856201228},
{0.008764843732513532, -0.23801039956920222, 0.0, 0.0, 0.0, 0.10916404654168671},
{0.0, 0.0, -0.026205828040949668, 0.0, 0.0017529687480840354, -0.021248602064239917},
{0.0, 0.0035059374961680712, 0.0, -0.0035059374961680712, 0.0, 0.0},
{0.0, 0.0, 0.0, 0.0035059374961680712, -0.0035059374961680712, 0.0},
{0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
B = {
{0.0, 0.001789238648560865},
{0.0014054011392825288, -4.202405507396201},
{0.0, 0.8177989672826691},
{0.0, 0.0},
{0.0, 0.0},
{0.0, 0.0}},
C = {
{0.0, 1.0, 0.0, 0.0, 0.0, 0.0},
{0.0, 0.0, 1.0, 0.0, 0.0, 0.0}},
D = {
{0.0, 0.0},
{0.0, 0.0}});
    annotation(Documentation(info = "<html><p>This block contains a parameterized state space model for the linearized heating system example.</p><p><br></p><p>Author: Hubertus Tummescheit<br>Date: 2025-07-18</p></html>"));
end HeatingSystemSS_reduced;
