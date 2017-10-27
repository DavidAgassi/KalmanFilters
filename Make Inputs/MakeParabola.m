function Xo_parabol = MakeParabola( Xi_times, Xi_x0, Xi_speed0 , Xi_accel, Xi_error )
%% FUNCTION NAME: MakeParabola
% return a 1 dimention vector representin a target
% at Xi_X0 at time t=0 with speed = Xi_speed0 moving at the acceleration Xi_accel. 
    Xo_parabol = Xi_x0 + Xi_times * Xi_speed0 + 0.5 * Xi_times.^2 * Xi_accel + Xi_error.* randn( size( Xi_times ) );
end