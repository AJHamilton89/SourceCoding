clear all
s = 2;
totalprobs=0;
totaltransitions=0;
start=3;
startdenom=(1-(zetafun(1,s)+zetafun(2,s)));

for n=3:2:100
    
    probsGH(n-2)=zetafun(n,s);
    probsGI(n-2)=zetafun(n+1,s);
     
 
   transGH (n-2) = probsGH(n-2)/(probsGH(n-2)+probsGI(n-2));
   transGI(n-2)=1- transGH(n-2);
    
end

 normprobsGH=probsGH/sum(probsGH);
 probTransGH= transGH.*normprobsGH;
 TransfinalGH=sum(probTransGH)
 
  normprobsGI=probsGI/sum(probsGI);
 probTransGI= transGI.*normprobsGI;
 TransfinalGI=sum(probTransGI)
