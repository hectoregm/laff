function [ x_out ] = laff_scal( alpha, x )

% x = scale( alpha, x ) scale vector x by a scalar alpha

% Extract the row and column sizes of alpha and x
[ m_a, n_a ] = size( alpha );
[ m_x, n_x ] = size( x );

% Make sure alpha is a scalar
if ( m_a ~= 1 | n_a ~= 1 )
    x_out = 'FAILED';
    return
end

% Make sure x is a (row or column) vector
if ( m_x ~= 1 & n_x ~= 1 )
    x_out = 'FAILED';
    return
end

if (n_x == 1) % x is a column vector
    for i=1:m_x   
        x( i,1 ) = alpha * x( i,1 );
    end
else % x is a row vector
    for i=1:n_x
        x( 1,i) = alpha * x( 1,i );
    end
end

x_out = x;
return
end