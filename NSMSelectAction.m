function action = NSMSelectAction(LTM, STM, observed)

exploreRate = 0.1;

if(isempty(LTM) ~= 1 )
    
    if rand >= exploreRate 
        
        means = zeros(4,2);
        
        nearest = KNearest(LTM, STM, observed);
        
        if (isempty(nearest) ~= 1)

            %Loop through all nearest and add up rewards and action occurences
            for stepInd = 1:size(nearest, 1)
                action = nearest(stepInd, 2);
                means(action, :) = [means(action, 1) + nearest(stepInd, 3), means(action, 2) + 1];
            end
            
            % Calculate reward means by dividing
            % summed rewards by action counts
            for j = 1:4
                means(j, 1) = means(j, 1) / means(j, 2);
            end
            
            if size(means(means(:,1) ~= 0)) > 0   % if any of the means are not zero
                [~, action] = max(means(:, 1)); % find the max mean action
            else
                action = randi(4); % No max means so explore
            end
        else
            action = randi(4); % No max means so explore
        end
    else
        action = randi(4); % Explore
    end
else
    action = randi(4);
end

end