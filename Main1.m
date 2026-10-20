tic
close all
clear all
global Ac Bc Cc Dc X_S derx_S Y_S u_lin NC
global NH Ts Xhat nus nuo Yhat Ptsp QQ1 QQ2 nI pu pl mu ml qql qqel q qe ma mb mc pow
Ptsp=[1.06]; % set point pressure mpas
pu=1.19; % upper limit pressure mpas
pl=1.03; % lower limit pressure mpas
mu=240; % User flow rate upper limit CFM
ml=30; % User flow rate lower limit CFM 
ma=60; % compressor flow rate 25% CFM
mb=120; % compressor flow rate 50% CFM 
mc=180; % compressor flow rate 75% CFM  
pow=19; % minimum power requirment kw
QQ1=1; % Optimizer coefficent 1
QQ2=1e-6; % Optimizer coefficent 2
u_pre=0.1; % initial valve opening
import OMMatlab.*
omc = OMMatlab;
omc.ModelicaSystem("Mainlink1.mo","Mainlink1");
omc1 = OMMatlab;
omc1.ModelicaSystem("Mainlink1.mo","Mainlink1");
%%
% Initial Input
I1=0.1; % initial valve opening   
nI= length(I1);  %number of inputs
u_lin=I1;
%% initial states
IC=[11.33;11.24;11.33;68.8027;34.6251;51.5588;0;94.7;44;70;100;96.5;20;100;100;92.0866;34.4874;26.125;17.643];
prn=[5e-4;5e-4;5e-4;0;0;1e-4;0;0;0;0;0;0;0;0;0;0;0;0;0]; % process additive noise
mrn=[0.0001;0.0001;1e-5;0.2]; % measurment additive noise
x0=IC; 
n=length(IC);
%% initial parameter names for initialization
State_names=["Tl_In";"Tu_In";"Tv_In";"ml_In";"mu_In";"mv_In";"powt_In";"xl1_In";"xl2_In";"xl3_In"
    ;"xl4_In";"xu1_In";"xu2_In";"xu3_In";"xu4_In";"y1_In";"y2_In";"y3_In";"y4_In"];
%% Primary initialization for variables
    for j=1:n
   omc.setParameters(State_names(j)+"="+mat2str(x0(j)))
    end
    %% primary simulation to get all variable values at t=0
omc.setSimulationOptions(["startTime="+num2str(0),"stopTime="+num2str(0),"tolerance=1e-6"]);
omc.simulate();
%% Linearize 
    omc.setLinearizationOptions(["startTime="+num2str(0),"stopTime="+num2str(0),"tolerance=1e-6"]);
    Coeff= omc.linearize();
    %% state and output names 
    Linear_states=omc.getLinearStates();
    Linear_outputs=omc.getLinearOutputs();
%% state fields, to summon from result files
State_Fields= [Linear_states];
Output_Fields=[Linear_outputs];
nus= length(State_Fields);  %number of states
nuo= length(Output_Fields); %number of outputs
%% simulation setup data
Ts=7200;   % sample time
Tsim=7200*120;  % simulation span
% pre-specifying Observed outputs
Y= zeros(nuo,1);
% get initial outputs from primary initialzation
for j1=1:length(Output_Fields)
        tmp=cell2mat(omc.getSolutions(Output_Fields(j1)));
        Y(j1)=tmp(1);    %%%% set initial observed outputs
end
Yhat=Y;
ICi=[11.33;11.24;11.33;68.8027;34.6251;51.5588;0;94.7;44;70;100;96.5;20;100;100;92.0866;34.4874;26.125;17.643];
Xhat=ICi;  % initial estimates
Xhat= reshape(Xhat,length(Xhat),1);
%% Primary initialization for variables
    for j=1:n
   omc.setParameters(State_names(j)+"="+mat2str(Xhat(j)))
    end
    %% primary simulation to get all variable values at t=0
omc.setSimulationOptions(["startTime="+num2str(0),"stopTime="+num2str(0),"tolerance=1e-6"]);
omc.simulate();
Y1= zeros(nuo,1);
% get initial outputs from primary initialzation
for j1=1:length(Output_Fields)
        tmp=cell2mat(omc.getSolutions(Output_Fields(j1)));
        Y1(j1)=tmp(1);    %%%% set initial observed outputs
end
Yhat1=Y1;
%% pre-locating discrete input signal
X_ob=[Xhat];
Y_ob=[Yhat];
X_obl=[Xhat];
Y_obl=[Yhat];
X_PR=[Xhat];
Y_PR=[Yhat];
X_PRc=[Xhat];
Y_mu=[mu];
Y_ml=[ml];
Y_pu=[pu];
Y_pl=[pl];
Y_ps=[Ptsp];
T_ob=[0];
X_Real=[x0];
Y_Real=[Yhat1];
T=[0];
%% Noise covariances
Q=1e-3*eye(nus);
R=1.3e-2*eye(nuo);
P0=3*eye(nus);  % initial State covariance matrix
P0(1,1)=P0(1,1)*5;
P0(6,6)=P0(6,6)*10;
P=P0;
Ad_Pr=zeros(nus,nus);
%% initial Linearization around initial u and x
    for j=1:n
omc1.setParameters(State_names(j)+"="+mat2str(x0(j),15))
    end
    % Linearize 
    omc1.setLinearizationOptions(["startTime="+num2str(0),"stopTime="+num2str(0),"tolerance=1e-6"]);
    Coeff= omc1.linearize();
    % Matrices
    Ac=(cell2mat(Coeff(1)));
    Bc=(cell2mat(Coeff(2)));
    Cc=(cell2mat(Coeff(3)));
    Dc=(cell2mat(Coeff(4)));
    % state and output names 
    Linear_states=omc1.getLinearStates();
    Linear_outputs=omc1.getLinearOutputs();
    % get Linearization coefficients
    omc1.setSimulationOptions(["startTime=0","stopTime="+num2str(0),"tolerance=1e-6"]);
    omc1.simulate();
    Y_S=zeros(nuo,1);
    for l=1:1:nuo
    temp=omc1.getSolutions(Output_Fields(l));
    tpY=cell2mat(temp);
    Y_S(l)=tpY(end);
    end
    X_S=zeros(nus,1);
    for l=1:1:nus
    temp=omc1.getSolutions(State_Fields(l));
    tpS=cell2mat(temp);
    X_S(l)=tpS(end);
    end
    derx_S=zeros(nus,1);
    for l=1:1:nus
    temp="der("+string(State_Fields(l))+")";
    temp1=omc1.getSolutions(temp);
    derx=cell2mat(temp1);
    derx_S(l)=derx(end);
    end
%% Set MPC Settings
NH=5;
NC=3;
LB=0*ones(nI*NC,1);
UB=1*ones(nI*NC,1);
U_guess=(LB+UB)/10;
opt_options = optimoptions('fmincon','Algorithm','sqp','ConstraintTolerance',1e-6, ...
    'MaxIterations',500000,'MaxFunctionEvaluations',10000000,'OptimalityTolerance',1e-6,'StepTolerance',1e-6,...
    'FunctionTolerance',1e-6);
qo=0.8; % filter coefficent 
U=I1*ones(nI,ceil(Tsim/Ts)); 
%% do simulation+observation+control:
for i=1:ceil(Tsim/Ts)
Success_flag=ones(1,ceil(Tsim/Ts));
Dicr_Flag=zeros(1,ceil(Tsim/Ts));
  % MPC Optimizer
  tic
   [p,fval,exitflag,output] = fmincon (@objFunc,U_guess,[],[],[],[],LB,UB,@nlcondi,opt_options);
    exitflag;
    output;
    if exitflag<=0  && i==1
         U(:,i)=I1;
    elseif exitflag<=0 && i>=1
        warning("The optimizer failed at ST= "+num2str(i))
        U(:,i)=U(:,i-1);
        Success_flag(i)=0;
         U_guess=(LB+UB)/10;
    end
    if i==1
    U(1,i)=p(1);
    u_pre=U(:,i);
    u_lin=U(:,i);
    u=U(:,i);
    U_guess=p;
    else
%Filter
 U(1,i)=p(1)*qo+U(:,i-1)*(1-qo);
    u_pre=U(:,i)*qo+U(:,i-1)*(1-qo);
    u_lin=U(:,i)*qo+U(:,i-1)*(1-qo);
    u=U(:,i)*qo+U(:,i-1)*(1-qo);
    end
    if exitflag>0
 U_guess=p;
    end
    %% initialize the plant model
for j=1:n
omc.setParameters(State_names(j)+"="+mat2str(x0(j)))
end
    for j=1:n
%         omc.setParameters(State_names(j)+"="+mat2str(x0(j)))
omc1.setParameters(State_names(j)+"="+mat2str(Xhat(j)))
    end
%% setting input for omc 
omc.setInputs("op="+mat2str(u_lin(1)));
%% setting input for omc1 
omc1.setInputs("op="+mat2str(u_lin(1)));
%% Linearize 
omc1.setLinearizationOptions(["startTime=0","stopTime="+num2str(0.02),"tolerance=1e-6"]);
    Coeff= omc1.linearize();
    %% Matrices
    Ac=(cell2mat(Coeff(1)));
    Bc=(cell2mat(Coeff(2)));
    Cc=(cell2mat(Coeff(3)));
    Dc=(cell2mat(Coeff(4)));
    %% Discrete derivative
    Ad=expm(Ac*Ts);
      %% get Linearization coefficients
    omc.setSimulationOptions(["startTime=0","stopTime="+num2str(0.02),"tolerance=1e-6"]);
    omc.simulate();
    Y_S=zeros(nuo,1);
    for l=1:1:nuo
    temp=omc.getSolutions(Output_Fields(l));
    tpY=cell2mat(temp);
    Y_S(l)=tpY(end);
    end
    X_S=zeros(nus,1);
    for l=1:1:nus
    temp=omc.getSolutions(State_Fields(l));
    tpS=cell2mat(temp);
    X_S(l)=tpS(end);
    end
    derx_S=zeros(nus,1);
    for l=1:1:nus
    temp="der("+string(State_Fields(l))+")";
    %der_Fields(l)=temp;
    temp1=omc.getSolutions(temp);
    derx=cell2mat(temp1);
    derx_S(l)=derx(end);
    end
     %% move plant model to the new ST
    omc.setSimulationOptions(["startTime="+num2str((i-1)*Ts),"stopTime="+num2str((i)*Ts),"tolerance=1e-6"]);
    omc.simulate();
%get States  @ new ST
    for j=1:nus
    tmp1=cell2mat(omc.getSolutions(State_Fields(j)));
    tmp2(j)=tmp1(end);
    end
rr=prn.*randn(nus,1);
pp=mrn.* randn(nuo,1);
 x0=tmp2'+rr;
    Puritydp_en=tmp2(end);  % Puritydp at the end of sample time
    tmp=cell2mat(omc.getSolutions("time"));
    T=[T,tmp(end)];
    %% Measurement
for j1=1:length(Output_Fields)
        tmp=cell2mat(omc.getSolutions(Output_Fields(j1)));
        Y(j1)=tmp(end);    %%%% initial outputs
end
 Y=Y+pp; % adding noise to measurment
 %% Prediction
 xh0=Xhat;
   for j=1:n
    omc1.setParameters(State_names(j)+"="+mat2str(xh0(j),15))
   end
    omc1.setSimulationOptions(["startTime="+num2str((i-1)*Ts),"stopTime="+num2str((i)*Ts),"tolerance=1e-12"]);
    omc1.simulate();
    tmp4=zeros(nus,1);
    for j=1:nus
    tmp3=cell2mat(omc1.getSolutions(State_Fields(j)));
    tmp4(j)=tmp3(end);
    end
    X_pred= tmp4;
    frr=Ad*P*Ad';
 P_pred=Ad*P*Ad'+ Q;
    for j=1:n
    omc1.setParameters(State_names(j)+"="+mat2str(X_pred(j),15))
    end
   omc1.setSimulationOptions(["startTime="+num2str((i-1)*Ts),"stopTime="+num2str((i)*Ts),"tolerance=1e-6"]);
    omc1.simulate();
    Y_pred=zeros(nuo,1);
    for j1=1:nuo
        tmp=cell2mat(omc1.getSolutions(Output_Fields(j1)));
        Y_pred(j1)=tmp(end);   
    end
      omc1.setLinearizationOptions(["startTime="+num2str((i-1)*Ts),"stopTime="+num2str((i)*Ts),"tolerance=1e-6"]);
     Coeff= omc1.linearize();
     Cc1=cell2mat(Coeff(3));
%% Correction
S=Cc1*P_pred*Cc1'+R;
ki=Cc1*P_pred*Cc1';
oi=P_pred*Cc1';
K=(P_pred*Cc1')/S;
Xhat= X_pred+K*(Y-Y_pred);
P=P_pred-K*S*K';
    for j=1:n
    omc1.setParameters(State_names(j)+"="+mat2str(Xhat(j),15))
    end
    omc1.setSimulationOptions(["startTime="+num2str((i-1)*Ts),"stopTime="+num2str((i)*Ts),"tolerance=1e-6"]);
    omc1.simulate();
    Yhat=zeros(nuo,1);
    for j1=1:nuo
        tmp=cell2mat(omc1.getSolutions(Output_Fields(j1)));
        Yhat(j1)=tmp(end);   
    end
    u=u_lin;
    exitflag;
X_PR=[X_PR,q];
Y_PR=[Y_PR,qe];
X_ob=[X_ob,Xhat];
Y_ob=[Y_ob,Yhat];
X_obl=[X_obl,qql];
Y_obl=[Y_obl,qqel];
T_ob=[T_ob,i*Ts];
X_Real=[X_Real,x0];
Y_Real=[Y_Real,Y];
Y_mu=[Y_mu,mu];
Y_ml=[Y_ml,ml];
Y_pu=[Y_pu,pu];
Y_pl=[Y_pl,pl];
Y_ps=[Y_ps,Ptsp];
disp("Ending ST=  "+num2str(i))
save("ws_"+num2str(i),'T','T_ob','Y_ob','X_ob','U','Y_Real','X_Real','Dicr_Flag','x0','P','Ts','Tsim')
toc
end
%% ploting
figure(1)
stairs((0:Ts:Tsim)/(60*60),[U(1,:)*100 U(1,end)*100],'LineWidth',1)
set(gca,'fontsize',10)
title('Valve opening','FontSize',12)
xlabel('Time (h)')
ylabel('Op (%)','interpreter','Latex','FontSize',12)
grid on
figure(2)
plot(T/(60*60),Y_Real(4,:),'--',T/(60*60),Y_mu(:,:),T/(60*60),Y_ml(:,:),'LineWidth',1)
set(gca,'fontsize',10)
legend({'Real-Value','Uppwe limit','Lower limit'},'Location','southeastoutside','FontSize',10)
title('Boil off flow rate','FontSize',12)
xlabel('Time (h)')
ylabel('$\dot{m_{out}}(CFM)$ ','interpreter','Latex','FontSize',12)
grid on 
figure(3)
plot(T/(60*60),Y_Real(3,:),T/(60*60),Y_pu(:,:),T/(60*60),Y_pl(:,:),'LineWidth',1)
set(gca,'fontsize',10)
legend({'Real-Value',' Set point','Uppwe limit','Lower limit'},'Location','southeastoutside','FontSize',10)
title('Pressure','FontSize',12)
xlabel('Time (h)')
ylabel('${P_t}(bara)$ ','interpreter','Latex','FontSize',12)
grid on 
% saveas(figure(3),'f3.emf')
Sh=(Ts)/(60*60);
Sd=(Tsim)/(60*60);
fprintf('The sample time is %2.1f hours \n',Sh)
fprintf('The simulation span is %2.1f hour \n',Sd)
fprintf('The total power consumption is %1.0f kj \n',X_Real(7,end)*10^5)
save Variables.mat
% load('Variables.mat')
toc