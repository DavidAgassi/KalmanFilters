function Xo_Q = getQ( Xi_dim , Xi_Q )
    switch Xi_dim
        case 'Circle'
            Xo_Q = [Xi_Q(1) , 0 , 0;
                    0 , 0 , 0;
                    0 , 0 , Xi_Q(2)];
        otherwise    
            Xo_Q = zeros( Xi_dim );
            Xo_Q( Xi_dim , Xi_dim ) = Xi_Q;
            Xo_Q = blkdiag( Xo_Q , Xo_Q );
    end
end