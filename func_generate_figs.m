function func_generate_figs(DD, n_ssz, n_mdl, n_bin, config, S, P, R3)
%func_generate_figs produces figures for descriptive stats from input
%distance distributions
%Parameters: DD, distance from target locations for each model; n_ssz,
% number of set sizes; n_mdl, number of models; n_bin, number of bins
% for histogram; config, config structure; S, location of stimuli; P,
% location of target response; R3, location responses for pure swap model

%%%%%%%%%%%
% Figures %
%%%%%%%%%%%

Colour={'k', 'b', 'r', 'g', 'c', 'm', 'y'};

% Frequency and distance from target location histogram , each model with its own row ...
figure;
for ii=1:n_mdl % For each model
    d=DD{ii};
    for i=1:n_ssz
        subplot(1,n_ssz,i); hold on; % Superimposed
        histogram(d(:,i), n_bin);
        xlabel('Spatial reports', 'FontSize', 16);
        ylabel('Number', 'FontSize', 16);
        title(horzcat('K=', num2str(config.k), ', set size ', num2str(config.SS(i))));
        set(gca, 'XLim', [-180, 180], 'FontSize', 14);
        axis square; box on;
    end
end

% Superimpose the distributions from the different models
figure;
for ii=1:n_mdl
    d=DD{ii};
    for i=1:n_ssz
        subplot(n_mdl, n_ssz,(ii-1)*n_ssz+i); hold on;
        histogram(d(:,i), n_bin);
        xlabel(horzcat('Spatial reports (Model ', num2str(ii), ')'), 'FontSize', 16);
        ylabel('Number', 'FontSize', 16);
        if ii==1
            title(horzcat('K=', num2str(config.k), ', set size ', num2str(config.SS(i))));
        end
        set(gca, 'XLim', [-180, 180], 'FontSize', 14);
        axis square; box on;
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Distances from non-target items, per Bays et al, 2009
figure;
for i=1:length(config.SS)
    ss=config.SS(i);
    s=S{i};
    
    subplot(1,length(config.SS),i);
    D_nt=[];
    for j=1:ss
        nt=s(:,j); % Non-target locations
        p=P(:,i); % Probe locations for this set size
        r=R3(:,i); % Reports by Model 3
        r(nt==p)=[];
        nt(nt==p)=[];
        d_nt=sign(r-nt) .* min(abs(r-nt), 360-abs(r-nt));
        D_nt=[D_nt; d_nt];
    end
    size(D_nt)
    histogram(D_nt, n_bin);
    set(gca, 'XLim', [-180, 180], 'FontSize', 14);
    axis square; box on;
end

%%%%
% SD
figure; hold on;
for i=1:n_mdl
    SD=std(DD{i},0,1);
    plot(config.SS,SD, 'Color', Colour{i}, 'LineWidth', 2);
end
xlabel('Set size', 'FontSize', 24);
ylabel('S.D. of spatial reports', 'FontSize', 24);
title(horzcat('K=', num2str(config.k)));
set(gca, 'FontSize', 20);
axis square; box on;

end