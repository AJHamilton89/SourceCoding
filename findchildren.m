function totalchildren = findchildren(mother,trellis)

[row,col]=find (trellis == mother);
totalchildren=[];
   %sub-trellis
   for n = row+1:length(trellis(:,1))

   childnodes=findchild(mother,trellis);
   mother=childnodes;
   totalchildren = [totalchildren,childnodes];   
   
   end
   
end