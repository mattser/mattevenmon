% =========================================================================
% MATTEVENMON | EMADD | Matthew Seredyn | 2021
% =========================================================================
% Function to take two Event Monitoring Files and Combine Them into one
% file.
% Use:
% Call by emadd(main data,added data,new event id)
% - Inputs need to have the same number of stations and sampling interval
% Output: Structured EM Data Array
% 
% Matthew Seredyn 2021
%
function data = emadd(data,add,id)
    if data.dt == add.dt
        if data.ns == add.ns
            [r1,c1] = size(data.stat(1).traces);
            [r2,~] = size(add.stat(1).traces);
            data.n = r1 + r2;
            for i = 1:data.ns
                tmp = data.stat(i).traces;
                data.stat(i).traces = zeros((r1+r2),c1);
                data.stat(i).traces(1:r1,:) = tmp;
                data.stat(i).traces(((r1+1):end),:) = add.stat(i).traces;
            end
            j = numel(data.extra);            
            data.extra(j+1).evid = add.extra.evid;
            data.extra(j+1).evs = r1 + add.extra.evs;
            data.extra(j+1).eve = r1 + add.extra.eve;    
            if exist('id','var')
                data.evid = id;
            end
        else
            
            error('Station Number Imcompatability');
        end
    else 
        error('Sampling Interval Incompatability');
    end
end
% =========================================================================
%                           End of Code