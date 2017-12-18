function [ S ] = poissonSamples( lambda,N )
% Generates N Poisson Random Samples with give mean i.e Lambda

S = zeros(N,1);
L = exp(-lambda);
for i = 1:N    
    k = 0;
    prod = rand;
    while prod >= L   % Repeat until prod is > exp(-lambda)
        prod = prod*rand; % Generate uniform random number u in [0,1] and multiply it with prod
        k = k+1;
    end
    S(i) = k; 
end


% The time between arrivals in a Poisson process is exponentially distributed. 
% Count how many arrivals there are in an interval by simulating 
% the times between arrivals and adding them up until the time sum spills over the interval.

end

