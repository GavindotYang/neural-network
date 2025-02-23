% the Gaussian function graph
x=0:0.1:10;
sig=[1 2 3];
c=[4 5 6];
y1=gaussmf(x,[sig(1),c(1)]);
plot(x,y1,'b')
% legend('sig=1,center=4')
hold on
y2=gaussmf(x,[sig(2),c(2)]);
plot(x,y2,'y');
% legend('sig=2,center=5')
hold on
y3=gaussmf(x,[sig(3),c(3)]);
plot(x,y3,'r');
legend('sig=1,center=4','sig=2,center=5','sig=3,center=6')
hold on