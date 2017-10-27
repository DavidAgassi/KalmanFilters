function Xo_stateVector = KalmanStepCircle(Xi_stateVector , Xi_plot )
PlotProtocol;
TrackProtocol;
KalmanStateProtocol;
% inits
circ = 'Circle';
preStateTime = Xi_stateVector{ KSPTimeCell };
preState = Xi_stateVector{ KSPStateVectorCell };
preCov = Xi_stateVector{ KSPCovCell };
preTest = Xi_stateVector{ KSPTestRes };
interval = Xi_plot(PPT) - preStateTime;
phi = getPhi( circ , interval );
M = getM( circ );
[azi,r]=cart2pol(Xi_plot(PPX),Xi_plot(PPY));
azi=fixAzi(azi);
X = [r;azi];
R = diag( Xi_plot( [ PPErrX , PPErrY ] ).^2 );

    
    % the kalman
    P = phi * preState;
    P(2) = fixAzi(P(2));
    S = phi * preCov * phi';
    
    PCov = (R + M*S*M');
    Res = X - M*P;
    
    H = S*M'/PCov;
    
    Xo_stateVector{ KSPTimeCell } = Xi_plot(PPT);
    update = P + H*Res;
    update(2) = fixAzi(update(2));
    Xo_stateVector{ KSPStateVectorCell } = update;
    Xo_stateVector{ KSPCovCell } = ( eye(size(S)) - H*M ) * S;
    Xo_stateVector{ KSPTestRes } = [ preTest(2:end) ,  sum(Res.^2./diag(PCov))];
end

