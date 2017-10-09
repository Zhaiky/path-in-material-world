L = input ('What is the length of the pendulum rod? '); %length of pendulum rod
t(1) = input ('What is the initial condition for t? '); %initial time
X(1) = input ('What is the initial displacement of the top? ');  %initial displacment of the top

% Constants
p = 0.050;   % mass of pendulum mass
m = 0.198;   % mass of large mass
g = 9.81;    % gravitational acceleration
k = 15;      % large mass spring constant
c = 0.124;   % large mass damping coefficient
b = 0.00022;

% Equations
% Q represents theta
% W represents omega, the angular velocity
fX = @(t,X,Q,V,W) V;
fQ = @(t,X,Q,V,W) W;
fV = @(t,X,Q,V,W) (p*L*(W^2)*sin(Q)+p*g*sin(Q)*cos(Q)-k*X-c*V+(b/L)*W*cos(Q))/((m+p*(sin(Q))^2));
fW = @(t,X,Q,V,W) (-p*L*(W^2)*sin(Q)*cos(Q)-(p+m)*g*sin(Q)+k*X*cos(Q)+c*V*cos(Q)-(1+m/p)*(b/L)*W)/(L*(m+p*(sin(Q))^2));

% Initial conditions
Q(1) = 0; % the initial angular displacement of the pendulum is 0
V(1) = 0; % the initial velocity of the top is 0
W(1) = 0; % the initial angular velocity of the pendulum is 0

% Step size and number of steps
h = 0.0001;
time_total = 20;
n = ceil(time_total/h);

% RK4 loop
for i = 1:n
    
    t(i+1) = t(i) + h; % time increment
    
    %RK1
    k1X = fX(t(i),X(i),Q(i),V(i),W(i));
    k1Q = fQ(t(i),X(i),Q(i),V(i),W(i));
    k1V = fV(t(i),X(i),Q(i),V(i),W(i));
    k1W = fW(t(i),X(i),Q(i),V(i),W(i));
    
    %RK2
    k2X = fX(t(i)+h/2,X(i)+h/2*k1X,Q(i)+h/2*k1Q,V(i)+h/2*k1V,W(i)+h/2*k1W);
    k2Q = fQ(t(i)+h/2,X(i)+h/2*k1X,Q(i)+h/2*k1Q,V(i)+h/2*k1V,W(i)+h/2*k1W);
    k2V = fV(t(i)+h/2,X(i)+h/2*k1X,Q(i)+h/2*k1Q,V(i)+h/2*k1V,W(i)+h/2*k1W);
    k2W = fW(t(i)+h/2,X(i)+h/2*k1X,Q(i)+h/2*k1Q,V(i)+h/2*k1V,W(i)+h/2*k1W);
    
    %RK3
    k3X = fX(t(i)+h/2,X(i)+h/2*k2X,Q(i)+h/2*k2Q,V(i)+h/2*k2V,W(i)+h/2*k2W);
    k3Q = fQ(t(i)+h/2,X(i)+h/2*k2X,Q(i)+h/2*k2Q,V(i)+h/2*k2V,W(i)+h/2*k2W);
    k3V = fV(t(i)+h/2,X(i)+h/2*k2X,Q(i)+h/2*k2Q,V(i)+h/2*k2V,W(i)+h/2*k2W);
    k3W = fW(t(i)+h/2,X(i)+h/2*k2X,Q(i)+h/2*k2Q,V(i)+h/2*k2V,W(i)+h/2*k2W);
    
    %RK4
    k4X = fX(t(i)+h,X(i)+h*k3X,Q(i)+h*k3Q,V(i)+h*k3V,W(i)+h*k3W);
    k4Q = fQ(t(i)+h,X(i)+h*k3X,Q(i)+h*k3Q,V(i)+h*k3V,W(i)+h*k3W);
    k4V = fV(t(i)+h,X(i)+h*k3X,Q(i)+h*k3Q,V(i)+h*k3V,W(i)+h*k3W);
    k4W = fW(t(i)+h,X(i)+h*k3X,Q(i)+h*k3Q,V(i)+h*k3V,W(i)+h*k3W);
    
    %Summing
    X(i+1) = X(i)+(h/6)*(k1X+2*k2X+2*k3X+k4X);
    Q(i+1) = Q(i)+(h/6)*(k1Q+2*k2Q+2*k3Q+k4Q);
    V(i+1) = V(i)+(h/6)*(k1V+2*k2V+2*k3V+k4V);
    W(i+1) = W(i)+(h/6)*(k1W+2*k2W+2*k3W+k4W);
    
end

plot(t,X);

