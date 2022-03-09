%test script

n=1;
for threshold_inf=0.00001:0.00005:0.01001
dictour=remove_low_information_entries_tengrams(dictour,threshold_inf);
dictsize(n)=length(dictour(:,1));
inf(n)=measure_information_ten(dictour);
n=n+1;
end

th_inf = 0.00001:0.00005:0.01001;

figure
yyaxis left
plot (th_inf,inf)
hold on
yyaxis right
plot(th_inf,dictsize)
grid on
