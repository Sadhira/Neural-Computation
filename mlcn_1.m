% MLCN

load hospital

h1 = hospital(1:10, :);
h2 = hospital(:,{'LastName' 'Age' 'Sex' 'Smoker'});

hospital.Properties.Description
hospital.Properties.VarNames{4} = 'Wgt';

hospital.AtRisk = hospital.Smoker | (hospital.Age > 40)

boxplot(hospital.Age, hospital.Sex)

h3 = hospital(hospital.Age < 30, {'LastName' 'Age' 'Sex' 'Smoker'})
h4 = sortrows(hospital, {'Sex', 'Age'}) %sorts based on two variables

%% 1

wgtMean = mean(hospital.Wgt)
wgtStd = std(hospital.Wgt)
wgtMedian = median(hospital.Wgt)

% predictions:
% in a histogram, there would be a skew of the peak to the right
% the distribution would be fairly narrow?

%% 2

hist(hospital.Wgt)

% evalutation of predictions:
% correct about the peak shift
% note that there are two completely different peaks for the two genders

%% 3

figure(3)
    
subplot(1,3,1)
hist(hospital.Wgt, 20)
title('n=20')

subplot(1,3,2)
hist(hospital.Wgt, 40)
title('n=40')

subplot(1,3,3)
hist(hospital.Wgt, 6)
title('n=6')

% 20 and 6 are interestingly both reasonable bin sizes, though 20 is best

%% 4

% [N,X] = hist(hospital.age, locationOfBinsVector)

range(hospital.Wgt)    % = 91
min(hospital.Wgt)      % = 111
max(hospital.Wgt)      % = 202

% good bin count =~ 20, and 90/20 = 4.5 -> bin size of 5

figure(3)
binRangeWgt = 110:5:205;
hist(hospital.Wgt, binRangeWgt)


figure(4)
[countsWgt, centersWgt] = hist(hospital.Wgt, binRangeWgt)

samples = 100;
pWgt = countsWgt / samples

plot(centersWgt, pWgt)
ylabel('Probability')
xlabel('Weight')

pTotal = sum(pWgt)

%% 5

% p(A|B) = P(A and B) / p(B)

WgtAndSmk = hospital.Wgt(hospital.Smoker == 1)
WgtAndNonSmk = hospital.Wgt(hospital.Smoker == 0)
WgtAndFem =  hospital.Wgt(hospital.Sex == 'Female')
WgtAndMle =  hospital.Wgt(hospital.Sex == 'Male')

length(WgtAndSmk);    % = 34

locationOfBins = [0:5:250];
nWeights = hist(hospital.Weight, l

%34/20 = 1.7 -> 2
% binRangeWgtSmk = 



















