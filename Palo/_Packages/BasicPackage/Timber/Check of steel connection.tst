Test: 5kN,40,9000,6,2 {
   Inputs: {
      d: 9  ->  9
      F↓1,v,Rk←: 3976  ->  3976
      f↓h,1,k←: 27.6  ->  27.6
      f↓h,2,k←: 27.6  ->  27.6
      f↓u←: 600  ->  600
      F↓v,Ed←: 5000  ->  5000
      F↓v,Rk1←: 9939  ->  9939
      F↓v,Rk2←: 3976  ->  3976
      F↓v,Rk3←: 4786  ->  4786
      F↓v,Rk4←: 5984  ->  5984
      F↓v,Rk5←: 4350  ->  4350
      F↓v,Rk6←: 5984  ->  5984
      α: 40  ->  40
      γ↓M←: 1.3  ->  1.3
      ρ↓1,k←: 370  ->  370
      ρ↓2,k←: 370  ->  370
      h: 100  ->  100
      h↓e←: 76  ->  76
      k↓mod,1←: 0.9  ->  0.9
      k↓mod,2←: 0.9  ->  0.9
      n↓B←: 6  ->  6
      n↓p←: 1  ->  1
      s: 0.151  ->  0.151
      t↓1←: 40  ->  40
      t↓2←: 32  ->  32
      Caption: Posouzení kovových spojovacích prostředků  ->  Posouzení kovových spojovacích prostředků
      PrintCaption: False  ->  False
      input: True  ->  True
      H1: True  ->  True
   }
   Results: {
      F↓90,Rd← = 7972 == 7972
      F↓v,Rd← = 33029 == 33029
      β = 1 == 1
      k↓mod← = 0.9 == 0.9
      M↓y,Rk← = 54488 == 54488
      w = 1 == 1
      np = 2 == 2
   }
   Test "5kN,40,9000,6,2" PASSED.
}
Test: 15kN,40,80,5,1 {
   Inputs: {
      d: 0.08  ->  0.08
      F↓1,v,Rk←: 1.86  ->  1.86
      F↓90,Rd←: 7972  ->  7972
      f↓h,1,k←: 64.7  ->  64.7
      f↓h,2,k←: 64.7  ->  64.7
      f↓u←: 600  ->  600
      F↓v,Ed←: 15000  ->  15000
      F↓v,Rk1←: 207  ->  207
      F↓v,Rk2←: 166  ->  166
      F↓v,Rk3←: 78  ->  78
      F↓v,Rk4←: 72.5  ->  72.5
      F↓v,Rk5←: 58  ->  58
      F↓v,Rk6←: 1.86  ->  1.86
      α: 40  ->  40
      γ↓M←: 1.3  ->  1.3
      ρ↓1,k←: 370  ->  370
      ρ↓2,k←: 370  ->  370
      h: 100  ->  100
      h↓e←: 76  ->  76
      k↓mod,1←: 0.9  ->  0.9
      k↓mod,2←: 0.9  ->  0.9
      n↓B←: 5  ->  5
      n↓p←: 0  ->  0
      s: 2327  ->  2327
      t↓1←: 40  ->  40
      t↓2←: 32  ->  32
      Caption: Posouzení kovových spojovacích prostředků  ->  Posouzení kovových spojovacích prostředků
      PrintCaption: False  ->  False
      input: True  ->  True
      H1: True  ->  True
   }
   Results: {
      F↓v,Rd← = 6.45 == 6.45
      β = 1 == 1
      k↓mod← = 0.9 == 0.9
      M↓y,Rk← = 0.253 == 0.253
      w = 1 == 1
      np = 1 == 1
   }
   Test "15kN,40,80,5,1" PASSED.
}
