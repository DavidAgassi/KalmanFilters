function Xo_phi = getPhi( Xi_dim , Xi_t )
    switch Xi_dim
        case 1
            Xo_phi = eye(2) ;
        case 2
            base = [ 1 , Xi_t ;
                    0 , 1 ];
            Xo_phi = blkdiag( base , base );
        case 3
            base = [ 1, Xi_t , 0.5 * Xi_t^2;
                    0 , 1 , Xi_t ;
                    0 , 0 , 1 ];
            Xo_phi = blkdiag( base , base );
        case 'Circle'
            Xo_phi = [  1 , 0 , 0;
                        0 , 1 , Xi_t;
                        0 , 0 , 1];
    end
end