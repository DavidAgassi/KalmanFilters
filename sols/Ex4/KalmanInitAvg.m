function [ Xo_kalmanStates , Xo_index ] = KalmanInitAvg( Xi_plots )
KalmanStateProtocol;
PlotProtocol;
    Xo_index = 1;
    Xo_kalmanStates = KalmanInitCommon( Xi_plots , Xo_index );
    Xo_kalmanStates{1,KSPStateVectorCell} = Xi_plots( 1 , [ PPX , PPY ] )';
    covx = CovInit(1,Xi_plots(:,PPErrX) , Xi_plots(:,PPT));
    covy = CovInit(1,Xi_plots(:,PPErrY) , Xi_plots(:,PPT));
    Xo_kalmanStates{1,KSPCovCell} = blkdiag(covx,covy);
end