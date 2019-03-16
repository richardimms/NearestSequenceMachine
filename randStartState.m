function rand_state =  randStartState()

    %Choose a random integer between 1-11.
    rand_int = randi(11);
    %If the random integer is 0 (non state) or 2 (reward state)
    %Find a new random starting state.
    while(rand_int == 0 || rand_int == 2)
        rand_int = randi(11);
    end
    %Return the chosen random state.
    rand_state = rand_int;


end