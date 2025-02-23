%%%一元函数逼近%%%%
clear,clc;
x=linspace( -4, 4,100);
%神经网络输入值
t=1.1*(1-x+2*x.^2).*exp((-x.^2)./2);  %t=10*x-30*sin(x) -80*tansig(x); %神经网络目标值
plot(x,t, '+'); %待逼近的函数图像
title('待逼近的函数图像' );
hold on
net=newrb(x,t,1,2); %平方和误差小于1
y=net(x) ;%神经网络输出值
plot(x,y,'g'); %仿真的函数图像
title('RBF神经网络函数逼近' );
x1abel( '输入值');
ylabel('目标值/输出值');
mse(y,t) %平方和误差
