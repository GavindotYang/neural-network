clear;
close all;
clc;
k=4;
Tolerance = 0.001;
%生成数据
mu1 = [20 20];
S1 = [10 0; 0 10];
data1 = mvnrnd(mu1, S1, 100);
mu2 = [80 80];
S2=[20 0;0 30];
data2 = mvnrnd(mu2, S2, 200);
mu3=[20 80];
S3 = [20 0;0 10];
data3 = mvnrnd(mu3, S3, 100);
mu4 = [80 20];
S4=[20 0;0 10];
data4 = mvnrnd(mu4, S4, 100);
data =[data1;data2;data3;data4];


%%画出原始数据
figure(1);
plot(data(:,1),data(:,2),'k.');
grid on
daspect([1 1 1]);
xlabel('x');ylabel('y');
title('原始输入点');
hold on;
%初始聚类结果
temp=randperm(size(data, 1));
for i=1:k
    center(i,:) = data(temp(i),:);
    color(i,:) = [rand(),rand(),rand()];
end
for i= 1: k
  x_dist(1,:) = data(:,1) - center(i,1);
  y_dist(2,:) = data(:,2) - center(i,2);
  distance = sqrt(x_dist(1,:).^2+y_dist(2,:).^2); %欧氏距离
  dist(:,i)=distance';
end

[mindist,cluster] = min(dist,[],2);
err_rec(1) = mean( mindist);
disp(['误差err=',num2str(err_rec(1))]);
figure(2);
for i = 1:k
  index = cluster==i;
  plot(data(index, 1),data(index, 2),'.','Color' ,color(i, :), 'MarkerFaceColor',color(i,:));
  hold on
  plot(center(i,1),center(i,2), 'k*');
end
hold off
grid on
daspect([1 1 1]);
pause(0.1);
iteration = 1;
while(1)
  for i=1:k
    index = cluster==i;
    center(i,:) = mean(data(index,:));
    
    x_dist(1,:) = data(:,1) -center(i,1);
    y_dist(2,:) = data(:,2) -center(i,2);
    distance = sqrt(x_dist(1,:).^2 + y_dist(2,:).^2); %欧氏距离
    dist(:,i) = distance';
  end
  [mindist, cluster] = min(dist, [], 2);
  err_rec(iteration+1) = mean(mindist); 
  
  h = figure(2);
  for i=1:k
    index = cluster==i;
    plot(data(index,1),data(index, 2), '.', 'Color',color(i, :), 'MarkerFaceColor', color(i,:));
    hold on
    plot(center(i,1),center(i,2),'k*');
  end
  title('聚类结果');
  hold off
grid on
daspect([1 1 1]);
pause(0.1); 
drawnow

disp([ '迭代次数ieration= ',num2str(iteration)]);
disp(['误差err=',num2str(err_rec(iteration+1))]);
if iteration > 3 && err_rec(iteration) - err_rec(iteration+1)<Tolerance
    disp('————');
    
    disp( '结束聚类');
    

    break
end
iteration = iteration + 1;
end

figure;
plot(0:iteration,err_rec);
grid on
