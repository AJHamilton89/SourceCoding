%test script

n=1;
for threshold_inf=0.00001:0.00005:0.01001
dictout=remove_low_information_entries(finaldictalt,threshold_inf);
dictsize(n)=length(dictout(:,1));
inf(n)=measure_information(dictout);
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
