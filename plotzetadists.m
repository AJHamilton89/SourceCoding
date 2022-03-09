n=1;
for s=1.1:0.2:4

for x=1:10000
Px (x,n) = x.^-s/zeta(s);
end
n=n+1;
end