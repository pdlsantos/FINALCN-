% ---------------
% Inciso A
% ---------------

puntos = linspace(-2*pi,2*pi,9); % 9 puntos equidistantes en [-2pi,2pi]

valor = (1/sqrt(2*pi)).*exp((-1/2).*(puntos.^2)); % Evaluo la función f en los 9 puntos

% Empieza algoritmo de diferencias finitas

d = valor; % copio los 9 valores de la funcion en un vector d

for i = 2:9
  for j = -9:-i
   j = -j;  % no sé recorrer en reverse la lista de indices en octave
   d(j) = (d(j)-d(j-1))/(puntos(j)-puntos(j-i+1)); % Estoy recorriendo el vector de abajo para arriba aplicando la definicion de diferencia dividida
                                                 % Voy de abajo para poder reutilizar el mismo vector en la siguiente pasada
                                                 % Podría haber usado una matriz pero ocuparía memoria innecesaria
  endfor 
endfor

x = linspace(-2*pi,2*pi,1000);   % Creo una grilla para los puntos

y = (1/sqrt(2*pi)).*exp((-1/2).*(x.^2)); %evaluo la función en la grilla

% evaluar el polinomio interpolante - Método de Horner

z = d(9).*(x-puntos(8))+d(8); % Arranco de este vector para guiarme

for k = -7:-1
  k = -k;
  z = d(k) + (x-puntos(k)).*z;
endfor  

% el  error es aproximadamente 0.465 adjunto la grafica generada con plot(x,y,x,z)

% ----------------
% Inciso B
% ----------------

% Mi idea es usar los ceros de Tchebichev para mejor la cota

ceros = zeros(9,1);

for i = 1:9
  ceros(i) = 2*pi*cos(pi*(2*(i-1)+1)/18); % ubico los ceros de Tchebichev en [-1,1] y los reescalo. como i arranca de 1 le resto 1 para que arranque de 0
endfor

valor1 = (1/sqrt(2*pi)).*exp((-1/2).*(ceros.^2)); % Evaluo la función f en los 9 puntos

% Realizo los mismo pasos que antes
d1 = valor1; % copio los 9 valores de la funcion en un vector d1

for i = 2:9
  for j = -9:-i
   j = -j; 
   d1(j) = (d1(j)-d1(j-1))/(ceros(j)-ceros(j-i+1)); % cambio el vector puntos por el vector ceros
  endfor 
endfor

z1 = d1(9).*(x-ceros(8))+d1(8); % cambio z por z1

for k = -7:-1
  k = -k;
  z1 = d1(k) + (x-ceros(k)).*z1;
endfor 

% el  error es aproximadamente 0.465 adjunto la grafica generada con plot(x,y,x,z)

% -----------------
% Inciso C
% -----------------

H = zeros(6,6); %Matriz asociada al sistema de ecuaciones a resolver, falta llenarla
a = zeros(6,1); %Vector con los coeficientes del polinomio buscado
b = zeros(6,1);
b(1) = 1/(sqrt(2*pi)); % Vector del lado derechio

% el sistema de ecuaciones a resolver para hallar el polinomio interpolante tiene asociado la ecuación Ha=b

H(:,1) = [1 0 1 0 1 0 ];
H(:,2) = [0 1 (-2*pi) 1 (2*pi) 1 ];
H(:,3) = [0 0 (-2*pi)^2 2*(-2*pi) (2*pi)^2 2*(2*pi) ];
H(:,4) = [0 0 (-2*pi)^3 3*(-2*pi)^2 (2*pi)^3 3*(2*pi)^2 ];
H(:,5) = [0 0 (-2*pi)^4 4*(-2*pi)^3 (2*pi)^4 4*(2*pi)^3 ];
H(:,6) = [0 0 (-2*pi)^5 5*(-2*pi)^4 (2*pi)^5 5*(2*pi)^4 ];

a = H\b;  % Resulevo el sistema 

% Evaluacion de polinomio

z2 = a(5) + a(6).*x; 

for k = -4:-1
  k = -k;
  z2 = a(k) + x.*z2;
endfor 


 