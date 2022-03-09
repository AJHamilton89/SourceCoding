
%define source file to generate alphabet
str= fopen('textpotter.txt');
string = ((fread(str,'char'))).';
%string = 'This is an example text string to try and pull out recurring text in the english language, it is mainly just me typing in any old rubbish.';
vector = uint16(string(:)');

i=1;
threshold=0.001;%threshold for removals

maxngram = 4;

for n = maxngram:-1:1
    for N= 1:length(vector)
        if N+n<length(vector)%length(vector)>=n
            %if N>=(length(vector)-n)
        str= vector(N:N+n-1);
        dict(i,1:n)=str;
        %vector(1:n)=[];
        i=i+1;
            
        else  
            %end
        end
        
    end
end

for n=1:length(dict)
    

   numelements(n)=nnz(dict(n,:));
end

fourgrams=dict(find(numelements == 4),:);
fourgrams = fourgrams(:,1:4);

trigrams=dict(find(numelements == 3),:);
trigrams = trigrams(:,1:3);

bigrams=dict(find(numelements == 2),:);
bigrams = bigrams(:,1:2);

monograms=dict(find(numelements == 1),:);
monograms = monograms(:,1);

for n=1:length(bigrams)
telltale=strmatch(bigrams(n,:),bigrams);
bicounts(n,:)=[bigrams(telltale(1),:),length(telltale)];
end

for n=1:length(trigrams)
telltale=strmatch(trigrams(n,:),trigrams);
tricounts(n,:)=[trigrams(telltale(1),:),length(telltale)];
end

for n=1:length(fourgrams)
telltale=strmatch(fourgrams(n,:),fourgrams);
fourcounts(n,:)=[fourgrams(telltale(1),:),length(telltale)];
end

for l=1:length(dict)
string2=strcat(num2str(dict(l,1)),num2str(dict(l,2)),num2str(dict(l,3)),num2str(dict(l,4)));%,num2str(dict(l,5)),num2str(dict(l,6)),num2str(dict(l,7)),num2str(dict(l,8)),num2str(dict(l,9)));%,num2str(dict(l,10)),num2str(dict(l,11)),num2str(dict(l,12)));
look(l)=str2num(string2);
end
% 
for l=1:length(dict)
sym_length(l)=length(find(dict(l,:)~=0));
end

charpersym=sum(sym_length)/length(look)

% condense the dictionary into unique entries
fourgrams=unique(fourgrams,'rows');

dictout=fourgrams;

dictout=sort_and_count(dictout,string);

dictsav=dictout;% save the dictionary to an unmanipulated file at this stage
%% this section is the original method 26/4/17 - changed to reflect a threshold of each n-gram
for p=1:1%2000 % this should be replaced with a conditional while loop based upon the entropy

dictout=shorten_low_entry(dictout);

dictout=remove_new_duplicates_and_update_counts(dictout);

dictout( ~any(dictout,2), : ) = []; %maybe put this line in one of the functions
end

%% do the threseholds in this section
dictoutnew=shorten_low_entry_new(dictsav,threshold);

dictoutnew( ~any(dictoutnew,2), : ) = [];

%% Threshold (entropy) code 31/5/17

dictoutent=remove_low_information_entries(dictsav,0.0003);

%% sort all the dictionaries at the end

finaldict=flipud(dictout(:,1:4));

[finaldictalt,manipulatedstring]=sort_and_count_and_delete(finaldict,string);


finaldictalt=flipud(finaldictalt);

finaldict=flipud(dictout(:,1:4));

finaldictent=flipud(dictoutent(:,1:4));

finaldictnew=flipud(dictoutnew);

[finaldictnewalt,manipulatedstring]=sort_and_count_and_delete(finaldictnew,string);

finaldictnewalt=flipud(finaldictnewalt);

finaldict=sort_and_count(finaldict,string);

finaldictent=sort_and_count(finaldictent,string);


finaldict=delete_redundant_entries(finaldict);
finaldictnew=delete_redundant_entries(finaldictnew);
finaldictalt=delete_redundant_entries(finaldictalt);
finaldictnewalt=delete_redundant_entries(finaldictnewalt);

distributionalt = sort((double (finaldictalt(:,5))),'descend'); % create distribution

distributionent = sort((double (finaldictent(:,5))),'descend');

distributionnewalt = sort((double (finaldictnewalt(:,5))),'descend'); % create distribution

distribution = sort((double (finaldict(:,5))),'descend'); % create distribution

distributionnew = sort((double (finaldictnew(:,5))),'descend'); % create distribution



figure
loglog(distribution/sum(distribution),'.') % plot it

hold on
loglog(distributionalt/sum(distributionalt),'.')

hold on
loglog(distributionnew/sum(distributionnew),'.')

hold on
loglog(distributionnewalt/sum(distributionnewalt),'.')

hold on
loglog(distributionent/sum(distributionent),'.')

grid minor
legend('original','dist alt','dist new(thresholds)','dist new(thresholds)_alt','ent thresholds')

 % create final dictionary

finaldictchar=char(finaldict);
finaldictcharalt=char(finaldictalt);
finaldictcharnew=char(finaldictnew);
finaldictcharnewalt=char(finaldictnewalt);


information_in_final_dict = measure_information(finaldict)

information_in_final_dict_alt = measure_information(finaldictalt)

information_in_final_dict_new = measure_information(finaldictnew)

information_in_final_dict_new_alt = measure_information(finaldictnewalt)

information_in_final_dict_ent = measure_information(finaldictent)