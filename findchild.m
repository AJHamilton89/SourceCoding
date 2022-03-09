function foundchildren = findchild(motherarray,trellis)





foundchildren = [];
for n=1:length(motherarray)
    mother=motherarray(n);
    
[row,col]=find (trellis == mother);

   children = trellis(row+1,(col*2-1):(col*2));
   foundchildren = [foundchildren,children];
end



end