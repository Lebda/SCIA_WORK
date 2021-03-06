        Test: 50kN,100x200,0.9 {
          Inputs: {
            k↓mod←: 0.9  ->  0.9
            f↓t,0,k←: 8∙10↑6←  ->  8∙10↑6←
            γ↓M←: 1.3  ->  1.3
            N↓Ed←: 50000  ->  50000
            h: 0.1  ->  0.1
            b: 0.2  ->  0.2
            PrintCaption: False  ->  False
            Caption: Tension check  ->  Tension check
            PrintInput: True  ->  True
            H1: True  ->  True
          }
          Results: {
            f↓t,0,d← = 5.54∙10↑6← == 5.54∙10↑6←
            N↓Rd← = 110769 == 110769
            A↓net← = 0.02 == 0.02
          }
          Test "50kN,100x200,0.9" PASSED.
        }
        Test: 25kN,100x300,0.9 {
          Inputs: {
            k↓mod←: 0.9  ->  0.9
            f↓t,0,k←: 8∙10↑6←  ->  8∙10↑6←
            γ↓M←: 1.3  ->  1.3
            N↓Ed←: 25000  ->  25000
            h: 0.1  ->  0.1
            b: 0.3  ->  0.3
            PrintCaption: False  ->  False
            Caption: Tension check  ->  Tension check
            PrintInput: True  ->  True
            H1: True  ->  True
          }
          Results: {
            f↓t,0,d← = 5.54∙10↑6← == 5.54∙10↑6←
            N↓Rd← = 166154 == 166154
            A↓net← = 0.03 == 0.03
          }
          Test "25kN,100x300,0.9" PASSED.
        }