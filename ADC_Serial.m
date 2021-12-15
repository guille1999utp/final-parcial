function ADC_Serial(muestras)
Temp = 0; %%se inicia la temperatura en 0
delete(instrfind({'port'},{'COM4'}));%%se elimina el puerto a utilizar 
s = serial('COM4');%%se llama el puerto
s.BaudRate = 9600;%%le asignamos el serial
fopen(s);%%arrancamos con el puerto
contador = 1;%%cuenta numero de muestras
figure('Name', 'Grafica Temperatura' );
title('Grafica temperatura adc_serial');
xlabel('numero de muestras');
ylabel('temperatura en C');
grid on;
hold on;

while contador <= muestras
ylim([0 100]);%%limite maximo temperatura en el eje y
xlim([0 muestras]);%%limite maximo temperatura en el eje x
out = fscanf(s, '%d');%%se llama los datos en el com1 que arroja el arduino simulado
Temp(contador)= out(1);%%se va organizando y guardando los datos optenidos por el arduino
plot(Temp);%%se grafica el temp para mostrarnos los datos en tiempo real
drawnow
contador = contador+1;%%se reinicia el ciclo para obtener el nuevo dato
end
p = polyfit([0:1:muestras-1],Temp,5)%%se haya la ecuacion grado 5
fclose(s);%%se cierra el puerto
delete(s);%%elimina el puerto
clear all
end