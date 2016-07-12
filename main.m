% File: main.m
% Purpose: Driver for image resizing using seam carving
% Dependencies: imenergy.m, horizontal_seam.m, remove_horizontal_seam.m,
% shrnk.m
%
% Author: Steven Karr
% Class: CS 534
% Date: 10-9-15

% Read in an image
I = imread('union-terrace.jpg'); 

% Numbers of rows and columens to remove from I
rows_removed = 100;
cols_removed = 100;

% Obtains shrinked image (by removing seams)
J = shrnk(I, rows_removed, cols_removed)

% Casts to uint8
J = uint8(J);

% Displays resultant image
imshow(J);

%--Experiment 1
%imwrite(uint8(shrnk(I, 0, 100)),'karr.1a.jpg','jpg');
%imwrite(uint8(shrnk(I, 100, 0)),'karr.1b.jpg','jpg');
%imwrite(uint8(shrnk(I, 100, 100)),'karr.1c.jpg','jpg');

%--Experiment 2
%Changes to code located in horizontal_seam.m L67-69

%--Experiment 3
%Changes to code located in remove_horizontal_seam.m L5,L14-17

%--Experiment 4
% I = imread('karr.4a.jpg'); 
% I = uint8(shrnk(I, 0, 150));
%imwrite(I, 'karr.4b.jpg', 'jpg');

%--Experiment 5
% I = imread('karr.5a.jpg'); 
% I = uint8(shrnk(I, 100, 100));
%imwrite(I, 'karr.5b.jpg', 'jpg');

% end