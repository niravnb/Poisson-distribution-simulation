function [ S ] = binomialSamples( N,t,p )
% Generates N Binomial Random Samples with give n and p

S = zeros(N,1);
for i = 1:N    
    k = 0;
    for j = 1:t
        prod = rand;
        if prod >= p   
           k = k+1;
        end
    end
    S(i) = k; 
end



end

