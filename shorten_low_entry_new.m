function dictout= shorten_low_entry_new(dictin,threshold)

%divide point is the location within array at where to take threshold
divide_point=0.3;
% factor is the factor increase in each threshold
factor=5;

for n=1:length(dictin)
  dictin(n,6)=nnz(dictin(n,1:4));
end


%% 4-->3

 %to warm it up
   for n=1:100 
    if dictin(n,6) == 4
    dictin(n,4)=0;
    end
  
     
    
    dictin=sortrows(dictin,1);
    
    if dictin(n,1:4) == dictin(n+1,1:4)
        
        dictin(n,5)=dictin(n,5)+dictin(n+1,5); %replace 5 with max n-gram +1
        
        dictin(n+1,:)=zeros(1,6);%zeros(1,length(dictin(1,:))); This really needs to remove the row - but how do I do this without affecting for loop!!!
        
    end
    dictin=sortrows(dictin,5);
   end


n=1;
threshold_value=0;
threshold_value2=0;
while threshold_value2<threshold
    
  
   % now it's warmed up - crack on
      if dictin(n,6) == 4
    dictin(n,4)=0;
    end
  
     
    
    dictin=sortrows(dictin,1);
    
    if dictin(n,1:4) == dictin(n+1,1:4)
        
        dictin(n,5)=dictin(n,5)+dictin(n+1,5); %replace 5 with max n-gram +1
        
        dictin(n+1,:)=zeros(1,6);%zeros(1,length(dictin(1,:))); This really needs to remove the row - but how do I do this without affecting for loop!!!
        
    end
    dictin=sortrows(dictin,5);
    
    %% take the sub-set of only 3's to define threshold
     dictin=sortrows(dictin,4);
     subset=dictin(find ((dictin(:,4) == 0)),:);
    
threshold_value=double(subset(floor((size(subset,1))*divide_point),5))/double(sum(subset(:,5)));
    
%% take the sub-set of only 3's to define threshold
subset2=dictin(find ((dictin(:,4) ~= 0)),:);
subset2=sortrows(subset2,5);
threshold_value2=double(subset2(floor((size(subset2,1))*divide_point),5))/double(sum(subset2(:,5)));

if n<length(dictin(:,1))-1  
   n=n+1;
   else
       n=1;
   end
   dictin(find(dictin(:,5) == 0), : ) = [];
end



%% 3-->2

for n=1:length(dictin)
  dictin(n,6)=nnz(dictin(n,1:4));
end

 %to warm it up
   for n=1:100 
    if dictin(n,6) == 3
    dictin(n,3)=0;
    end
  
     
    
    dictin=sortrows(dictin,1);
    
    if dictin(n,1:4) == dictin(n+1,1:4)
        
        dictin(n,5)=dictin(n,5)+dictin(n+1,5); %replace 5 with max n-gram +1
        
        dictin(n+1,:)=zeros(1,6);%zeros(1,length(dictin(1,:))); This really needs to remove the row - but how do I do this without affecting for loop!!!
        
    end
    dictin=sortrows(dictin,5);
   end


n=1;
threshold_value=0;
threshold_value2=0;
threshold=threshold/factor;
while threshold_value2<threshold
    
  
   % now it's warmed up - crack on
      if dictin(n,6) == 3
    dictin(n,3)=0;
    end
  
     
    
    dictin=sortrows(dictin,1);
    
    if dictin(n,1:4) == dictin(n+1,1:4)
        
        dictin(n,5)=dictin(n,5)+dictin(n+1,5); %replace 5 with max n-gram +1
        
        dictin(n+1,:)=zeros(1,6);%zeros(1,length(dictin(1,:))); This really needs to remove the row - but how do I do this without affecting for loop!!!
        
    end
    dictin=sortrows(dictin,5);
    
    %% take the sub-set of only 2's to define threshold
     dictin=sortrows(dictin,3);
     subset=dictin(find ((dictin(:,3) == 0)),:);
    
threshold_value=double(subset(floor((size(subset,1))*divide_point),5))/double(sum(subset(:,5)));
    
%% take the sub-set of only 2's to define threshold
subset2=dictin(find ((dictin(:,3) ~= 0)),:);
subset2=sortrows(subset2,5);
threshold_value2=double(subset2(floor((size(subset2,1))*divide_point),5))/double(sum(subset2(:,5)));

if n<length(dictin(:,1))-1  
   n=n+1;
   else
       n=1;
   end
   dictin(find(dictin(:,5) == 0), : ) = [];
end



%% 2-->1
for n=1:length(dictin)
  dictin(n,6)=nnz(dictin(n,1:4));
end

 %to warm it up
   for n=1:100 
    if dictin(n,6) == 2
    dictin(n,2)=0;
    end
  
     
    
    dictin=sortrows(dictin,1);
    
    if dictin(n,1:4) == dictin(n+1,1:4)
        
        dictin(n,5)=dictin(n,5)+dictin(n+1,5); %replace 5 with max n-gram +1
        
        dictin(n+1,:)=zeros(1,6);%zeros(1,length(dictin(1,:))); This really needs to remove the row - but how do I do this without affecting for loop!!!
        
    end
    dictin=sortrows(dictin,5);
   end


n=1;
threshold_value=0;
threshold_value2=0;
threshold=threshold/factor;
while threshold_value2<threshold
    
  
   % now it's warmed up - crack on
      if dictin(n,6) == 2
    dictin(n,2)=0;
    end
  
     
    
    dictin=sortrows(dictin,1);
    
    if dictin(n,1:4) == dictin(n+1,1:4)
        
        dictin(n,5)=dictin(n,5)+dictin(n+1,5); %replace 5 with max n-gram +1
        
        dictin(n+1,:)=zeros(1,6);%zeros(1,length(dictin(1,:))); This really needs to remove the row - but how do I do this without affecting for loop!!!
        
    end
    dictin=sortrows(dictin,5);
    
    %% take the sub-set of only 1's to define threshold
     dictin=sortrows(dictin,2);
     subset=dictin(find ((dictin(:,2) == 0)),:);
    
threshold_value=double(subset(floor((size(subset,1))*divide_point),5))/double(sum(subset(:,5)));
    
%% take the sub-set of only 1's to define threshold
subset2=dictin(find ((dictin(:,2) ~= 0)),:);
subset2=sortrows(subset2,5);
threshold_value2=double(subset2(floor((size(subset2,1))*divide_point),5))/double(sum(subset2(:,5)));

if n<length(dictin(:,1))-1  
   n=n+1;
   else
       n=1;
   end
   dictin(find(dictin(:,5) == 0), : ) = [];
end

for n=1:length(dictin)
  dictin(n,6)=nnz(dictin(n,1:4));
% need some code in here to check if values repeated?
end

dictin=sortrows(dictin,1);
dictin=remove_new_duplicates_and_update_counts(dictin);
dictin( ~any(dictin,2), : ) = [];

dictout=dictin;



