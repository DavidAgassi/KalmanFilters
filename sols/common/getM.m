function Xo_M = getM( Xi_dim )
    switch Xi_dim
        case 1
            Xo_M = eye(2) ;
        case 2
            Xo_M = [ 1 , 0 , 0 , 0 ;
                    0 , 0 , 1 , 0 ];
        case 3
            Xo_M = [ 1 , 0 , 0 , 0 , 0 , 0 ;
                    0 , 0 , 0 , 1 , 0 , 0 ];
        case 'Circle'
            Xo_M = [ 1 , 0 , 0 ;
                    0 , 1 , 0 ];
    end
end