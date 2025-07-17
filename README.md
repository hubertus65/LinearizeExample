# Linearize project
Project with custom function to linearize the model and compute its state space representation(matrices A, B, C and D).",

#### Added 7/2025: 
 - Changed to newest model, and temerpaature as state
 - scaled states and inputs
 - reduced number of states for a control design model

#### Further possible improvements:
 - provide a fully incompressible model that does not trigger index reduction (only T-states left), but bring back the long pipes to capture time delay
 - rewrite to have a state that is related to flow more directly, since that would be even better for control design purposes
