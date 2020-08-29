% |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
%           DATOS GENERADOS DE GiD PARA MATLAB - OCTAVE              
% |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

% INFORMACION DE UNIDADES:
% Todas las unidades estan dadas en el sistema internacional
%           Distancia:             | m
%           Fuerza:                | N
%           Modulo de Young:	   | Pa
%           Inercia:               | m^4
%           Area:                  | m^2

% INFORMACION DEL PROBLEMA:
% 			Numero de elementos:   | 50
% 			Numero de nudos:       | 51

IMPR = 9;  % Tipo de impresion de resultados
TIPR = 11;  % Tipo de problema, en este caso siempre sera 11 ya que estamos trabajando con vigas
NIIE = 0;  % Numero de interpolaciones internas por elemento

% TABLA DE CATEGORIAS: CAT()
% 			EYOU: Modulo de Young
% 			INER: Inercia
% 			TIPE: Tipo de analisis del elemento
% 				  111: Euler-Bernoulli
% 				  112: Timoshenko 1PG - 1 Punto de Gauss-Legendre para el calculo de matriz Kz
% 				  113: Timoshenko 2PG - 2 Punto de Gauss-Legendre para el calculo de matriz Kz
% 				  212: 111 y 112 simultaneamente
% 				  213: 111 y 113 simultaneamente
% 				  223: 112 y 113 simultaneamente
% 				  300: 111, 112 y 113 simultaneamente
% 			AREA: Area
% 			Kz: Parametro de correccion de cortante (Timoshenko)
% 			POISS: Coeficiente de Poisson
% CAT = [ EYOU    INER    TIPE    AREA    Kz    POISS ]  

CAT = [ ...
  2.15000e+10  1.60000e-03 113  1.20000e-01  8.30000e-01  2.00000e-01
];


% TABLA DE CONECTIVIDADES DE LOS ELEMENTOS: ELE()
% 			ELEM: Numero del elemento finito
% 			ICAT: Indice de categoria
% 			NUDI: Identificacion del primer nudo del elemento
% 			NUDJ: Identificacion del segundo nudo del elemento
% NOTA IMPORTANTE: Mas abajo se eliminara la primera columna ELEM, para que ELE() sea compatible
%				   con el programa PEFUNI
% ELE = [ ELEM    ICAT    NUDI    NUDJ ]  

ELE = [ ...
         1          1        51         50 
         2          1        50         49 
         3          1        49         48 
         4          1        48         47 
         5          1        47         46 
         6          1        46         45 
         7          1        45         44 
         8          1        44         43 
         9          1        43         42 
        10          1        42         41 
        11          1        41         40 
        12          1        40         39 
        13          1        39         38 
        14          1        38         37 
        15          1        37         36 
        16          1        36         35 
        17          1        35         34 
        18          1        34         33 
        19          1        33         32 
        20          1        32         31 
        21          1        31         30 
        22          1        30         29 
        23          1        29         28 
        24          1        28         27 
        25          1        27         26 
        26          1        26         25 
        27          1        25         24 
        28          1        24         23 
        29          1        23         22 
        30          1        22         21 
        31          1        21         20 
        32          1        20         19 
        33          1        19         18 
        34          1        18         17 
        35          1        17         16 
        36          1        16         15 
        37          1        15         14 
        38          1        14         13 
        39          1        13         12 
        40          1        12         11 
        41          1        11         10 
        42          1        10          9 
        43          1         9          8 
        44          1         8          7 
        45          1         7          6 
        46          1         6          5 
        47          1         5          4 
        48          1         4          3 
        49          1         3          2 
        50          1         2          1 
];

ELE(:,1)= []; %Aqui se elimina la primera columna ELEM, para que ELE() sea compatible con PEFUNI


% TABLA DE COORDENADAS DE LOS NUDOS: XYZ()
% Cada fila corresponde al numero del nudo
% 			XNUD: Coordenada x del nudo
% XYZ = [ XNUD ]  

XYZ = [ ...
    5.00000e+00 
    4.90000e+00 
    4.80000e+00 
    4.70000e+00 
    4.60000e+00 
    4.50000e+00 
    4.40000e+00 
    4.30000e+00 
    4.20000e+00 
    4.10000e+00 
    4.00000e+00 
    3.90000e+00 
    3.80000e+00 
    3.70000e+00 
    3.60000e+00 
    3.50000e+00 
    3.40000e+00 
    3.30000e+00 
    3.20000e+00 
    3.10000e+00 
    3.00000e+00 
    2.90000e+00 
    2.80000e+00 
    2.70000e+00 
    2.60000e+00 
    2.50000e+00 
    2.40000e+00 
    2.30000e+00 
    2.20000e+00 
    2.10000e+00 
    2.00000e+00 
    1.90000e+00 
    1.80000e+00 
    1.70000e+00 
    1.60000e+00 
    1.50000e+00 
    1.40000e+00 
    1.30000e+00 
    1.20000e+00 
    1.10000e+00 
    1.00000e+00 
    9.00000e-01 
    8.00000e-01 
    7.00000e-01 
    6.00000e-01 
    5.00000e-01 
    4.00000e-01 
    3.00000e-01 
    2.00000e-01 
    1.00000e-01 
    0.00000e+00 
];


% TABLA DE DESPLAZAMIENTOS CONOCIDOS: UCO() 
% 			INUD: número del nudo 
% 			DCUY: indicador si el desplazam en y es conocido o no (1:conoc o 0:descon) 
% 			DCRZ: indicador si la rotación en z es conocida o no (1:conoc o 0:descon) 
% 			VAUY: valor del desplazamiento en y conocido.  No importa su valor si DCUY=0 
% 			VARZ: valor de la rotación en z conocido. No importa su valor cuando DCRZ=0 
% UCO = [ INUD   DCUY   DCRZ   VAUY   VARZ ] 

UCO = [ ...
1    1   0  0.00000e+00  0.00000e+00
51    1   0  0.00000e+00  0.00000e+00
];


% TABLA DE FUERZAS APLICADAS EN LOS NUDOS DE LA MALLA. FUN()
% 			INUD: número del nudo 
% 			FUNY: valor de la fuerza puntual en dirección y 
% 			FUMZ: valor del momento alrededor del eje z. 
% FUN = [ INUD    FUNX    FUMZ ] 

FUN = [ ...
];


% TABLA DE FUERZAS DISTRIBUIDAS UNIFORMEMENTE EN LOS ELEMENTOS: FDI()
% 			IELE: número del elemento IELE 
% 			WELE: valor de la carga distribuida uniforme en dirección y.
% FDI = [ IELE    WELE ] 

FDI = [ ...
         1  -1.00000e+04
         2  -1.00000e+04
         3  -1.00000e+04
         4  -1.00000e+04
         5  -1.00000e+04
         6  -1.00000e+04
         7  -1.00000e+04
         8  -1.00000e+04
         9  -1.00000e+04
        10  -1.00000e+04
        11  -1.00000e+04
        12  -1.00000e+04
        13  -1.00000e+04
        14  -1.00000e+04
        15  -1.00000e+04
        16  -1.00000e+04
        17  -1.00000e+04
        18  -1.00000e+04
        19  -1.00000e+04
        20  -1.00000e+04
        21  -1.00000e+04
        22  -1.00000e+04
        23  -1.00000e+04
        24  -1.00000e+04
        25  -1.00000e+04
        26  -1.00000e+04
        27  -1.00000e+04
        28  -1.00000e+04
        29  -1.00000e+04
        30  -1.00000e+04
        31  -1.00000e+04
        32  -1.00000e+04
        33  -1.00000e+04
        34  -1.00000e+04
        35  -1.00000e+04
        36  -1.00000e+04
        37  -1.00000e+04
        38  -1.00000e+04
        39  -1.00000e+04
        40  -1.00000e+04
        41  -1.00000e+04
        42  -1.00000e+04
        43  -1.00000e+04
        44  -1.00000e+04
        45  -1.00000e+04
        46  -1.00000e+04
        47  -1.00000e+04
        48  -1.00000e+04
        49  -1.00000e+04
        50  -1.00000e+04
];


% TABLA DE FUERZAS DISTRIBUIDAS LINEALMENTE EN LOS ELEMENTOS: FDIL()
% 			IELE: número del elemento IELE 
% 			MFDILI: valor inicial de la carga en el elemento general antes de crear la malla
% 			MFDILF: valor final de la carga en el elemento general antes de crear la malla
% FDI = [ IELE    MFDILI    MFDILF ] 

FDIL = [ ...
];
NIT = 0;  % Numero de iteracion, se utiliza para los casos de TIPE = 212, 213, 223 y 300






