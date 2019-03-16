function [steps_taken,return_episodes] = randEpisode()

    %Draw the grid.
    [grid,observation_grid] = draw_grid();
    %Choose an initial starting state
    
    state = randStartState();
    
    episode = [];
    
    chosen_state  = 0;
    
    steps_taken = 0;
    %Choose a random action to take
    
    while (state ~=2) 
        %Take a random action
        action = randi(4);
        
        %Using the state/action pair take the transition
        [chosen_state,row,col] = transition(grid,state,action);

        if(chosen_state == 0)
            while(chosen_state == 0)
                %Take a new random action
                action = randi(4);
                %Using the state/action pair take the transition
                [chosen_state,row,col] = transition(grid,state,action);
            end
            %Make sure the state is the chosen state.
            state = chosen_state;
        else
            %Make sure that the state is the chosen state.
            state = chosen_state;
        end
        
        %Pass observation the row and column from the desired state.
        obs = observation(observation_grid,row,col);
        %Add an episode to the list of episodes.
        episode = [episode;obs,action,1.0];
        steps_taken = steps_taken + 1;
    end
    
    %Make the last value (state 2) equal 10.
    episode(end,3) = 10;
    %Decrement from the end of the matrix to the begining
    
    for k=size(episode,1):-1:1
        %Ignore the index with discounted rate as 10.
        if(episode(k,3) ~= 10)
        %Decrement each one by 0.9.
            episode(k,3) = episode(k+1,3) - 0.9;
        end
    end

    %If the length of the episode is 20 or greater
    if(length(episode) >= 20)
        %Return only the last 20 results.
        return_episodes = episode(end-19:end,:,:);
    else
        %Append zeroes to the matrix until it is 20 long.
        while(length(episode) < 20)
            episode = [0,0,0;episode];
        end
        return_episodes = episode;
    end
end