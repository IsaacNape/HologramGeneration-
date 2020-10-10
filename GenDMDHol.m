function h=GenDMDHol(U,Base, Xgrating, Ygrating)
% Hologram generation for amplitude only spatial light modulators 
% U :  optical field; Base: data struct with meshgrid info; X(Y)grating: frequency in X (Y) direction
% Base can be generated using the GenBase function 

Gy = Ygrating./(Base.V*Base.dy); % grating frequency
Gx = Xgrating./(Base.H*Base.dx);% grating frequency 

%Amplitude info of field
U=conj(U);% Conjugate the field
U1 = U./sqrt(sum(sum(abs(U).^2))); % Normalise input field by energy (probably not neccesary)
v =1; %abs(U1)./max(max(abs(U1)));
A = asin(v)/pi;

%Phase info of field
ph = angle(U); %% extract phase of the function
varphi = ph/pi;

%Final hologram
h= 0.5 + 0.5*sign(cos(2*pi*(Gx*Base.X+Gy*Base.Y)-pi*varphi)-cos(pi*A)); % Compute hologram 
h = h./max(h(:));
