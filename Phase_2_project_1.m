%Ritvik Verma
%Project 1
%Phase 2
%Approximating f(t) = 12 cos(40t) using truncated sums 
%with up to 6 non-zero terms
%refining the output

clear
clf
format shortG

tms = linspace(0,200,401);  %the units for tms are in ms
t = tms/1000;   %the units for t are in s

n = 0:2:10;
a = 12 * (-1).^(n/2) .* 40.^n./factorial(n);

coefficientTable = table(n.', a.', 'VariableNames',...
    {'Index n', 'Coefficient a_n'})
%table for coefficients
%--------------Create plotting functions-------------
%f = 12*cos(40*t);
f1 = a(1)*t.^n(1);
f2 = f1 + a(2)*t.^n(2);
f3 = f2 + a(3)*t.^n(3);
f4 = f3 + a(4)*t.^n(4);
f5 = f4 + a(5)*t.^n(5);
f6 = f5 + a(6)*t.^n(6);

%-------------Plot and label graphs------------------
plot([0,200], [0,0], 'k', 'LineWidth', 1)
hold on
p1 = plot(tms,f1,tms,f2,tms,f3,tms,f4,tms,f5,'LineWidth',2);
p2 = plot(tms,f6,'LineWidth',4);
hold off

ax=gca;
ax.FontSize = 16;
ylim([-15 15])
xlabel('time t (ms)', 'Fontsize', 20)
ylabel('f(t)', 'FontSize', 20)
title({'Approximating f(t) = 12 cos(40t)',... 
    'using truncated sums with up to 6 non-zero terms'...
    'ECE 202 Project 1 Phase 2'},'FontSize',24)

legend([p1;p2], "up to n = "+n,'FontSize',20,'Location','northeastoutside')
grid on
set(gca, 'GridAlpha', 0.5)
