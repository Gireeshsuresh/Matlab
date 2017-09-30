%ENPM808F Homework 2

clear all; close all; clc;

x_range = 300;          %Input Range
x = [1:1:x_range];
y = sin(x);                %Function

r_x = generate_random_samples(x_range);
r_y = sin(r_x);

figure('Name','Discrete CMAC','NumberTitle','off');


plot(x,y,'-g','LineWidth',3)       %Plot function and random samples (training)

title('Discrete CMAC Results');

hold on

%
% PART ONE - DISCRETE
%

for plot_train_id = 1:1:size(r_x,1)
    if mod(plot_train_id,3) ~= 0
        plot(r_x(plot_train_id),r_y(plot_train_id),'--ks',...
            'MarkerSize',10,'MarkerEdgeColor','b')        
    end
end

hold off

Discrete_results = [];
test_error_best = 10000;

for g = 3:1:17 % Generalization matrix(g) - [3,5,7,9,11,13,15,17]
    tic                     %Start timer
    [best_weight_matrix, best_err_value_training, test_error, ...
        iterations, out_plot] = discrete_function(r_x,r_y,x_range,g);
    t = toc;                %Stop timer
    if test_error < test_error_best
        out_plot_best = out_plot;
        g_best = g;
    end
    Discrete_results = [Discrete_results; ...
        g t iterations best_err_value_training test_error];
end

Discrete_results

hold on                 %Plot test results

for best_plot_id = 1:size(out_plot_best,1)
    plot(out_plot_best(best_plot_id,1),out_plot_best(best_plot_id,2),'r-o',...
        'MarkerFaceColor',[0,0.8,0])
end
text(200,100,'Discrete Function')
text(200,60,'Best Window Size: ')
text(280,60,num2str(g_best))
xlabel('Input')
ylabel('Output')
legend('Training data','Random Sample data','Location','northwest');
hold off

%
% PART TWO - CONTINUOUS
%

Continuous_results = [];
test_error_best = 10000;

for g = 3:1:17 %[5,7,9,11,13,15,17]
    tic                     %Start timer
    [best_weight_matrix, best_err_value_training, test_error, ...
        iterations, out_plot] = continuous_function(r_x,r_y,x_range,g);
    t = toc;                %Stop timer
    if test_error < test_error_best
        t_best_c = t;
        out_plot_best = out_plot;
        g_best = g;
    end
    Continuous_results = [Continuous_results;...
        g t iterations best_err_value_training test_error];
end

Continuous_results



figure('Name','Continuous CMAC','NumberTitle','off');

plot(x,y,'y','LineWidth',4)  %Plot function and random samples (training)

title('Continuous CMAC Results');

hold on
for plot_train_id = 1:1:size(r_x,1)
    if mod(plot_train_id,3) ~= 0        
        plot(r_x(plot_train_id),r_y(plot_train_id),'b-*',...
            'MarkerFaceColor','red','MarkerSize',9)
    end
end
hold off



hold on                     %Plot test results

for best_plot_id = 1:size(out_plot_best,1)
    plot(out_plot_best(best_plot_id,1),out_plot_best(best_plot_id,2),'r-s',...
        'MarkerFaceColor',[0,0.9,0])
end
text(200,100,'Continuous Function')
text(200,60,'Best Window Size:')
text(280,60,num2str(g_best))
xlabel('Input')
ylabel('Output')
legend('Training data','Random Sample data','Location','northwest');

hold off

%
% Figure 3 : Comparison between Discrete Vs Continuous CMAC Results
%

figure('Name','Discrete Vs Continuous CMAC ','NumberTitle','off'); 

plot(Discrete_results(:,1), Discrete_results(:,2),'b--o')
title('Comparison between Discrete Vs Continuous CMAC Results')
hold on

plot(Continuous_results(:,1), Continuous_results(:,2),'g--o')
xlabel('Generalization Factor')
ylabel('Time')
legend('Discrete','Continuous','Location','northwest');

hold off

figure('Name',' Generalization Vs Time ','NumberTitle','off');
plot(Discrete_results(:,1), Discrete_results(:,2),'b--o')
title('Discrete : Generalization Vs Time to Converge')
xlabel('Generalization Factor')
ylabel('Time')

figure('Name',' Generalization Vs Time ','NumberTitle','off');
plot(Continuous_results(:,1), Continuous_results(:,2),'g--o')
title('Continuous : Generalization Vs Time to Converge')

