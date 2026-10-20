model Mainlink1
// med function
function median
  input Real a;
  input Real b;
  input Real c;
  input Real be;
  output Real med;
algorithm
med:= a+b+c-((a)/(1+exp(be*(b-a)))+(b)/(1+exp(-be*(b-a))))/(1+exp(be*(c-(a)/(1+exp(be*(b-a)))+(b)/(1+exp(-be*(b-a))))))+(c)/(1+exp(-be*(c-(a)/(1+exp(be*(b-a)))+(b)/(1+exp(-be*(b-a))))))-((a)/(1+exp(-be*(b-a)))+(b)/(1+exp(be*(b-a))))/(1+exp(-be*(c-(a)/(1+exp(-be*(b-a)))+(b)/(1+exp(be*(b-a))))))+(c)/(1+exp(be*(c-(a)/(1+exp(-be*(b-a)))+(b)/(1+exp(be*(b-a))))));
end median;
// Liquid heat capacity CH4 (kJ/kmolK)
function cplch4
  input Real a;
  output Real b;
algorithm
  b := (0.0002*a^2-0.0276*a+4.5057)*16;
end cplch4;
// Liquid heat capacity C2H6 (kJ/kmolK)
function cplc2h6
  input Real a;
  output Real b;
algorithm
  b := (5e-5*a^2-0.0095*a+2.5662)*30;
end cplc2h6;
// Liquid heat capacity C3H8 (kJ/kmolK)
function cplc3h8
  input Real a;
  output Real b;
algorithm
  b := (2e-5*a^2-0.027*a+1.6027)*44;
end cplc3h8;
// Liquid heat capacity C4H10 (kJ/kmolK)
function cplc4h10
  input Real a;
  output Real b;
algorithm
  b := (2e-5*a^2-0.001*a+1.2226)*58;
end cplc4h10;
// Liquid heat capacity N2 (kJ/kmolK)
function cplN2
  input Real a;
  output Real b;
algorithm
  b := (0.0003*a^2-0.0326*a+2.7443)*28;
end cplN2;
// Vapor heat capacity CH4 (kJ/kmolK)
function cpvch4
  input Real a;
  output Real b;
algorithm
  b := (3e-5*a^2-0.0093*a+2.7887)*16;
end cpvch4;
// Vapor heat capacity C2H6 (kJ/kmolK)
function cpvc2h6
  input Real a;
  output Real b;
algorithm
  b := (7e-5*a^2-0.0001*a+1.1903)*30;
end cpvc2h6;
// Vapor heat capacity C3H8 (kJ/kmolK)
function cpvc3h8
  input Real a;
  output Real b;
algorithm
  b := (5e-7*a^2+0.004*a+0.4852)*44;
end cpvc3h8;
// Vapor heat capacity C4H10 (kJ/kmolK)
function cpvc4h10
  input Real a;
  output Real b;
algorithm
  b := (1e-7*a^2+0.0046*a+0.3087)*58;
end cpvc4h10;
// Vapor heat capacity N2 (kJ/kmolK)
function cpvN2
  input Real a;
  output Real b;
algorithm
  b := (4e-6*a^2-0.001*a+1.0875)*28;
end cpvN2;
// Liquid density CH4 (kmol/m3)
function rhlch4
  input Real a;
  output Real b;
algorithm
  b := (-0.004*a^2-0.6027*a+540.39)/16;
end rhlch4;
// Liquid density C2H6 (kmol/m3)
function rhlc2h6
  input Real a;
  output Real b;
algorithm
  b := (-0.0012*a^2-0.7929*a+733.03)/30;
end rhlc2h6;
// Liquid density C3H8 (kmol/m3)
function rhlc3h8
  input Real a;
  output Real b;
algorithm
  b := (-0.0002*a^2-0.905*a+807.47)/44;
end rhlc3h8;
// Liquid density C4H10 (kmol/m3)
function rhlc4h10
  input Real a;
  output Real b;
algorithm
  b := (-0.0028*a^2-0.2646*a+804.11)/58;
end rhlc4h10;
// Liquid density N2 (kmol/m3)
function rhlN2
  input Real a;
  output Real b;
algorithm
  b := (-0.0167*a^2-1.9275*a+1054.2)/28;
end rhlN2;
// Liquid enthalpy CH4(kJ/kmol)
function hlch4
  input Real a;
  output Real b;
algorithm
  b := (0.0062*a^2+2.1323*a-5893.5)*16;
end hlch4;
// Liquid enthalpy C2H6(kJ/kmol)
function hlc2h6
  input Real a;
  output Real b;
algorithm
  b := (-0.0004*a^2+2.1947*a-3885.2)*30;
end hlc2h6;
// Liquid enthalpy C3H8(kJ/kmol)
function hlc3h8
  input Real a;
  output Real b;
algorithm
  b := (0.0021*a^2+1.1517*a-3264.1)*44;
end hlc3h8;
// Liquid enthalpy C4H10(kJ/kmol)
function hlc4h10
  input Real a;
  output Real b;
algorithm
  b := (0.0034*a^2+0.6249*a-3110.6)*58;
end hlc4h10;
// Liquid enthalpy N2(kJ/kmol)
function hlN2
  input Real a;
  output Real b;
algorithm
  b := (0.004*a^2+1.2852*a-548.85)*28;
end hlN2;
// Vapor enthalpy CH4(kJ/kmol)
function hvch4
  input Real a;
  output Real b;
algorithm
  b := (-0.01*a^2+4.4875*a-5443.8)*16;
end hvch4;
// Vapor enthalpy C2H6(kJ/kmol)
function hvc2h6
  input Real a;
  output Real b;
algorithm
  b := (-0.0016*a^2+2.0257*a-3319)*30;
end hvc2h6;
// Vapor enthalpy C3H8(kJ/kmol)
function hvc3h8
  input Real a;
  output Real b;
algorithm
  b := (1.5038*a-2811.7)*44;
end hvc3h8;
// Vapor enthalpy C4H10(kJ/kmol)
function hvc4h10
  input Real a;
  output Real b;
algorithm
  b := (1.5956*a-2795.2)*58;
end hvc4h10;
// Vapor enthalpy N2(kJ/kmol)
function hvN2
  input Real a;
  output Real b;
algorithm
  b := (-0.0005*a^2+1.1287*a-311.89)*28;
end hvN2;
//tank diameter (m)
parameter Real D = 43.3;
parameter Real pi = 3.14;
//Gas constant value (m3*bar/kmol.K)
parameter Real R = 0.0831434;
// height of LNG tank (m)
parameter Real Ht = 30;
// ambient temperature(k)
parameter Real Ta = 308.15;
// Molecular weight of CH4 / C2H6 / C3H8 / C4H10 / N2
parameter Real [5] mw={16,30,44,58,28};
// Wagner equation constant
parameter Real [5] a={-6.02327,-6.46829,-4.7478,-6.89609,-6.13812};
parameter Real [5] b={1.26769,1.3949,1.49121,1.53762,1.30179};
parameter Real [5] c={-0.57154,-1.13072,-1.47048,-1.72907,-0.81564};
parameter Real [5] d={-1.36722,-1.86605,-2.34287,-2.56103,-1.71325};
// Critical property and acentric factor
parameter Real [5] pc={46,48.8,42.5,36.5,33.9}; // bar
parameter Real [5] tc={190.4,305.4,369.8,408.2,126.2}; // kelvin
parameter Real [5] w={0.011,0.099,0.153,0.183,0.039};
// valve coefficent (kmol/s)
parameter Real     cv=0.04;
// valve modification
parameter Real     ck=0.98;
parameter Real     kb=1e-6;
// tank outlet pressure (bara)
parameter Real     po=1;
// destination pressure (bara)
 parameter Real pd=80;
// Ideal gas specific heat of CH4 / C2H6 / C3H8 / C4H10 / N2 (From hysys)
parameter Real [5]    K={1.33,1.29,1.25,1.21,1.41};
// Kinematic viscosity of LNG [m2/s]
parameter Real v=5.083e-7;
// Thermal conductivity of LNG (kW/mk)
parameter Real kt=2.02e-4;
// Acceleration gravity (m/s2)
parameter Real g=9.81;
// Auxilary varaibles for initail conditions
parameter Real ml_In=0;
parameter Real mu_In=0;
parameter Real mv_In=0;
parameter Real xl1_In=0;
parameter Real xl2_In=0;
parameter Real xl3_In=0;
parameter Real xl4_In=0;
parameter Real xu1_In=0;
parameter Real xu2_In=0;
parameter Real xu3_In=0;
parameter Real xu4_In=1;
parameter Real y1_In=0;
parameter Real y2_In=1;
parameter Real y3_In=0;
parameter Real y4_In=0;
parameter Real Tl_In=0;
parameter Real Tv_In=0;
parameter Real Tu_In=0;
parameter Real powt_In=1;
// Scaled BOG (kg/s);
output Real mbtsc;
// Scaled tank pressure (pas)
output Real Tz;
// Scaled upper layer temperature (kelvin)
output Real Tusc;
// Scaled lower layer temperature (kelvin)
Real Tlsc; 
// Scaled vapor temperature (kelvin)
output Real Tvsc; 
// Valve opening;
input Real op ;
//BOG (kmol/s);
Real mb;
//BOG (ton/hr);
Real mbt;
// Evaporation(kmol/s)
Real me;
// Evaporation(ton/hr)
Real met;
// Upper layer liquid mass fraction
  Real[5] xu; 
// Lower layer liquid mass fraction
Real[5] xl; 
// Film liquid mass fraction
Real[5] xf; 
// Vapor mass fraction
Real[5] y; 
// Vapor flim mass fraction 
Real[5] ys;
// Vapor-liquid equilibrium in the tank
Real [5] k;
// rate of heat leak into the vapor (kw)
Real Qv; 
// rate of heat leak into the upper liquid (kw)
Real Qu; 
// rate of heat leak into the lower liquid (kw)
Real Ql; 
// Vapor height (m)
Real Hva;
// Upper liquid layer height (m)
Real Hui;
// Upper liquid layer height (m)
Real Hli;
// Vapor density (kmol/m3)
Real rhov; 
// Vapor molecular weight(kg/kmol) 
Real mwv;
// Upper liquid molecular weight(kg/kmol) 
Real mwu;
// Lower liquid molecular weight(kg/kmol) 
Real mwl;
// Film liquid molecular weight(kg/kmol) 
Real mwf;
// Saturated temperature (k)
Real ts (start=112);
// Auxilary varaibles
Real[5] tf;
// Normal flow rate
Real Nor;
// Chock flow rate
Real Chock;
// Critical pressure for chock flow (bar)
Real Pc;
// Average of Ideal gas specific heat
Real Kavr; 
// Lower liquid temperature (k)
Real Tl; 
// Upper liquid temperature (k)
Real Tu; 
// Vpaor temperature (k)
Real Tv; 
// Lower Liquid hold up(kmol)
Real ml; 
// Upper Liquid hold up(kmol)
Real mu; 
// Vapor hold up(kmol)
Real mv; 
//parameter of tank cross section area (m2)
Real Acs ;
//parameter of side area vapor(m2)
Real Asv ;
//parameter of side area upper liquid (m2) 
Real Asu ;
//parameter of side area lower liquid (m2)
Real Asl ;
// thermal equilibrium between liquid- and vapour-phases(w/m2*k)
Real hl ;
// recirculation flow (kmol/s) 
Real mr ;
// density of the upper liquid (kmol/m3)
Real rhou ;
// density of the film liquid (kmol/m3) 
Real rhof (start=26) ;
// density of the average film and upper layer liquid (kmol/m3) 
Real rhofu ;
// Heat capacity upper liquid (kJ/kmol*k)  
Real Cpu ;
// Average Heat capacity upper liquid (kJ/kmol*k) 
Real Cpla ;
// Average Heat capacity lower liquid (kJ/kmol*k) 
Real Cpva ;
// Average Heat capacity lower liquid (kJ/kmol*k)  
Real Cpvas ;
// Average Heat capacity film liquid (kJ/kmol*k)
Real Cpf ;
// Thermal diffusivity (m2/s) 
Real alpha ;
// specific enthalpy of the upper layer liquid (kj/kmol) 
Real Hu ;
// specific enthalpy of the layer film vapor (kj/kmol)
Real Hfv;
// specific enthalpy of the layer film liquid (kj/kmol)  
Real Hfl;
// specific enthalpy of the vapor (kj/kmol)  
Real Hv ;
// specific enthalpy of the lower layer liquid (kj/kmol) 
Real Hl ;
// mass transfer between the two liquid layers (kmol/m2s)  
Real kapa ;
// density difference between the upper layer liquid and lower layer liquid (kmol/m3) 
Real drhoul ;
// average density of the upper layer liquid and lower layer liquid (kmol/m3)  
Real rhoul ;
// heat transfer rate from the vapor to upper layer liquid (kw)  
Real Qvu ;
// heat transfer rate from the upper layer liquid to lower layer liquid(kw)  
Real Qul ;
// lower Liquid denity (kmol/m3) 
Real rhola;
// heat-transfer resistance through the tank roof (kw/m2k)
Real Utop ;
// heat-transfer resistance between two layers (kw/m2k)
Real Usi;
// heat-transfer resistance through the bottom (kw/m2k) 
Real Ubo;
// Average top temperature (k) 
Real Tau;
// Average bottom temperature (k)
Real Tab;
// Average side temperature (k)
Real Tas;
Real mlsc;
Real musc;
Real mvsc;
Real MC;
Real powt;
Real powtsc;
Real pow;
Real [4] xlsc;
Real [4] xusc;
Real [4] ysc;
initial equation
mlsc=ml_In;
musc=mu_In;
mvsc=mv_In;
xlsc[1]=xl1_In; xlsc[2]=xl2_In; xlsc[3]=xl3_In; xlsc[4]=xl4_In; 
xusc[1]=xu1_In; xusc[2]=xu2_In; xusc[3]=xu3_In; xusc[4]=xu4_In; 
ysc[1]=y1_In; ysc[2]=y2_In; ysc[3]=y3_In; ysc[4]=y4_In; 
Tusc=Tu_In;
Tlsc=Tl_In;
Tvsc=Tv_In;
powtsc=powt_In;
equation
// scale
mlsc=ml/(10^4);
musc=mu/(10^4);
mvsc=mv/(10^1);
Tlsc=Tl/(10^1);
Tusc=Tu/(10^1);
powtsc=powt/(10^5);
Tvsc=Tv/(10^1);
mbtsc=mbt/(1);
xlsc[1:4]=xl[1:4].*{10^2,10^3,10^4,10^5};
xusc[1:4]=xu[1:4].*{10^2,10^3,10^4,10^5};
ysc[1:4]=y[1:4].*{10^2,10^6,10^8,10^10};
// Average phisical property
Cpu=cplch4(Tu).*xu[1]+cplc2h6(Tu).*xu[2]+cplc3h8(Tu).*xu[3]+cplc4h10(Tu).*xu[4]+cplN2(Tu).*xu[5];
Cpla=cplch4(Tl).*xl[1]+cplc2h6(Tl).*xl[2]+cplc3h8(Tl).*xl[3]+cplc4h10(Tl).*xl[4]+cplN2(Tl).*xl[5];
Cpf=cplch4(ts).*xf[1]+cplc2h6(ts).*xf[2]+cplc3h8(ts).*xf[3]+cplc4h10(ts).*xf[4]+cplN2(ts).*xf[5];
Cpva=cpvch4(Tv).*y[1]+cpvc2h6(Tv).*y[2]+cpvc3h8(Tv).*y[3]+cpvc4h10(Tv).*y[4]+cpvN2(Tv).*y[5];
Cpvas=cpvch4(ts).*ys[1]+cpvc2h6(ts).*ys[2]+cpvc3h8(ts).*ys[3]+cpvc4h10(ts).*ys[4]+cpvN2(ts).*ys[5];
rhou=rhlch4(Tu).*xu[1]+rhlc2h6(Tu).*xu[2]+rhlc3h8(Tu).*xu[3]+rhlc4h10(Tu).*xu[4]+rhlN2(Tu).*xu[5];
rhola=rhlch4(Tl).*xl[1]+rhlc2h6(Tl).*xl[2]+rhlc3h8(Tl).*xl[3]+rhlc4h10(Tl).*xl[4]+rhlN2(Tl).*xl[5];
rhof=rhlch4(ts).*xf[1]+rhlc2h6(ts).*xf[2]+rhlc3h8(ts).*xf[3]+rhlc4h10(ts).*xf[4]+rhlN2(ts).*xf[5];
Hu=abs(hlch4(Tu).*xu[1]+hlc2h6(Tu).*xu[2]+hlc3h8(Tu).*xu[3]+hlc4h10(Tu).*xu[4]+hlN2(Tu).*xu[5]);
Hl=abs(hlch4(Tl).*xl[1]+hlc2h6(Tl).*xl[2]+hlc3h8(Tl).*xl[3]+hlc4h10(Tl).*xl[4]+hlN2(Tl).*xl[5]);
Hfv=abs(hvch4(ts).*ys[1]+hvc2h6(ts).*ys[2]+hvc3h8(ts).*ys[3]+hvc4h10(ts).*ys[4]+hvN2(ts).*ys[5]);
Hfl=abs(hlch4(ts).*xf[1]+hlc2h6(ts).*xf[2]+hlc3h8(ts).*xf[3]+hlc4h10(ts).*xf[4]+hlN2(ts).*xf[5]);
Hv=abs(hvch4(Tv).*y[1]+hvc2h6(Tv).*y[2]+hvc3h8(Tv).*y[3]+hvc4h10(Tv).*y[4]+hvN2(Tv).*y[5]);
//Differential Equations:
// 1. Mass Balance:
der(mlsc)*(10^4)=0;
der(musc)*(10^4)=-me;
der(mvsc)*(10^1)=-mb+me;
mlsc*(10^4)*der(xlsc[1:4]./{10^2,10^3,10^4,10^5}) = kapa*Acs*(xusc[1:4]./{10^2,10^3,10^4,10^5}-xlsc[1:4]./{10^2,10^3,10^4,10^5});
musc*(10^4)* der(xusc[1:4]./{10^2,10^3,10^4,10^5}) = -(me+mr)*xu[1:4]+mr*xf[1:4]-kapa*Acs*(xusc[1:4]./{10^2,10^3,10^4,10^5}-xlsc[1:4]./{10^2,10^3,10^4,10^5});
mvsc*(10^1)*der(ysc[1:4]./{10^2,10^6,10^8,10^10}) = me*ys[1:4]-mb*ysc[1:4]./{10^2,10^6,10^8,10^10};   
// 2. Energy Balance:
Cpla*ml*(10^1)*der(Tlsc)=Ql-Qul;
Cpva*mv*(10^1)*der(Tvsc)=Qv-Qvu+me*Hfv-mb*Hv;
Cpu*mu*(10^1)*der(Tusc)=Qu-(me+mr)*Hu+mr*Hfl+Qvu+Qul;
//Algebraic Equations:
Acs=(pi/4)*(D^2);
Asv=pi*D*Hva;
Asu=pi*D*Hui;
Asl=pi*D*Hli;
rhofu=(rhof+rhou)/2;
mr=0.3276*((kt*Acs)/Cpu)*(g*(rhof-rhou)/(rhofu*alpha*v))/((abs(g*(rhof-rhou)/(rhofu*alpha*v)))^(2/3)+10^(-12));
xf[1:4]*mr=mr*xu[1:4]+me*xu[1:4]-me*ys[1:4];
alpha=(kt)/(rhofu*Cpu);
me=((Hu-Hfl)*mr+Qvu)/(Hfv-Hu);
hl=kapa*Cpu;
hl=0.0493*kt*(((g)/((v*v)*rhoul))^(1/3))*(drhoul/((abs(drhoul))^(2/3)+10^(-16)));
drhoul=rhou-rhola;
rhoul=(rhou+rhola)/2;
Kavr=sum(K[1:5].*y[1:5]);
Nor=cv*op*(Tz-po)*(((Tz+po)/2)^0.5)/(sqrt(abs(Tz-po)+kb*Tz));
Pc=Tz*(2/(Kavr+1))^(Kavr/(Kavr-1));
Chock=cv*op*ck*Pc;
sum(xl[1:5])-1=0;
sum(xu[1:5])-1=0;
sum(y[1:5])-1=0;
sum(ys[1:5])-1=0;
sum(xf[1:5])-1=0;
Ql=Asl*Usi*(Ta-Tlsc*(10^1))+Acs*Ubo*(Ta-Tlsc*(10^1));
Qu=Asu*Usi*(Ta-Tusc*(10^1));
Qv=Asv*Usi*(Ta-Tvsc*(10^1))+Acs*Utop*(Ta-Tvsc*(10^1));
Qul=hl*Acs*(Tlsc*(10^1)-Tusc*(10^1));
Qvu=Qv*0.95;
Ht-Hli-Hui-Hva=0;
ml-(Hli*rhola*Acs)=0;
mu-(Hui*rhou*Acs)=0;
mv-(Hva*rhov*Acs)=0;
ys[1:4]=k[1:4].*xf[1:4];
Tz-R*Tv*rhov=0;
mwv=1/sum(y[1:5]./mw[1:5]);
mwu=1/sum(xu[1:5]./mw[1:5]);
mwl=1/sum(xl[1:5]./mw[1:5]);
mwf=1/sum(xf[1:5]./mw[1:5]);
Utop=(8.25e-3+(1.165e-4)*(Tau))/(0.2*1000);
Usi=(8.25e-3+(1.165e-4)*(Tas))/(0.2*1000);
Ubo=(8.25e-3+(1.165e-4)*(Tab))/(0.2*1000);
Tau=(Ta+Tvsc*(10^1))/2;
Tab=(Ta+Tlsc*(10^1))/2;
Tas=(Ta+Tusc*(10^1))/2;
mb=median(Nor,Chock,0,1);
tf[1:5]=(1).-((ts)./tc[1:5]);
  Tz=sum((xu[1:5].*pc[1:5].*(exp((a[1:5].*tf[1:5]+b[1:5].*(tf[1:5].^2)./sqrt(abs(tf[1:5]))     +c[1:5].*(tf[1:5].^3)./sqrt(abs(tf[1:5]))+d[1:5].*(tf[1:5].^5))./((1).-tf[1:5])))));
k[1:5]=(pc[1:5]/(Tz)).*exp((5.37*((1).+w[1:5]).*((1).-tc[1:5]/ts)));
met=3.6*mb*mwv;
mbtsc=mb*60*35.315/rhov;
if  mbtsc<60 then
MC=60*36.74*60*rhov*mwv/35.315;
elseif mbtsc<120 then
MC=120*36.74*60*rhov*mwv/35.315; 
elseif mbtsc<180 then
MC=180*36.74*60*rhov*mwv/35.315;
else
MC=240*36.74*60*rhov*mwv/35.315;
end if;
pow=(6*(Kavr/(Kavr-1))*(1545*1.8*Tv)*((pd/po)^((Kavr-1)/(6*Kavr))-1)/(mwv))*(MC/1000*0.746)/(0.7*33000);
der(powtsc*10^5)=pow;
end Mainlink1;
