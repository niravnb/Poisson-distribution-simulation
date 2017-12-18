function [ range ] = CalculateCI( m,N )
% Calculates 95% Confidence Interval of the given data and return it's
% range

range = zeros(2,1);
range(1) = m - 1.96*sqrt(10/N);
range(2) = m + 1.96*sqrt(10/N);



end

