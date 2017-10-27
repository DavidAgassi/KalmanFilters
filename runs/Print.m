function Print( Xi_truePath , Xi_plots , Xi_track , Xi_testPassInd)
PlotProtocol;
TrackProtocol;
    trackLen = size(Xi_track,1);
    figure;
    % XY
    subplot(2,2,[1,2]);
    hold on;
    plot(Xi_truePath( : , PPX ), Xi_truePath( : ,PPY ) ,'g.');
    plot(Xi_plots( : , PPX ), Xi_plots( : , PPY ), 'bo');
    plot(Xi_track( : , TPX ), Xi_track( : , TPY ), 'r.-');
    quiver(Xi_track( : , TPX ), Xi_track( : , TPY )...
        ,Xi_track( : , TPXDot ), Xi_track( : , TPYDot ),'r','AutoScale','off');
    annotateAxis( 'X' , 'Y' );
    axis equal;
    
    
    %TX
    subplot(2,2,3);
    hold on;
    plot(Xi_truePath( : , PPT ), Xi_truePath( : ,PPX ) ,'g.');
    plot(Xi_plots( : , PPT ), Xi_plots( : , PPX ), 'bo');
    plot(Xi_track( : , TPT ), Xi_track( : , TPX ), 'r.-');
    quiver(Xi_track( : , TPT ), Xi_track( : , TPX )...
        ,ones(trackLen,1), Xi_track( : , TPXDot ),'r','AutoScale','off');
    annotateAxis( 'T' , 'X' );
    %TY
    subplot(2,2,4);
    hold on;
    plot(Xi_truePath( : , PPT ), Xi_truePath( : ,PPY ) ,'g.');
    plot(Xi_plots( : , PPT ), Xi_plots( : , PPY ), 'bo');
    plot(Xi_track( : , TPT ), Xi_track( : , TPY ), 'r.-');
    quiver(Xi_track( : , TPT ), Xi_track( : , TPY )...
        ,ones(trackLen,1), Xi_track( : , TPYDot ),'r','AutoScale','off');
    annotateAxis( 'T' , 'Y' );
    
    if( nargin == 4 )
        subplot(2,2,[1,2]);
        plot(Xi_track( Xi_testPassInd , TPX ), Xi_track( Xi_testPassInd , TPY ), 'md' ,'markersize',20);
        subplot(2,2,3);
        plot(Xi_track( Xi_testPassInd , TPT ), Xi_track( Xi_testPassInd , TPX ), 'md' ,'markersize',20 );
        subplot(2,2,4);
        plot(Xi_track( Xi_testPassInd , TPT ), Xi_track( Xi_testPassInd , TPY ), 'md' ,'markersize',20 );
    end
end

function annotateAxis( Xi_xLable , Xi_yLable )
    xlabel( Xi_xLable );
    ylabel( Xi_yLable );
    legend( 'True' , 'Plots' , 'Tracks' );
end