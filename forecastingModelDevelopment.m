load('indices.mat');

% The data is divided in two periods (estimation and forecasting),
% both of lenght 268 (half of the total period)

% Create a matrix containing the estimation period values of the chosen
% market indices (SP, DAX, FTSE, BOVESPA)
estimationMatrix = zeros(268, 4);
estimationMatrix(:, 1) = input_indices(1:268, 1);
estimationMatrix(:, 2) = input_indices(1:268, 2);
estimationMatrix(:, 3) = input_indices(1:268, 3);
estimationMatrix(:, 4) = input_indices(1:268, 5);

% Create a matrix containing the forecasting period values
forecastingMatrix = zeros(268, 4);
forecastingMatrix(:, 1) = input_indices(269:536, 1);
forecastingMatrix(:, 2) = input_indices(269:536, 2);
forecastingMatrix(:, 3) = input_indices(269:536, 3);
forecastingMatrix(:, 4) = input_indices(269:536, 5);

% Create the target vector
estimationTargets = target_indices(1:268, 2);
forecastingTargets = target_indices(269:536, 2);

% Save workspace
save('tempWork.mat');

% Set the options for the Genetic Algorithm
fitnessFun = @fitnessIndex;
numVar = 2;
option = gaoptimset('PopulationSize',50,'CrossoverFraction',0.8,'Generations',30);
LB = [1 1];
UB = [30 30];
IntCon = [1 2];

% Run Genetic Algorithm
[cr,fval,exitflag] = ga(fitnessFun,numVar,[],[],[],[],LB,UB,[],IntCon,option);
disp('Input and Output delays:');
disp(cr);
disp('Best error with the previous delays:');
disp(fval);

% Function 'perform()' called in 'fitnessIndex()' returns the MSE
[MSE, MAPE, perc] = fitnessIndexCrom(cr);
disp('Estimation period:');
fprintf('\tMSE: %f\n',MSE);
fprintf('\tMAPE: %f\n',MAPE);
fprintf('\tPercentage: %f%%\n\n',perc);

% Use the data of the forecasting period to evaluate the out-of-sample
% forecasting performance.
closeLoopOutput = functionCloseLoop(max(cr));

delete 'tempWork.mat';