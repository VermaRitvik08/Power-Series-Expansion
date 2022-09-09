%Ritvik Verma
%Project 1
%Phase 1
%Approximating f(t) = 12 cos(40t) using truncated sums 
%with up to 6 non-zero terms

clear
clf
format shortG

t = linspace(0,0.2,401);

n = 0:2:10;
a = 12*(-1).^(n/2).*40.^n ./ factorial(n)

%--------------Create plotting functions-------------
%f = 12*cos(40*t);
f1 = a(1)*t.^n(1);
f2 = f1 + a(2)*t.^n(2);
f3 = f2 + a(3)*t.^n(3);
f4 = f3 + a(4)*t.^n(4);
f5 = f4 + a(5)*t.^n(5);
f6 = f5 + a(6)*t.^n(6);

%-------------Plot and label graphs------------------
plot(t,f1,t,f2,t,f3,t,f4,t,f5,t,f6,'LineWidth',2);
ylim([-15 15])
xlabel('time t (s)', 'Fontsize', 20)
ylabel('f(t)', 'FontSize', 20)
title({'Approximating f(t) = 12 cos(40t)',... 
    'using truncated sums with up to 6 non-zero terms'...
    'ECE 202 Project 1 Phase 1'},'FontSize',24)
grid on
set(gca, 'GridAlpha', 0.4)




