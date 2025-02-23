clear

clc

k=1;

u=[-0.5:0.05:0.45];

t=0.5.*(1+cos(u));

n=10;

net=newff(minmax(u),[n,1],{'tansig' 'purelin'},'trainlm');

y1=sim(net,u);

plot(u,t,'-',u,y1,'--');

xlabel('时间');

ylabel('函数值');

title('未训练的BP网络逼近效果');

legend('要逼近的函数曲线','未训练的BP网络逼近曲线');

net=newff(minmax(u),[n,1],{'tansig' 'purelin'},'traingdm');

net.trainParam.epochs=1000;

net.trainParam.goal=0.01;

m=[-0.48:0.05:0.47];

net=train(net,m,t);

y2=sim(net,m);

plot(u,t,'-',u,y1,'--',m,y2,'.');

legend('要逼近的函数曲线','未训练的BP网络逼近曲线','训练后的BP网络逼近曲线');

xlabel('时间');

ylabel('函数值');
