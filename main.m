N = 100
sig = 0.1
mu = 0.5 
func = 1 


p = 95;
%Student T CI 
CIFcn = @(x,p)std(x(:),'omitnan')/sqrt(sum(~isnan(x(:)))) * tinv(abs([0,1]-(1-p/100)/2),sum(~isnan(x(:)))-1) + mean(x(:),'omitnan'); 
%Non Parametric Percentile Method 
CIFcnPCT = @(x,p)prctile(x,abs([0,100]-(100-p)/2));

intervals = [];
correct = 0;

CIPCT_correct = 0;
CIT_correct = 0;
fn_bettereq_than_cipct=0;
fn_worse_than_cipct=0; 
fn_bettereq_than_cit=0;
fn_worse_than_cit=0;

for i = 1:10000
    x =  sample_truncated_normal(N,sig,mu);
    
    [a b] = ci(x, func);
    
    intervals = [intervals, {[a b]}];
    
    CIPCT = CIFcnPCT(x,95) ;
    CIT = CIFcn(x, 95) ;
    
    if mu >= a & mu <=  b;
        correct = correct + 1 ;
        
        % test if in this sample the fn performs better at achieving 
        % the smaller range 
        if mu >= CIPCT(1) & mu <= CIPCT(2); 
            if CIPCT(2) - CIPCT(1) >= b - a;
                fn_bettereq_than_cipct = fn_bettereq_than_cipct + 1;
            else
                fn_worse_than_cipct= fn_worse_than_cipct+1; 
            end 
        else
            fn_bettereq_than_cipct = fn_bettereq_than_cipct + 1;
            
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
        
        if mu >= CIPCT(1) & mu <= CIPCT(2); 
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

    
    %break 
end 

correct 
fn_vs_cipct = [fn_bettereq_than_cipct, fn_worse_than_cipct]
fn_vs_cit = [fn_bettereq_than_cit, fn_worse_than_cit]