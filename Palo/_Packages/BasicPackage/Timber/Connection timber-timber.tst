        Test: NoNails,50kN,0,15mm,6,2,150x300,40,50 {
          Inputs: {
            d: 0.015  ->  0.015
            F↓90,Ed←: 12941  ->  12941
            F↓90,Rd←: 3593  ->  3593
            f↓h,1,k←: 107  ->  107
            f↓h,2,k←: 107  ->  107
            f↓u←: 600  ->  600
            F↓v,Ed←: 50000  ->  50000
            F↓v,Rk1←: 0.0642  ->  0.0642
            F↓v,Rk2←: 0.0401  ->  0.0401
            F↓v,Rk3←: 0.076  ->  0.076
            F↓v,Rk4←: 0.118  ->  0.118
            F↓v,Rk5←: 11393  ->  11393
            F↓v,Rk6←: 14505  ->  14505
            α: 0  ->  0
            γ↓M←: 1.3  ->  1.3
            ρ↓1,k←: 370  ->  370
            ρ↓2,k←: 370  ->  370
            h: 0.15  ->  0.15
            h↓e←: 0.3  ->  0.3
            k↓mod,1←: 0.9  ->  0.9
            k↓mod,2←: 0.9  ->  0.9
            M↓y,Rk←: 3.26∙10↑-3←  ->  3.26∙10↑-3←
            n↓B←: 6  ->  6
            n↓p←: 2  ->  2
            s↓v←: 3.6  ->  3.6
            t↓1←: 0.04  ->  0.04
            t↓2←: 0.05  ->  0.05
            Caption: Posouzení kovových spojovacích prostředků  ->  Posouzení kovových spojovacích prostředků
            PrintCaption: False  ->  False
            B0: False  ->  False
            w: 1  ->  1
            H1: True  ->  True
          }
          Results: {
            F↓v,Rd← = 0.333 == 0.333
            F↓v,Rk← = 0.0401 == 0.0401
            β = 1 == 1
            k↓mod← = 0.9 == 0.9
            s = 150062 == 150062
          }
          Test "NoNails,50kN,0,15mm,6,2,150x300,40,50" PASSED.
        }
        Test: Nails,40kN,5,15mm,8,3,150x300,40,50 {
          Inputs: {
            d: 0.015  ->  0.015
            F↓90,Ed←: 3486  ->  3486
            F↓90,Rd←: NaN  ->  NaN
            f↓h,1,k←: 30.3  ->  30.3
            f↓h,2,k←: 30.3  ->  30.3
            f↓u←: 600  ->  600
            F↓v,Ed←: 40000  ->  40000
            F↓v,Rk1←: 0.0182  ->  0.0182
            F↓v,Rk2←: 0.0114  ->  0.0114
            F↓v,Rk3←: 0.042  ->  0.042
            F↓v,Rk4←: 0.0626  ->  0.0626
            F↓v,Rk5←: 11393  ->  11393
            F↓v,Rk6←: 14505  ->  14505
            α: 5  ->  5
            γ↓M←: 1.3  ->  1.3
            ρ↓1,k←: 370  ->  370
            ρ↓2,k←: 370  ->  370
            h: 0.15  ->  0.15
            h↓e←: 0.3  ->  0.3
            k↓mod,1←: 0.9  ->  0.9
            k↓mod,2←: 0.9  ->  0.9
            M↓y,Rk←: 3.26∙10↑-3←  ->  3.26∙10↑-3←
            n↓B←: 8  ->  8
            n↓p←: 3  ->  3
            s↓v←: NaN  ->  NaN
            t↓1←: 0.04  ->  0.04
            t↓2←: 0.05  ->  0.05
            Caption: Posouzení kovových spojovacích prostředků  ->  Posouzení kovových spojovacích prostředků
            PrintCaption: False  ->  False
            B0: True  ->  True
            w: 1  ->  1
            H1: True  ->  True
          }
          Results: {
            F↓v,Rd← = 0.189 == 0.189
            F↓v,Rk← = 0.0114 == 0.0114
            β = 1 == 1
            k↓mod← = 0.9 == 0.9
            s = 211625 == 211625
          }
          Test "Nails,40kN,5,15mm,8,3,150x300,40,50" PASSED.
        }
        Test: Nails,40kN,5,15mm,8,3,250x100,80,80 {
          Inputs: {
            d: 0.015  ->  0.015
            F↓90,Ed←: 3486  ->  3486
            F↓90,Rd←: 0.317  ->  0.317
            f↓h,1,k←: 30.3  ->  30.3
            f↓h,2,k←: 30.3  ->  30.3
            f↓u←: 600  ->  600
            F↓v,Ed←: 40000  ->  40000
            F↓v,Rk1←: 0.0364  ->  0.0364
            F↓v,Rk2←: 0.0182  ->  0.0182
            F↓v,Rk3←: 0.0405  ->  0.0405
            F↓v,Rk4←: 0.0626  ->  0.0626
            F↓v,Rk5←: 11393  ->  11393
            F↓v,Rk6←: 14505  ->  14505
            α: 5  ->  5
            γ↓M←: 1.3  ->  1.3
            ρ↓1,k←: 370  ->  370
            ρ↓2,k←: 370  ->  370
            h: 0.25  ->  0.25
            h↓e←: 0.1  ->  0.1
            k↓mod,1←: 0.9  ->  0.9
            k↓mod,2←: 0.9  ->  0.9
            M↓y,Rk←: 3.26∙10↑-3←  ->  3.26∙10↑-3←
            n↓B←: 8  ->  8
            n↓p←: 3  ->  3
            s↓v←: 11013  ->  11013
            t↓1←: 0.08  ->  0.08
            t↓2←: 0.08  ->  0.08
            Caption: Posouzení kovových spojovacích prostředků  ->  Posouzení kovových spojovacích prostředků
            PrintCaption: False  ->  False
            B0: True  ->  True
            w: 1  ->  1
            H1: True  ->  True
          }
          Results: {
            F↓v,Rd← = 0.302 == 0.302
            F↓v,Rk← = 0.0182 == 0.0182
            β = 1 == 1
            k↓mod← = 0.9 == 0.9
            s = 132266 == 132266
          }
          Test "Nails,40kN,5,15mm,8,3,250x100,80,80" PASSED.
        }