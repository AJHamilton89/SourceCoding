function dictout= sort_and_count_generic(dictin,string,maxngram)

for n=1:length(dictin)
occurances=length(strfind(deblank(char(string)),(nonzeros(char(dictin(n,1:maxngram)))).'));
dictin(n,maxngram+1)=occurances;
end

dictin=unique(dictin,'rows');

dictout=sortrows(dictin,maxngram+1);