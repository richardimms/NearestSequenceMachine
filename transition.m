function [new_state] = transition(grid,state,action)

inds = find(grid==state);

[row, col] = ind2sub(size(grid),inds);

%Given the initial state and some action (north,south,east,west) what state
%Do I end up in.
if state ~= 0
        if(action == 1)
            %North
            row = row - 1;
        elseif(action == 2)
            %East
            col = col + 1;
        elseif(action == 3)
            %South
            row = row + 1;
        elseif(action == 4)
            %West
            col = col - 1;
        end
else
    row = 0;
    col = 0;
end

    if row > 3 || col < 1 ||  col > 5 || row < 1
        %Ensure that the value being returned isn't 0
        new_state = 0;
    else
        if(grid(row,col)) == 0
            new_state = 0;
        else
            new_state = grid(row,col);
        end
    end


end