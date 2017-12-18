function y =  poissonpmf(x,p,n)
% Calculates Poisson PMF P(X=x) for each sample in X

    y = zeros(length(x),1);
    for i = 1:length(x)
        y(i) = nchoosek(n,x(i))*p.^x(i)*(1-p).^(n-x(i));
    end

end
