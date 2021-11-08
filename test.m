

values = {};
func = 1;
Ns = [10, 30, 100, 300, 1000];

distros ={@sample_truncated_normal, @sample_bernoulli, @sample_uniform}; 


for dist=1:3;

    for func=1:10;

        for i=1:5;
            i

            [correct, fn_vs_cipct, fn_vs_cit, nameStr]  =check_distro(Ns(i), func, distros{1, dist});

            v = {Ns(i), func, nameStr, correct, fn_vs_cipct(1), fn_vs_cipct(2), fn_vs_cit(1), fn_vs_cit(2)};

            values = [values; v];

        end 

    end 
end 

values
T = cell2table(values, 'VariableNames', {'Size', 'Fn', 'Distro', 'Correct', 'Better vs CIPCT', ...
    'Worse vs CIPCT', 'Better vs CIT', 'Worse vs CIT'})

writetable(T, 'c.csv')
