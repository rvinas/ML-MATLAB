% gradient_descent.m: Gradient Descent method to solve a linear system of
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

function [x, j, points, directions, errors] = gradient_descent(A, b, x0)
    % -----------------------------------------------------------
    % Solves system Ax=b using the gradient descent method
    % -----------------------------------------------------------
    % Input parameters:
    % A: Coefficient matrix
    % b: Independent terms matrix
    % x0 (optional): Initial point
    % -----------------------------------------------------------
    % Returns:
    % x: Final point (system's solution)
    % j: Number of iterations until convergence
    % points: Sequence of descent points until convergence
    % directions: Set of descent directions along the points
    % errors: l2 norms of residuals
    % -----------------------------------------------------------
    if nargin<3, 
        x0=zeros(length(b),1); % default starting point is coordinate origin
    end
    j=0;
    x=x0;
    r=b-A*x; % residual vector (equivalent to the inverse of the gradient vector, the direction of maximum descent)
    d=r'*r;
    tol=sqrt(eps)*norm(b); % tolerance, we'll stop when l2 norm of errors < tol
    
    % Points and directions are stored for a posterior graphical
    % representation
    points=[];
    directions=[];
    errors=[];
    while sqrt(d)>tol  % convergence criteria
        j=j+1; 
        v=A*r;
        alpha=d/(r'*v); % optimal descent rate
        errors = [errors sqrt(d)];
        points = [points x];
        directions = [directions alpha*r];
        x=x+alpha*r; % descent the hill
        r=r-alpha*v; % update residuals
        d=r'*r;
    end
    j=j+1;
    errors = [errors sqrt(d)];
    points = [points x];
    directions = [directions alpha*r];
end