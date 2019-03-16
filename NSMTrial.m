function [step_count, LTM] = NSMTrial(episode_count)
    
    %Initialise the Long Term Memory.
    LTM = [];
    episode_count = 50;

    %Step Count initialisation.
    step_count = zeros(episode_count, 1);
    %Loop over the number of episodes.
    for i = 1 : episode_count
       %Get the episode count from the previous LTM.
       [steps, episode] = NSMEpisode(LTM);
       %Add to new LTM.
       LTM = cat(3, LTM, episode);
       %Count the amount of steps.
       step_count(i, 1) = steps;
    end
end