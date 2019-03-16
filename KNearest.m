function nearest_steps = KNearest(LTM, STM, observation_value)
    
    %Get the number of steps from the LTM. (should always be 20).
    steps = size(LTM, 1);
    %Get the number of episodes from LTM. should always be 100.)
    episodes = size(LTM, 3);
   
    %Set the initial K value, although this can be any size we are saying
    %for this project it is 10.
    K = 2;
    
    nearest_steps = [];
    
    %Loop over the amount of episodes.
    for i = 1 : episodes
       %Loop over the amount of steps.
        for j = 1 : steps
            %Calculate the proximity and get the step for the given values.
            [prox, match] = mproximity(LTM, i, j, STM, observation_value);
            %If the proximity is greater than 0.
            if prox > 0
                %Create a new vector based on the match and the proximity.
                step_prox_vector = [match prox;];

                %If the size of nearest steps is larger than our "memory"
                if size(nearest_steps,1) ==  K
                    
                    %Find the smallest proximity
                    [val,Idx] = min(nearest_steps(:,4));
                    %If the current proximity value is greater than the
                    %previous
                    if prox > val
                        %Replace the previous with the new  proximity.
                        nearest_steps(Idx, :) = step_prox_vector;
                    end
                else
                    %Just add the new vector to nearest steps.
                    nearest_steps = [nearest_steps; step_prox_vector];
                end
            end
        end
    end   
end