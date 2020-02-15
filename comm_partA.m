% Communication Theory and Systems 1st Project
% Part A
 %% Signal Creation
 ts = 0.01;
t = 0:ts:2; %in ms
x = t.*2;
x(ceil(length(x)/4)+1:ceil(3*length(x)/4)) = x(ceil(length(x)/4)+1:ceil(3*length(x)/4)) - 2;
x(ceil(3*length(x)/4)+1:length(x)) = x(ceil(3*length(x)/4)+1:length(x)) - 4;
% x is now done 
 % Generate the phase deviation signal
 theta = zeros(1,length(x));
 sum=0; Kf=1000;
 for i=1:1:length(x)
     theta(i)=sum+x(i);
     sum=theta(i);
 end
 theta = theta.*(Kf*2*pi);
  subplot(2,1,1);
  plot(t,theta);
  title('The phase deviation signal');
%% Carrier and Modulation
Ac = 1; Fc=10000;
modulated_carrier = Ac.*cos(2*pi*Fc*t/1000 + theta); %I divided t by 1000 to make it in seconds so I can multiply by Fc (1/second)
  subplot(2,1,2);
  plot(t,modulated_carrier);
  title('The frequency modulated carrier');
  % The next variables I set to use in SIMULINK [ Part B ]
  m1=[t' x'];
  m2=[t' (theta.*10^-3)'];  % Just scaling to decrease the high values of the phase deviated signal to enable appropriate plotting
  m3=[t' modulated_carrier'];