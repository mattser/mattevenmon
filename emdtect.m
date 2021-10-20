% =========================================================================
% MATTEVENMON | EMDTECT | MATTHEW SEREDYN & HUBERT KALUZNY | 2021
% =========================================================================
%
% emdtect data supplied by the function emmfa to search for seimsic events
% These events are detected as soon as their matched filtered cross
% correlation score supass the provided threshold, or the default threshold
% value of 0.2 
%
% Use by indexes = emdtect(corr,thresh)
%
% corr is in the form of corr.st which contains the stacked siesmic traces
% given by emmfa 
% thresh is the threshold value. If one isn't provided then a default value
% of 0.2 is used
% Indexes the is the data positional data of a detected event.

function peak_midpoint = emdtect(corr,thresh)

    if ~exist('thresh','var')
        
        thresh = 0.2;
        
    end

    [r,c] = size(corr.st);
    % Set up parameters
    in_island = 0;
    island_idx = [];
    island_start_pos = 0;
    peak_midpoint = [];
    
    for i = 1:c
        
        true_dtect = 0;
        
        for j = 1:r
            
            if corr.st(j,i) > thresh
                
                true_dtect = true_dtect + 1;
                
            end
            
        end
                
       
       if in_island &&  true_dtect < 4
           
           in_island = 0;
           peak_midpoint(end+1) = round((island_start_pos + (i-1)) / 2);
           
       elseif ~in_island && true_dtect > 4
           
           in_island = 1;
           island_start_pos = i;
       end
           

        
    end




end
% =========================================================================
%                           End of Code