clear all

%%
%%%%%%%%%%%%%%%%%%%
% This file creates a contour plot of the objective function
% when considering two design variables, x1 and x2
%
% We will make a contour plot of the problem illustrated on page 4
% of the problem description
%%%%%%%%%%%%%%%%%%%

%%
% The meshgrid command returns a set of 2-D grid coordinates that become
% the foundation of the contour plot.
% [X,Y] = meshgrid(x,y)
% x, y represent the bounds on each variable for the plot
% format - lower bound : step size : upper bound
% use 'help meshgrid' for more

[x1,x2] = meshgrid(0:.1:5,0:.1:5);

%%
% This command determines how many rows and columnds are in the design
% variable x1. 
% m is the number of rows
% n is the number of columns

[m,n] = size(x1);


%% 
% For each element of the 2-D grid, we evaluate the objective function
% Store it in F(row,column)

for i = 1:m
    for j = 1:n
        
        F(i,j) = -4*x1(i,j) - x2(i,j) + 50;
        
    end
end

%%
% Now, we can make the contour plot
% The 10 in the last element of the function tells it to plot that many
% different contour levels
%
% use 'help contour' for more information

[c1,h1] = contour(x1,x2,F,10);

%%
% clabel puts contour labels on the graph
% xlabel labels the x-axis
% ylabel labels the y-axis

clabel(c1,h1);
xlabel('x1')
ylabel('x2')

%%
% Now, lets say that we want to define specific contours to plot
% We will show the contours when F = [31, 35, 39, 43, 47]

z = [31 35 39 43 47];

figure
[c2,h2] = contour(x1,x2,F,z);
clabel(c2,h2);
xlabel('x1')
ylabel('x2')
