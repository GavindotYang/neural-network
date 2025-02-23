%%%Univariate function approximation%%%%
clear,clc;
x=linspace( -4, 4,100);
%Neural network input values
t=1.1*(1-x+2*x.^2).*exp((-x.^2)./2);  %t=10*x-30*sin(x) -80*tansig(x); %Neural network target values
plot(x,t, '+'); %the function to be approximated
title('the function to be approximated' );
hold on
net=newrb(x,t,1,2); %The sum of squared errors is less than 1
y=net(x) ;%Neural network output
plot(x,y,'g'); %the simulated function
title('RBF neural network function approximation' );
x1abel( 'Inֵput');
ylabel('Output/Target');
mse(y,t) %SSE 
