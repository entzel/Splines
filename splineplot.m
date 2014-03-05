function [x1,y1] = splineplot(x,y,k)
n=length(x);
coeff = splinecoeff(x,y);
x1=[]; y1=[];
for i=1:n-1
    xs = linspace(x(i), x(i+1),k+1);
    dx = xs-x(i);
    ys = coeff(i,3)*dx;
    ys = (ys + coeff(i,2)).*dx;
    ys = (ys +coeff(i,1)).*dx+y(i);
    x1 = [x1; xs(1:k)'];
    y1=[y1;ys(1:k)'];
end
x1 =[x1; x(end)];
y1=[y1;y(end)];
plot(x,y,'o',x1,y1)

%x= [4.2,1.8,0,1.5,2, 1.5, 1.8,3.59,3,3]
%y = [2.2,0,1.1,4, 3.7,4, 5.8, 5.9 ,4.6, 5.9]
% t = [0 1 2 3 4 5 6 7 8 9 10]
%[u,v] = splineplot(t,x,10)
%[u,g] = splineplot(t, y,10)
%plot(v,g)