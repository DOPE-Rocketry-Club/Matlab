% Definire la deviazione standard dei dati casuali generati per accelerazione e angoli di Eulero
accel_stddev = 0.1; % in m/s^2
euler_stddev = 2; % in gradi

filename = 'nome_file_dati.csv';
filepath = 'percorso/del/file/';

% Caricare il file CSV come una matrice
data = readtable([filepath filename]);
dati_csv1 = data(:, 1:3); % x, y, z
dati_csv2 = data(:, 4:6); % x, y, z


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
scatter3(x, y, z, 'filled');
hold on
scatter3(euler_angles(:,1), euler_angles(:,2), euler_angles(:,3), '*');
hold off
xlabel('X Acceleration (m/s^2)');
ylabel('Y Acceleration (m/s^2)');
zlabel('Z Acceleration (m/s^2)');
title('Accelerometer Data');

