Test: 1x1x5,1500Pa {
   Inputs: {
      PrintCaption: False  ->  False
      Caption: uživatelský popis  ->  uživatelský popis
      b: 1  ->  1
      h: 1  ->  1
      z↓g←: 5  ->  5
      c↓f←: 1.8  ->  1.8
      q↓p←: 1500  ->  1500
      Headline: True  ->  True
   }
   Results: {
      A↓ref← = 1 == 1
      F↓w← = 2700 == 2700
      z↓e← = 5.5 == 5.5
      e = 0.25 == 0.25
   }
   Test "1x1x5,1500Pa" PASSED.
}
Test: 1x5x5,1500Pa {
   Inputs: {
      PrintCaption: False  ->  False
      Caption: uživatelský popis  ->  uživatelský popis
      b: 1  ->  1
      h: 5  ->  5
      z↓g←: 5  ->  5
      c↓f←: 1.8  ->  1.8
      q↓p←: 1500  ->  1500
      Headline: True  ->  True
   }
   Results: {
      A↓ref← = 5 == 5
      F↓w← = 13500 == 13500
      z↓e← = 7.5 == 7.5
      e = 0.25 == 0.25
   }
   Test "1x5x5,1500Pa" PASSED.
}
Test: 2x6,5x5;1500Pa {
   Inputs: {
      PrintCaption: False  ->  False
      Caption: uživatelský popis  ->  uživatelský popis
      b: 2  ->  2
      h: 6.5  ->  6.5
      z↓g←: 5  ->  5
      c↓f←: 1.8  ->  1.8
      q↓p←: 1500  ->  1500
      Headline: True  ->  True
   }
   Results: {
      A↓ref← = 13 == 13
      F↓w← = 35100 == 35100
      z↓e← = 8.25 == 8.25
      e = 0.5 == 0.5
   }
   Test "2x6,5x5;1500Pa" PASSED.
}
Test: 2x6,5x5;100Pa {
   Inputs: {
      PrintCaption: False  ->  False
      Caption: uživatelský popis  ->  uživatelský popis
      b: 2  ->  2
      h: 6.5  ->  6.5
      z↓g←: 5  ->  5
      c↓f←: 1.8  ->  1.8
      q↓p←: 100  ->  100
      Headline: True  ->  True
   }
   Results: {
      A↓ref← = 13 == 13
      F↓w← = 2340 == 2340
      z↓e← = 8.25 == 8.25
      e = 0.5 == 0.5
   }
   Test "2x6,5x5;100Pa" PASSED.
}
