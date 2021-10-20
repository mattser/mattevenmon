% =========================================================================
% MATTEVENMON | E3D2EM | Matthew Seredyn | 2021
% =========================================================================
% Function Takes a series of SAC files generated by E3D, the seismic
% waveform modelling code and transforms it into usable mat structured
% array.
% Use:
% Call by e3d2sac
% - Select directory of sac files
% - Input data paramets: Number of stations and filename
% Output: Structured Data Array With
% - .t as the traces
% - .ns as the number of stations
% - .dt as the sampling interval for the data
%
% Matthew Seredyn 2021
%
function data = e3d2em

    fileSelect = 1;
    
    while fileSelect

        fileLoc = uigetdir;
        if isequal(fileLoc,0)
            error('Select SAC folder Location');
        else
            fileLoc = string(fileLoc);
            fileSelect = 0;
        end
            
    end
    
    prompt = {'SAC File Names(s):','Number of Stations'};
    dlgTitle = 'Parameters';
    dims = [1 35];
    defInput = {'template','13'};
    params = inputdlg(prompt,dlgTitle,dims,defInput); 
    
    data.ns = str2num(params{2});
    name = string(params{1});
    
    for i = 1:data.ns     
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