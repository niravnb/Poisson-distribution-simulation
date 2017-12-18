function y =  calculatepmf(x,A)
% Calculates PMF P(X=x) for each sample in X

    y = zeros(length(x),1);
    for i = 1:length(x)
        y(i) = A/x(i)^2;
    end

end
