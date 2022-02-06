%% ELEC 4700 - PA#4 - Laplace Equation by Iteration PA Assignment
%%
clf;
close all;

%Parameters
%----------
nx = 30; %solution variable nx
ny = 20; %solution variable ny

LB = 1; % Left bound
RB = 0; % Right bound
TB = 0; % Top bound
BB = 0; % Bottom bound

max_iterations = 100; % max number of iterations

%set velocity to nx and ny 
V_rand = rand (nx,ny); 

%Loop through the iterations getting a new solution and resetting the BC's
for j = 1:  max_iterations

V_rand = imboxfilt(V_rand,3);

    for ix = 1 : nx
        for iy = 1 : ny

                %if ix is equal to 1 applie 1 for left bound
                if ix == 1
                    V_rand(iy,ix) = LB;

                 %If iy is equal to nx applie 0 for right bound
                elseif ix == nx
                    V_rand(ix,iy) = RB;

                end
        end

    end

    % Calculate the electric field
    [Ex,Ey] = gradient(V_rand);

    % Plot Ex and Ey using surf() and quiver
    figure (1)
    surf(V_rand)

    figure (2)
    quiver(Ex,Ey);
    %pause(0.0009)
end             
            
     
        
        