        Test: 6m,200x140mm,0.9,1.5kN/m,1kN/m,C14 {
          Inputs: {
            L: 6  ->  6
            E: 4.7∙10↑9←  ->  4.7∙10↑9←
            Caption: Simple member - timber - uniform load  ->  Simple member - timber - uniform load
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            s: 0.746  ->  0.746
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            h: 0.2  ->  0.2
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 14∙10↑6←  ->  14∙10↑6←
            γ↓M←: 1.3  ->  1.3
            b: 0.14  ->  0.14
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
          }
          Results: {
            M↓Rd← = 9046 == 9046
            M↓Ed← = 6750 == 6750
            w = 0.0385 == 0.0385
            k↓h← = 1 == 1
            f↓m,d← = 9.69∙10↑6← == 9.69∙10↑6←
            I↓y← = 93.3∙10↑-6← == 93.3∙10↑-6←
            W↓y← = 933∙10↑-6← == 933∙10↑-6←
            ϕ↓ab← = 0.0205 == 0.0205
          }
          Test "6m,200x140mm,0.9,1.5kN/m,1kN/m,C14" PASSED.
        }
        Test: 10m,200x140mm,0.9,1.5kN/m,1kN/m,C14 {
          Inputs: {
            L: 10  ->  10
            E: 4.7∙10↑9←  ->  4.7∙10↑9←
            Caption: Simple member - timber - uniform load  ->  Simple member - timber - uniform load
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            s: 2.07  ->  2.07
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            h: 0.2  ->  0.2
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 14∙10↑6←  ->  14∙10↑6←
            γ↓M←: 1.3  ->  1.3
            b: 0.14  ->  0.14
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
          }
          Results: {
            M↓Rd← = 9046 == 9046
            M↓Ed← = 18750 == 18750
            w = 0.297 == 0.297
            k↓h← = 1 == 1
            f↓m,d← = 9.69∙10↑6← == 9.69∙10↑6←
            I↓y← = 93.3∙10↑-6← == 93.3∙10↑-6←
            W↓y← = 933∙10↑-6← == 933∙10↑-6←
            ϕ↓ab← = 0.095 == 0.095
          }
          Test "10m,200x140mm,0.9,1.5kN/m,1kN/m,C14" PASSED.
        }
        Test: 10m,300x140mm,0.9,1.5kN/m,1kN/m,C14 {
          Inputs: {
            L: 10  ->  10
            E: 4.7∙10↑9←  ->  4.7∙10↑9←
            Caption: Simple member - timber - uniform load  ->  Simple member - timber - uniform load
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            s: 0.921  ->  0.921
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            h: 0.3  ->  0.3
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 14∙10↑6←  ->  14∙10↑6←
            γ↓M←: 1.3  ->  1.3
            b: 0.14  ->  0.14
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
          }
          Results: {
            M↓Rd← = 20354 == 20354
            M↓Ed← = 18750 == 18750
            w = 0.0879 == 0.0879
            k↓h← = 1 == 1
            f↓m,d← = 9.69∙10↑6← == 9.69∙10↑6←
            I↓y← = 315∙10↑-6← == 315∙10↑-6←
            W↓y← = 2.1∙10↑-3← == 2.1∙10↑-3←
            ϕ↓ab← = 0.0281 == 0.0281
          }
          Test "10m,300x140mm,0.9,1.5kN/m,1kN/m,C14" PASSED.
        }
        Test: 10m,300x140mm,0.9,1.5kN/m,1kN/m,C22 {
          Inputs: {
            L: 10  ->  10
            E: 6.7∙10↑9←  ->  6.7∙10↑9←
            Caption: Simple member - timber - uniform load  ->  Simple member - timber - uniform load
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            s: 0.586  ->  0.586
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            h: 0.3  ->  0.3
            k↓mod←: 0.9  ->  0.9
            f↓m,k←: 22∙10↑6←  ->  22∙10↑6←
            γ↓M←: 1.3  ->  1.3
            b: 0.14  ->  0.14
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
          }
          Results: {
            M↓Rd← = 31985 == 31985
            M↓Ed← = 18750 == 18750
            w = 0.0617 == 0.0617
            k↓h← = 1 == 1
            f↓m,d← = 15.2∙10↑6← == 15.2∙10↑6←
            I↓y← = 315∙10↑-6← == 315∙10↑-6←
            W↓y← = 2.1∙10↑-3← == 2.1∙10↑-3←
            ϕ↓ab← = 0.0197 == 0.0197
          }
          Test "10m,300x140mm,0.9,1.5kN/m,1kN/m,C22" PASSED.
        }