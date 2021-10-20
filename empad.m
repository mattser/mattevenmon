% =========================================================================
% MATTEVENMON | EMPAD | MATTHEW SEREDYN | 2021
% =========================================================================
% Function to take synthetic, or other, signals and pad them with start and
% end time
% Use:
% Call by matpad(data,time before, time after)
% - Data input needs a .t for traces, and .dt for sampling inverals
% - Input time in seconds
% Output: Structured Data Array With
% - .t as the traces
% - .ns as the number of stations
% - .dt as the sampling interval for the data
%
% Matthew Seredyn 2021
%

function data = empad(data,pretime,posttime)

    pet = round(pretime/data.dt);
    pot = round(posttime/data.dt);
    data.extra(1).evs = pet;
    data.extra(1).eve = length(data.stat(1).traces) + pet;
    
    for i = 1:data.ns
    
        [r, c] = size(data.stat(i).traces);

        t = zeros( (pet + r + pot) , c);

        t(pet+1:pet+r,:) = data.stat(i).traces;

        data.stat(i).traces = t;
    
    end
    
    data.n = length(data.stat(1).traces);

end