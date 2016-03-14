clear all
clc
clear figure

Fs=44100 ;
x=wavread('malam.wav');
t=0:1/Fs:length(x)/Fs-1/Fs;
subplot(2,3,1)
plot(t,x);
grid on

X=fft(x);
subplot(2,3,2)
plot(abs(X(1:Fs/2)))
axis([0 5000 0 3000])
grid on

%Wn=[2200/(0.5*Fs) 2700/(0.5*Fs)];
Wn=1000/(0.5*Fs);
[B,A]=cheby2(8,50,Wn);
[H,w]=freqz(B,A,200);
%argument=atan2(imag(H),real(H));
subplot(2,3,3)
plot(w*Fs/(2*pi),20*log10(abs(H)))
grid on

%subplot(2,3,4)
%plot(wH,argument);
%axis([0 3.2 -3.14 3.14])
grid on

y=filter(B,A,x);
subplot(2,3,4)
plot(t,y)
grid on

Y=fft(y);
subplot(2,3,5)
plot(abs(Y(1:Fs/2)))

%axis([0 5000 0 3000])
grid on


%y=filter(B,A,x);
%subplot(2,3,6)
%plot(t,y);
%grid on
sound(15*x,Fs)
sound(50*y,Fs)