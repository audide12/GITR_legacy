clear all
close all

Ti0=linspace(1,1300,121);
m=12;
fcond = 0.1;
k0e=2000;
ne = 1e20;

phi_in = 1.73e23;
vTh = sqrt(Ti0*1.602e-19./m./1.66e-27);
tau_s = m*Ti0.*(Ti0/2).^0.5./(6.8e4*(1+2/m)*ne/1e18*(4^2)*15);
vdiff = vTh.*vTh.*tau_s./.15;
cs = sqrt((2*1.602e-19*Ti0)/2/1.66e-27);
vB = -0.1*sqrt((2*1.602e-19*Ti0)/2/1.66e-27);
mz=12;
mi=2;
Z=4;

mu = mz/(mz+mi);
Beta_i = 3*(mu+5*sqrt(2)*Z^2*(1.1*mu^(5/2) - 0.35*mu^(3/2)) - 1)/(2.6-2*mu + 5.4*mu^2)
s=sinj;
fcond=0.1;
gamma=7;
n0=1e20;
mz=12;
mD=2
cs0=sqrt(2*Ti0*1.602e-19/mD/1.66e-27);
P=gamma*n0*cs0.*Ti0.*1.602e-19;
a = 7/2*fcond*P/k0e./Ti0.^(7/2);
dTids = Ti0.*(2*a./7./(a*s+1).^(5/7));
% dTids = 1.602e-19*(Ti0).^2.*fcond.*7.*ne.*cs./(1+7/2*fcond.*7.*ne.*cs./k0e./(Ti0).^(5/2)).^(5/7);
vTi = 1.602e-19/1.66e-27/m*Beta_i*tau_s.*dTids;
vpl = vdiff - vB - vTi;
figure(1)
plot(Ti0,phi_in./vTh,'lineWidth',2)
hold on
plot(Ti0,phi_in./vpl,'lineWidth',2)
title('Case B Peak Impurity Density')
xlabel('T_{i0} [eV]')
ylabel('n_p [10^{20} m^{-3}]')
axis([0 150 0 1e20])
set(gca,'fontsize',16)
legend('\phi_{in}/v_{prompt loss}','\phi_{in}/v_{thermal}')
np=phi_in./vpl;



fcond=0.1;
gamma=7;
n0=1e20;
mz=12;
mD=2
cs0=sqrt(2*Ti0*1.602e-19/mD/1.66e-27);
P=gamma*n0*cs0.*Ti0.*1.602e-19;
k0e=2000;
s = 1.2;
sinj=0.15;
sv=1.2;


FFf = mz*1.66e-27*(0.1*cs0)./Ti0./1.602e-19./tau_s.*(sv-sinj);
Ts_sv = Ti0.*(1+7/2*fcond*P*sv/k0e./Ti0.^(7/2)).^(2/7);
Ts_sinj = Ti0.*(1+7/2*fcond*P*sinj/k0e./Ti0.^(7/2)).^(2/7);
FiGf = (Beta_i-1)*log(Ts_sv/Ts_sinj);
nz_np = exp(-FFf+FiGf);
figure(2)
semilogy(1./(Ti0.^2)*1e4,nz_np.*np.*vTi./1.73e23)
% semilogy(1./(Ti0.^2)*1e4,exp(-40000./(Ti0.^2)))
axis([0 3.5 1e-5 1e-2])
% Mi = .1;
% fcond = .1;
% ne=1e20;
% sinj=0.15;
% sv=1.2;
% delta_s = sv-sinj;
% Ti0=linspace(10,130,100);
% tau_s = m*Ti0.*(Ti0/2).^0.5./(6.8e4*(1+2/m)*ne/1e18*(4^2)*15);
% cs = sqrt((2*1.602e-19*Ti0)/2/1.66e-27);
% lambda_par = 1.602e-19*Ti0.*tau_s/mz/1.66e-27./(cs);
% 
% nz_np = exp(-Mi*delta_s./lambda_par.*(1-0.1*fcond/Mi));
% figure(2)
% semilogy(1./(Ti0.^2)*1e4,nz_np)
% % semilogy(1./(Ti0.^2)*1e4,exp(-40000./(Ti0.^2)))
% axis([0 3.5 1e-5 1])
% 
% FFf = mz*1.66e-27*(0.1*vTh)./Ti0./1.602e-19./tau_s.*(sv-sinj);
% FiGf = (Beta_i-1)*log(1);