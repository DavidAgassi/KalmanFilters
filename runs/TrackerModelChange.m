function [Xo_track , Xo_testFailIndex] = TrackerModelChange( Xi_plots, Xi_modelName1 , Xi_modelName2, Xi_maneuverName)
    len = size(Xi_plots,1) - 1;
    initFunc1 = str2func(['KalmanInit' Xi_modelName1]);
    stepFunc1 = str2func(['KalmanStep' Xi_modelName1]);
    convFunc1 = str2func(['Track2TP' Xi_modelName1]);
    initFunc2 = str2func(['KalmanInit' Xi_modelName2]);
    stepFunc2 = str2func(['KalmanStep' Xi_modelName2]);
    convFunc2 = str2func(['Track2TP' Xi_modelName2]);
    testFunc = str2func(['Find' Xi_maneuverName]);
    Xo_testFailIndex=[];
    
    [track1 , i0]= feval( initFunc1 , Xi_plots);
    
    for i = i0 : len
        track1(i+1,:) =  feval( stepFunc1 , track1(i , : ), Xi_plots(i+1,:));
        if( feval( testFunc , track1(i+1,:) , Xi_plots(i+1,:) ) )
            Xo_testFailIndex = i + 1;
            break;
        end
    end
    if( isempty( Xo_testFailIndex ) )
        Xo_track = feval( convFunc1 , track1 );
        return;
    end
    Xo_track = feval( convFunc1 , track1( 1 : end - 1 , : ) );
    [track2 , i0]= feval( initFunc2 , Xi_plots( Xo_testFailIndex : end , : ) );
    for i = i0 : len - Xo_testFailIndex
        track2(i+1,:) =  feval( stepFunc2 , track2( i , : ) , Xi_plots( i + Xo_testFailIndex , : ) );
    end
    Xo_track = [Xo_track ; feval( convFunc2 , track2 ) ];
end