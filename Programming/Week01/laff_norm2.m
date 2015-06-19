function [ alpha ] = laff_norm2( x )

% alpha = nprm( x ) computes the length of vector x.

% Extract the row and column sizes of x
[ m_x, n_x ] = size( x );

% Make sure x is a (row or column) vector
if ( m_x ~= 1 && n_x ~= 1 )
    alpha = 'FAILED';
    return
end

alpha = sqrt(laff_dot( x, x ));

end

