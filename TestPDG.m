clear all
s = 2;
totalprobs=0;
totaltransitions=0;
start=3;
startdenom=(zetafun(1,s)+zetafun(2,s));
startnumerator=zetafun(1,s)+zetafun(2,s);

for n=1:7
    %%% these equations are valid for PBD but not PDB
    
   start(n)= floor(2^(n-20))+floor(2^(n-19))+floor(2^(n-18))...
        +floor(2^(n-17))+floor(2^(n-16))+floor(2^(n-15))...
        +floor(2^(n-14))+floor(2^(n-19))+floor(2^(n-13))...
        +floor(2^(n-12))+floor(2^(n-11))+floor(2^(n-10))...
        +floor(2^(n-9))+floor(2^(n-8))+floor(2^(n-7))...
        +floor(2^(n-6))+floor(2^(n-5))+floor(2^(n-4))...
        +floor(2^(n-3))+floor(2^(n-2))+floor(2^(n-1))...
        +floor(2^n);
    
    stop(n)=floor(2^(n+1))+floor(2^(n-20))+floor(2^(n-19))+floor(2^(n-18))...
        +floor(2^(n-17))+floor(2^(n-16))+floor(2^(n-15))...
        +floor(2^(n-14))+floor(2^(n-19))+floor(2^(n-13))...
        +floor(2^(n-12))+floor(2^(n-11))+floor(2^(n-10))...
        +floor(2^(n-9))+floor(2^(n-8))+floor(2^(n-7))...
        +floor(2^(n-6))+floor(2^(n-5))+floor(2^(n-4))...
        +floor(2^(n-3))+floor(2^(n-2))+floor(2^(n-1))...
        +floor(2^n)-1;
   clear probstemp
    for m=start(n):stop(n)
        
        probstemp(m)=zetafun(m,s);
    end
    probsDG (n) = sum(probstemp);
    probsDB (n)= 1-(startnumerator+sum(probsDG(1:n)));
    transDG (n) = probsDG(n)/(probsDG(n)+probsDB(n));
end

 normprobsDG=probsDG/sum(probsDG);
 probTrans= transDG.*normprobsDG;
 Transfinal=sum(probTrans)


  %%% these equations are valid for PBD but not PDB
    
%    start(n)= -3+2*floor(2^(n-20))+2*floor(2^(n-19))+2*floor(2^(n-18))...
%         +2*floor(2^(n-17))+2*floor(2^(n-16))+2*floor(2^(n-15))...
%         +2*floor(2^(n-14))+2*floor(2^(n-19))+2*floor(2^(n-13))...
%         +2*floor(2^(n-12))+2*floor(2^(n-11))+2*floor(2^(n-10))...
%         +2*floor(2^(n-9))+2*floor(2^(n-8))+2*floor(2^(n-7))...
%         +2*floor(2^(n-6))+2*floor(2^(n-5))+2*floor(2^(n-4))...
%         +2*floor(2^(n-3))+2*floor(2^(n-2))+2*floor(2^(n-1))...
%         +2*floor(2^n);
%     
%     stop(n)=-4+floor(2^(n+1))+2*floor(2^(n-20))+2*floor(2^(n-19))+2*floor(2^(n-18))...
%         +2*floor(2^(n-17))+2*floor(2^(n-16))+2*floor(2^(n-15))...
%         +2*floor(2^(n-14))+2*floor(2^(n-19))+2*floor(2^(n-13))...
%         +2*floor(2^(n-12))+2*floor(2^(n-11))+2*floor(2^(n-10))...
%         +2*floor(2^(n-9))+2*floor(2^(n-8))+2*floor(2^(n-7))...
%         +2*floor(2^(n-6))+2*floor(2^(n-5))+2*floor(2^(n-4))...
%         +2*floor(2^(n-3))+2*floor(2^(n-2))+2*floor(2^(n-1))...
%         +2*floor(2^n);






% for n=3:2:100
%     
%     %numerator
%     probsDG((n-1)/2)=zetafun(n,s)+zetafun(n+1,s);
%     
%     totalprobs=sum(probsDG((n-1)/2));%totalprobs+probs((n+(4-start))/4);
%     newprobs= probsDG/totalprobs;
%     relevantprobs=newprobs.*probsDG;
%     
%     probsDB((n-1)/2)=1-(startnumerator+sum(probsDG(1:end)));
%     
%     transistionDB((n-1)/2)=probsDB(((n-1)/2))/(probsDB(((n-1)/2))+probsDG(((n-1)/2)));
%     %denominator
% %     if n<4
% % %  
%             relevantdenomadd=0;%HACK
%         %work out the total denom is
%         currentdenom2((n-1)/2)=(startdenom-relevantdenomadd);
%         currentdenom1((n-1)/2)=1-currentdenom2((n-1)/2);
%         %caculate total transittions
%         
%         transition((n-1)/2)=totalprobs/1-currentdenom2((n-1)/2);
%         totaltransitions=totaltransitions+transition((n-1)/2);
%         
%        newttrans((n-1)/2)= transition((n-1)/2)/totaltransitions;
%     else
%        probsdenom((n-1)/2)=zetafun(n-2,s)+zetafun(n-1,s)
% %         relevantdenomadd=zetafun(n,s)+zetafun(n+1,s);
%         currentdenom2((n-1)/2)=(sum(probsdenom(1:(n-1)/2)));
%         currentdenom1((n-1)/2)=1-currentdenom2((n-1)/2);
% %         transition((n-1)/2)=totalprobs/1-currentdenom2((n-1)/2);
% %         totaltransitions=totaltransitions+transition((n-1)/2);
% %         newttrans((n-1)/2)= transition((n-1)/2)/totaltransitions;
% %     end
% end



% relevanttrans=newttrans.*transition;
% finaltrans=sum(relevanttrans)


% newprobs= probs/totalprobs;
% 
% relevantprobs=newprobs.*probs;
% 
% % transition=(sum(relevantprobs))/(1-(zetafun(1,s)+zetafun(2,s)))