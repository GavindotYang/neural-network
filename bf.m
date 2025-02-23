clear

clc

k=1;

u=[-0.5:0.05:0.45];

t=0.5.*(1+cos(u));

n=10;

net=newff(minmax(u),[n,1],{'tansig' 'purelin'},'trainlm');

y1=sim(net,u);

plot(u,t,'-',u,y1,'--');

xlabel('Time');

ylabel('Value');

title('The approximation effect of an untrained BP neural network');

legend(' the function to be approximated','The approximation curve of an untrained BP neural network');

net=newff(minmax(u),[n,1],{'tansig' 'purelin'},'traingdm');

net.trainParam.epochs=1000;

net.trainParam.goal=0.01;

m=[-0.48:0.05:0.47];

net=train(net,m,t);

y2=sim(net,m);

plot(u,t,'-',u,y1,'--',m,y2,'.');

legend('The curve of the function to be approximated','The approximation curve of a trained BP neural network','The approximation curve of a trained BP neural network.');

xlabel('Time');

ylabel('Value');
