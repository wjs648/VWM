% Starting point of location report simulations.
clear;
inc_config;

PDs={}; % collection of distribution results across parameter space
for j = 10:2:20 % vary minimum distance between items across epochs
    config.loc_min_dist=j;
    
    % For convenience ...
    n_ssz=length(config.SS); % Number of set sizes
    n_mdl=4; % Number of models
    n_bin=40; % Number of bins for histograms
    
    if max(config.SS)*(2*config.loc_min_dst+1) > config.n_loc
        disp('Minimum distance is too large for the largest set size ... bailing out ...');
        return;
    end
    
    [S,P,R1,R2,R3,R4]=func_run_simulations(config);
    
    D1=func_get_distance_periodic(config,R1,P);
    D2=func_get_distance_periodic(config,R2,P);
    D3=func_get_distance_periodic(config,R3,P);
    D4=func_get_distance_periodic(config,R4,P);
    
    DD={D1,D2,D3,D4};
    
    PDs(end+1, :) = {DD, j}; %append the distance distribution and the parameters to PDs
    
    func_generate_figs(DD, n_ssz, n_mdl, n_bin, config, S, P, R3);
end
