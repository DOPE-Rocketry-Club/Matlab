%File dati
filename = 'IMU_0.CSV';
filepath = 'C:\Users\samue\OneDrive - unige.it\Desktop\Matlab\data\Test-lavatrice\';

% Caricare il file CSV come una matrice
data = readtable([filepath,filename]);
dati_csv1 = data(:, 1:4); % time, x, y z

%Dati con smooth
var2 = smoothdata(dati_csv1.x,"loess",100)
var3 = smoothdata(dati_csv1.y,"loess",100)
var4 = smoothdata(dati_csv1.z,"loess",100)


%Grafico 1
hold on
plot(dati_csv1.time, dati_csv1.x)
plot(dati_csv1.time, dati_csv1.y)
plot(dati_csv1.time, dati_csv1.z, "g")
xlabel("Tempo");
ylabel("X, Y, Z gradi");
figure();


%Grafico 2
scatter3(var2, var3, var4, '*');
xlabel('X Gradi');
ylabel('Y Gradi');
zlabel('Z Gradi');
title('Accelerometer Data');
hold off
