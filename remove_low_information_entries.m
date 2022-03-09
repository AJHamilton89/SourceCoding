function [dictout] = remove_low_information_entries(dictin,threshold_inf)

% threshold_inf=0.0003;

dictin=double(dictin);

for n=1:length(dictin)
  dictin(n,6)=nnz(dictin(n,1:4));
end

for n=1:length(dictin)
dictin(n,7)=(((dictin(n,5))/sum(dictin(:,5))));
end

dictin(:,8)=-dictin(:,7).*log2(dictin(:,7));

dictin(:,9)=dictin(:,8)./dictin(:,6);


%% remove entries with too low information per character

too_low_locs=find(dictin(:,9)<threshold_inf);

dictin(too_low_locs,4)=0;

% find new entropy

dictin=remove_new_duplicates_and_update_counts(dictin);
dictin( ~any(dictin,2), : ) = [];

for n=1:length(dictin)
  dictin(n,6)=nnz(dictin(n,1:4));
end

for n=1:length(dictin)
dictin(n,7)=(((dictin(n,5))/sum(dictin(:,5))));
end

dictin(:,8)=-dictin(:,7).*log2(dictin(:,7));

dictin(:,9)=dictin(:,8)./dictin(:,6);


%% remove entries with too low information per character

too_low_locs=find(dictin(:,9)<threshold_inf);

dictin(too_low_locs,3)=0;

% find new entropy

dictin=remove_new_duplicates_and_update_counts(dictin);
dictin( ~any(dictin,2), : ) = [];

for n=1:length(dictin)
  dictin(n,6)=nnz(dictin(n,1:4));
end

for n=1:length(dictin)
dictin(n,7)=(((dictin(n,5))/sum(dictin(:,5))));
end

dictin(:,8)=-dictin(:,7).*log2(dictin(:,7));

dictin(:,9)=dictin(:,8)./dictin(:,6);


%% remove entries with too low information per character

too_low_locs=find(dictin(:,9)<threshold_inf);

dictin(too_low_locs,2)=0;

% find new entropy

dictin=remove_new_duplicates_and_update_counts(dictin);
dictin( ~any(dictin,2), : ) = [];

for n=1:length(dictin)
  dictin(n,6)=nnz(dictin(n,1:4));
end

for n=1:length(dictin)
dictin(n,7)=(((dictin(n,5))/sum(dictin(:,5))));
end

dictin(:,8)=-dictin(:,7).*log2(dictin(:,7));

dictin(:,9)=dictin(:,8)./dictin(:,6);

dictin=sortrows(dictin,9);



dictout=dictin;