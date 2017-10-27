function Xo_trackUpdate = KalmanStepEmpty( Xi_priviousTrackUpdate , Xi_plot )
TrackProtocol;
PlotProtocol;
    Xo_trackUpdate = zeros(1,TPLength);
    Xo_trackUpdate(TPT) = Xi_plot(PPT);
    Xo_trackUpdate(TPX) = Xi_plot(PPX);
    Xo_trackUpdate(TPY) = Xi_plot(PPY);
end