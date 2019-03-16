function [step_taken,LTM] =  rndTrials(N)

step_taken = [];
LTM = [];

%Long term memory should be made up of random episodes...
%By calling the rndEpisode function you have implemented.

    for i = 1 : N
        [steps,episode] = randEpisode();   
        LTM=cat(3,LTM,episode);
        step_taken = [step_taken;steps];
    end
    
end