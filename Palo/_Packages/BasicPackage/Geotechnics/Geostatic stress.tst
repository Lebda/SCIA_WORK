Test: 3m,10kN/m {
   Inputs: {
      γ↓1←: 18000  ->  18000
      h↓1←: 3  ->  3
      γ↓2←: 22000  ->  22000
      h↓2←: 3  ->  3
      γ↓3←: 25000  ->  25000
      h↓3←: 4  ->  4
      γ↓4←: 0  ->  0
      h↓4←: 0  ->  0
      γ↓5←: 23000  ->  23000
      h↓5←: 0  ->  0
      h↓hpv←: 3  ->  3
      γ↓w←: 10000  ->  10000
      H1: True  ->  True
      PrintCaption: False  ->  False
      NA: ČSN EN 1997  ->  ČSN EN 1997
      H2: userdefined description  ->  userdefined description
   }
   Results: {
      σ↓ef← = 150000 == 150000
      u = 70000 == 70000
      σ↓u← = 220000 == 220000
      h = 10 == 10
   }
   Test "3m,10kN/m" PASSED.
}
Test: 0,5m;15kN/m {
   Inputs: {
      γ↓1←: 18000  ->  18000
      h↓1←: 3  ->  3
      γ↓2←: 22000  ->  22000
      h↓2←: 3  ->  3
      γ↓3←: 25000  ->  25000
      h↓3←: 4  ->  4
      γ↓4←: 0  ->  0
      h↓4←: 0  ->  0
      γ↓5←: 23000  ->  23000
      h↓5←: 0  ->  0
      h↓hpv←: 0.5  ->  0.5
      γ↓w←: 15000  ->  15000
      H1: True  ->  True
      PrintCaption: False  ->  False
      NA: ČSN EN 1997  ->  ČSN EN 1997
      H2: userdefined description  ->  userdefined description
   }
   Results: {
      σ↓ef← = 77500 == 77500
      u = 142500 == 142500
      σ↓u← = 220000 == 220000
      h = 10 == 10
   }
   Test "0,5m;15kN/m" PASSED.
}
