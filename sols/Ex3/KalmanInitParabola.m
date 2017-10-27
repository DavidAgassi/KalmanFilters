function [ Xo_kalmanStates , Xo_index ] = KalmanInitParabola( Xi_plots )
KalmanStateProtocol;
PlotProtocol;
    Xo_index = 3;
    Xo_kalmanStates = KalmanInitCommon( Xi_plots , Xo_index );
    interval1 = Xi_plots( 2 , PPT ) - Xi_plots( 1 , PPT );
    interval2 = Xi_plots( 3 , PPT ) - Xi_plots( 2 , PPT );
    intervalAll = Xi_plots( 3 , PPT ) - Xi_plots( 1 , PPT );
    Xo_kalmanStates{ 1 , KSPStateVectorCell } = zeros( 6 , 1);
    Xo_kalmanStates{ 2 , KSPStateVectorCell } = zeros( 6 , 1);
    Xo_kalmanStates{ 3 , KSPStateVectorCell } = zeros( 6 , 1);
    
    % state init
    Xo_kalmanStates{ 1 , KSPStateVectorCell }([1,4]) = Xi_plots( 1 , [ PPX ,PPY ] );
    Xo_kalmanStates{ 2 , KSPStateVectorCell }([1,4]) = Xi_plots( 2 , [ PPX ,PPY ] );
    Xo_kalmanStates{ 3 , KSPStateVectorCell }([1,4]) = Xi_plots( 3 , [ PPX ,PPY ] );
    V1s = ( Xi_plots( 2 , [ PPX ,PPY ] ) - Xi_plots( 1 , [ PPX ,PPY ] ) ) / interval1;
    Xo_kalmanStates{ 1 , KSPStateVectorCell }([2,5]) = V1s;
    V2s = ( Xi_plots( 3 , [ PPX ,PPY ] ) - Xi_plots( 2 , [ PPX ,PPY ] ) ) / interval2;
    Xo_kalmanStates{ 2 , KSPStateVectorCell }([2,5]) = V2s;
    As=(V2s - V1s)' / interval2;
    Xo_kalmanStates{ 3 , KSPStateVectorCell }([3,6]) = As;
    V0s = ( Xo_kalmanStates{ 3 , KSPStateVectorCell }([1,4]) - Xo_kalmanStates{ 1 , KSPStateVectorCell }([1,4])...
        -0.5*As*intervalAll^2)/intervalAll;
    Xo_kalmanStates{ 3 , KSPStateVectorCell }([2,5]) = V0s + As*intervalAll;
    
    % cov init
    covX = CovInit( 3 , Xi_plots( : , PPErrX ) , Xi_plots( : , PPT ) );
    covY = CovInit( 3 , Xi_plots( : , PPErrY ) , Xi_plots( : , PPT ) );
    Xo_kalmanStates{ 3 , KSPCovCell } = blkdiag(covX,covY); 
end