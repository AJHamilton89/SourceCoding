function [dictout] = remove_low_information_entries_tengrams(dictin,threshold_inf)

% threshold_inf=0.0003;

dictin=double(dictin);

for n=1:length(dictin)
  dictin(n,maxngram+1)=nnz(dictin(n,1:4));
end

for n=1:length(dictin)
dictin(n,maxngram+2)=(((dictin(n,maxngram+1))/sum(dictin(:,maxngram+1))));
end

dictin(:,maxngram+3)=-dictin(:,maxngram+2).*log2(dictin(:,maxngram+2));

dictin(:,maxngram+4)=dictin(:,maxngram+3)./dictin(:,maxngram+3);


%% remove entries with too low information per character - this does the last character - need to repeat for 9-1

for row_to_delete = maxngram:-1:1

too_low_locs=find(dictin(:,maxngram+4)<threshold_inf);

dictin(too_low_locs,row_to_delete)=0;

% find new entropy

dictin=remove_new_duplicates_and_update_counts_tens(dictin);
dictin( ~any(dictin,2), : ) = [];

for n=1:length(dictin)
  dictin(n,maxngram+1)=nnz(dictin(n,1:maxngram));
end

for n=1:length(dictin)
dictin(n,maxngram+2)=(((dictin(n,maxngram+1))/sum(dictin(:,maxngram+1))));
end

dictin(:,maxngram+3)=-dictin(:,maxngram+2).*log2(dictin(:,maxngram+2));

dictin(:,maxngram+4)=dictin(:,maxngram+3)./dictin(:,maxngram+1);

end


dictin=sortrows(dictin,maxngram+4);



dictout=dictin;