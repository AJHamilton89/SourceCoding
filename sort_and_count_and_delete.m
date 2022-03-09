function [dictout,manipulatedstring]= sort_and_count_and_delete(dictin,string)

for n=1:length(dictin)
locations = strfind(deblank(char(string)),(nonzeros(char(dictin(n,1:4)))).');
string(locations)=0;
occurances=length(locations);
dictin(n,5)=occurances;
end

dictin=unique(dictin,'rows');

dictout=sortrows(dictin,5);

  dictin(find(dictin(:,5) == 0), : ) = [];

manipulatedstring = string;