function J = remove_horizontal_seam(I, S)
% Author: Steven Karr
% Date: 10-9-15
% Class: CS 534, Dyer
% Purpose: Removes passed seam from image

    % Temp image, set to zeros
    J = zeros(size(I, 1) - 1, size(I, 2), 3);
    
    %--Experiment 3 (change 1 of 2)
    %J = zeros(size(I, 1), size(I, 2), 3);
  
    % Copies values except for those at the seam
    
    % Copies values below the seam
    for col = 1:size(I, 2)             
        for row = 1:S(col) - 1
            J(row, col, 1) = I(row, col, 1);
            J(row, col, 2) = I(row, col, 2);
            J(row, col, 3) = I(row, col, 3);
        end
        
        %--Experiment 3 (change 2 of 2)
        %J(row, col, 1) = 255;
        %J(row, col, 2) = 0;
        %J(row, col, 3) = 0;
          
        %Copies the values above the seam
        for row = S(col) + 1:size(I, 1)
            J(row - 1, col, 1) = I(row, col, 1);
            J(row - 1, col, 2) = I(row, col, 2);
            J(row - 1, col, 3) = I(row, col, 3);            
        end
    end    
end

