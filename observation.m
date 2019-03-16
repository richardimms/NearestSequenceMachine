function return_state = observation(grid,row,col)

        if(grid(row,col)) == 0
            return_state = 0;
        else
            return_state = grid(row,col);
        end

end