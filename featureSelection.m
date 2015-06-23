load('indices.mat');

% Creates an input matrix for each market index
SPmatrix = createInputs(input_indices(:,1));
DAXmatrix = createInputs(input_indices(:,2));
FTSEmatrix = createInputs(input_indices(:,3));
NIKKEImatrix = createInputs(input_indices(:,4));
BOVESPAmatrix = createInputs(input_indices(:,5));
EUmatrix = createInputs(input_indices(:,6));
EMmatrix = createInputs(input_indices(:,7));

% Creates the ISE target vector
ISEvector = target_indices(8:536, 2);

% Creates the matrix containing all performance values
% Each column refers to the specific market index
% The rows refers to the number of neurons
performanceMatrix = zeros(16, 7);

% Fitting market indices
performanceMatrix(:, 1) = fittingIndex(SPmatrix, ISEvector);
performanceMatrix(:, 2) = fittingIndex(DAXmatrix, ISEvector);
performanceMatrix(:, 3) = fittingIndex(FTSEmatrix, ISEvector);
performanceMatrix(:, 4) = fittingIndex(NIKKEImatrix, ISEvector);
performanceMatrix(:, 5) = fittingIndex(BOVESPAmatrix, ISEvector);
performanceMatrix(:, 6) = fittingIndex(EUmatrix, ISEvector);
performanceMatrix(:, 7) = fittingIndex(EMmatrix, ISEvector);

% Create two vectors: one vector containing the minimum performance values
% of each market index and one vector containing the number og neurons
% corresponding to the minimum performance value
minPerformance = zeros(1, 7);
numNeurons = zeros(1, 7);

for i = 1:7
    minPerformance(1, i) = min(performanceMatrix(:, i));
    numNeurons(1, i) = 4 + find(performanceMatrix(:, i) == minPerformance(1, i));
end

bar(minPerformance');

clear i;