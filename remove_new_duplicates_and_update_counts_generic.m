function dictout= remove_new_duplicates_and_update_counts_generic(dictin,maxngram)

dictin=sortrows(dictin,1);

for n=1:(length(dictin(:,1))-1)
    
    if dictin(n,1:maxngram) == dictin(n+1,1:maxngram)
        
        dictin(n+1,maxngram+1)=dictin(n,maxngram+1)+dictin(n+1,maxngram+1); %replace 5 with max n-gram +1
        
        dictin(n,:)=zeros(1,length(dictin(1,:))); %This really needs to remove the row - but how do I do this without affecting for loop!!!
        
    end
    
%     dictin=sortrows(dictin,1);
end

dictout=sortrows(dictin,maxngram+1);