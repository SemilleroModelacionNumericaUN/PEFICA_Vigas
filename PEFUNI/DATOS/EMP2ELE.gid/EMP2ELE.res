Gid Post Results File 1.0 
### 
# PEFICA-Octave postproceso para GiD 
# 
GaussPoints "GP" Elemtype line 
Number of Gauss Points: 2 
Nodes included 
Natural Coordinates: Internal 
end gausspoints 
# 
Result "Desplazamiento" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "U_y"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -1.892563e-02 
     2 0.00   -1.892563e-02 
   0.00   -6.056202e-02 
End Values 
# 
Result "Giro" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "Tetha_z"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -1.362645e-02 
     2 0.00   -1.362645e-02 
   0.00   -1.816860e-02 
End Values 
# 
Result "Cortante" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "V_y"  
Values 
     1 0.00   +5.000000e+04
   0.00   +5.000000e+04
     2 0.00   +5.000000e+04
   0.00   +5.000000e+04
End Values 
# 
Result "Momento" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "M_z"  
Values 
     1 0.00   -2.500000e+05 
   0.00   -1.250000e+05 
     2 0.00   -1.250000e+05 
   0.00   -3.929017e-10 
End Values 
