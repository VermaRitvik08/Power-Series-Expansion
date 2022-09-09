%Ritvik Verma
%Project 1
%Phase 5
%Approximating f(t) = 12cos(40t) using truncated sums 
%with up to 6 non-zero terms
%Letting user define parameters

clear
clf
format shortG

tmin = input('Enter starting time (ms): ');   %start time in ms
tmax = input('Enter end time (ms): '); %end time in ms
N = input('Enter number of intervals in graph: ');  %number of intervals
%f = 12*cos(40*t);

tms = linspace(tmin,tmax,N+1);  %the units for tms are in ms
t = tms/1000;   %the units for t are in s

A = 12;     %Amplitude of graph
w = 40;     %angular frequency of graph in rad/s
term = input('Enter number of non-zero terms: '); 
%number of non-zero sums being plotted

n = 0:2:(term-1)*2;
a = A * (-1).^(n/2) .* w.^n./factorial(n);

coefficientTable = table(n.', a.', 'VariableNames',...
    {'Index n', 'Coefficient a_n'})

%--------------Create plotting functions-------------
f=zeros(1,1+N);
p=zeros(term,1);
plot([tmin,tmax], [0,0], 'k', 'LineWidth', 1);
hold on
for i = 1:term
    f = f + a(i)*t.^n(i);
    if i ~= term
        p(i)=plot(tms, f, 'LineWidth',2);
    else
        p(term)=plot(tms, f, 'LineWidth', 4);
    end
end
hold off
%-------------Check with previous script-------------
if term==6  %only print check when number of sums are 6
    f1 = a(1)*t.^n(1);
    f2 = f1 + a(2)*t.^n(2);
    f3 = f2 + a(3)*t.^n(3);
    f4 = f3 + a(4)*t.^n(4);
    f5 = f4 + a(5)*t.^n(5);
    f6 = f5 + a(6)*t.^n(6);
    check = sum(abs(f-f6))      %should be 0 if graphs are same
end
%-------------Plot and label graphs------------------

df = abs(A*cos(w*t) - f);   %difference between 2 functions
avg_dev = sum(df)/length(df) %average standard deviation

ax=gca;
ax.FontSize = 16;
ylim([-1.25*A 1.25*A])
xlabel('time t (ms)', 'Fontsize', 20)
ylabel('f(t)', 'FontSize', 20)

str = sprintf('Approximating f(t) = %ucos(%ut)',A,w); 
str2 = sprintf('using truncated sums with up to %u non-zero terms',term);
str3 = sprintf('with an Average Deviation of %0.4g',avg_dev);
title({str,...
    str2,...
    str3,...
    'ECE 202 Project 1 Phase 5'},'FontSize',24);
legend(p, "up to n = "+n,'FontSize',20,'Location','northeastoutside')
grid on
set(gca, 'GridAlpha', 0.5)