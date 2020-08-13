
x0 = 3; %  Semilla del cero de orden 2
x1 = 2; % Semilla del cero de orden 1

% método inciso b

b0 = x0;
b1 = x1;

e0 = [abs(pi - b0)];
e1 = [abs(pi/2 - b1)]
j = 1
while(e0>10^(-10)) %propongo como método de parada que el error absoluto sea menor a 10^-10
b0 = b0 - ((sin(b0)*sin(b0)*cos(b0))^2)/(sin(sin(b0)*sin(b0)*cos(b0)+b0)*sin(sin(b0)*sin(b0)*cos(b0)+b0)*cos(sin(b0)*sin(b0)*cos(b0)+b0)-sin(b0)*sin(b0)*cos(b0));
e0(j) = abs(pi - b0);
b1 = b1 - ((sin(b1)*sin(b1)*cos(b1))^2)/(sin(sin(b1)*sin(b1)*cos(b1)+b1)*sin(sin(b1)*sin(b1)*cos(b1)+b1)*cos(sin(b1)*sin(b1)*cos(b1)+b1)-sin(b1)*sin(b1)*cos(b1));
e1(j) = abs(pi/2 - b1);
j+=1;
endwhile

e0y = e0(2:length(e0));
e0x = e0(1:length(e0)-1);


e1y = e1(2:length(e0));
e1x = e1(1:(length(e0)-1));

% graficar rectas

loglog(e0x,e0y); % pendiente aproximadamente 1
loglog(e1x,e1y); % pocos puntos pero pendiente aproximadamente 2
