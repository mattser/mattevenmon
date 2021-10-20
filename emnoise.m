% =========================================================================
% MATTEVENMON | EMNOISE | MATTHEW SEREDYN | 2021
% =========================================================================
%
% Function to introduce and create random Gaussian Noise to a continous
% time of the event monitoring format.
% To use:
% out = emnoise(input,scale)
% out - Continous time series with added noise
% input - Input continous time series of the event monitoring format
% sace - The maximum percentage (out of 100) to scale the noise (based of
%           maximum amplitude in a timeseries).

function data = emnoise(data,scale)

    if ~exist('scale','var')
        scale = 100;
    end

    [r,c] = size(data.stat(1).traces);
    
    for i = 1:data.ns
       
       amp(i) = max(nonzeros(abs(data.stat(i).traces)));

        
    end
    
    x = mean(amp)*(scale/100);
    
    for i = 1:data.ns
           
       n = (randn(r,c))*x;

       data.stat(i).traces = data.stat(i).traces + n;

    end
     
end
% =========================================================================
%                           End of Code