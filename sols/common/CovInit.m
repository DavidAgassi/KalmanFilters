function Xo_cov = CovInit( Xi_dim , Xi_errs , Xi_times )
switch Xi_dim
    case 1
        Xo_cov = Xi_errs(1);
    case 2
        interval12 = Xi_times(2)-Xi_times(1);
        varX2 = Xi_errs(2)^2;
        varXdot12 = sum( Xi_errs.^2 )/ interval12^2;
        covX1Xdot12 = Xi_errs(2)^2 / interval12;
        Xo_cov = [  varX2 , covX1Xdot12;
                    covX1Xdot12 , varXdot12 ];
    case 3
        interval12 = Xi_times(2)-Xi_times(1);
        interval23 = Xi_times(3)-Xi_times(2);
        varX3 = Xi_errs(3)^2;
        varXdot23 = sum( Xi_errs( 2 : 3 ).^2 ) / interval23^2;
        x1dotdotCof = 1/(interval23*interval12);
        x2dotdotCof = (interval23 - interval12) /(interval23*interval12);
        x3dotdotCof = 1/interval23^2;
        varXdotdot = (Xi_errs(1)*x1dotdotCof)^2 + (Xi_errs(2)*x2dotdotCof)^2 + (Xi_errs(3)*x3dotdotCof)^2;
        covX3Xdot23 = (Xi_errs(3)/interval23)^2;
        covX3Xdotdot = (Xi_errs(3)/interval23^2)^2;
        covXdot23Xdotdot = (Xi_errs(2)*x2dotdotCof/interval23)^2 + (Xi_errs(3)*x3dotdotCof/interval23)^2;
        Xo_cov = [  varX3 , covX3Xdot23 , covX3Xdotdot;
                    covX3Xdot23 , varXdot23 , covXdot23Xdotdot;
                    covX3Xdotdot , covXdot23Xdotdot , varXdotdot ];
end