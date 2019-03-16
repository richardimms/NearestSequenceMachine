function NSMExperiment()

    %Initialise all arrays/cells.
    total_count = {};
    value_count = [];
    total_mean = [];
    total_std = [];
    
    %Loop over 100 - the amount of experiments.
    for i = 1:100
        %Calculate the step count and store the count in a seperate cell.
        count = NSMTrial(50);
        %Store the count returned from a trial in the cell total_count.
        total_count{i} = count;
    end 
    
    %Loop over the amount of episodes
    for i = 1:50
        %Loop over the amount of experiments
        for j = 1:100
            %Create a temp array value containing the experiment.
            temp_array = total_count{j};
            %Create a temp_value containing the i value from that trial.
            temp_value = temp_array(i);
            %Store the temporary value in an array.
            value_count = [value_count;temp_value];
        end 
        %Find the mean over all of the values within the array and store
        %that in another array.
        total_mean = [total_mean;mean(value_count)]; 
        %Same with standard deviation.
        total_std = [total_std;std(value_count)];
        %Set the value_count value back to empty.
        value_count = [];
    end    
    
     %Plot the shadedError bar of the mean and standard deviation.
    figure(1);hold on;
    shadedErrorBar([],total_mean,total_std);
    xlabel('Episode Number');
    ylabel('Number of Steps');
    title('Mean and Standard deviation of NSM');
    legend('Standard Deviation','Mean');
    figure(2);hold on;
    plot(total_count{1});
    xlabel('Number of Episode');
    ylabel('Number of steps');
    title('NSM Performance Improvement');
    legend('Steps');


end 
