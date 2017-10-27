function [ Xo_kalmanStates , Xo_index ] = KalmanInitSimple( Xi_plots )
KalmanStateProtocol;
PlotProtocol;
    Xo_index = 2;
    Xo_kalmanStates = KalmanInitCommon( Xi_plots , Xo_index );
    interval = Xi_plots( 2 , PPT ) - Xi_plots( 1 , PPT );
    
    % state init
    Xo_kalmanStates{ 1 , KSPStateVectorCell }([1,3]) = Xi_plots( 1 , [ PPX ,PPY ] );
    Xo_kalmanStates{ 2 , KSPStateVectorCell }([1,3]) = Xi_plots( 2 , [ PPX ,PPY ] );
    Vs = ( Xi_plots( 2 , [ PPX ,PPY ] ) - Xi_plots( 1 , [ PPX ,PPY ] ) ) / interval;
    Xo_kalmanStates{ 1 , KSPStateVectorCell }([2,4]) = Vs;
    Xo_kalmanStates{ 2 , KSPStateVectorCell }([2,4]) = Vs;
    Xo_kalmanStates{ 1 , KSPStateVectorCell } = Xo_kalmanStates{ 1 , KSPStateVectorCell }';
    Xo_kalmanStates{ 2 , KSPStateVectorCell } = Xo_kalmanStates{ 2 , KSPStateVectorCell }';
    
    % cov init
    covX = CovInit( 2 , Xi_plots( : , PPErrX ) , Xi_plots( : , PPT ) );
    covY = CovInit( 2 , Xi_plots( : , PPErrY ) , Xi_plots( : , PPT ) );
    Xo_kalmanStates{ 2 , KSPCovCell } = blkdiag(covX,covY); 
end