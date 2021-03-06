        Test: 6m,6kN,4kN,200x140mm,0.9,C14 {
          Inputs: {
            L: 6  ->  6
            E: 4.7∙10↑9←  ->  4.7∙10↑9←
            Caption: Simple member - timber - simple force 2x  ->  Simple member - timber - simple force 2x
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 6000  ->  6000
            F↓k←: 4000  ->  4000
            s: 1.33  ->  1.33
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            h: 0.2  ->  0.2
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 14∙10↑6←  ->  14∙10↑6←
            γ↓M←: 1.3  ->  1.3
            b: 0.14  ->  0.14
          }
          Results: {
            M↓Rd← = 9046 == 9046
            M↓Ed← = 12000 == 12000
            w = 0.0699 == 0.0699
            ϕ↓a← = 0.0365 == 0.0365
            k↓h← = 1 == 1
            f↓m,d← = 9.69∙10↑6← == 9.69∙10↑6←
            I↓y← = 93.3∙10↑-6← == 93.3∙10↑-6←
            W↓y← = 933∙10↑-6← == 933∙10↑-6←
          }
          Test "6m,6kN,4kN,200x140mm,0.9,C14" PASSED.
        }
        Test: 15m,6kN,4kN,200x140mm,0.9,C14 {
          Inputs: {
            L: 15  ->  15
            E: 4.7∙10↑9←  ->  4.7∙10↑9←
            Caption: Simple member - timber - simple force 2x  ->  Simple member - timber - simple force 2x
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 6000  ->  6000
            F↓k←: 4000  ->  4000
            s: 3.32  ->  3.32
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            h: 0.2  ->  0.2
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 14∙10↑6←  ->  14∙10↑6←
            γ↓M←: 1.3  ->  1.3
            b: 0.14  ->  0.14
          }
          Results: {
            M↓Rd← = 9046 == 9046
            M↓Ed← = 30000 == 30000
            w = 1.09 == 1.09
            ϕ↓a← = 0.228 == 0.228
            k↓h← = 1 == 1
            f↓m,d← = 9.69∙10↑6← == 9.69∙10↑6←
            I↓y← = 93.3∙10↑-6← == 93.3∙10↑-6←
            W↓y← = 933∙10↑-6← == 933∙10↑-6←
          }
          Test "15m,6kN,4kN,200x140mm,0.9,C14" PASSED.
        }
        Test: 4m,6kN,4kN,200x140mm,0.9,C14 {
          Inputs: {
            L: 4  ->  4
            E: 4.7∙10↑9←  ->  4.7∙10↑9←
            Caption: Simple member - timber - simple force 2x  ->  Simple member - timber - simple force 2x
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 6000  ->  6000
            F↓k←: 4000  ->  4000
            s: 0.884  ->  0.884
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            h: 0.2  ->  0.2
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 14∙10↑6←  ->  14∙10↑6←
            γ↓M←: 1.3  ->  1.3
            b: 0.14  ->  0.14
          }
          Results: {
            M↓Rd← = 9046 == 9046
            M↓Ed← = 8000 == 8000
            w = 0.0207 == 0.0207
            ϕ↓a← = 0.0162 == 0.0162
            k↓h← = 1 == 1
            f↓m,d← = 9.69∙10↑6← == 9.69∙10↑6←
            I↓y← = 93.3∙10↑-6← == 93.3∙10↑-6←
            W↓y← = 933∙10↑-6← == 933∙10↑-6←
          }
          Test "4m,6kN,4kN,200x140mm,0.9,C14" PASSED.
        }
        Test: 4m,15kN,12kN,500x140mm,0.9,C14 {
          Inputs: {
            L: 4  ->  4
            E: 4.7∙10↑9←  ->  4.7∙10↑9←
            Caption: Simple member - timber - simple force 2x  ->  Simple member - timber - simple force 2x
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 15000  ->  15000
            F↓k←: 12000  ->  12000
            s: 0.354  ->  0.354
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            h: 0.5  ->  0.5
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 14∙10↑6←  ->  14∙10↑6←
            γ↓M←: 1.3  ->  1.3
            b: 0.14  ->  0.14
          }
          Results: {
            M↓Rd← = 56538 == 56538
            M↓Ed← = 20000 == 20000
            w = 3.98∙10↑-3← == 3.98∙10↑-3←
            ϕ↓a← = 3.11∙10↑-3← == 3.11∙10↑-3←
            k↓h← = 1 == 1
            f↓m,d← = 9.69∙10↑6← == 9.69∙10↑6←
            I↓y← = 1.46∙10↑-3← == 1.46∙10↑-3←
            W↓y← = 5.83∙10↑-3← == 5.83∙10↑-3←
          }
          Test "4m,15kN,12kN,500x140mm,0.9,C14" PASSED.
        }
        Test: 4m,15kN,12kN,500x140mm,0.8,C14 {
          Inputs: {
            L: 4  ->  4
            E: 4.7∙10↑9←  ->  4.7∙10↑9←
            Caption: Simple member - timber - simple force 2x  ->  Simple member - timber - simple force 2x
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 15000  ->  15000
            F↓k←: 12000  ->  12000
            s: 0.398  ->  0.398
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            h: 0.5  ->  0.5
            k↓mod←: 0.8  ->  0.8
            f↓m,k←: 14∙10↑6←  ->  14∙10↑6←
            γ↓M←: 1.3  ->  1.3
            b: 0.14  ->  0.14
          }
          Results: {
            M↓Rd← = 50256 == 50256
            M↓Ed← = 20000 == 20000
            w = 3.98∙10↑-3← == 3.98∙10↑-3←
            ϕ↓a← = 3.11∙10↑-3← == 3.11∙10↑-3←
            k↓h← = 1 == 1
            f↓m,d← = 8.62∙10↑6← == 8.62∙10↑6←
            I↓y← = 1.46∙10↑-3← == 1.46∙10↑-3←
            W↓y← = 5.83∙10↑-3← == 5.83∙10↑-3←
          }
          Test "4m,15kN,12kN,500x140mm,0.8,C14" PASSED.
        }
        Test: 4m,15kN,12kN,500x140mm,0.8,C18 {
          Inputs: {
            L: 4  ->  4
            E: 6∙10↑9←  ->  6∙10↑9←
            Caption: Simple member - timber - simple force 2x  ->  Simple member - timber - simple force 2x
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 15000  ->  15000
            F↓k←: 12000  ->  12000
            s: 0.31  ->  0.31
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            h: 0.5  ->  0.5
            k↓mod←: 0.8  ->  0.8
            f↓m,k←: 18∙10↑6←  ->  18∙10↑6←
            γ↓M←: 1.3  ->  1.3
            b: 0.14  ->  0.14
          }
          Results: {
            M↓Rd← = 64615 == 64615
            M↓Ed← = 20000 == 20000
            w = 3.12∙10↑-3← == 3.12∙10↑-3←
            ϕ↓a← = 2.44∙10↑-3← == 2.44∙10↑-3←
            k↓h← = 1 == 1
            f↓m,d← = 11.1∙10↑6← == 11.1∙10↑6←
            I↓y← = 1.46∙10↑-3← == 1.46∙10↑-3←
            W↓y← = 5.83∙10↑-3← == 5.83∙10↑-3←
          }
          Test "4m,15kN,12kN,500x140mm,0.8,C18" PASSED.
        }