function Xo_line = MakeLine( Xi_times,  Xi_x0, Xi_speed , Xi_error )
%% FUNCTION NAME: MakeLine
% return a 1 dimention vector representin a target
% at Xi_X0 at time t=0 moving at the speed Xi_speed. 
    Xo_line = Xi_x0 + Xi_times * Xi_speed + Xi_error.* randn( size( Xi_times ) );
end