within LinearizeExample.LinearizeWorkshop.Experiments;

model Experiment_linear_reduced
    extends .LinearizeExample.LinearizeWorkshop.Experiments.Experiment_nonlinear(
    redeclare .LinearizeExample.LinearizeWorkshop.HeatingSystem_linear plant(
    redeclare .LinearizeExample.LinearizeWorkshop.ModelReduction.HeatingSystemSS_reduced heatingSystemSS,
    y0={343.31083306214447, 296.50537471161863}));
end Experiment_linear_reduced;
