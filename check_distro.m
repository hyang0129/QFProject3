
function [correct, fn_vs_cipct, fn_vs_cit, nameStr] = check_distro(N, func, distro);

sig = 0.5;
mu = 0.5 ;

p = 95;
%Student T CI 
CIFcn = @(x,p)std(x(:),'omitnan')/sqrt(sum(~isnan(x(:)))) * tinv(abs([0,1]-(1-p/100)/2),sum(~isnan(x(:)))-1) + mean(x(:),'omitnan'); 
%Non Parametric Percentile Method 
CIFcnPCT = @(x,p)prctile(x,abs([0,100]-(100-p)/2));


intervals = [];
correct = 0;

fn_bettereq_than_cipct=0;
fn_worse_than_cipct=0; 
fn_bettereq_than_cit=0;
fn_worse_than_cit=0;

n = 10000;



for i = 1:n
%     x =  sample_truncated_normal(N,sig,mu);
    [x, nameStr, mu] = distro(N) ;
    
    [a b] = ci(x, func);
    
    intervals = [intervals, {[a b]}];
    
%     CIPCT = CIFcnPCT(x,95) ;
    if i <= 100
        [x, nameStr, mu] = distro(N) ;
        CIPCT = bootci(100, @mean, x);
    end 
    
    [x, nameStr, mu] = distro(N) ;
    CIT = CIFcn(x, 95) ;
    
    if mu >= a & mu <=  b;
        correct = correct + 1 ;
        
        % test if in this sample the fn performs better at achieving 
        % the smaller range 
        if i <= 100
            if mu >= CIPCT(1) & mu <= CIPCT(2); 
                if CIPCT(2) - CIPCT(1) >= b - a;
                    fn_bettereq_than_cipct = fn_bettereq_than_cipct + 1;
                else
                    fn_worse_than_cipct= fn_worse_than_cipct+1; 
                end 
            else
                fn_bettereq_than_cipct = fn_bettereq_than_cipct + 1;

            end 
        end 
        
        if mu >= CIT(1) & mu <= CIT(2); 
            if CIT(2) - CIT(1) >= b - a;
                fn_bettereq_than_cit = fn_bettereq_than_cit + 1;
            else
                fn_worse_than_cit= fn_worse_than_cit+1; 
            end 
        else
            fn_bettereq_than_cit = fn_bettereq_than_cit + 1;
            
        end         

    else 
        % in this case, fn failed to find mu, so check if 
        % other methods can find mu 
        
        if mu >= CIPCT(1) & mu <= CIPCT(2) & i <= 100; 
            fn_worse_than_cipct= fn_worse_than_cipct+1; 
        end
        
        if mu >= CIT(1) & mu <= CIT(2); 
            fn_worse_than_cit= fn_worse_than_cit+1; 
        end 
        
        %when nothing finds mu then its ignored for comparison purposes 
    end 
    
    %intervals, CIPCT
    x;
    CI = CIFcnPCT(x,95) ;

%     waitbar(i/n, f, sprintf('Progress: %d %%', floor(i/n*100)));
    %break 
end 

correct ;
fn_vs_cipct = [fn_bettereq_than_cipct, fn_worse_than_cipct];
fn_vs_cit = [fn_bettereq_than_cit, fn_worse_than_cit];