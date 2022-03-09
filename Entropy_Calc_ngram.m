% define source string
str=fopen('book1.txt');

%transpose string into vector
string = (fread(str,'char')).';

%represent as ASCII characters
vector = uint16(string(:)');


clear dict;
clear ngram_inf;

figure

set(gca,'xscale','log')
xlabel('n-gram')

yyaxis left
ylabel('Entropy per Character')
set(gca,'yscale','log')




%set max n-gram (could change to for loop)
for maxngram=1:100;
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
dict = sort_and_count_generic(dict,string,maxngram); %note on 23/6/17 this is hard coded to 4-grams at the moment - almost immediately solved


ngram_inf(maxngram)=measure_information_generic(dict,maxngram);



hold on

plot(ngram_inf)


end