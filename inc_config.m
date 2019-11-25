config=struct;

config.loc_max=360; % 360 degrees is a periodic space - DO NOT EDIT

config.n_clr=8; % Number of colours used (circular)
config.n_loc=config.loc_max; % Number of spatial locations used (circular)

config.SS=[1, 2, 4, 6, 8]; % Set size

% Colour
stp=ceil(config.loc_max/config.n_clr - 0.5); % Step for picking colours
config.Clr=stp:stp:config.loc_max; % Colours
clear stp;

% Spacial location
config.loc_min_dst=20; % Minimum distance between locations
stp=ceil(config.loc_max/config.n_loc - 0.5); % Step for picking locations
config.Loc=stp:stp:config.loc_max; % Spatial locations
clear stp;

% Model 4, chunking
config.chunk_dst=90; % Distance for chunking, i.e. group items within this span

config.n_trl=1000; % Number of trials for each condition
config.k=3; % Capacity
