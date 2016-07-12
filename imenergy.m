function E = imenergy(I)
% Author: Steven Karr
% Date: 10-9-15
% Class: CS 534, Dyer
% Purpose: calculates the energy image from an RGB image

    % Converts image to double
    dblI = im2double(I);
    
    % Converts image to grayscale
	gI = rgb2gray(dblI);
    
    % Uses MATLAB function imgradient() to calculate energy image
	[Gmag, Gdir] = imgradient(gI);
    
    % Returns result
    E = Gmag;
end

