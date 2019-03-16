function [proximity,match] = mproximity(LTM, episode_index, step_index, STM, observation_value)

    %Initialise proximity to 0.
    proximity = 0.0;

    %Assign the current LTM episode.
    %Find the observation value based on the step index.
    LTM_observation = LTM(step_index,1,episode_index);

    %Initial the count of the LTM's
    LTM_Count = step_index;
    STM_Count = size(STM,1);

    match = [];
    %If the observation value in the LTM matches the current observation
    %value.
    if(LTM_observation == observation_value)
        %Reduce the LTM by one as we wish to compare preceding steps.
        LTM_Count = LTM_Count - 1;

        %Make the match equal the episode and step in LTM.
        match = LTM(step_index,:,episode_index);
        %Initialse the proximity to one as we have found a match.
        proximity = 1.0;
        
        %Change this to a while loop as the LTM step can be different to
        %the STM step. 
        %PREVIOUS WAS A DECREMENTING FOR LOOP - NOT CORRECT AS THE INDEX FOR LTM AND STM CAN BE DIFFERENT.       
        while LTM_Count > 0 && STM_Count > 0
            %If the LTM observation value is the same as the STM
            %observation value then...
           LTM_Obs_Comp = LTM(LTM_Count,1,episode_index);
           STM_Obs_Comp = STM(STM_Count,1);
           LTM_Action_Comp = LTM(LTM_Count,2,episode_index);
           STM_Action_Comp = STM(STM_Count,2);
           
           if(LTM_Obs_Comp == STM_Obs_Comp)
               %If the action value is the same as the STM action value...
                if(LTM_Action_Comp == STM_Action_Comp)
                    %Decrement the counters by 1.
                    LTM_Count = LTM_Count - 1;
                    STM_Count = STM_Count - 1;
                    %Increase the porximity by 1.
                    proximity = proximity + 1;
                else
                    %If no match, break.
                    break;
                end
           else
                %If no match,break.
                break;
           end
        end
    end
    
end
