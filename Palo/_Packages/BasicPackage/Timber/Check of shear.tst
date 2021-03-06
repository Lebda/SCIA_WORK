        Test: 8kN,180x150,0.67 {
          Inputs: {
            b: 0.15  ->  0.15
            h: 0.18  ->  0.18
            k↓mod←: 0.8  ->  0.8
            γ↓M←: 1.3  ->  1.3
            k↓cr←: 0.67  ->  0.67
            f↓v,k←: 1.7∙10↑6←  ->  1.7∙10↑6←
            V↓Ed←: 8000  ->  8000
            PrintCaption: False  ->  False
            Caption: Check of shear  ->  Check of shear
            H1: True  ->  True
          }
          Results: {
            s = 0.634 == 0.634
            b↓ef← = 0.101 == 0.101
            A↓ef← = 0.0181 == 0.0181
            f↓v,d← = 1.05∙10↑6← == 1.05∙10↑6←
            V↓Rd← = 12617 == 12617
          }
          Test "8kN,180x150,0.67" PASSED.
        }
        Test: 15kN,180x150,0.67 {
          Inputs: {
            b: 0.15  ->  0.15
            h: 0.18  ->  0.18
            k↓mod←: 0.8  ->  0.8
            γ↓M←: 1.3  ->  1.3
            k↓cr←: 0.67  ->  0.67
            f↓v,k←: 1.7∙10↑6←  ->  1.7∙10↑6←
            V↓Ed←: 15000  ->  15000
            PrintCaption: False  ->  False
            Caption: Check of shear  ->  Check of shear
            H1: True  ->  True
          }
          Results: {
            s = 1.19 == 1.19
            b↓ef← = 0.101 == 0.101
            A↓ef← = 0.0181 == 0.0181
            f↓v,d← = 1.05∙10↑6← == 1.05∙10↑6←
            V↓Rd← = 12617 == 12617
          }
          Test "15kN,180x150,0.67" PASSED.
        }
        Test: 15kN,200x200,0.8 {
          Inputs: {
            b: 0.2  ->  0.2
            h: 0.2  ->  0.2
            k↓mod←: 0.8  ->  0.8
            γ↓M←: 1.3  ->  1.3
            k↓cr←: 0.8  ->  0.8
            f↓v,k←: 1.7∙10↑6←  ->  1.7∙10↑6←
            V↓Ed←: 15000  ->  15000
            PrintCaption: False  ->  False
            Caption: Check of shear  ->  Check of shear
            H1: True  ->  True
          }
          Results: {
            s = 0.672 == 0.672
            b↓ef← = 0.16 == 0.16
            A↓ef← = 0.032 == 0.032
            f↓v,d← = 1.05∙10↑6← == 1.05∙10↑6←
            V↓Rd← = 22318 == 22318
          }
          Test "15kN,200x200,0.8" PASSED.
        }