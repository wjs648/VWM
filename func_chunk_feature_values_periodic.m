function [Ch] = func_chunk_feature_values_periodic(c, loc)
%func_chunk_stimulus_array Divide the stimulus array into "chunks"
%   Currently, this function doesn't necessarily return the optimal
%   chunking/clustering of the feature dimension, and it doesn't constrain
%   the number of chunks. Maybe humans don't either ...

%     [loc_sort, idx_sort]=sort(loc);
%     ss=length(loc); % Set size
%     Ch=nan(ss,ss);
%     i=0;
%     while(~isempty(loc_sort))
%         i=i+1;
%         d=func_get_distance_periodic(c,loc_sort(1),loc_sort);
%         xc=find(abs(d)<c.chunk_dst);
%         ch=idx_sort(xc);
%         loc_sort(xc)=[];
%         idx_sort(xc)=[];
%         Ch(i,1:length(ch))=ch;
%     end
%     if i<ss % Surely unnecessary to check ...
%         Ch(i+1:end,:)=[];
%     end

    [loc_sort, idx_sort]=sort(loc);
%     Ch=cell(1,length(loc)+1); % Make it too long and shorten it below ... see below
    Ch={};
    i=0;
    while(~isempty(loc_sort))
        i=i+1;
        d=func_get_distance_periodic(c,loc_sort(1),loc_sort);
        xc=find(abs(d)<c.chunk_dst);
        ch=idx_sort(xc);
        loc_sort(xc)=[];
        idx_sort(xc)=[];
        Ch{i}=ch;
    end
%     Ch
%     Ch=Ch{1,1:i}
end
