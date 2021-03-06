        Test: 3m,50x50mm,3m,1.5kN/m,1kN/m,C18 {
          Inputs: {
            L: 6  ->  6
            E: 6∙10↑9←  ->  6∙10↑9←
            Caption: Bracket - timber - triangular increasing force  ->  Bracket - timber - triangular increasing force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            s: 34.8  ->  34.8
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            H: 0.05  ->  0.05
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 18∙10↑6←  ->  18∙10↑6←
            γ↓M←: 1.3  ->  1.3
            B: 0.05  ->  0.05
            a: 3  ->  3
            d: 0  ->  0
            c: 3  ->  3
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
            k↓h←: 1.25  ->  1.25
          }
          Results: {
            M↓Rd← = 323 == 323
            M↓Ed← = 11250 == 11250
            f↓m,d← = 15.5∙10↑6← == 15.5∙10↑6←
            I↓y← = 520.83333333∙10↑-9← == 521∙10↑-9←
            W↓y← = 20.833333333∙10↑-6← == 20.8∙10↑-6←
            w↓b← = 26.1 == 26.1
            w↓L← = 26.1 == 26.1
            ϕ↓b← = 6.12 == 6.12
          }
          Test "3m,50x50mm,3m,1.5kN/m,1kN/m,C18" PASSED.
        }
        Test: 3m,200x150mm,3m,1.5kN/m,1kN/m,C18 {
          Inputs: {
            L: 6  ->  6
            E: 6∙10↑9←  ->  6∙10↑9←
            Caption: Bracket - timber - triangular increasing force  ->  Bracket - timber - triangular increasing force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            s: 0.903  ->  0.903
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            H: 0.2  ->  0.2
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 18∙10↑6←  ->  18∙10↑6←
            γ↓M←: 1.3  ->  1.3
            B: 0.15  ->  0.15
            a: 3  ->  3
            d: 0  ->  0
            c: 3  ->  3
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
            k↓h←: 1  ->  1
          }
          Results: {
            M↓Rd← = 12462 == 12462
            M↓Ed← = 11250 == 11250
            f↓m,d← = 12.5∙10↑6← == 12.5∙10↑6←
            I↓y← = 100∙10↑-6← == 100∙10↑-6←
            W↓y← = 1∙10↑-3← == 1∙10↑-3←
            w↓b← = 0.136 == 0.136
            w↓L← = 0.136 == 0.136
            ϕ↓b← = 0.0319 == 0.0319
          }
          Test "3m,200x150mm,3m,1.5kN/m,1kN/m,C18" PASSED.
        }
        Test: 3m,200x150mm,3m,1.5kN/m,1kN/m,C14 {
          Inputs: {
            L: 6  ->  6
            E: 4.7∙10↑9←  ->  4.7∙10↑9←
            Caption: Bracket - timber - triangular increasing force  ->  Bracket - timber - triangular increasing force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            s: 1.16  ->  1.16
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            H: 0.2  ->  0.2
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 14∙10↑6←  ->  14∙10↑6←
            γ↓M←: 1.3  ->  1.3
            B: 0.15  ->  0.15
            a: 3  ->  3
            d: 0  ->  0
            c: 3  ->  3
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
            k↓h←: 1  ->  1
          }
          Results: {
            M↓Rd← = 9692 == 9692
            M↓Ed← = 11250 == 11250
            f↓m,d← = 9.69∙10↑6← == 9.69∙10↑6←
            I↓y← = 100∙10↑-6← == 100∙10↑-6←
            W↓y← = 1∙10↑-3← == 1∙10↑-3←
            w↓b← = 0.174 == 0.174
            w↓L← = 0.174 == 0.174
            ϕ↓b← = 0.0407 == 0.0407
          }
          Test "3m,200x150mm,3m,1.5kN/m,1kN/m,C14" PASSED.
        }