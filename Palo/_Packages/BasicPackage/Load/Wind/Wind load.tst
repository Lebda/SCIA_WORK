Test: Cat1,c0=1,vb0=25,cdir=1 {
   Inputs: {
      c↓dir←: 1  ->  1
      c↓season←: 1  ->  1
      v↓b0←: 25  ->  25
      c↓0←: 1  ->  1
      z: 10  ->  10
      z↓0←: 0.01  ->  0.01
      z↓0II←: 0.05  ->  0.05
      z↓min←: 1  ->  1
      ρ: 1.25  ->  1.25
      Cat: 1  ->  1
      c↓s←c↓d←: 1  ->  1
      A↓ref←: 5  ->  5
      c↓pe1←: 1  ->  1
      c↓pe10←: 0.8  ->  0.8
      k↓I←: 1  ->  1
      Caption: uživatelský popis  ->  uživatelský popis
      PrintCaption: False  ->  False
      Headline: True  ->  True
   }
   Results: {
      v↓b← = 25 == 25
      v↓m← = 29.3 == 29.3
      c↓r← = 1.17 == 1.17
      k↓r← = 0.17 == 0.17
      I↓v← = 0.145 == 0.145
      q↓p← = 1081 == 1081
      F↓w← = 4651 == 4651
      c↓f← = 0.86 == 0.86
   }
   Test "Cat1,c0=1,vb0=25,cdir=1" PASSED.
}
Test: Cat4,c0=4,vb0=35,cdir=2 {
   Inputs: {
      c↓dir←: 2  ->  2
      c↓season←: 1  ->  1
      v↓b0←: 35  ->  35
      c↓0←: 4  ->  4
      z: 10  ->  10
      z↓0←: 1  ->  1
      z↓0II←: 0.05  ->  0.05
      z↓min←: 10  ->  10
      ρ: 1.25  ->  1.25
      Cat: 4  ->  4
      c↓s←c↓d←: 1  ->  1
      A↓ref←: 5  ->  5
      c↓pe1←: 1  ->  1
      c↓pe10←: 0.8  ->  0.8
      k↓I←: 1  ->  1
      Caption: uživatelský popis  ->  uživatelský popis
      PrintCaption: False  ->  False
      Headline: True  ->  True
   }
   Results: {
      v↓b← = 70 == 70
      v↓m← = 151 == 151
      c↓r← = 0.54 == 0.54
      k↓r← = 0.234 == 0.234
      I↓v← = 0.109 == 0.109
      q↓p← = 25107 == 25107
      F↓w← = 107986 == 107986
      c↓f← = 0.86 == 0.86
   }
   Test "Cat4,c0=4,vb0=35,cdir=2" PASSED.
}
