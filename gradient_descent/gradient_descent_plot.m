% gradient_descent_plot.m: Gradient Descent plot solving a linear system of
% equations
% Copyright 2017 Ramon Vinas
% 
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
% 
%    http://www.apache.org/licenses/LICENSE-2.0
% 
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.

% Define 2-dimensional space
x=-8:0.2:10;
y=-8:0.2:6;
[X,Y]=meshgrid(x,y);

% Define linear system of equations Ax+b=0
A = [3 2; 2 6];
b = [2; -8];
% Q is the convex function that we need to minimize in order to solve the
% linear system of equations. See: https://ocw.mit.edu/courses/mathematics/18-409-topics-in-theoretical-computer-science-an-algorithmists-toolkit-fall-2009/lecture-notes/MIT18_409F09_scribe21.pdf
Q = 1/2 * ((3*X + 2*Y).*X + (2*X+6*Y).*Y) - (2*X-8*Y);

% Plot contour plot
contour(X, Y, Q, 20, 'LineWidth', 2);
c = colorbar;
c.Label.String = 'Loss';
hold on;

% Perform gradient descent and obtain the intermediate points and
% directions along the descent
[x, j, points, directions, errors] = gradient_descent(A, b, [-8; 6]);

% Plot points and directions
q = quiver(points(1,:), points(2,:), directions(1,:), directions(2,:));
q.AutoScale = 'off';
q.LineWidth = 1.5;
q.Color = 'red';

% Title and labels
title('Gradient descent');
xlabel('w_1');
ylabel('w_2');
