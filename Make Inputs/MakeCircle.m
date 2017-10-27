function [Xo_Xs , Xo_Ys] = MakeCircle( Xi_times, Xi_centerX, Xi_centerY , Xi_R , Xi_angularVelocitiy , Xi_azi0 ,Xi_noisR , Xi_noisAV)
%% FUNCTION NAME: MakeCircle
% return a circle in PlotProtocol at times Xi_times
% center = [ Xi_centerX , Xi_centerY ]
% radius = Xi_R
% azimouth at t=0 = Xi_azi0
% angularVelocitiy = Xi_angularVelocitiy
    vecSize = size(Xi_times);
    Rs = ones(vecSize) * Xi_R + randn(size(Xi_times)).*Xi_noisR;
    Azis = Xi_azi0 + Xi_times * Xi_angularVelocitiy + randn(size(Xi_times)).*Xi_noisAV;
    Xo_Xs = Xi_centerX + Rs .* cos( Azis );
    Xo_Ys = Xi_centerY + Rs .* sin( Azis );
end