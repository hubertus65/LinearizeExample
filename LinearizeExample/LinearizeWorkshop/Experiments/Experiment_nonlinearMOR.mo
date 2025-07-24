within LinearizeExample.LinearizeWorkshop.Experiments;

model Experiment_nonlinearMOR
    extends .LinearizeExample.LinearizeWorkshop.Experiments.Experiment_nonlinear(redeclare replaceable .LinearizeExample.LinearizeWorkshop.ModelReduction.HeatingSystem_physicalMOR plant);
end Experiment_nonlinearMOR;
