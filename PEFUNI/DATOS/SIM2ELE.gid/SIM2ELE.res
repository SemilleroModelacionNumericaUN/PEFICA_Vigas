Gid Post Results File 1.0 
### 
# PEFICA-Octave postproceso para GiD 
# 
GaussPoints "GP" Elemtype line 
Number of Gauss Points: 7 
Nodes included 
Natural Coordinates: Internal 
end gausspoints 
# 
Result "Desplazamiento" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "U_y"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -6.133306e-04 
   0.00   -1.174090e-03 
   0.00   -1.655993e-03 
   0.00   -2.032753e-03 
   0.00   -2.278085e-03 
   0.00   -2.365704e-03 
     2 0.00   -2.365704e-03 
   0.00   -2.278085e-03 
   0.00   -2.032753e-03 
   0.00   -1.655993e-03 
   0.00   -1.174090e-03 
   0.00   -6.133306e-04 
   0.00   +0.000000e+00 
End Values 
# 
Result "Giro" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "Tetha_z"  
Values 
     1 0.00   -1.514050e-03 
   0.00   -1.419422e-03 
   0.00   -1.261709e-03 
   0.00   -1.040910e-03 
   0.00   -7.570252e-04 
   0.00   -4.100553e-04 
   0.00   -3.743238e-20 
     2 0.00   -3.743238e-20 
   0.00   +4.100553e-04 
   0.00   +7.570252e-04 
   0.00   +1.040910e-03 
   0.00   +1.261709e-03 
   0.00   +1.419422e-03 
   0.00   +1.514050e-03 
End Values 
# 
Result "Cortante" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "V_y"  
Values 
     1 0.00   +2.500000e+04
   0.00   +2.083333e+04
   0.00   +1.666667e+04
   0.00   +1.250000e+04
   0.00   +8.333333e+03
   0.00   +4.166667e+03
   0.00   +3.637979e-12
     2 0.00   +3.637979e-12
   0.00   -4.166667e+03
   0.00   -8.333333e+03
   0.00   -1.250000e+04
   0.00   -1.666667e+04
   0.00   -2.083333e+04
   0.00   -2.500000e+04
End Values 
# 
Result "Momento" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "M_z"  
Values 
     1 0.00   -1.546141e-11 
   0.00   +9.548611e+03 
   0.00   +1.736111e+04 
   0.00   +2.343750e+04 
   0.00   +2.777778e+04 
   0.00   +3.038194e+04 
   0.00   +3.125000e+04 
     2 0.00   +3.125000e+04 
   0.00   +3.038194e+04 
   0.00   +2.777778e+04 
   0.00   +2.343750e+04 
   0.00   +1.736111e+04 
   0.00   +9.548611e+03 
   0.00   -1.455192e-11 
End Values 
