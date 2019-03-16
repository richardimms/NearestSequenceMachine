function resultingState = trans(grid,state,action)

    inds = find(grid==state);
    
   [row, col] = ind2sub(size(grid),inds);

    newRow = row;
    newCol = col;

   if action == 1          % Go North
        newRow = row - 1;
    elseif action == 2      % Go East
        newCol = col + 1;
    elseif action == 3      % Go South
        newRow = row + 1;
    elseif action == 4      % Go West
        newCol = col - 1;
    end
   
    % Check for out of bounds. Return original state if so.
    if newCol > 5
        newCol = col;
        % Gone too far east.
    elseif newCol < 1
        newCol = col;
        % Gone too far west.
    end
    if newRow > 3
        newRow = row;
        % Gone too far south.
    elseif newRow < 1
        newRow = row;
        % Gone too far north.
    end
   
    if newRow > 0 && newCol > 0
        resultingState = grid(newRow, newCol);
    else
        resultingState = state;
    end
   
    if resultingState == 0
        resultingState = state;
        % Illegal move.
    end
end
