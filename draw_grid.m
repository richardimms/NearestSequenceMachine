function [grid,observation] = draw_grid()

%Draw the state grid
grid = [7 8 9 10 11;
        4 0 5 0 6;
        1 0 2 0 3];

%Draw the observation grid
observation =   [9 5  1 5 3;
                10 0 10 0 10;
                14 0 14 0 14];
            
     
end 
