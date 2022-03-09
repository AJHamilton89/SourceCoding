
function [catmat]=padconcatenation(a,b,c)
sa=size(a);
sb=size(b);

switch c
    case 1
        tempmat=NaN(sa(1)+sb(1),max([sa(2) sb(2)]));
        tempmat(1:sa(1),1:sa(2))=a;
        tempmat(sa(1)+1:end,1:sb(2))=b;
        
    case 2
        tempmat=NaN(max([sa(1) sb(1)]),sa(2)+sb(2));
        tempmat(1:sa(1),1:sa(2))=a;
        tempmat(1:sb(1),sa(2)+1:end)=b;
end

catmat=tempmat;
end

function x = generate_random_symbols(a, distribution, parameter)

    x = zeros(1,a);
    random_number = rand(size(x));
    sum_prob = 0;
    symbol_value = 0;

    while sum(random_number > sum_prob) > 0
        symbol_value = symbol_value + 1;
        x(random_number > sum_prob) = symbol_value;
        sum_prob = sum_prob + feval(distribution, symbol_value, parameter);
    end
end

function Px = distribution_zeta(x, s)

    Px = x.^-s/zeta(s);
end

function code = idcodeword(x,codewords)

symbolnumber=x;


code=codewords(symbolnumber,1:end);

code(isnan(code)) = [];
end

function [codes] = createcodes(max,k)

codewords = [zeros(1,length(de2bi(1+2^k-1))-1-k),fliplr(de2bi(1+2^k-1))];
for l=2:max
   codeword = [zeros(1,length(de2bi(l+2^k-1))-1-k),fliplr(de2bi(l+2^k-1))];
codewords = padconcatenation( codewords,codeword,1);
end

end