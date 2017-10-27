function Xo_track = Track2TPAvg( Xi_kalmanStates )
KalmanStateProtocol;
TrackProtocol;
    Xo_track( : ,TPT ) = cell2mat( Xi_kalmanStates( : , KSPTimeCell ) );
    Xo_track( : , [TPX , TPY] ) = cell2mat( Xi_kalmanStates( : , KSPStateVectorCell )' )';
    Xo_track( : , [TPXDot , TPYDot] ) = 0;
end