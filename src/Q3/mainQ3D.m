lambda = 10;
NSet = [10 100 1000 10000];
n = [15 30 50 100];
p = lambda./n;

iteration = 10000;
meansforN10 = zeros(iteration,1);
meansforN100 = zeros(iteration,1);
meansforN1000 = zeros(iteration,1);
meansforN10000 = zeros(iteration,1);




for i = 1:iteration
   samples = binomialSamples(NSet(1),n(1),p(1));
    meansforN10(i) = sum(samples)/length(samples);
end

histogram(meansforN10,1000);
title(['Histogram of Sample Mean for N = ',num2str(NSet(1))]);
% axis([7 13 0 400]);
xlabel('Sample Mean'); ylabel('Frequency of Sample Mean');
set(gca,'FontSize',14,'FontWeight','bold')
print('-djpeg', ['BHistogram_N_',num2str(NSet(1)),'.jpg'], '-r300');
close all;


for i = 1:iteration
     samples = binomialSamples(NSet(2),n(1),p(1));
    meansforN100(i) = sum(samples)/length(samples);
end

histogram(meansforN100,1000);
title(['Histogram of Sample Mean for N = ',num2str(NSet(2))]);
% axis([7 13 0 400]);
xlabel('Sample Mean'); ylabel('Frequency of Sample Mean');
set(gca,'FontSize',14,'FontWeight','bold')
print('-djpeg', ['BHistogram_N_',num2str(NSet(2)),'.jpg'], '-r300');
close all;


for i = 1:iteration
     samples = binomialSamples(NSet(3),n(1),p(1));
    meansforN1000(i) = sum(samples)/length(samples);
end

histogram(meansforN1000,1000);
title(['Histogram of Sample Mean for N = ',num2str(NSet(3))]);
% axis([7 13 0 400]);
xlabel('Sample Mean'); ylabel('Frequency of Sample Mean');
set(gca,'FontSize',14,'FontWeight','bold')
print('-djpeg', ['BHistogram_N_',num2str(NSet(3)),'.jpg'], '-r300');
close all;


for i = 1:iteration
    samples = binomialSamples(NSet(4),n(1),p(1));
    meansforN10000(i) = sum(samples)/length(samples);
end

histogram(meansforN10000,1000);
title(['Histogram of Sample Mean for N = ',num2str(NSet(4))]);
% axis([7 13 0 400]); 
xlabel('Sample Mean'); ylabel('Frequency of Sample Mean');
set(gca,'FontSize',14,'FontWeight','bold')
print('-djpeg', ['BHistogram_N_',num2str(NSet(4)),'.jpg'], '-r300');
close all;

%% Count of mean falling in given interval

lowerbound = 9.99;
upperbound = 10.01;

countforN10 = sum(meansforN10>=lowerbound & meansforN10<=upperbound);
countforN100 = sum(meansforN100>=lowerbound & meansforN100<=upperbound);
countforN1000 = sum(meansforN1000>=lowerbound & meansforN1000<=upperbound);
countforN10000 = sum(meansforN10000>=lowerbound & meansforN10000<=upperbound);

%


lowerbound1 = 9.9;
upperbound1 = 10.1;

count1forN10 = sum(meansforN10>=lowerbound1 & meansforN10<=upperbound1);
count1forN100 = sum(meansforN100>=lowerbound1 & meansforN100<=upperbound1);
count1forN1000 = sum(meansforN1000>=lowerbound1 & meansforN1000<=upperbound1);
count1forN10000 = sum(meansforN10000>=lowerbound1 & meansforN10000<=upperbound1);



%% Confidence Interval

CICountforN10 = 0;
CICountforN100 = 0;
CICountforN1000 = 0;
CICountforN10000 = 0;

for i = 1:length(meansforN10)
   rangeforN10 = CalculateCI(meansforN10(i),10);
  if rangeforN10(1)>10 || rangeforN10(2)<10
      CICountforN10 = CICountforN10 + 1;
  end  
end


for i = 1:length(meansforN100)
   rangeforN100 = CalculateCI(meansforN100(i),100);
  if rangeforN100(1)>10 || rangeforN100(2)<10
      CICountforN100 = CICountforN100 + 1;
  end  
end

for i = 1:length(meansforN1000)
   rangeforN1000 = CalculateCI(meansforN1000(i),1000);
  if rangeforN1000(1)>10 || rangeforN1000(2)<10
      CICountforN1000 = CICountforN1000 + 1;
  end  
end

for i = 1:length(meansforN10000)
   rangeforN10000 = CalculateCI(meansforN10000(i),10000);
  if rangeforN10000(1)>10 || rangeforN10000(2)<10
      CICountforN10000 = CICountforN10000 + 1;
  end  
end


    
   
%% Counting number of times means fall outside CI

rangeforN10 = CalculateCI(mean(meansforN10),10);
rangeforN100 = CalculateCI(mean(meansforN100),100);
rangeforN1000 = CalculateCI(mean(meansforN1000),1000);
rangeforN10000 = CalculateCI(mean(meansforN10000),10000);


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


samples = binornd(n(1),p(1),100,1)
pmf = poissonpmf(samples,p(1),n(1));
scatter(samples,pmf,'filled')
 title(['PMF of Binomial Samples for n = 15 and p = 0.67']);
xlabel('k'); ylabel('P(X = k)');
set(gca,'FontSize',14,'FontWeight','bold')
print('-djpeg', ['PMF_Binomial.jpg'], '-r300');
close all;




