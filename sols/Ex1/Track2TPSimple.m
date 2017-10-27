function Xo_track = Track2TPSimple( Xi_kalmanStates )
KalmanStateProtocol;
TrackProtocol;
    Xo_track( : ,TPT ) = cell2mat( Xi_kalmanStates( : , KSPTimeCell ) );
    Xo_track( : , TPX : TPYDot ) = cell2mat( Xi_kalmanStates( : , KSPStateVectorCell )' )';
end