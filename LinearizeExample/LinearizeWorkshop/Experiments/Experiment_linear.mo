within LinearizeExample.LinearizeWorkshop.Experiments;
model Experiment_linear
    extends .LinearizeExample.LinearizeWorkshop.Experiments.Experiment_nonlinear(redeclare replaceable .LinearizeExample.LinearizeWorkshop.HeatingSystem_linear plant);
end Experiment_linear;
