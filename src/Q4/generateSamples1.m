function [ S ] = generateSamples1( A,N,range )
% Generates N Random Samples 

S = zeros(N,1);
L = A;
for i = 1:N    
    k = 1;
    prod = rand;
    a = 0.4;
    if prod > 0.5  %4970
        prod = 1 - prod;
        a = 0.6;
    end
    
    for j = 2:length(range)
    if prod > range(j-1) && prod < range(j)
        k = j-1;
        break
    end
    end
    

    if a > 0.5
        k = -1*k;
    end
    
    S(i) = k; 
end



end
