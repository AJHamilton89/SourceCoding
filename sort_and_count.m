function dictout= sort_and_count(dictin,string)

for n=1:length(dictin)
occurances=length(strfind(deblank(char(string)),(nonzeros(char(dictin(n,1:4)))).'));
dictin(n,5)=occurances;
end

dictin=unique(dictin,'rows');

dictout=sortrows(dictin,5);