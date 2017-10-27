function Xo_track = Track2TPParabola( Xi_kalmanStates )
KalmanStateProtocol;
TrackProtocol;
    Xo_track( : ,TPT ) = cell2mat( Xi_kalmanStates( : , KSPTimeCell ) );
    mat = cell2mat( Xi_kalmanStates( : , KSPStateVectorCell )');
    Xo_track( : , TPX : TPYDot ) = mat([1,2,4,5],:)';
end