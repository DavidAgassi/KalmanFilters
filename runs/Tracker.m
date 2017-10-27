function Xo_track = Tracker( Xi_plots, Xi_modelName)
    initFunc = str2func(['KalmanInit' Xi_modelName]);
    stepFunc = str2func(['KalmanStep' Xi_modelName]);
    convFunc = str2func(['Track2TP' Xi_modelName]);
    
    [track , i0]= feval( initFunc , Xi_plots);
    
    for i = i0 : size(Xi_plots,1)-1
       track(i+1,:) =  feval( stepFunc , track(i , : ), Xi_plots(i+1,:));
    end
    Xo_track = feval( convFunc , track);
end