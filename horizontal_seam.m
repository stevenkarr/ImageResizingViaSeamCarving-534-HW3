function S = horizontal_seam(I)
% Author: Steven Karr
% Date: 10-9-15
% Class: CS 534, Dyer
% Purpose: calculates the energy image from an RGB image

    % Obtain energy image
    I = imenergy(I);
    
    % Instantiate cumulative energies and sets vals to zeros.
	cEnergy = zeros(size(I, 1), size(I, 2));
    
    % Instantiate vectors matrix and sets vals to zeros.
	Vectors = zeros(size(I, 1), size(I, 2));
	
    % For the first column, there is no previous energy to sum. Therefore,
    % we merely copy the values of the intensity image to the leftmost
    % column of the cumulative energy image.
    for row = 1:size(I, 1)
		cEnergy(row, 1) = I(row, 1);
    end

    % For the remainder, we must search the "up-left", "left", and
    % "down-left" sections of the energy image. The least value is
    % part of the optimal seam's path, so we create a vector for each
    % pixel and add the min pixel to the energy to calculate the cumulative
    % energy at that pixel.
    %
    % Begin building cumulative energy and vector array:
    for col = 2:size(I, 2)
        for row = 1:size(I, 1)
			% Construction of a single cumulative energy / vector value
            % VECTOR CODE: 1 = down left, 0 = left, -1 = up left
			
            % Instantiate vector + cumulative energy values
            vector = 0;
			minEnergy = 0;
		
			% up left
            % Conditional to avoid calling negative index
			if(row > 1)
                % Flags vector as up left
				vector = -1;
                % Sets minEnergy to first value, doesn't need to check yet
				minEnergy = I(row - 1, col - 1);
			end
		
			% left
			if(I(row, col - 1) < minEnergy)
                % Flags vector as left
				vector = 0;
                
				minEnergy = I(row, col - 1);
			end
		
			% down left
			
            % Conditional to avoid calling negative index
			if(row < size(I, 1))
				                
                if(I(row + 1, col - 1) < minEnergy)
                    %Flags vector as down left
                    vector = 1;
                    % Sets minEnergy to new val since met conditional
                    minEnergy = I(row + 1, col - 1);
                end
            end
			
			%Adds results to cumulative energy matrix
			cEnergy(row, col) = I(row, col) + cEnergy(row + vector, col - 1);
			
            %Adds results to vectors array
            Vectors(row, col) = vector;     
        end
    end
    
    % Finds the minimum value at rightmost column of cumulative energy
    tempIndex = 1;
    col = size(I, 2);
    minEnergy = cEnergy(1, col);
    for row = 1:size(I, 1)
        if(cEnergy(row, col) < minEnergy)
            minEnergy = cEnergy(row, col);
            tempIndex = row;
        end
    end
    
    % Construct seam out of vectors array
    S = zeros(1, size(I, 2));
    currIndex = tempIndex;
    for col = size(I, 2):-1:1
        S(col) = currIndex;
        currIndex = currIndex + Vectors(currIndex, col);
    end    
    
    %--Experiment 2
    %saveas(imagesc(I), 'karr.2a.jpg');
    %saveas(imagesc(cumenergies), 'karr.2b.jpg');
end