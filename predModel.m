function XXDT = predModel(t,XY,XYdot,u)
global Ac Bc Cc Dc X_S derx_S Y_S u_lin nus nuo Ptsp nI QQ1 beta1 beta2 beta3 ma mb mc pow
u=reshape(u,nI,1);
x=reshape(XY(1:nus),nus,1);
Xdot=reshape(XYdot(1:nus),nus,1);
Dobj=XYdot(nus+1);
y=reshape(XY(nus+2:end),nuo,1);
qob1=ma-y(4);
qob2=mb-y(4);
qob3=mc-y(4);
po=pow+pow*(1/(1+exp(beta1*qob1)))+pow*(1/(1+exp(beta2*qob2)))+pow*(1/(1+exp(beta3*qob3)));
res1=-Xdot+Ac*(x-X_S)+Bc*(u-u_lin)+derx_S;
res2=Cc*(x-X_S)+Dc*(u-u_lin)+Y_S-y;
% resd=-Dobj+QQ1*((y(3)-Ptsp)^2);% objective function for set point tracking
resd=-Dobj+QQ1*(po)+QQ1*10*((y(3)-Ptsp)^2);% objective function for economic tracking
XXDT=[res1;resd;res2];
end