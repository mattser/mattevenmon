% =========================================================================
% MATTEVENMON | AUTOE3D2EM | MATTHEW SEREDYN & HUBERT KALUZNY | 2021
% =========================================================================
%
% autoe3d2em allows for the loading of seismic data (sac) produced in the 
% E3D elastic waveform modelling code into the Event Monitoring Code format 
%
% Use by t = autoe3d2em(fileLoc,name,ns)
%
% Output:
%       t - EventMon data structure
%
% Inputs:
%       fileLoc - File(s) Location
%       name - Name of Files
%       ns - Number of Stations
%
% Matthew Seredyn 2021
%
function data = autoe3d2em(fileLoc,name,ns)
       
    for i = 1:ns     
        stnName{i} = sprintf('%03u',i-1);
    end
    
    p = em_CreateProject;
    
    if ispc
       nom = char(strcat(fileLoc,'\',name,'.'));
    elseif isunix
       nom = char(strcat(fileLoc,'/',name,'.'));
    elseif ismac
       nom = char(strcat(fileLoc,'/',name,'.'));
    end
    
    data = ms_LoadSacTraces(p,nom,'stations',stnName,'.','components',{'x','y','z'});    
    
    data.evid = name;
    data.extra(1).evid = name;
    data.extra(1).evs = 1;
    data.extra(1).eve = length(data.stat(1).traces);
    
end
% =========================================================================
%                           End of Code