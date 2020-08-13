% Ejercicio 6

% Datos del  problema

valor = load("-ascii","funcionf.txt");
x = linspace(1,3,65);
h = 1/32;

% Regla compuesta a derecha

Rh = 0;

for i =  2:65
  Rh = valor(i) + Rh; 
endfor

Rh = h*Rh;

% Regla compuesta del trapecio

Th = valor(1)+valor(65)/2;

for i = 2:64
  Th = valor(i) + Th;
endfor

Th = h*Th;

% Regla compuesta  de Simpsons la cantidad de subintervalos es 64, por lo tanto par

Sh =0;

for i = 2:33
  Sh = valor(2*i-3) + 4*valor(2*i-2) + valor(2*i-1) + Sh;
endfor

Sh = h*Sh/3;

%%%%%% Aproximaciones mejores

% Regla T22 - en el final aparece como T_2^2

% Calculo S2h

S2h =0;

for i = 1:16
  S2h = valor(4*i-3) + 4*valor(4*i-1) + valor(4*i+1) + S2h;
endfor

S2h = 2*h*S2h/3; % En el final aparece como T_2^1

T22 = (16*S2h-Sh)/15; % Esta es la primer propuesta de mejor aproximacion

% Regla T33 - en el final aparece como T_3^3

% Calculo S4h

S4h =0;

for i = 1:8
  S4h = valor(8*i-7) + 4*valor(8*i-3) + valor(8*i+1) + S4h;
endfor

S4h = 4*h*S4h/3; % En el final aparece como T_2^1

T33 = (1024*S4h-80*S2h+Sh)/945; % Esta es la segunda propuesta de mejor aproximacion

%  estimaciones

estRh = floor(-log10(2*abs(Rh-T33)/T33)); % Estimación de Rh 
estTh = floor(-log10(2*abs(Th-T33)/T33)); % Estimación de Th
estSh = floor(-log10(2*abs(Sh-T33)/T33)); % Estimación de Sh