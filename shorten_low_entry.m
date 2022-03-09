function dictout= shorten_low_entry(dictin)

for n=1:length(dictin)
  dictin(n,6)=nnz(dictin(n,1:4));
end


n=1;
keep_going=true;
while keep_going==true
    
while n<length(dictin)
if dictin(n,6) == 4
dictin(n,4)=0;
keep_going=false;
break

else
n=n+1;
end
end

n=1;
while n<length(dictin)
if dictin(n,6) == 3
dictin(n,3)=0;
keep_going=false;
break

else
n=n+1;
end
end

n=1;
while n<length(dictin)
if dictin(n,6) == 2
dictin(n,2)=0;
keep_going=false;
break

else
n=n+1;
end
end
end

for n=1:length(dictin)
  dictin(n,6)=nnz(dictin(n,1:4));
end
% need some code in here to check if values repeated?

dictout=dictin;




