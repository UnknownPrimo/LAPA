%% ELEC 4700 - PA#4 - Laplace Equation by Iteration PA Assignment
%%
clf;
close all;

%Parameters
%----------
nx = 30; %solution variable nx
ny = 20; %solution variable ny

%Boundary conditions
LB = 1; % Left bound
RB = 0; % Right bound
TB = 0; % Top bound
BB = 0; % Bottom bound

% max number of iterations
max_iterations = 100; 

% Matrix V for as solution variable for nx and ny 
Matrix_V = zeros(nx,ny); 

%Loop through the iterations getting a new solution and resetting the BC's
for j = 1 : max_iterations

    Matrix_V = imboxfilt(Matrix_V,3);
        
        %Loop 
        for ix = 1 : nx
            for iy = 1 : ny

                    %if ix is equal to 1 applie 1 for left bound
                    if ix == 1
                        Matrix_V(ix,iy) = LB;

                     %If iy is equal to nx applie 0 for right bound
                    elseif ix == nx
                        Matrix_V(ix,iy) = RB;

                    %if ix is equal to 1 applie 0 for left bound
                    elseif iy == 1
                        Matrix_V(ix,iy) = TB;

                     %If iy is equal to ny applie 0 for right bound
                    elseif iy == ny
                        Matrix_V(ix,iy) = BB;

                    end
            end

        end

    % Calculate the electric field
    [Ex,Ey] = gradient(Matrix_V);

    % Plot Ex and Ey using surf() and quiver
    figure (1)
    surf(Matrix_V)

    figure (2)
    quiver(Ex,Ey);
    %pause(0.0009)
end             
            
     
        
        