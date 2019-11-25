function [IDX] = func_range_from_index(x, n_sm,n_lg)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    IDX=[];
    for i=1:length(x)
        % An array of possibilities (finer grained) for position
        Idx=(x(i)-1)*ceil(n_lg/n_sm - 0.5)+1;
        Idx=Idx:Idx+ceil(n_lg/n_sm - 0.5)-1;
        Idx=Idx-ceil(n_lg/n_sm/2 - 0.5);
        Idx(Idx<=0)=Idx(Idx<=0)+n_lg;
        IDX=[IDX,Idx];
    end
end
