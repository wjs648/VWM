function [loc,Loc_spc] = func_get_locations_periodic(c,ss)
%func_get_locations_periodic Return ss locations, where ss is the set size
%   Parameters: c, config struct; ss, set size

    loc=[]; % Locations of stimuli, not including minimum distance
    Loc_spc=[]; % Locations of stimuli (including minimum distance)
    while length(loc)<ss % Set spatial locations, respecting minimum distance
        x=datasample(c.Loc, 1); % Get location
        % Is this location within loc_min_dst from already-chosen
        % locations?
        X=x-c.loc_min_dst:x+c.loc_min_dst;
        X(X>c.n_loc)=X(X>c.n_loc)-c.n_loc; % Periodicity ...
        X(X<1)=c.n_loc+X(X<1); % ... periodicity continued
        ok=1; % Is the location ok? I.e. not already used
        for j=1:length(loc)
            if ismember(loc(j),X)
                ok=0;
                break;
            end
        end
        if ok==1
            loc=[loc,x];
            Loc_spc=[Loc_spc,X];
            
        end
    end
end
