x=-10:.1:10;
y=atan(x);
z=atan2(y,x);
k=tan(x);


figure %atan
plot(x,y);
grid on;

figure %atan2
plot(z);
grid on;

figure %tan
plot(x,k);
grid on;
