        Test: 6m,15kN,10kN,200x140mm,2m,C14 {
          Inputs: {
            L: 6  ->  6
            E: 4.7∙10↑9←  ->  4.7∙10↑9←
            Caption: Bracket - timber - solitary force  ->  Bracket - timber - solitary force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 15000  ->  15000
            F↓k←: 10000  ->  10000
            s: 3.32  ->  3.32
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            H: 0.2  ->  0.2
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 14∙10↑6←  ->  14∙10↑6←
            γ↓M←: 1.3  ->  1.3
            B: 0.14  ->  0.14
            a: 2  ->  2
            b: 4  ->  4
            ϕ↓b←: 0.0456  ->  0.0456
          }
          Results: {
            M↓Rd← = 9046 == 9046
            M↓Ed← = 30000 == 30000
            f↓m,d← = 9.69∙10↑6← == 9.69∙10↑6←
            I↓y← = 93.3∙10↑-6← == 93.3∙10↑-6←
            W↓y← = 933∙10↑-6← == 933∙10↑-6←
            k↓H← = 1 == 1
            w↓b← = 0.0608 == 0.0608
            w↓L← = 0.243 == 0.243
          }
          Test "6m,15kN,10kN,200x140mm,2m,C14" PASSED.
        }
        Test: 10m,15kN,10kN,200x140mm,4m,C14 {
          Inputs: {
            L: 10  ->  10
            E: 4.7∙10↑9←  ->  4.7∙10↑9←
            Caption: Bracket - timber - solitary force  ->  Bracket - timber - solitary force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 15000  ->  15000
            F↓k←: 10000  ->  10000
            s: 6.63  ->  6.63
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            H: 0.2  ->  0.2
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 14∙10↑6←  ->  14∙10↑6←
            γ↓M←: 1.3  ->  1.3
            B: 0.14  ->  0.14
            a: 4  ->  4
            b: 6  ->  6
            ϕ↓b←: 0.182  ->  0.182
          }
          Results: {
            M↓Rd← = 9046 == 9046
            M↓Ed← = 60000 == 60000
            f↓m,d← = 9.69∙10↑6← == 9.69∙10↑6←
            I↓y← = 93.3∙10↑-6← == 93.3∙10↑-6←
            W↓y← = 933∙10↑-6← == 933∙10↑-6←
            k↓H← = 1 == 1
            w↓b← = 0.486 == 0.486
            w↓L← = 1.58 == 1.58
          }
          Test "10m,15kN,10kN,200x140mm,4m,C14" PASSED.
        }
        Test: 10m,15kN,10kN,200x140mm,4m,C22 {
          Inputs: {
            L: 10  ->  10
            E: 6.7∙10↑9←  ->  6.7∙10↑9←
            Caption: Bracket - timber - solitary force  ->  Bracket - timber - solitary force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 15000  ->  15000
            F↓k←: 10000  ->  10000
            s: 4.22  ->  4.22
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            H: 0.2  ->  0.2
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 22∙10↑6←  ->  22∙10↑6←
            γ↓M←: 1.3  ->  1.3
            B: 0.14  ->  0.14
            a: 4  ->  4
            b: 6  ->  6
            ϕ↓b←: 0.128  ->  0.128
          }
          Results: {
            M↓Rd← = 14215 == 14215
            M↓Ed← = 60000 == 60000
            f↓m,d← = 15.2∙10↑6← == 15.2∙10↑6←
            I↓y← = 93.3∙10↑-6← == 93.3∙10↑-6←
            W↓y← = 933∙10↑-6← == 933∙10↑-6←
            k↓H← = 1 == 1
            w↓b← = 0.341 == 0.341
            w↓L← = 1.11 == 1.11
          }
          Test "10m,15kN,10kN,200x140mm,4m,C22" PASSED.
        }