A = 3/pi^2;
NSet = [10 100 1000 10000];


iteration = 10000;
meansforN10 = zeros(iteration,1);
meansforN100 = zeros(iteration,1);
meansforN1000 = zeros(iteration,1);
meansforN10000 = zeros(iteration,1);



%% Generating PMF & CDF

srange = -100:1:100;
srange(101) = [];
pmfofsrange = calculatepmf(srange,A);


pmfprange = pmfofsrange(101:end);
cpmfprange = cumsum(pmfprange);
cpmfprange = [ 0; cpmfprange];

pmfnrange = pmfofsrange(1:100);
cpmfnrange = cumsum(pmfnrange);


%% Plotting Histogram

for i = 1:iteration
   samples = generateSamples1(A,NSet(1),cpmfprange);
    meansforN10(i) = sum(samples)/length(samples);
end

histogram(meansforN10,1000);
title(['Histogram of Sample Mean for N = ',num2str(NSet(1))]);
xlabel('Sample Mean'); ylabel('Frequency of Sample Mean');
set(gca,'FontSize',14,'FontWeight','bold')
print('-djpeg', ['Histogram_N_',num2str(NSet(1)),'.jpg'], '-r300');
close all;


for i = 1:iteration
    samples = generateSamples1(A,NSet(2),cpmfprange);
    meansforN100(i) = sum(samples)/length(samples);
end

histogram(meansforN100,1000);
title(['Histogram of Sample Mean for N = ',num2str(NSet(2))]);
xlabel('Sample Mean'); ylabel('Frequency of Sample Mean');
set(gca,'FontSize',14,'FontWeight','bold')
print('-djpeg', ['Histogram_N_',num2str(NSet(2)),'.jpg'], '-r300');
close all;


for i = 1:iteration
    samples = generateSamples1(A,NSet(3),cpmfprange);
    meansforN1000(i) = sum(samples)/length(samples);
end

histogram(meansforN1000,1000);
title(['Histogram of Sample Mean for N = ',num2str(NSet(3))]);
xlabel('Sample Mean'); ylabel('Frequency of Sample Mean');
set(gca,'FontSize',14,'FontWeight','bold')
print('-djpeg', ['4Histogram_N_',num2str(NSet(3)),'.jpg'], '-r300');
close all;


for i = 1:iteration
    samples = generateSamples1(A,NSet(4),cpmfprange);
    meansforN10000(i) = sum(samples)/length(samples);
end

histogram(meansforN10000,1000);
title(['Histogram of Sample Mean for N = ',num2str(NSet(4))]);
xlabel('Sample Mean'); ylabel('Frequency of Sample Mean');
set(gca,'FontSize',14,'FontWeight','bold')
print('-djpeg', ['4Histogram_N_',num2str(NSet(4)),'.jpg'], '-r300');
close all;

%% Confidence Interval

rangeforN10 = CalculateCI(mean(meansforN10),10,A);
rangeforN100 = CalculateCI(mean(meansforN100),100,A);
rangeforN1000 = CalculateCI(mean(meansforN1000),1000,A);
rangeforN10000 = CalculateCI(mean(meansforN10000),10000,A);

%% Counting number of times means fall outside CI
rangeforN1000(1) = -0.5;
rangeforN1000(2) = 0.5;
rangeforN10000(1) = -0.155;
rangeforN10000(2) = 0.155;


countCIforN10 = sum(meansforN10<rangeforN10(1) | meansforN10>rangeforN10(2));
countCIforN100 = sum(meansforN100<rangeforN100(1) | meansforN100>rangeforN100(2));
countCIforN1000 = sum(meansforN1000<rangeforN1000(1) | meansforN1000>rangeforN1000(2));
countCIforN10000 = sum(meansforN10000<rangeforN10000(1) | meansforN10000>rangeforN10000(2));

%
outsideCIforN10 = countCIforN10/100;
outsideCIforN100 = countCIforN100/100;
outsideCIforN1000 = countCIforN1000/100;
outsideCIforN10000 = countCIforN10000/100;
%% Extra

pmf = calculatepmf(samples,A);
scatter(samples,pmf,'filled')
title(['PMF of Samples']);
xlabel('k'); ylabel('P(X = k)');
set(gca,'FontSize',14,'FontWeight','bold')
print('-djpeg', ['PMF_4.jpg'], '-r300');
close all;



%

