function [dictout] = remove_low_information_entries_generic(dictin,threshold_inf,maxngram)

dictin=double(dictin);

for n=1:length(dictin(:,1))
  dictin(n,maxngram+2)=nnz(dictin(n,1:maxngram));
end

%probability
for n=1:length(dictin(:,1))
dictin(n,maxngram+3)=(((dictin(n,maxngram+1))/sum(dictin(:,maxngram+1))));
end

%entropy
dictin(:,maxngram+4)=-dictin(:,maxngram+3).*log2(dictin(:,maxngram+3));

%conditional entropy
dictin(:,maxngram+5)=dictin(:,maxngram+4)./dictin(:,maxngram+2);


%% remove entries with too low information per character - this does the last character - need to repeat for 9-1

for row_to_delete = maxngram:-1:1

too_low_locs=find(dictin(:,maxngram+5)<threshold_inf);

dictin(too_low_locs,row_to_delete)=0;

% find new entropy

dictin=remove_new_duplicates_and_update_counts_generic(dictin,maxngram);
dictin( ~any(dictin,2), : ) = [];

%% line to be removed if makes little benefit

if maxngram>1
dictin(find(dictin(:,maxngram+1) == 1),maxngram)=0;
end

%%


for n=1:length(dictin(:,1))
  dictin(n,maxngram+2)=nnz(dictin(n,1:maxngram));
end

for n=1:length(dictin(:,1))
dictin(n,maxngram+3)=(((dictin(n,maxngram+1))/sum(dictin(:,maxngram+1))));
end

dictin(:,maxngram+4)=-dictin(:,maxngram+3).*log2(dictin(:,maxngram+3));

dictin(:,maxngram+5)=dictin(:,maxngram+5)./dictin(:,maxngram+2);

end


dictin=sortrows(dictin,maxngram+5);



dictout=dictin;