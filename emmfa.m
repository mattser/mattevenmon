% =========================================================================
% MATTEVENMON | EMMFA | MATTHEW SEREDYN | 2021
% =========================================================================
% NEW
% Match Filter Algorthm based on the method set out by Caffagni, et. al.
% 2016. 
%
% parent is the template or the parent event as detected at each individual
% detector
% Use by corr = emmfa(parent,data)
% Outputs:
%       corr - Correlation Data structure
% Inputs:
%       parent - Event Mon parent data
%       data - Event Mon data

function [corr] = emmfa(pdata,udata)

    pt = em_Struct2Mat(pdata);
    ut = em_Struct2Mat(udata);
    % Restructure events into normal matlab arrays to perform cross
    % correlation steps
    
    [~,c] = size(ut);
    
    
    tic;

    % Perform the cross correlation
    % This was added as normxcorr2 cannot successfully complete if NaNs are
    % present in the array as of r2018a.
    
    f = waitbar(0,'Cross Correlating Point');
    for i = 1:c
        
        pt(:,i) = pt(:,i) / max(abs(pt(:,i)));
        ut(:,i) = ut(:,i) / max(abs(ut(:,i)));
        
        waitbar(i/c,f,sprintf('Cross Correlating Trace %u/%u',i,c));

        if ~any(isnan(ut(:,i))) && ~(std(pt(:,i)) == 0)

            ct(:,i) = normxcorr2(pt(:,i),ut(:,i));

        elseif any(isnan(ut(:,i)))
            msg = sprintf('Trace %2.0f contains NaNs or i. This makes me sad :(\n Remove Them to Correlate the Traces',i);
            warning(msg);
            
        else
            msg = sprintf('Template Trace %u. Is flat or does not contain data...\nThis makes me sad :c\nUse an actual template\n',i);
            warning(msg);
        end

    end
    
    close(f);

    % Second step is to stack all 3 time traces for each station - Implicit
    % beamforming.

    for i = 1:(c/3)

        corr.st(:,i) = (ct(:,(i*3))+ct(:,(i*3)-1)+ct(:,(i*3)-2))/3;

    end

    corr.stc = sum(corr.st,2)/udata.ns;
    % Correlation should exhibit similar lags between each station as a
    % result of the template. Average results across the stations.
    
    
end
% =========================================================================
%                           End of Code