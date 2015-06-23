load('indices.mat');

% Divide the market indices and the targets into three periods,
% respectevely, for Training, Testing and Checking
% The chosen indices are the same of the first part of the project
% (SP, DAX, FTSE, BOVESPA). The last column in each period matrix
% contains the ISE100 values

trainPeriod = zeros(178, 5);
trainPeriod(:, 1:3) = input_indices(1:178, 1:3);
trainPeriod(:, 4) = input_indices(1:178, 5);
trainPeriod(:, 5) = target_indices(1:178, 2);

testPeriod = zeros(179, 5);
testPeriod(:, 1:3) = input_indices(179:357, 1:3);
testPeriod(:, 4) = input_indices(179:357, 5);
testPeriod(:, 5) = target_indices(179:357, 2);

checkPeriod = zeros(179, 5);
checkPeriod(:, 1:3) = input_indices(358:536, 1:3);
checkPeriod(:, 4) = input_indices(358:536, 5);
checkPeriod(:, 5) = target_indices(358:536, 2);