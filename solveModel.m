function [T,Xp,Yp,J] = solveModel(uinp)
global Ac Bc Cc Dc X_S derx_S Y_S u_lin NH Ts Xhat nus nuo q qe QQ1 NC oo Ptsp qob beta1 beta2 beta3  ma mb mc pow
p=[reshape(uinp(1:NC),1,NC)];
p=[p,p(:,end).*ones(1,NH-NC)];
T=[];
Xp=[];
Yp=[];
size_in=size(p);
x0=Xhat;
y0=(Cc*(x0-X_S)+Dc*(p(:,1)-u_lin)+Y_S);
J0=0;
XY0=[x0;J0;y0];
qob1=ma-y0(4);
beta1=1;
qob2=mb-y0(4);
beta2=1;
qob3=mc-y0(4);
beta3=1;
po=pow+pow*(1/(1+exp(beta1*qob1)))+pow*(1/(1+exp(beta2*qob2)))+pow*(1/(1+exp(beta3*qob3)));
xd0=Ac*(x0-X_S)+Bc*(p(:,1)-u_lin)+derx_S;
% Dobj0=QQ1*(+y0(3)-Ptsp)^2; %objective function for set point tracking
Dobj0=QQ1*(po)+QQ1*10*(+y0(3)-Ptsp)^2; %objective function for economic tracking
yd0=zeros(size(y0));
XYD0=[xd0;Dobj0;yd0];
% options = odeset('RelTol',1e-8,'AbsTol',1e-6);
for i=1:size_in(2)
[tt,xy]=ode15i(@(t,XY,XYdot)predModel(t,XY,XYdot,p(:,i)),[(i-1)*Ts (i)*Ts],XY0,XYD0,[]);
if i==1
T=[T;tt];
Xp=[xy(:,1:nus)];
Yp=[xy(:,nus+2:end)];
end
y0=xy(end,nus+2:end);
if i<size_in(2)
% Dobj0=QQ1*(y0(3)-Ptsp)^2; %objective function for set point tracking
qob1=ma-y0(4);
qob2=mb-y0(4);
qob3=mc-y0(4);
po=pow+pow*(1/(1+exp(beta1*qob1)))+pow*(1/(1+exp(beta2*qob2)))+pow*(1/(1+exp(beta3*qob3)));
Dobj0=QQ1*(po)+QQ1*10*(y0(3)-Ptsp)^2; %objective function for economic tracking
XY0=[xy(end,1:nus)';xy(end,nus+1);xy(end,nus+2:end)'];
XYD0=[Ac*(xy(end,1:nus)'-X_S)+Bc*(p(:,i+1)-u_lin)+derx_S;Dobj0;zeros(size(y0))'];
end
end
J=xy(end,nus+1);
q=Xp(end,1:nus)';
qe=Yp(end,1:nuo)';
end