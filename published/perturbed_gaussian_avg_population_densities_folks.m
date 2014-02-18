clear all;
close all;
clc;

%% load simulation results
load('perturbed_gaussian_sims_multi_agent_folks.mat');

timeSteps = [ 200 500 1000 ];
stddevs = [ 10 20 30 40 50 ];

realisations = 1000;

%% plot results for each set of simulations (one set per variance)
for i = 1:length(stddevs)
    
    %% construct mesh
    eval(['mesh = node_positions_0_' num2str(stddevs(i)) '_0(:, 1);']);
    nodeCount = length(mesh);
   
    c0 = 1;
    analytic_sol = @(c0, x, t) (c0/2) * ...
        (erf((20 - (x - 150)) / (2 * sqrt(1/2 * t))) + erf((20 + (x - 150)) / (2 * sqrt(1/2 * t))));
    
    figure;
    
    sol_init = lattice_profile_initial(:);
    plot(mesh, sol_init, 'b');
    hold all;
    
    %% plot the analytic and average solution at each time of interest
    for j = 1:length(timeSteps)
        
        %% determine and plot analytic solution
        eval(['sol_analytic_' num2str(timeSteps(j)) ' = zeros(nodeCount, 1);']);
        
        for k = 1:nodeCount
            eval(['sol_analytic_' num2str(timeSteps(j)) '(k) = analytic_sol(c0, mesh(k),' num2str(timeSteps(j)) ');']);
        end
        
        eval(['plot(mesh, sol_analytic_' num2str(timeSteps(j)) ', ''r'');']);
        
        %% determine and plot averaged solution
        eval(['sol_numeric_' num2str(stddevs(i)) '_' num2str(timeSteps(j)) ' = zeros(nodeCount, 1);']);
        
        for k = 0:realisations-1
            eval(['sol_numeric_' num2str(stddevs(i)) '_' num2str(timeSteps(j)) ' = ' ...
                'sol_numeric_' num2str(stddevs(i)) '_' num2str(timeSteps(j)) ' + ' ...
                'lattice_profile_0_' num2str(stddevs(i)) '_0_' num2str(k) '_' num2str(timeSteps(j)) '(:);']);
        end
        eval(['sol_numeric_' num2str(stddevs(i)) '_' num2str(timeSteps(j)) ' = ' ...
            'sol_numeric_' num2str(stddevs(i)) '_' num2str(timeSteps(j)) ' / realisations;']);
        
        eval(['plot(mesh, sol_numeric_' num2str(stddevs(i)) '_' num2str(timeSteps(j)) ', ''b'');']);
    end
    
    %% format the plotted data
    title(['Average Agent Densities (c0 = 1, std dev = 0.' num2str(stddevs(i)) ', realisations = 1000, Folks Model)'], ...
        'FontWeight', 'Bold');
    
    xlabel('x');
    ylabel('Concentration');
    ylim([0 1.1]);
    xlim([0 300]);
    legend('Simulation', 'Analytic');
    
end
