% define source string
str=fopen('paper1.txt');

%transpose string into vector
string = (fread(str,'char')).';

%represent as ASCII characters
vector = uint16(string(:)');
vector=double(vector);

%set granularity of plots
granularity = 40;

clear dict;
clear inf;
clear dictsize;
clear th_inf;
% figure
% 
% set(gca,'xscale','log')
% 
% yyaxis left
% ylabel('Entropy per Character')
% set(gca,'yscale','log')
% ylim([1e-1,1e1])
% 
% yyaxis right
% ylabel('Dictionary Size')
% xlabel('Entropy Threshold')
% grid on
% set(gca,'yscale','log')


%set max n-gram (could change to for loop)
for maxngram=1:10;
clear dict
i=1;
n=1;



    for N= 1:length(vector)
        if N+maxngram<length(vector)
            
        str= vector(N:N+maxngram-1);
        dict(i,1:maxngram)=str;
       
        i=i+1;
            
        else      
        end
        
    end

dict =unique(dict,'rows');

%count how many n-grams actually  appeared and put in column n-grams + 1
dict = sort_and_count_generic(double(dict),string,maxngram); %note on 23/6/17 this is hard coded to 4-grams at the moment - almost immediately solved


for threshold_inf= -20:-20%logspace(-20,-2,granularity)
dict=remove_low_information_entries_generic(dict,threshold_inf,maxngram); % needs to become generic
dictsize(n,maxngram)=length(dict(:,1));
inf(n,maxngram)=measure_information_generic(dict,maxngram);
n=n+1;
clear dictnew
end

th_inf = logspace(-20,-4,granularity);

% hold on
% yyaxis left
% plot (th_inf,inf(:,maxngram))
% hold on
% yyaxis right
% plot(th_inf,dictsize(:,maxngram))


dist=dict(:,(maxngram+1));
dist=sort(dist,'descend');
probdist=double(dist)./sum(dist);
figure;
loglog(probdist,'.')


drawnow
 filename = 'test_variables.mat';
save(filename)
end

