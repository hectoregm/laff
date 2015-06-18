function [ y_out ] = laff_axpy( alpha, x, y )

% x = axpy( alpha, x, y ) scale vector x by a scalar and add vector y

% Extract the row and column sizes of alpha, x and y
[ m_a, n_a ] = size( alpha );
[ m_x, n_x ] = size( x );
[ m_y, n_y ] = size( y );

% Make sure alpha is a scalar
if ( m_a ~= 1 || n_a ~= 1 )
   y_out = 'FAILED';
   return
end

% Make sure x and y are (row or column) vectors of equal length
if ( m_x ~= 1 && n_x ~= 1 ) || ( m_y ~= 1 && n_y ~= 1 )
    y_out = 'FAILED';
    return
end
if ( m_x * n_x ~= m_y * n_y )
    y_out = 'FAILED';
    return
end

if ( n_x == 1 )     % x is a column vector
    if ( n_y == 1 )     % y is a column vector
        % Copy the elements of x into the elements of y
        for i=1:m_x   
            y( i,1 ) = alpha * x( i,1 ) + y( i, 1);
        end
    else     % y is a row vector
        % Copy the elements of x into the elements of y
        for i=1:m_x   
            y( 1,i ) = alpha * x( i,1 ) + y (1, i);
        end
    end
else    % x is a row vector
    if ( n_y == 1 )     % y is a column vector
        % Copy the elements of x into the elements of y
        for i=1:n_x   
            y( i,1 ) = alpha * x( 1,i ) + y( i,1 );
        end
    else     % y is a row vector
        % Copy the elements of x into the elements of y
        for i=1:n_x   
            y( 1,i ) = alpha * x( 1,i ) + y( 1,i);
        end
    end
end

% Return the updated y in y_out
y_out = y;

return
end

