function XXDT = predModelc(t,XY,XYdot,u)
global Ac Bc Cc Dc X_S derx_S Y_S u_lin nus nuo nI pu pl mu ml
u=reshape(u,nI,1);
x=reshape(XY(1:nus),nus,1);
Xdot=reshape(XYdot(1:nus),nus,1);
DFl=XYdot(nuo+nus+1);
DFu=XYdot(nuo+nus+2);
DPl=XYdot(nuo+nus+3);
DPu=XYdot(nuo+nus+4);
y=reshape(XY(nus+1:nuo+nus),nuo,1);
res1=-Xdot+Ac*(x-X_S)+Bc*(u-u_lin)+derx_S;
res2=Cc*(x-X_S)+Dc*(u-u_lin)+Y_S-y;
resml=DFl-(max(0,-(y(4)-ml)))^2;
resmu=DFu-(max(0,(y(4)-mu)))^2;
respl=DPl-(max(0,-(y(3)-pl)))^2;
respu=DPu-(max(0,(y(3)-pu)))^2;
XXDT=[res1;res2;resml;resmu;respl;respu];
end