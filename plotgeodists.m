n=1;
for p1=[1e-3,3e-3,6e-3]

for x=1:10000
Px (x,n) = p1*(1-p1).^(x-1);
end
n=n+1;
end 