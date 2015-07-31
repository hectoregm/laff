function [ A_out, b_out ] = Solve( A, b )

% Get LU factorization of matrix A.
LU = LU_unb_var5( A );

% Get individual LU factorizations.
L = tril(LU, -1) + eye(size(A));
U = triu(LU);

% Solve Lower system
y = Ltrsv_unb_var1(L, b );

% Solve Upper system
z = Utrsv_unb_var1( U, y );

A_out = LU;
b_out = z;
end

