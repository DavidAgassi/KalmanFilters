function [ Xo_kalmanStates , Xo_index ] = KalmanInitCircle( Xi_plots )
KalmanStateProtocol;
PlotProtocol;
    Xo_index = 2;
    Xo_kalmanStates = KalmanInitCommon( Xi_plots , Xo_index );
    interval = Xo_kalmanStates{ 2 , KSPTimeCell } - Xo_kalmanStates{ 1 , KSPTimeCell };
    [az,r] = cart2pol( Xi_plots( 1:2,PPX ) , Xi_plots( 1:2,PPY ) );
    av = ( az(2) - az(1) ) / interval;
    RsInv = Xi_plots( 1:2 , PPErrX ).^-2;
    AziErr = Xi_plots( 1:2 , PPErrY );
    r2 = sum(r.*RsInv)/sum(RsInv);
    Xo_kalmanStates{1,KSPStateVectorCell} = [r(1); az(1); av];
    Xo_kalmanStates{2,KSPStateVectorCell} = [r2; az(2); av];

    covR = sum(RsInv)^-1;
    
    varAz2 = AziErr(2)^2;
    varAzdot12 = sum( AziErr.^2 )/ interval^2;
    covAz1Azdot12 = AziErr(2)^2 / interval;
    covAzi = [  varAz2 , covAz1Azdot12;
                covAz1Azdot12 , varAzdot12 ];

    Xo_kalmanStates{2,KSPCovCell} = blkdiag(covR,covAzi);
end