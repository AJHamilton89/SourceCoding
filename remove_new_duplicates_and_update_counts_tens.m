function dictout= remove_new_duplicates_and_update_counts_tens(dictin)

dictin=sortrows(dictin,1);

for n=1:(length(dictin)-1)
    
    if dictin(n,1:10) == dictin(n+1,1:10)
        
        dictin(n+1,11)=dictin(n,11)+dictin(n+1,11); %replace 5 with max n-gram +1
        
        dictin(n,:)=zeros(1,length(dictin(1,:))); %This really needs to remove the row - but how do I do this without affecting for loop!!!
        
    end
    
    dictin=sortrows(dictin,1);
end

dictout=sortrows(dictin,11);