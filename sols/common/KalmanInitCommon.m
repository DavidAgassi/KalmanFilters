function Xo_kalmanStatesCommon = KalmanInitCommon( Xi_plots , Xi_initLen )
KalmanStateProtocol;
PlotProtocol;
ChiTestConst;
    Xo_kalmanStatesCommon = cell(Xi_initLen , KSPProtocolLen);
    for i = 1 : Xi_initLen
        Xo_kalmanStatesCommon{ i , KSPTimeCell } = Xi_plots( i , PPT );
        Xo_kalmanStatesCommon{ i , KSPTestRes } = zeros( 1, CTCHistoryLen );
    end
end