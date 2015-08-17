function [ B_out ] = GJ_Inverse_alt_unb( A, B )

  B = eye( size( A ) );

  [ ATL, ATR, ...
    ABL, ABR ] = FLA_Part_2x2( A, ...
                               0, 0, 'FLA_TL' );

  [ BTL, BTR, ...
    BBL, BBR ] = FLA_Part_2x2( B, ...
                               0, 0, 'FLA_TL' );

  while ( size( ATL, 1 ) < size( A, 1 ) )

    [ A00,  a01,     A02,  ...
      a10t, alpha11, a12t, ...
      A20,  a21,     A22 ] = FLA_Repart_2x2_to_3x3( ATL, ATR, ...
                                                    ABL, ABR, ...
                                                    1, 1, 'FLA_BR' );

    [ B00,  b01,    B02,  ...
      b10t, beta11, b12t, ...
      B20,  b21,    B22 ] = FLA_Repart_2x2_to_3x3( BTL, BTR, ...
                                                   BBL, BBR, ...
                                                   1, 1, 'FLA_BR' );

    %------------------------------------------------------------%

    a01 = a01 / alpha11;
    a21 = a21 / alpha11;
    A02 = laff_ger(-1, a01, a12t, A02);
    A22 = laff_ger(-1, a21, a12t, A22);
    
    B00 = laff_ger(-1, a01, b10t, B00);
    B20 = laff_ger(-1, a21, b10t, B20);
    b01 = laff_scal(-1, a01 );
    b21 = laff_scal(-1, a21 );
    
    a01 = laff_zerov( a01 );
    a21 = laff_zerov( a21 );
    a12t = a12t / alpha11;
    b10t = b10t / alpha11;
    beta11 = 1 / alpha11;
    
    alpha11 = laff_onev( alpha11 );


    %------------------------------------------------------------%

    [ ATL, ATR, ...
      ABL, ABR ] = FLA_Cont_with_3x3_to_2x2( A00,  a01,     A02,  ...
                                             a10t, alpha11, a12t, ...
                                             A20,  a21,     A22, ...
                                             'FLA_TL' );

    [ BTL, BTR, ...
      BBL, BBR ] = FLA_Cont_with_3x3_to_2x2( B00,  b01,    B02,  ...
                                             b10t, beta11, b12t, ...
                                             B20,  b21,    B22, ...
                                             'FLA_TL' );

  end

  B_out = [ BTL, BTR
            BBL, BBR ];

return


