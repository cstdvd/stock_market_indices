function indexPerformance = fittingIndex(inputMatrix, targetVector)

% Solve an Input-Output Fitting problem with a Neural Network
% Script generated by NFTOOL
% Created Fri Jul 04 16:52:04 CEST 2014

    inputs = inputMatrix';
    targets = targetVector';
    
    indexPerformance = zeros(16, 1);

    % Repeat the procedure with variable number of neurons
    for hiddenLayerSize = 5:20
    % Create a Fitting Network
        net = fitnet(hiddenLayerSize);


        % Setup Division of Data for Training, Validation, Testing
        net.divideParam.trainRatio = 70/100;
        net.divideParam.valRatio = 15/100;
        net.divideParam.testRatio = 15/100;

        avgPerf = 0;
        
        % Train the network ten times and evaluate the average value
        for i = 1:10
        % Train the Network
            [net,tr] = train(net,inputs,targets);

            % Test the Network
            outputs = net(inputs);
            errors = gsubtract(targets,outputs);
            performance = perform(net,targets,outputs);
            avgPerf = avgPerf + performance;
        end
        
        avgPerf = avgPerf / 10;
        indexPerformance(hiddenLayerSize - 4, 1) = avgPerf;
        
        % View the Network
        %view(net)

    end

    % Plots
    % Uncomment these lines to enable various plots.
    %figure, plotperform(tr)
    %figure, plottrainstate(tr)
    %figure, plotfit(net,inputs,targets)
    %figure, plotregression(targets,outputs)
    %figure, ploterrhist(errors)

end