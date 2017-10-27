function [Xo_track, Xo_index] = KalmanInitEmpty( Xi_plots )
    Xo_index = 1;
    Xo_track = KalmanStepEmpty( [],Xi_plots( 1,:));
end