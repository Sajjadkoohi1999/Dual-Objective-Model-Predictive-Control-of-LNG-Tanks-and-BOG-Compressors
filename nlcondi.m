function [c,ceq] = nlcondi(uinp) 
global Ac Bc Cc Dc X_S derx_S Y_S u_lin Ptsp NH Ts Xhat nus nuo qql qqel QQ1 NC pu pl mu ml y0 Yyp Xp h ff xy
p=[reshape(uinp(1:NC),1,NC)];
p=[p,p(:,end).*ones(1,NH-NC)];
T=[];
Xp=[];
ff=[];
Yyp=[];
c=[];
ceq=[];
h=[];
size_in=size(p);
x0=Xhat;
y0=(Cc*(x0-X_S)+Dc*(p(:,1)-u_lin)+Y_S);
Flimitmin=0;
Flimitmax=0;
Ptmin=0;
Ptmax=0;
XY0=[x0;y0;Flimitmin;Flimitmax;Ptmin;Ptmax];
xd0=Ac*(x0-X_S)+Bc*(p(:,1)-u_lin)+derx_S;
yd0=zeros(size(y0));
DFl0=(max(0,-(y0(4)-ml)))^2;
DFu0=(max(0,(y0(4)-mu)))^2;
DPl0=(max(0,-(y0(3)-pl)))^2;
DPu0=(max(0,(y0(3)-pu)))^2;
XYD0=[xd0;yd0;DFl0;DFu0;DPl0;DPu0];
epsi=1e-5;
%  options = odeset('RelTol',1e-6,'AbsTol',1e-5);
for i=1:size_in(2)
[tt,xy]=ode15i(@(t,XY,XYdot)predModelc(t,XY,XYdot,p(:,i)),[(i-1)*Ts (i)*Ts],XY0,XYD0,[]);
if i==1
T=[T;tt];
Xp=[xy(:,1:nus)];
Yyp=[xy(:,nus+1:nuo+nus)];
end
ff=[ff;xy(:,nus+1:nuo+nus)];
h=[h;xy(:,nuo+nus+1:nuo+nus+4)];
y0=xy(end,nus+1:nuo+nus);
if i<size_in(2)
DFl0=(max(0,-(y0(4)-ml)))^2;
DFu0=(max(0,(y0(4)-mu)))^2;
DPl0=(max(0,-(y0(3)-pl)))^2;
DPu0=(max(0,(y0(3)-pu)))^2;
XY0=[xy(end,1:nus)';xy(end,nus+1:nuo+nus)';xy(end,nuo+nus+1);xy(end,nuo+nus+2);xy(end,nuo+nus+3);xy(end,nuo+nus+4)];
XYD0=[Ac*(xy(end,1:nus)'-X_S)+Bc*(p(:,i+1)-u_lin)+derx_S;zeros(size(y0))';DFl0;DFu0;DPl0;DPu0];
end
end
c(1)=xy(end,nuo+nus+1)-epsi;
c(2)=xy(end,nuo+nus+2)-epsi;
c(3)=xy(end,nuo+nus+3)-epsi;
c(4)=xy(end,nuo+nus+4)-epsi;
ceq=[];
qql=Xp(end,1:nus)';
qqel=Yyp(end,1:nuo)';
end