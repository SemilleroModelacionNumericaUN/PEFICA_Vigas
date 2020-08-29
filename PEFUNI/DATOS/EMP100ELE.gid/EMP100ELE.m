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
% 			Numero de elementos:   | 100
% 			Numero de nudos:       | 101

IMPR = 0;  % Tipo de impresion de resultados
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
         1          1       101        100 
         2          1       100         99 
         3          1        99         98 
         4          1        98         97 
         5          1        97         96 
         6          1        96         95 
         7          1        95         94 
         8          1        94         93 
         9          1        93         92 
        10          1        92         91 
        11          1        91         90 
        12          1        90         89 
        13          1        89         88 
        14          1        88         87 
        15          1        87         86 
        16          1        86         85 
        17          1        85         84 
        18          1        84         83 
        19          1        83         82 
        20          1        82         81 
        21          1        81         80 
        22          1        80         79 
        23          1        79         78 
        24          1        78         77 
        25          1        77         76 
        26          1        76         75 
        27          1        75         74 
        28          1        74         73 
        29          1        73         72 
        30          1        72         71 
        31          1        71         70 
        32          1        70         69 
        33          1        69         68 
        34          1        68         67 
        35          1        67         66 
        36          1        66         65 
        37          1        65         64 
        38          1        64         63 
        39          1        63         62 
        40          1        62         61 
        41          1        61         60 
        42          1        60         59 
        43          1        59         58 
        44          1        58         57 
        45          1        57         56 
        46          1        56         55 
        47          1        55         54 
        48          1        54         53 
        49          1        53         52 
        50          1        52         51 
        51          1        51         50 
        52          1        50         49 
        53          1        49         48 
        54          1        48         47 
        55          1        47         46 
        56          1        46         45 
        57          1        45         44 
        58          1        44         43 
        59          1        43         42 
        60          1        42         41 
        61          1        41         40 
        62          1        40         39 
        63          1        39         38 
        64          1        38         37 
        65          1        37         36 
        66          1        36         35 
        67          1        35         34 
        68          1        34         33 
        69          1        33         32 
        70          1        32         31 
        71          1        31         30 
        72          1        30         29 
        73          1        29         28 
        74          1        28         27 
        75          1        27         26 
        76          1        26         25 
        77          1        25         24 
        78          1        24         23 
        79          1        23         22 
        80          1        22         21 
        81          1        21         20 
        82          1        20         19 
        83          1        19         18 
        84          1        18         17 
        85          1        17         16 
        86          1        16         15 
        87          1        15         14 
        88          1        14         13 
        89          1        13         12 
        90          1        12         11 
        91          1        11         10 
        92          1        10          9 
        93          1         9          8 
        94          1         8          7 
        95          1         7          6 
        96          1         6          5 
        97          1         5          4 
        98          1         4          3 
        99          1         3          2 
       100          1         2          1 
];

ELE(:,1)= []; %Aqui se elimina la primera columna ELEM, para que ELE() sea compatible con PEFUNI


% TABLA DE COORDENADAS DE LOS NUDOS: XYZ()
% Cada fila corresponde al numero del nudo
% 			XNUD: Coordenada x del nudo
% XYZ = [ XNUD ]  

XYZ = [ ...
    5.00000e+00 
    4.95000e+00 
    4.90000e+00 
    4.85000e+00 
    4.80000e+00 
    4.75000e+00 
    4.70000e+00 
    4.65000e+00 
    4.60000e+00 
    4.55000e+00 
    4.50000e+00 
    4.45000e+00 
    4.40000e+00 
    4.35000e+00 
    4.30000e+00 
    4.25000e+00 
    4.20000e+00 
    4.15000e+00 
    4.10000e+00 
    4.05000e+00 
    4.00000e+00 
    3.95000e+00 
    3.90000e+00 
    3.85000e+00 
    3.80000e+00 
    3.75000e+00 
    3.70000e+00 
    3.65000e+00 
    3.60000e+00 
    3.55000e+00 
    3.50000e+00 
    3.45000e+00 
    3.40000e+00 
    3.35000e+00 
    3.30000e+00 
    3.25000e+00 
    3.20000e+00 
    3.15000e+00 
    3.10000e+00 
    3.05000e+00 
    3.00000e+00 
    2.95000e+00 
    2.90000e+00 
    2.85000e+00 
    2.80000e+00 
    2.75000e+00 
    2.70000e+00 
    2.65000e+00 
    2.60000e+00 
    2.55000e+00 
    2.50000e+00 
    2.45000e+00 
    2.40000e+00 
    2.35000e+00 
    2.30000e+00 
    2.25000e+00 
    2.20000e+00 
    2.15000e+00 
    2.10000e+00 
    2.05000e+00 
    2.00000e+00 
    1.95000e+00 
    1.90000e+00 
    1.85000e+00 
    1.80000e+00 
    1.75000e+00 
    1.70000e+00 
    1.65000e+00 
    1.60000e+00 
    1.55000e+00 
    1.50000e+00 
    1.45000e+00 
    1.40000e+00 
    1.35000e+00 
    1.30000e+00 
    1.25000e+00 
    1.20000e+00 
    1.15000e+00 
    1.10000e+00 
    1.05000e+00 
    1.00000e+00 
    9.50000e-01 
    9.00000e-01 
    8.50000e-01 
    8.00000e-01 
    7.50000e-01 
    7.00000e-01 
    6.50000e-01 
    6.00000e-01 
    5.50000e-01 
    5.00000e-01 
    4.50000e-01 
    4.00000e-01 
    3.50000e-01 
    3.00000e-01 
    2.50000e-01 
    2.00000e-01 
    1.50000e-01 
    1.00000e-01 
    5.00000e-02 
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
101    1   1  0.00000e+00  0.00000e+00
];


% TABLA DE FUERZAS APLICADAS EN LOS NUDOS DE LA MALLA. FUN()
% 			INUD: número del nudo 
% 			FUNY: valor de la fuerza puntual en dirección y 
% 			FUMZ: valor del momento alrededor del eje z. 
% FUN = [ INUD    FUNX    FUMZ ] 

FUN = [ ...
1  -5.00000e+04  0.00000e+00
];


% TABLA DE FUERZAS DISTRIBUIDAS UNIFORMEMENTE EN LOS ELEMENTOS: FDI()
% 			IELE: número del elemento IELE 
% 			WELE: valor de la carga distribuida uniforme en dirección y.
% FDI = [ IELE    WELE ] 

FDI = [ ...
];


% TABLA DE FUERZAS DISTRIBUIDAS LINEALMENTE EN LOS ELEMENTOS: FDIL()
% 			IELE: número del elemento IELE 
% 			MFDILI: valor inicial de la carga en el elemento general antes de crear la malla
% 			MFDILF: valor final de la carga en el elemento general antes de crear la malla
% FDI = [ IELE    MFDILI    MFDILF ] 

FDIL = [ ...
];
NIT = 0;  % Numero de iteracion, se utiliza para los casos de TIPE = 212, 213, 223 y 300






