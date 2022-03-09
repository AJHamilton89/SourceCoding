%%%code to calcuate probabilties in accordance with page 59 of logbook

%set how many symbols we need to go down
max=100;

%set S parameter
s=2;

%set K parameter for codewords
k=1;

%set flag for creating codewords
createcodes=1;

createsymbols=1;

num_symbols=1000;
%set how far we want to go for conditional probabilities
g=20;


%% create RExp codewords

if createcodes==1
codewords = createExpGcodes(max,k);
end
%% select codeword if required
%identify symbol of interest

if createsymbols==1
%generate symbols
symbols=generate_random_symbols(num_symbols,'distribution_zeta',s,max);

codewordout=[];

for num=1:length(symbols)
codeword=idcodeword(symbols(num),codewords);
reorderedcodeword=reordercodewordRExpG(codeword,1);
codewordout = [codewordout,reorderedcodeword];
end

end
%%

%define first max(x) probabilities
for x= 1:2*max+2;
Px (x) = x.^-s/zeta(s);
end
 
%take the first right
Pac=sum(Px(1:2));

%take the first left
Pab=1-sum(Px(1:2));

%Ending at node 1 
Pcf=Px(1)/sum(Px(1:2));

%Ending at node 2
Pcg=Px(2)/sum(Px(1:2));

% loop for conditional probabilities
for n = 1:100
  
    
    %final left branch
    node3(n)=Px(1+2*n)/sum(Px(1+2*n:2+2*n));
    
    %final right branch
    node4(n)=Px(2+2*n)/sum(Px(1+2*n:2+2*n));
    
  % penultimate branch
    Pgeneral(n)=sum(Px(1:2+2*n));
    
    %opposite of penultimate branch
    Pgeneralnot(n)=1-sum(Px(1:2+2*n));
    
   
    
   
end

