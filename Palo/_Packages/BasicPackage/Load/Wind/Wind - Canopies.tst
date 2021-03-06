Test: 1000Pa,15°,10x10 {
   Inputs: {
      PrintCaption: False  ->  False
      Caption: uživatelský popis  ->  uživatelský popis
      q↓p←: 1000  ->  1000
      α: 15  ->  15
      d: 10  ->  10
      b: 10  ->  10
      ϕ: 0.5  ->  0.5
      A↓A←: 24  ->  24
      A↓B←: 8  ->  8
      A↓C←: 8  ->  8
      c↓f,max←: 0.4  ->  0.4
      c↓p,net,max,A←: 0.9  ->  0.9
      c↓p,net,max,B←: 1.9  ->  1.9
      c↓p,net,max,C←: 1.4  ->  1.4
      c↓f,0←: -0.8  ->  -0.8
      c↓p,net,0,A←: -0.9  ->  -0.9
      c↓p,net,0,B←: -1.7  ->  -1.7
      c↓p,net,0,C←: -1.4  ->  -1.4
      c↓f,1←: -1.3  ->  -1.3
      c↓p,net,1,A←: -1.3  ->  -1.3
      c↓p,net,1,B←: -2.2  ->  -2.2
      c↓p,net,1,C←: -1.6  ->  -1.6
      c↓f,max,2←: 0.6  ->  0.6
      c↓p,net,max,A,2←: 1.1  ->  1.1
      c↓p,net,max,B,2←: 1.9  ->  1.9
      c↓p,net,max,C,2←: 1.5  ->  1.5
      c↓f,0,2←: -0.9  ->  -0.9
      c↓p,net,0,A,2←: -1.2  ->  -1.2
      c↓p,net,0,B,2←: -1.8  ->  -1.8
      c↓p,net,0,C,2←: -1.4  ->  -1.4
      c↓f,1,2←: -1.3  ->  -1.3
      c↓p,net,1,A,2←: -1.4  ->  -1.4
      c↓p,net,1,B,2←: -2.2  ->  -2.2
      c↓f,ϕ,max←: 0.4  ->  0.4
      ϕ↓1←: 0  ->  0
      ϕ↓2←: 1  ->  1
      c↓f←,↓α1←: -1.1  ->  -1.1
      c↓f←,↓α2←: -1.15  ->  -1.15
      c↓f,ϕ←: -1.05  ->  -1.05
      c↓p,net,maxA,←: 2.08  ->  2.08
      c↓p,net,maxB,←: 1.54  ->  1.54
      c↓p,net,maxC,←: 0.66  ->  0.66
      c↓p,net,A,1←: -1.1  ->  -1.1
      c↓p,net,A,2←: -1.3  ->  -1.3
      c↓p,net,A←: -2.76  ->  -2.76
      c↓p,net,ϕ,A←: -1.1  ->  -1.1
      c↓p,net,B,1←: -1.95  ->  -1.95
      c↓p,net,B,2←: -2  ->  -2
      c↓p,net,ϕ,B←: -1.95  ->  -1.95
      c↓p,net,C,1←: -1.5  ->  -1.5
      c↓p,net,1,C,2←: -1.6  ->  -1.6
      c↓p,net,ϕ,C←: -1.5  ->  -1.5
      c↓p,net,C,2←: -1.5  ->  -1.5
      c↓f,ϕ,1←: 0  ->  0
      c↓p,net,max,D←: 0.4  ->  0.4
      c↓p,net,0,D←: -1.8  ->  -1.8
      c↓p,net,1,D←: -2.1  ->  -2.1
      c↓p,net,max,D,2←: 0.4  ->  0.4
      c↓p,net,0,D,2←: -2  ->  -2
      c↓p,net,D,1←: -1.95  ->  -1.95
      c↓p,net,D,2←: -2.05  ->  -2.05
      c↓p,net,1,D,2←: -2.1  ->  -2.1
      c↓p,net,ϕ,D←: -1.95  ->  -1.95
      c↓p,net,maxB←: 1.54  ->  1.54
      c↓p,net,maxC←: 0.66  ->  0.66
      A↓D←: 16  ->  16
      multi: True  ->  True
      ψ↓mc,+,1←: 1  ->  1
      ψ↓mc,-,1←: 0.8  ->  0.8
      ψ↓mc,+,2←: 0.9  ->  0.9
      ψ↓mc,-,2←: 0.7  ->  0.7
      ψ↓mc,+,3←: 0.7  ->  0.7
      ψ↓mc,-,3←: 0.7  ->  0.7
      Headline: True  ->  True
      c↓f,α1←: -1.05  ->  -1.05
      c↓f,α2←: -1.1  ->  -1.1
      ψ↓mc, + ,1←: 1  ->  1
      ψ↓mc, - ,1←: 0.8  ->  0.8
      ψ↓mc, + ,2←: 0.9  ->  0.9
      ψ↓mc, - ,2←: 0.7  ->  0.7
      ψ↓mc, + ,3←: 0.7  ->  0.7
      ψ↓mc, - ,3←: 0.7  ->  0.7
      typ: 1  ->  1
   }
   Results: {
      α↓1← = 15 == 15
      α↓2← = 20 == 20
      w↓p,net,max,A← = 630 == 630
      w↓p,net,max,B← = 1330 == 1330
      w↓p,net,max,C← = 980 == 980
      w↓p,net,max,D← = 280 == 280
      w↓p,net,ϕ,A← = -770 == -770
      w↓p,net,ϕ,B← = -1365 == -1365
      w↓p,net,ϕ,C← = -1050 == -1050
      w↓p,net,ϕ,D← = -1365 == -1365
      F↓f,ϕ,max← = 14000 == 14000
      F↓f,ϕ← = -36750 == -36750
   }
   Test "1000Pa,15°,10x10" PASSED.
}
Test: 1000Pa,15°,10x10,typ2 {
   Inputs: {
      PrintCaption: False  ->  False
      Caption: uživatelský popis  ->  uživatelský popis
      q↓p←: 1000  ->  1000
      α: 15  ->  15
      d: 10  ->  10
      b: 10  ->  10
      ϕ: 0.5  ->  0.5
      A↓A←: 24  ->  24
      A↓B←: 8  ->  8
      A↓C←: 8  ->  8
      c↓f,max←: 0.7  ->  0.7
      c↓p,net,max,A←: 1.4  ->  1.4
      c↓p,net,max,B←: 2.7  ->  2.7
      c↓p,net,max,C←: 1.8  ->  1.8
      c↓f,0←: -1.1  ->  -1.1
      c↓p,net,0,A←: -1.8  ->  -1.8
      c↓p,net,0,B←: -2.4  ->  -2.4
      c↓p,net,0,C←: -2.5  ->  -2.5
      c↓f,1←: -1.4  ->  -1.4
      c↓p,net,1,A←: -1.6  ->  -1.6
      c↓p,net,1,B←: -2.9  ->  -2.9
      c↓p,net,1,C←: -3  ->  -3
      c↓f,max,2←: 0.8  ->  0.8
      c↓p,net,max,A,2←: 1.7  ->  1.7
      c↓p,net,max,B,2←: 2.9  ->  2.9
      c↓p,net,max,C,2←: 2.1  ->  2.1
      c↓f,0,2←: -1.3  ->  -1.3
      c↓p,net,0,A,2←: -2.2  ->  -2.2
      c↓p,net,0,B,2←: -2.8  ->  -2.8
      c↓p,net,0,C,2←: -2.9  ->  -2.9
      c↓f,1,2←: -1.4  ->  -1.4
      c↓p,net,1,A,2←: -1.6  ->  -1.6
      c↓p,net,1,B,2←: -2.9  ->  -2.9
      c↓f,ϕ,max←: 0.7  ->  0.7
      ϕ↓1←: 0  ->  0
      ϕ↓2←: 1  ->  1
      c↓f←,↓α1←: -1.1  ->  -1.1
      c↓f←,↓α2←: -1.15  ->  -1.15
      c↓f,ϕ←: -1.25  ->  -1.25
      c↓p,net,maxA,←: 2.08  ->  2.08
      c↓p,net,maxB,←: 1.54  ->  1.54
      c↓p,net,maxC,←: 0.66  ->  0.66
      c↓p,net,A,1←: -1.7  ->  -1.7
      c↓p,net,A,2←: -1.9  ->  -1.9
      c↓p,net,A←: -2.76  ->  -2.76
      c↓p,net,ϕ,A←: -1.7  ->  -1.7
      c↓p,net,B,1←: -2.65  ->  -2.65
      c↓p,net,B,2←: -2.85  ->  -2.85
      c↓p,net,ϕ,B←: -2.65  ->  -2.65
      c↓p,net,C,1←: -2.75  ->  -2.75
      c↓p,net,1,C,2←: -3  ->  -3
      c↓p,net,ϕ,C←: -2.75  ->  -2.75
      c↓p,net,C,2←: -2.95  ->  -2.95
      c↓f,ϕ,1←: 0  ->  0
      c↓p,net,max,D←: 0.4  ->  0.4
      c↓p,net,0,D←: -1.8  ->  -1.8
      c↓p,net,1,D←: -2.1  ->  -2.1
      c↓p,net,max,D,2←: 0.4  ->  0.4
      c↓p,net,0,D,2←: -2  ->  -2
      c↓p,net,D,1←: -1.95  ->  -1.95
      c↓p,net,D,2←: -2.05  ->  -2.05
      c↓p,net,1,D,2←: -2.1  ->  -2.1
      c↓p,net,ϕ,D←: -1.95  ->  -1.95
      c↓p,net,maxB←: 1.54  ->  1.54
      c↓p,net,maxC←: 0.66  ->  0.66
      A↓D←: 16  ->  16
      multi: False  ->  False
      ψ↓mc,+,1←: 1  ->  1
      ψ↓mc,-,1←: 0.8  ->  0.8
      ψ↓mc,+,2←: 0.9  ->  0.9
      ψ↓mc,-,2←: 0.7  ->  0.7
      ψ↓mc,+,3←: 0.7  ->  0.7
      ψ↓mc,-,3←: 0.7  ->  0.7
      Headline: True  ->  True
      c↓f,α1←: -1.25  ->  -1.25
      c↓f,α2←: -1.35  ->  -1.35
      ψ↓mc, + ,1←: 1  ->  1
      ψ↓mc, - ,1←: 0.8  ->  0.8
      ψ↓mc, + ,2←: 0.9  ->  0.9
      ψ↓mc, - ,2←: 0.7  ->  0.7
      ψ↓mc, + ,3←: 0.7  ->  0.7
      ψ↓mc, - ,3←: 0.7  ->  0.7
      typ: 0  ->  0
   }
   Results: {
      α↓1← = 15 == 15
      α↓2← = 20 == 20
      w↓p,net,max,A← = 1400 == 1400
      w↓p,net,max,B← = 2700 == 2700
      w↓p,net,max,C← = 1800 == 1800
      w↓p,net,max,D← = 280 == 280
      w↓p,net,ϕ,A← = -1700 == -1700
      w↓p,net,ϕ,B← = -2650 == -2650
      w↓p,net,ϕ,C← = -2750 == -2750
      w↓p,net,ϕ,D← = -1365 == -1365
      F↓f,ϕ,max← = 70000 == 70000
      F↓f,ϕ← = -125000 == -125000
   }
   Test "1000Pa,15°,10x10,typ2" PASSED.
}
Test: 1500Pa,15°,15x15,typ2 {
   Inputs: {
      PrintCaption: False  ->  False
      Caption: uživatelský popis  ->  uživatelský popis
      q↓p←: 1500  ->  1500
      α: 15  ->  15
      d: 15  ->  15
      b: 15  ->  15
      ϕ: 0.5  ->  0.5
      A↓A←: 24  ->  24
      A↓B←: 8  ->  8
      A↓C←: 8  ->  8
      c↓f,max←: 0.7  ->  0.7
      c↓p,net,max,A←: 1.4  ->  1.4
      c↓p,net,max,B←: 2.7  ->  2.7
      c↓p,net,max,C←: 1.8  ->  1.8
      c↓f,0←: -1.1  ->  -1.1
      c↓p,net,0,A←: -1.8  ->  -1.8
      c↓p,net,0,B←: -2.4  ->  -2.4
      c↓p,net,0,C←: -2.5  ->  -2.5
      c↓f,1←: -1.4  ->  -1.4
      c↓p,net,1,A←: -1.6  ->  -1.6
      c↓p,net,1,B←: -2.9  ->  -2.9
      c↓p,net,1,C←: -3  ->  -3
      c↓f,max,2←: 0.8  ->  0.8
      c↓p,net,max,A,2←: 1.7  ->  1.7
      c↓p,net,max,B,2←: 2.9  ->  2.9
      c↓p,net,max,C,2←: 2.1  ->  2.1
      c↓f,0,2←: -1.3  ->  -1.3
      c↓p,net,0,A,2←: -2.2  ->  -2.2
      c↓p,net,0,B,2←: -2.8  ->  -2.8
      c↓p,net,0,C,2←: -2.9  ->  -2.9
      c↓f,1,2←: -1.4  ->  -1.4
      c↓p,net,1,A,2←: -1.6  ->  -1.6
      c↓p,net,1,B,2←: -2.9  ->  -2.9
      c↓f,ϕ,max←: 0.7  ->  0.7
      ϕ↓1←: 0  ->  0
      ϕ↓2←: 1  ->  1
      c↓f←,↓α1←: -1.1  ->  -1.1
      c↓f←,↓α2←: -1.15  ->  -1.15
      c↓f,ϕ←: -1.25  ->  -1.25
      c↓p,net,maxA,←: 2.08  ->  2.08
      c↓p,net,maxB,←: 1.54  ->  1.54
      c↓p,net,maxC,←: 0.66  ->  0.66
      c↓p,net,A,1←: -1.7  ->  -1.7
      c↓p,net,A,2←: -1.9  ->  -1.9
      c↓p,net,A←: -2.76  ->  -2.76
      c↓p,net,ϕ,A←: -1.7  ->  -1.7
      c↓p,net,B,1←: -2.65  ->  -2.65
      c↓p,net,B,2←: -2.85  ->  -2.85
      c↓p,net,ϕ,B←: -2.65  ->  -2.65
      c↓p,net,C,1←: -2.75  ->  -2.75
      c↓p,net,1,C,2←: -3  ->  -3
      c↓p,net,ϕ,C←: -2.75  ->  -2.75
      c↓p,net,C,2←: -2.95  ->  -2.95
      c↓f,ϕ,1←: 0  ->  0
      c↓p,net,max,D←: 0.4  ->  0.4
      c↓p,net,0,D←: -1.8  ->  -1.8
      c↓p,net,1,D←: -2.1  ->  -2.1
      c↓p,net,max,D,2←: 0.4  ->  0.4
      c↓p,net,0,D,2←: -2  ->  -2
      c↓p,net,D,1←: -1.95  ->  -1.95
      c↓p,net,D,2←: -2.05  ->  -2.05
      c↓p,net,1,D,2←: -2.1  ->  -2.1
      c↓p,net,ϕ,D←: -1.95  ->  -1.95
      c↓p,net,maxB←: 1.54  ->  1.54
      c↓p,net,maxC←: 0.66  ->  0.66
      A↓D←: 16  ->  16
      multi: False  ->  False
      ψ↓mc,+,1←: 1  ->  1
      ψ↓mc,-,1←: 0.8  ->  0.8
      ψ↓mc,+,2←: 0.9  ->  0.9
      ψ↓mc,-,2←: 0.7  ->  0.7
      ψ↓mc,+,3←: 0.7  ->  0.7
      ψ↓mc,-,3←: 0.7  ->  0.7
      Headline: True  ->  True
      c↓f,α1←: -1.25  ->  -1.25
      c↓f,α2←: -1.35  ->  -1.35
      ψ↓mc, + ,1←: 1  ->  1
      ψ↓mc, - ,1←: 0.8  ->  0.8
      ψ↓mc, + ,2←: 0.9  ->  0.9
      ψ↓mc, - ,2←: 0.7  ->  0.7
      ψ↓mc, + ,3←: 0.7  ->  0.7
      ψ↓mc, - ,3←: 0.7  ->  0.7
      typ: 0  ->  0
   }
   Results: {
      α↓1← = 15 == 15
      α↓2← = 20 == 20
      w↓p,net,max,A← = 2100 == 2100
      w↓p,net,max,B← = 4050 == 4050
      w↓p,net,max,C← = 2700 == 2700
      w↓p,net,max,D← = 280 == 280
      w↓p,net,ϕ,A← = -2550 == -2550
      w↓p,net,ϕ,B← = -3975 == -3975
      w↓p,net,ϕ,C← = -4125 == -4125
      w↓p,net,ϕ,D← = -1365 == -1365
      F↓f,ϕ,max← = 236250 == 236250
      F↓f,ϕ← = -421875 == -421875
   }
   Test "1500Pa,15°,15x15,typ2" PASSED.
}
