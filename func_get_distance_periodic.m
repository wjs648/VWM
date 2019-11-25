function [D] = func_get_distance_periodic(c,R,P)
%func_get_distance_periodic Return period distance between R and P
%   Params: c, config; R, reports; P, probe values
    D=sign(R-P) .* min(abs(R-P), c.loc_max-abs(R-P));
end
