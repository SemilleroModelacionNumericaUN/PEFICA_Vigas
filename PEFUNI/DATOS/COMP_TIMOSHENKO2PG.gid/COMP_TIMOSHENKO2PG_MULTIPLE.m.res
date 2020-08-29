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
   0.00   -9.689922e-03 
     2 0.00   -9.689922e-03 
   0.00   -3.100775e-02 
End Values 
# 
Result "Giro" "Euler-Bernoulli"  1  Vector OnGaussPoints "GP" 
ComponentNames "Tetha_z"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -8.720930e-03 
     2 0.00   -8.720930e-03 
   0.00   -1.162791e-02 
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
     1 0.00   -2.000000e+05 
   0.00   -1.000000e+05 
     2 0.00   -1.000000e+05 
   0.00   -1.018634e-10 
End Values 
Result "Desplazamiento" "Timoshenko_1PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "U_y"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -8.833006e-03 
     2 0.00   -8.833006e-03 
   0.00   -2.929392e-02 
End Values 
# 
Result "Giro" "Timoshenko_1PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "Tetha_z"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -8.720930e-03 
     2 0.00   -8.720930e-03 
   0.00   -1.162791e-02 
End Values 
# 
Result "Cortante" "Timoshenko_1PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "V_y"  
Values 
     1 0.00   +5.000000e+04
   0.00   +5.000000e+04
     2 0.00   +5.000000e+04
   0.00   +5.000000e+04
End Values 
# 
Result "Momento" "Timoshenko_1PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "M_z"  
Values 
     1 0.00   -2.000000e+05 
   0.00   -1.000000e+05 
     2 0.00   -1.000000e+05 
   0.00   -1.353328e-09 
End Values 
Result "Desplazamiento" "Timoshenko_2PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "U_y"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -1.016190e-03 
     2 0.00   -1.016190e-03 
   0.00   -3.237865e-03 
End Values 
# 
Result "Giro" "Timoshenko_2PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "Tetha_z"  
Values 
     1 0.00   +0.000000e+00 
   0.00   -9.041137e-04 
     2 0.00   -9.041137e-04 
   0.00   -1.205485e-03 
End Values 
# 
Result "Cortante" "Timoshenko_2PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "V_y"  
Values 
     1 0.00   +5.000000e+04
   0.00   +5.000000e+04
     2 0.00   +5.000000e+04
   0.00   +5.000000e+04
End Values 
# 
Result "Momento" "Timoshenko_2PG"  1  Vector OnGaussPoints "GP" 
ComponentNames "M_z"  
Values 
     1 0.00   -2.000000e+05 
   0.00   -1.000000e+05 
     2 0.00   -1.000000e+05 
   0.00   +3.201421e-10 
End Values 
