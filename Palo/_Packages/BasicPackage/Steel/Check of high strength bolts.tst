        Test: 8.8,M16,10kN,15kN,16mm,3,1 {
          Inputs: {
            F↓v,Ed←: 10000  ->  10000
            F↓t,Ed←: 15000  ->  15000
            A↓net←: 157∙10↑-6←  ->  157∙10↑-6←
            d: 0.016  ->  0.02
            F↓t,1←: 5000  ->  5000
            f↓ub←: 800∙10↑6←  ->  800∙10↑6←
            f↓yb←: 640∙10↑6←  ->  640∙10↑6←
            γ↓M3←: 1.25  ->  1.25
            μ: 0.3  ->  0.3
            k↓s←: 1  ->  1
            n↓B←: 3  ->  3
            n↓p←: 1  ->  1
            Caption: uživatelský popis  ->  uživatelský popis
            Material: 8.8  ->  8.8
            PrintCaption: False  ->  False
            H1: True  ->  True
          }
          Results: {
            F↓1← = 20141 == 20141
            F↓p,C← = 87920 == 87920
            F↓s,Rd← = 60422 == 60422
            s = 0.166 == 0.166
          }
          Test "8.8,M16,10kN,15kN,16mm,3,1" PASSED.
        }
        Test: 4.8,M16,10kN,15kN,16mm,3,1 {
          Inputs: {
            F↓v,Ed←: 10000  ->  10000
            F↓t,Ed←: 15000  ->  15000
            A↓net←: 157∙10↑-6←  ->  157∙10↑-6←
            d: 0.016  ->  0.02
            F↓t,1←: 5000  ->  5000
            f↓ub←: 800∙10↑6←  ->  800∙10↑6←
            f↓yb←: 640∙10↑6←  ->  640∙10↑6←
            γ↓M3←: 1.25  ->  1.25
            μ: 0.3  ->  0.3
            k↓s←: 1  ->  1
            n↓B←: 3  ->  3
            n↓p←: 1  ->  1
            Caption: uživatelský popis  ->  uživatelský popis
            Material: 8.8  ->  8.8
            PrintCaption: False  ->  False
            H1: True  ->  True
          }
          Results: {
            F↓1← = 20141 == 20141
            F↓p,C← = 87920 == 87920
            F↓s,Rd← = 60422 == 60422
            s = 0.166 == 0.166
          }
          Test "4.8,M16,10kN,15kN,16mm,3,1" PASSED.
        }
        Test: 4.8,M16,10kN,15kN,16mm,5,4 {
          Inputs: {
            F↓v,Ed←: 10000  ->  10000
            F↓t,Ed←: 15000  ->  15000
            A↓net←: 157∙10↑-6←  ->  157∙10↑-6←
            d: 0.016  ->  0.02
            F↓t,1←: 3000  ->  3000
            f↓ub←: 800∙10↑6←  ->  800∙10↑6←
            f↓yb←: 640∙10↑6←  ->  640∙10↑6←
            γ↓M3←: 1.25  ->  1.25
            μ: 0.3  ->  0.3
            k↓s←: 1  ->  1
            n↓B←: 5  ->  5
            n↓p←: 4  ->  4
            Caption: uživatelský popis  ->  uživatelský popis
            Material: 8.8  ->  8.8
            PrintCaption: False  ->  False
            H1: True  ->  True
          }
          Results: {
            F↓1← = 20525 == 20525
            F↓p,C← = 87920 == 87920
            F↓s,Rd← = 410496 == 410496
            s = 0.0244 == 0.0244
          }
          Test "4.8,M16,10kN,15kN,16mm,5,4" PASSED.
        }