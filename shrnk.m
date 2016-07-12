function J = shrnk(I, num_rows_removed, num_cols_removed)
% Author: Steven Karr
% Date: 10-9-15
% Class: CS 534, Dyer
% Purpose: Shrinks an image using seam carving

    % Temp image
    J = I;
        
    % Sequentially removed the passed amount of seams
    for x = 1:num_rows_removed
        S = horizontal_seam(J);
        J = uint8(remove_horizontal_seam(J, S));
    end
    
    % Flips image, will now remove vertical seams
    J = permute(J, [2 1 3]);
    
    % Sequentially removed the passed amount of seams
    for x = 1:num_cols_removed
        S = horizontal_seam(J);
        J = uint8(remove_horizontal_seam(J, S));
    end
    
    % Flips image back
    J = permute(J, [2 1 3]);
end

