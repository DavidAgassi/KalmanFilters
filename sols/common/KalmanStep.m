function Xo_stateVector = KalmanStep(Xi_stateVector , Xi_plot , Xi_dim , Xi_Q )
PlotProtocol;
TrackProtocol;
KalmanStateProtocol;
% inits
preStateTime = Xi_stateVector{ KSPTimeCell };
preState = Xi_stateVector{ KSPStateVectorCell };
preCov = Xi_stateVector{ KSPCovCell };
preTest = Xi_stateVector{ KSPTestRes };
interval = Xi_plot(PPT) - preStateTime;
phi = getPhi( Xi_dim , interval );
Q = getQ( Xi_dim , Xi_Q );
M = getM( Xi_dim );
X = Xi_plot( [ PPX , PPY ])';
R = diag( Xi_plot( [ PPErrX , PPErrY ] ).^2 );

    
    % the kalman
    P = phi * preState;
    S = phi * preCov * phi' + Q;
    
    PCov = (R + M*S*M');
    Res = X - M*P;
    
    H = S*M'/PCov;
    
    Xo_stateVector{ KSPTimeCell } = Xi_plot(PPT);
    Xo_stateVector{ KSPStateVectorCell } = P + H*Res;
    Xo_stateVector{ KSPCovCell } = ( eye( 2*Xi_dim ) - H*M ) * S;
    Xo_stateVector{ KSPTestRes } = [ preTest(2:end) ,  sum(Res.^2./diag(PCov))];
end 