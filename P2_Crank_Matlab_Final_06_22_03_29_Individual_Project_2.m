% MAE 208 (004)
% Project-2-Individual-Crank_Grady_Fort.M
% 22-03-31
% Grady Fort
% gefort@ncsu.edu


% 0 x bounds
    % old: .3:.1:11
    % new 1747: .5:.1:11
% 0 y bounds
    % 2.5:1:26
% 0 z bounds (absolute)

clc; clear;

%%%%%%%%%%%%%%%%%%%
% This code maximizes the speed of a slider crank system when \theta is 40 \degrees 
% code based on contour_example.m written by Professor Scott Fergusson
%%%%%%%%%%%%%%%%%%%

%%
% The meshgrid command returns a set of 2-D grid coordinates that become
% the foundation of the contour plot.
% [X,Y] = meshgrid(x,y)
% x, y represent the bounds on each variable for the plot
% format - lower bound : step size : upper bound
% use 'help meshgrid' for more

%[r,L] = meshgrid(.5:.1:11,2.5:1:26);
[r,L] = meshgrid(.3:.1:11,2.5:1:26);

%%
% This command determines how many rows and columns are in the design
% variable r. 
% m is the number of rows
% n is the number of columns

[m,n] = size(r);


%% 
% For each element of the 2-D grid, we evaluate the objective function
% Store it in F(row,column)

for i = 1:m
    for j = 1:n
        % F(i,j) = -((r(i,j))^2*theta*cos(theta)*sin(theta))/...
        % sqrt((l(i,j))^2-r^2*sin(theta)^2)-omega*r(i,j)*theta*sin(theta);
        f = -r(i,j)*70*sind(40) - (r(i,j)*sind(40).*r(i,j)*70*cosd(40))/...
            (sqrt(L(i,j).^2 - (r(i,j)*sind(40)).^2));
        if isreal(f)
            F(i,j) = f;
        end
    end
end

%%
% Now, we can make the contour plot
% The 10 in the last element of the function tells it to plot that many
% different contour levels
%
% use 'help contour' for more information

% [c1,h1] = contour(r,l,F,10);

%%
% clabel puts contour labels on the graph
% xlabel labels the x-axis
% ylabel labels the y-axis

% clabel(c1,h1);
% xlabel('r')
% ylabel('L')

%%
% Now, lets say that we want to define specific contours to plot

z = [100 200 300 400 500 600 700 800];

figure
[c2,h2] = contour(r,L,abs(F),z);
clabel(c2,h2);
xlabel('r')
ylabel('L')
%0.5≤𝑟≤10 and 2.5≤𝑙≤25
xline(0.5)
xline(10)
yline(25)
%2.5 not plotting
yline(2.5)
%𝑙≥2.5𝑟
%just multiply



% solve
%{
From 
% r1 = (11
r1 = .3:.1:11
LL = sqrt((10-r1.*cosd(40)).^2 + (r1.*sind(40)).^2);
LU = sqrt((20-r1.*cosd(40)).^2 + (r1.*sind(40)).^2);
.3:.1:11

%}
r1 = .3:.1:11;
LL = sqrt((10-r1.*cosd(40)).^2 + (r1.*sind(40)).^2);
LU = sqrt((20-r1.*cosd(40)).^2 + (r1.*sind(40)).^2);
line(r1,LL)
line(r1,LU,'Color','red')
S = 2.5*r1;
line(r1,S,'Color','magenta')