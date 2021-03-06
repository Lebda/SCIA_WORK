Test: 1000Pa,6x15x9,35°,wind0 {
   Inputs: {
      PrintCaption: False  ->  False
      Caption: uživatelský popis  ->  uživatelský popis
      q↓p←: 1000  ->  1000
      h: 6  ->  6
      b: 15  ->  15
      d: 9  ->  9
      α: 35  ->  35
      θ: 0  ->  0
      A↓J←: 18  ->  18
      c↓pe,10,F,1←: 0.7  ->  0.7
      c↓pe,1,F,1←: 0.7  ->  0.7
      c↓pe,10,G,1←: 0.7  ->  0.7
      c↓pe,1,G,1←: 0.7  ->  0.7
      c↓pe,10,H,1←: 0.4  ->  0.4
      c↓pe,1,H,1←: 0.4  ->  0.4
      c↓pe,10,I,1←: 0  ->  0
      c↓pe,1,I,1←: 0  ->  0
      c↓pe,10,J,1←: 0  ->  0
      c↓pe,1,J,1←: 0  ->  0
      c↓pe,10,F,2←: 0.7  ->  0.7
      c↓pe,1,F,2←: 0.7  ->  0.7
      c↓pe,10,G,2←: 0.7  ->  0.7
      c↓pe,1,G,2←: 0.7  ->  0.7
      c↓pe,10,H,2←: 0.6  ->  0.6
      c↓pe,1,H,2←: 0.6  ->  0.6
      c↓pe,10,I,2←: 0  ->  0
      c↓pe,1,I,2←: 0  ->  0
      c↓pe,10,J,2←: 0  ->  0
      c↓pe,1,J,2←: 0  ->  0
      c↓pe,10,F←: 0.7  ->  0.7
      c↓pe,1,F←: 0.7  ->  0.7
      c↓pe,F←: 0.7  ->  0.7
      c↓pe,10,G←: 0.7  ->  0.7
      c↓pe,1,G←: 0.7  ->  0.7
      c↓pe,G←: 0.7  ->  0.7
      c↓pe,10,H←: 0.467  ->  0.467
      c↓pe,1,H←: 0.467  ->  0.467
      c↓pe,H←: 0.467  ->  0.467
      c↓pe,10,I←: 0  ->  0
      c↓pe,1,I←: 0  ->  0
      c↓pe,I←: 0  ->  0
      c↓pe,10,J←: 0  ->  0
      c↓pe,1,J←: 0  ->  0
      c↓pe,J←: 0  ->  0
      c↓pe,10,I,tlak←: 0.2  ->  0.2
      c↓pe,1,I,sani←: -0.2  ->  -0.2
      c↓pe,10,J,tlak←: 0.2  ->  0.2
      c↓pe,1,J,saní←: -0.2  ->  -0.2
      ZavTlak: True  ->  True
      c↓pe,I,tlak←: 0.2  ->  0.2
      c↓pe,J,tlak←: 0.2  ->  0.2
      c↓pe,I,sani←: -0.2  ->  -0.2
      w↓I,tlak←: 200  ->  200
      w↓I,sani←: -200  ->  -200
      w↓J,tlak←: 200  ->  200
      w↓J,sani←: -200  ->  -200
      c↓pe,J,sani←: -0.2  ->  -0.2
      NavTlak: True  ->  True
      Headline: True  ->  True
      input: True  ->  True
   }
   Results: {
      e = 12 == 12
      A↓F← = 3.6 == 3.6
      A↓G← = 7.2 == 7.2
      A↓H← = 49.5 == 49.5
      A↓I← = 45 == 45
      α↓1← = 30 == 30
      α↓2← = 45 == 45
      w↓F← = 700 == 700
      w↓G← = 700 == 700
      w↓H← = 467 == 467
      w↓I← = 0 == 0
      w↓J← = 0 == 0
   }
   Test "1000Pa,6x15x9,35°,wind0" PASSED.
}
Test: 1500Pa,6x10x9,-30°,wind1 {
   Inputs: {
      PrintCaption: False  ->  False
      Caption: uživatelský popis  ->  uživatelský popis
      q↓p←: 1500  ->  1500
      h: 6  ->  6
      b: 10  ->  10
      d: 9  ->  9
      α: -30  ->  -30
      θ: 1  ->  1
      A↓J←: 18  ->  18
      c↓pe,10,F,1←: -1.5  ->  -1.5
      c↓pe,1,F,1←: -2.1  ->  -2.1
      c↓pe,10,G,1←: -1.2  ->  -1.2
      c↓pe,1,G,1←: -2  ->  -2
      c↓pe,10,H,1←: -1  ->  -1
      c↓pe,1,H,1←: -1.3  ->  -1.3
      c↓pe,10,I,1←: -0.9  ->  -0.9
      c↓pe,1,I,1←: -1.2  ->  -1.2
      c↓pe,10,J,1←: -0.8  ->  -0.8
      c↓pe,1,J,1←: -1.4  ->  -1.4
      c↓pe,10,F,2←: -1.9  ->  -1.9
      c↓pe,1,F,2←: -2.5  ->  -2.5
      c↓pe,10,G,2←: -1.2  ->  -1.2
      c↓pe,1,G,2←: -2  ->  -2
      c↓pe,10,H,2←: -0.8  ->  -0.8
      c↓pe,1,H,2←: -1.2  ->  -1.2
      c↓pe,10,I,2←: -0.8  ->  -0.8
      c↓pe,1,I,2←: -1.2  ->  -1.2
      c↓pe,10,J,2←: -0.7  ->  -0.7
      c↓pe,1,J,2←: -1.2  ->  -1.2
      c↓pe,10,F←: -1.5  ->  -1.5
      c↓pe,1,F←: -2.1  ->  -2.1
      c↓pe,F←: -1.86  ->  -1.86
      c↓pe,10,G←: -1.2  ->  -1.2
      c↓pe,1,G←: -2  ->  -2
      c↓pe,G←: -1.44  ->  -1.44
      c↓pe,10,H←: -1  ->  -1
      c↓pe,1,H←: -1.3  ->  -1.3
      c↓pe,H←: -1  ->  -1
      c↓pe,10,I←: -0.9  ->  -0.9
      c↓pe,1,I←: -1.2  ->  -1.2
      c↓pe,I←: -0.9  ->  -0.9
      c↓pe,10,J←: -0.8  ->  -0.8
      c↓pe,1,J←: -1.4  ->  -1.4
      c↓pe,J←: -0.8  ->  -0.8
      c↓pe,10,I,tlak←: 0.2  ->  0.2
      c↓pe,1,I,sani←: -0.2  ->  -0.2
      c↓pe,10,J,tlak←: 0.2  ->  0.2
      c↓pe,1,J,saní←: -0.2  ->  -0.2
      ZavTlak: True  ->  True
      c↓pe,I,tlak←: 0.2  ->  0.2
      c↓pe,J,tlak←: 0.2  ->  0.2
      c↓pe,I,sani←: -0.2  ->  -0.2
      w↓I,tlak←: 200  ->  200
      w↓I,sani←: -200  ->  -200
      w↓J,tlak←: 200  ->  200
      w↓J,sani←: -200  ->  -200
      c↓pe,J,sani←: -0.2  ->  -0.2
      NavTlak: True  ->  True
      Headline: True  ->  True
      input: True  ->  True
   }
   Results: {
      e = 10 == 10
      A↓F← = 2.5 == 2.5
      A↓G← = 5 == 5
      A↓H← = 50 == 50
      A↓I← = 40 == 40
      α↓1← = -30 == -30
      α↓2← = -15 == -15
      w↓F← = -2792 == -2792
      w↓G← = -2161 == -2161
      w↓H← = -1500 == -1500
      w↓I← = -1350 == -1350
      w↓J← = 0 == 0
   }
   Test "1500Pa,6x10x9,-30°,wind1" PASSED.
}
