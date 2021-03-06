Test: NoNails,i,5kN,15,4x8000 {
   Inputs: {
      d: 8  ->  8
      f↓h,k←: 16.3  ->  16.3
      f↓u←: 600  ->  600
      F↓v,a,Rk←: 3902  ->  3902
      F↓v,b,Rk←: 3715  ->  3715
      F↓v,c,Rk←: 14533  ->  14533
      F↓v,d,Rk←: 5254  ->  5254
      F↓v,e,Rk←: 9755  ->  9755
      F↓v,Ed←: 5000  ->  5000
      F↓v,f,Rk←: 9755  ->  9755
      F↓v,g,Rk←: 14533  ->  14533
      F↓v,h,Rk←: 5254  ->  5254
      F↓v,j,Rk←: 4878  ->  4878
      F↓v,k,Rk←: 3715  ->  3715
      F↓v,l,Rk←: 4878  ->  4878
      F↓v,m,Rk←: 5254  ->  5254
      F↓v,Rd←: 13507  ->  13507
      F↓v,Rk←: 4878  ->  4878
      F↓v,Rk,1←: 7194  ->  7194
      F↓v,Rk,2←: 10174  ->  10174
      α: 15  ->  15
      γ↓M←: 1.3  ->  1.3
      ρ↓k←: 370  ->  370
      h: 150  ->  150
      h↓e←: 120  ->  120
      k↓mod←: 0.9  ->  0.9
      n↓B←: 4  ->  4
      t↓s←: 8  ->  8
      t↓w←: 75  ->  75
      w: 1  ->  1
      Caption: Check of steel connections  ->  Check of steel connections
      PrintCaption: False  ->  False
      B0: False  ->  False
      Type: 8  ->  8
      H1: True  ->  True
   }
   Results: {
      F↓90,Ed← = 1294 == 1294
      F↓90,Rd← = 17806 == 17806
      M↓y,Rk← = 40115 == 40115
      s = 0.37 == 0.37
      s↓v← = 0.0727 == 0.0727
   }
   Test "NoNails,i,5kN,15,4x8000" PASSED.
}
Test: Nails,c,15kN,15,4x8000 {
   Inputs: {
      d: 8  ->  8
      f↓h,k←: 27.9  ->  27.9
      f↓u←: 600  ->  600
      F↓v,a,Rk←: 6699  ->  6699
      F↓v,b,Rk←: 4868  ->  4868
      F↓v,c,Rk←: 24430  ->  24430
      F↓v,d,Rk←: 6884  ->  6884
      F↓v,e,Rk←: 16748  ->  16748
      F↓v,Ed←: 15000  ->  15000
      F↓v,f,Rk←: 9755  ->  9755
      F↓v,g,Rk←: 14533  ->  14533
      F↓v,h,Rk←: 5254  ->  5254
      F↓v,j,Rk←: 4878  ->  4878
      F↓v,k,Rk←: 3715  ->  3715
      F↓v,l,Rk←: 4878  ->  4878
      F↓v,m,Rk←: 5254  ->  5254
      F↓v,Rd←: 19063  ->  19063
      F↓v,Rk←: 6884  ->  6884
      F↓v,Rk,1←: 7194  ->  7194
      F↓v,Rk,2←: 10174  ->  10174
      α: 15  ->  15
      γ↓M←: 1.3  ->  1.3
      ρ↓k←: 370  ->  370
      h: 150  ->  150
      h↓e←: 120  ->  120
      k↓mod←: 0.9  ->  0.9
      n↓B←: 4  ->  4
      t↓s←: 8  ->  8
      t↓w←: 75  ->  75
      w: 1  ->  1
      Caption: Check of steel connections  ->  Check of steel connections
      PrintCaption: False  ->  False
      B0: True  ->  True
      Type: 2  ->  2
      H1: True  ->  True
   }
   Results: {
      F↓90,Ed← = 3882 == 3882
      F↓90,Rd← = 17806 == 17806
      M↓y,Rk← = 40115 == 40115
      s = 0.787 == 0.787
      s↓v← = 0.218 == 0.218
   }
   Test "Nails,c,15kN,15,4x8000" PASSED.
}
Test: Nails,c,15kN,15,4x80 {
   Inputs: {
      d: 0.08  ->  0.08
      f↓h,k←: 30.3  ->  30.3
      f↓u←: 600  ->  600
      F↓v,a,Rk←: 72.8  ->  72.8
      F↓v,b,Rk←: 1.27  ->  1.27
      F↓v,c,Rk←: 257  ->  257
      F↓v,d,Rk←: 1.8  ->  1.8
      F↓v,e,Rk←: 182  ->  182
      F↓v,Ed←: 15000  ->  15000
      F↓v,f,Rk←: 9755  ->  9755
      F↓v,g,Rk←: 14533  ->  14533
      F↓v,h,Rk←: 5254  ->  5254
      F↓v,j,Rk←: 4878  ->  4878
      F↓v,k,Rk←: 3715  ->  3715
      F↓v,l,Rk←: 4878  ->  4878
      F↓v,m,Rk←: 5254  ->  5254
      F↓v,Rd←: 4.99  ->  4.99
      F↓v,Rk←: 1.8  ->  1.8
      F↓v,Rk,1←: 7194  ->  7194
      F↓v,Rk,2←: 10174  ->  10174
      α: 15  ->  15
      γ↓M←: 1.3  ->  1.3
      ρ↓k←: 370  ->  370
      h: 150  ->  150
      h↓e←: 120  ->  120
      k↓mod←: 0.9  ->  0.9
      n↓B←: 4  ->  4
      t↓s←: 8  ->  8
      t↓w←: 75  ->  75
      w: 1  ->  1
      Caption: Check of steel connections  ->  Check of steel connections
      PrintCaption: False  ->  False
      B0: True  ->  True
      Type: 2  ->  2
      H1: True  ->  True
   }
   Results: {
      F↓90,Ed← = 3882 == 3882
      F↓90,Rd← = 17806 == 17806
      M↓y,Rk← = 0.253 == 0.253
      s = 3006 == 3006
      s↓v← = 0.218 == 0.218
   }
   Test "Nails,c,15kN,15,4x80" PASSED.
}
