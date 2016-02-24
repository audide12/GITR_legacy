%input file for GITR0.0

% Number of threads to run on 
nThreads = 2;

% Volume definition

xMinV =-0.02;
xMaxV =+0.02;

% Surface definition

yMin = -0.02;
yMax = 0.02;

zMin = -0.02;
zMax = 0.02;

% Surface grid

nY = 100;
nZ = 100;

% Volume grid
nXv = 100;
nYv = 100;
nZv = 100;

% Constant E field value - only used when EfieldInterpolator_number = 0
Efield_in = [1e2 0 0];

Bx_in = 0.00;
By_in = 0.00;
Bz_in = -2.0;

% Background species info

background_Z = [-1 1];
background_amu = [ME/MI 2];
background_flow = [0.9 0.9];%Fraction of thermal velocity - only used when FlowVelocityInterpolator_number = 0

% Density
maxDensity = [1e19 1e19];
densitySOLDecayLength =1e4;
maxTemp_eV = [20 20];
tempSOLDecayLength = 1e4;
perDiffusionCoeff_in = 0.04;

% Impurity particles 

nP = 16;
sourceStrength = 1e19;

x_start = 0.00;
y_start = 0.00;
z_start = 0.00;

energy_eV_x_start = -10.0;
energy_eV_y_start = 0.0;
energy_eV_z_start = 0.0;

impurity_amu = 184.0;
impurity_Z = 1.0;

densityChargeBins = [0 1];

% Surface parameterization z = dz/dx * x + b

surface_dz_dx = 1.73205;
surface_zIntercept = 0;

%Ionization
file_inz = 'ADAS/scd50_w.dat';
%Recombination
file_rcmb = 'ADAS/acd50_w.dat';
%Emission
file_emission = {'ADAS/w0_400875.m','ADAS/w1_434811.m'};

% Particle time stepping control

nPtsPerGyroOrbit = 1e2;
ionization_nDtPerApply = 10;
collision_nDtPerApply = 10;
nT = 2e3;
sheath_timestep_factor = 1e4;

% Plots

plotInitialSurface = 0;
plot1DProfileSlices = 0;

trackHistory = 1;

% Interpolator Dimensionality Selection

EfieldInterpolator_number = 2;
BfieldInterpolator_number = 0;
FlowVelocityInterpolator_number = 0;

temperatureInterpolator_number = 0;
densityInterpolator_number = 0;
perDiffusionCoefficientInterpolator_number = 0;

% Checks on Monte Carlo Probability and Step Size
ionizationProbabilityTolerance = 0.5;
velocityChangeTolerance = 1e-2; % Fraction of previous speed
positionStepTolerance = 1e-3;

connectionLength = 50;

% Output options
printProfiles = 1;
