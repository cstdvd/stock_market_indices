function resMatrix = createInputs( inputCol )
%CREATEINPUTS Creates a 529x7 matrix from an 529 long vector
%   Each rows i of the matrix is composed by 7 elements from i to i+6
%   of the input vector. It is used for any market index as predictor.

    resMatrix = zeros(529, 7);
    
    for i = 1:529
        resMatrix(i, :) = inputCol(i:i+6, 1);
    end

end

