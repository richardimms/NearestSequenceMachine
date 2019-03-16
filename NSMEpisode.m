function [numSteps, episode] = NSMEpisode(LTM)
    
    %Draw the state grid and observation grid.
    [grid,observation_grid] = draw_grid();
    %Take a random start state.
    state = randStartState();

    %Initialise Variables.
    episode = [];
    numSteps = 0;
    % While not the goal state.
    while state ~= 2
       
        %Find the observation value based on the index in the grid of the
        %state plus the row and column it is found.
        inds = find(grid==state);
        [row, col] = ind2sub(size(grid),inds);
        obs = observation_grid(row,col);
       
        %If the length of the episodes >= 20 take only the first 20 rows.
        %Ensure that only the first 20 rows will be used for STM.
        previous_state = state;
        
        action = NSMSelectAction(LTM, episode, obs);
 

        %Check the chosen state from the transition...
        chosen_state = transition(grid,state,action);
       
        %If the chosen state is 0 an illegal move, then state will equal
        %the previous state.
        if(chosen_state == 0)
           state = previous_state;
        else
            %When out of the loop and the checks have been completed set state
            %to equal the chosen state.
            %Record the observation, action and discounted reward.
            episode = [episode;obs,action,1.0];
            %Update the number of steps taken by 1.
            numSteps = numSteps + 1;
            state = chosen_state;
        end
    end
    
    %Make the last episode of the STM have a discounted reward of 10.
    episode(end,3) = 10;

    
    %Append zeroes to the matrix until it is 20 long.
    while(size(episode,1) <= 20)
       episode = [0,0,0;episode];
    end
    
    %Decrement from end to begining - 0.9.
    for k=size(episode,1):-1:1
        %Ignore the index with discounted rate as 10.
        if(episode(k,3) ~= 10)
        %Decrement each one by 0.9.
            episode(k,3) = episode(k+1,3) * 0.9;
        end
    end
    
    
    %Return just the last 20 episodes.
    episode = episode(end-19:end,:,:);
end