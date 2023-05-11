% Definire la deviazione standard dei dati casuali generati per accelerazione e angoli di Eulero
accel_stddev = 0.1; % in m/s^2
euler_stddev = 2; % in gradi

filename = 'LOG_8.CVS';
filepath = 'C:\Users\samue\OneDrive - unige.it\Desktop\Matlab\data\Test-lavatrice\';

% Caricare il file CSV come una matrice
data = readtable("C:\Users\samue\OneDrive - unige.it\Desktop\Matlab\data\Test-lavatrice\IMU_0.CSV");
dati_csv1 = data(:, 1:4); % time, x, y z
var2 = smoothdata(dati_csv1.x,"loess",100)
var3 = smoothdata(dati_csv1.y,"loess",100)
var4 = smoothdata(dati_csv1.z,"loess",100)


% Generare casualmente 100 dati di accelerazione (x, y, z)
acceleration = [normrnd(0, accel_stddev, 100, 1),...
                normrnd(0, accel_stddev, 100, 1),...
                normrnd(9.81, accel_stddev, 100, 1)];

% Generare casualmente 100 dati di angoli di Eulero (roll, pitch, yaw)
euler_angles = [normrnd(0, euler_stddev, 100, 1),...
                normrnd(0, euler_stddev, 100, 1),...
                normrnd(0, euler_stddev, 100, 1)];

z = linspace(0,4*pi,500);
x = 2*cos(z) + rand(1,500);
y = 2*sin(z) + rand(1,500);
% Creare un grafico di dispersione 3D dell'accelerazione
figure();
%scatter3(x, y, z, 'filled');
hold on
plot(dati_csv1.time, dati_csv1.x)
plot(dati_csv1.time, dati_csv1.y)
plot(dati_csv1.time, dati_csv1.z, "g")
figure();
scatter3(dati_csv1.x, dati_csv1.y, dati_csv1.z, '*');
figure();
scatter3(var2, var3, var4, '*');
hold off

xlabel('X Acceleration (m/s^2)');
ylabel('Y Acceleration (m/s^2)');
zlabel('Z Acceleration (m/s^2)');
title('Accelerometer Data');

