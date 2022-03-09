clear all
s = 2;
k=1;
totalprobs=0;
totaltransitions=0;
start=2^k+1;
% startdenom=(1-(zetafun(1,s)+zetafun(2,s)));
stop = 100;
onetrans = 0;
zerotrans = 0;
 zerotranstemp=zeros(stop,1);
 onetranstemp=zeros(stop,1);
prob=zeros(stop,1);
normprob=zeros(stop,1);
%  bival = createExpGcodes(stop,k);
%  PDGtemp=zeros(stop,1);
 
for n=start:stop
    
    prob(n)=zetafun(n,s);
    normprob(n)=prob(n)/(1-(zetafun(1,s)+zetafun(2,s)));
    
%     bivaltemp = (bival(n,(~isnan(bival(n,:)))));  %num2str(dec2bin(n));
%     
%   
%     for i = (floor(size(bivaltemp, 2)/2))+k:(size(bivaltemp, 2)-k)
%         onetranstemp(n) = onetranstemp(n) + (bivaltemp(i));
%     end
%     
%     for i = 1:(floor(size(bivaltemp, 2)/2))+k-1
%         PDGtemp(n) = PDGtemp(n) + (bivaltemp(i));
%     end
%     
%     onetrans=onetrans+onetranstemp;
%     
%    PDBtemp(n)=floor(size(bivaltemp, 2)/2)+(k-2)-PDGtemp(n);
%    
%    PDBtranstemp(n)=PDBtemp(n)/(PDBtemp(n)+PDGtemp(n));
%    
%    PDGtranstemp(n)=PDGtemp(n)/(PDBtemp(n)+PDGtemp(n));
%    
   % zerotranstemp(n)=floor(size(bivaltemp, 2)/2)-k-onetranstemp(n);
    
%% try k generalised version - works hooray!

temp=fliplr(de2bi(n+2^k-1)); % calculate FLC bits
trans=temp(2:(2+length(de2bi(n+2^k-1))-1-k)); %look at holding states only
onetranstemp(n)=sum(trans); %how many ones?
zerotranstemp(n)=0-sum(trans-1); %how many zeros?

PDBtemp(n)=length(de2bi(n+2^k-1))-2-k;%how many zeros in UEC (apart from original)
PDGtemp(n)=1;
end

%PDBtemp=PDBtemp';

probTransDG= normprob.*PDGtemp';
TransfinalDG=sum(probTransDG);

probTransDB= normprob.*PDBtemp';
TransfinalDB=sum(probTransDB);

probTransBDones= normprob.*onetranstemp;
Transfinalones=sum(probTransBDones);

probTransBDzeros= normprob.*zerotranstemp;
Transfinalzeros=sum(probTransBDzeros);

PBDones=Transfinalones/(Transfinalones+Transfinalzeros);

PBDzeros=1-PBDones;

PDG=TransfinalDG/(TransfinalDG+TransfinalDB);

PDB=1-PDG;
%     
% for n=0:7
%    
%  startones(n+1)= 1+2*floor(2^(n-20))+2*floor(2^(n-19))+2*floor(2^(n-18))...
%         +2*floor(2^(n-17))+2*floor(2^(n-16))+2*floor(2^(n-15))...
%         +2*floor(2^(n-14))+2*floor(2^(n-19))+2*floor(2^(n-13))...
%         +2*floor(2^(n-12))+2*floor(2^(n-11))+2*floor(2^(n-10))...
%         +2*floor(2^(n-9))+2*floor(2^(n-8))+2*floor(2^(n-7))...
%         +2*floor(2^(n-6))+2*floor(2^(n-5))+2*floor(2^(n-4))...
%         +2*floor(2^(n-3))+2*floor(2^(n-2))+2*floor(2^(n-1))...
%         +2*floor(2^n);
%     
%      
%     
%     stopones(n+1)=floor(2^(n+1))+2*floor(2^(n-20))+2*floor(2^(n-19))+2*floor(2^(n-18))...
%         +2*floor(2^(n-17))+2*floor(2^(n-16))+2*floor(2^(n-15))...
%         +2*floor(2^(n-14))+2*floor(2^(n-19))+2*floor(2^(n-13))...
%         +2*floor(2^(n-12))+2*floor(2^(n-11))+2*floor(2^(n-10))...
%         +2*floor(2^(n-9))+2*floor(2^(n-8))+2*floor(2^(n-7))...
%         +2*floor(2^(n-6))+2*floor(2^(n-5))+2*floor(2^(n-4))...
%         +2*floor(2^(n-3))+2*floor(2^(n-2))+2*floor(2^(n-1))...
%         +2*floor(2^n);
%     
%     startzeros(n+1)= stopones(n+1)+1;
%     
%     stopzeros(n+1)= stopones(n+1)+2*floor(2^n);
% 
%     
%     clear probstempones
%     for m=startones(n+1):stopones(n+1)
%         
%         probstempones(m)=zetafun(m,s);
%     end
%     
%     clear probstempzeros
%      for m=startzeros(n+1):stopzeros(n+1)
%         
%         probstempzeros(m)=zetafun(m,s);
%      end
%      probsBDones (n+1) = sum(probstempones);
%     normprobstempones=probstempones/sum(probstempones);
%     probTranstempones= probstempones.*normprobstempones;
%     probsBDonesmult (n+1) = sum( probTranstempones)*nnz(normprobstempones);
%     
%     probsBDzeros (n+1)= sum(probstempzeros);
%     normprobstempzeros=probstempzeros/sum(probstempzeros);
%     probTranstempzeros= probstempzeros.*normprobstempzeros;
%     probsBDzerosmult (n+1) = sum( probTranstempzeros)*nnz(normprobstempzeros);
%     
%     transBDones (n+1) = probsBDones(n+1)/(probsBDones(n+1)+probsBDzeros(n+1));
%     transBDzeros (n+1) = probsBDzeros(n+1)/(probsBDones(n+1)+probsBDzeros(n+1));
%     
%     
% end
% 
% normprobsBDones=probsBDonesmult/sum(probsBDonesmult);
%  probTransBDones= transBDones.*normprobsBDones;
% Transfinalones=sum(probTransBDones)
% 
%  normprobsBDzeros=probsBDzerosmult/sum(probsBDzerosmult);
%  probTransBDzeros= transBDzeros.*normprobsBDzeros;
%  Transfinalzeros=sum(probTransBDzeros)








% for n=start:4:100
%     
%     %numerator
%     probs(1)=zetafun(n,s)+zetafun(n+1,s);%(n+(4-start))/4
%     probs(2)=zetafun(n+2,s)+zetafun(n+3,s);
%     totalprobs=sum(probs);%totalprobs+probs((n+(4-start))/4);
%     newprobs= probs/totalprobs;
%     relevantprobs=newprobs.*probs;
%     
%     %denominator
%     if n<5
% %         % set relitavevalue i.e. are we going for 3,4,7,8 or 5,6
% %         relitavevalue=floor((n+1)/4)*4-5;
% %         
% %         %work out what the relevant denominator value to add is
% %         relevantdenomadd=zetafun(relitavevalue,s)+zetafun(relitavevalue+1,s)+zetafun(relitavevalue+3,s);
% %         
%             relevantdenomadd=0;%HACK
%         %work out the total denom is
%         currentdenom2((n+(4-start))/4)=(startdenom-relevantdenomadd);
%         
%         %caculate total transittions
%         
%         transition((n+(4-start))/4)=newprobs(1)/currentdenom2((n+(4-start))/4);
%         totaltransitions=totaltransitions+transition((n+(4-start))/4);
%         
%        newttrans((n+(4-start))/4)= transition((n+(4-start))/4)/totaltransitions;
%     else
%         
%         relitavevalue=floor((n+1)/4)*4-5;
%         relevantdenomadd=zetafun(relitavevalue,s)+zetafun(relitavevalue+1,s)+zetafun(relitavevalue+2,s)+zetafun(relitavevalue+3,s);
%         currentdenom2((n+(4-start))/4)=(startdenom-relevantdenomadd);
%         transition((n+(4-start))/4)=newprobs(1)/currentdenom2((n+(4-start))/4);
%         totaltransitions=totaltransitions+transition((n+(4-start))/4);
%         newttrans((n+(4-start))/4)= transition((n+(4-start))/4)/totaltransitions;
%     end
% end
% 
% 
% 
% relevanttrans=newttrans.*transition;
% finaltrans=sum(relevanttrans)
% 

% newprobs= probs/totalprobs;
% 
% relevantprobs=newprobs.*probs;
% 
% % transition=(sum(relevantprobs))/(1-(zetafun(1,s)+zetafun(2,s)))