function Xo_track = Track2TPCircle( Xi_kalmanStates )
KalmanStateProtocol;
TrackProtocol;
    Xo_track( : ,TPT ) = cell2mat( Xi_kalmanStates( : , KSPTimeCell ) );
    stateVecs = cell2mat( Xi_kalmanStates( : , KSPStateVectorCell )' )';
    Rs = stateVecs( : , 1 );
    Azis = stateVecs( : , 2 );
    AVs = stateVecs( : , 3);
    Xo_track( : , TPX ) = Rs.*cos(Azis);
    Xo_track( : , TPY ) = Rs.*sin(Azis);
    Xo_track( : , TPXDot ) = Rs.*-sin(Azis).*AVs;
    Xo_track( : , TPYDot ) = Rs.*cos(Azis).*AVs;
end