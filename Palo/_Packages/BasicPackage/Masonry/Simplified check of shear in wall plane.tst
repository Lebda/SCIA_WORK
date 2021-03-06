        Test: 20kNm,150kN,30kN,20e-6MPa,2.5m,300mm,mortar {
          Inputs: {
            L: 2.5  ->  2.5
            M↓Ed←: 20000  ->  20000
            N↓Ed←: 150000  ->  150000
            V↓Ed←: 30000  ->  30000
            t: 0.3  ->  0.3
            γ↓M←: 2  ->  2
            K: 0.45  ->  0.45
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            f↓vk0←: 20∙10↑6←  ->  20∙10↑6←
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
          }
          Results: {
            e↓Ed← = 0.133 == 0.133
            c↓v← = 3 == 3
            f↓k← = 5.94∙10↑6← == 5.94∙10↑6←
            f↓d← = 2.97∙10↑6← == 2.97∙10↑6←
            σ↓d← = 200000 == 200000
            f↓vk← = 1.3∙10↑6← == 1.3∙10↑6←
            f↓vd0← = 10∙10↑6← == 10∙10↑6←
            N↓lim← = 1.11∙10↑6← == 1.11∙10↑6←
            V↓Rd← = 653250 == 653250
            fb = 20∙10↑6← == 20∙10↑6←
            f↓vd← = 650000 == 650000
          }
          Test "20kNm,150kN,30kN,20e-6MPa,2.5m,300mm,mortar" PASSED.
        }
        Test: 20kNm,150kN,30kN,20e-6MPa,2.5m,300mm,NOmortar {
          Inputs: {
            L: 2.5  ->  2.5
            M↓Ed←: 20000  ->  20000
            N↓Ed←: 150000  ->  150000
            V↓Ed←: 30000  ->  30000
            t: 0.3  ->  0.3
            γ↓M←: 2  ->  2
            K: 0.45  ->  0.45
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            f↓vk0←: 20∙10↑6←  ->  20∙10↑6←
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: False  ->  False
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
          }
          Results: {
            e↓Ed← = 0.133 == 0.133
            c↓v← = 1.5 == 1.5
            f↓k← = 5.94∙10↑6← == 5.94∙10↑6←
            f↓d← = 2.97∙10↑6← == 2.97∙10↑6←
            σ↓d← = 200000 == 200000
            f↓vk← = 900000 == 900000
            f↓vd0← = 10∙10↑6← == 10∙10↑6←
            N↓lim← = 1.11∙10↑6← == 1.11∙10↑6←
            V↓Rd← = 452250 == 452250
            fb = 20∙10↑6← == 20∙10↑6←
            f↓vd← = 450000 == 450000
          }
          Test "20kNm,150kN,30kN,20e-6MPa,2.5m,300mm,NOmortar" PASSED.
        }
        Test: 200kNm,15kN,30kN,20e-6MPa,2.5m,300mm,mortar {
          Inputs: {
            L: 2.5  ->  2.5
            M↓Ed←: 200000  ->  200000
            N↓Ed←: 15000  ->  15000
            V↓Ed←: 30000  ->  30000
            t: 0.3  ->  0.3
            γ↓M←: 2  ->  2
            K: 0.45  ->  0.45
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            f↓vk0←: 20∙10↑6←  ->  20∙10↑6←
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
          }
          Results: {
            e↓Ed← = 13.3 == 13.3
            c↓v← = 3 == 3
            f↓k← = 5.94∙10↑6← == 5.94∙10↑6←
            f↓d← = 2.97∙10↑6← == 2.97∙10↑6←
            σ↓d← = 20000 == 20000
            f↓vk← = 1.3∙10↑6← == 1.3∙10↑6←
            f↓vd0← = 10∙10↑6← == 10∙10↑6←
            N↓lim← = 1.11∙10↑6← == 1.11∙10↑6←
            V↓Rd← = -109∙10↑6← == -109∙10↑6←
            fb = 20∙10↑6← == 20∙10↑6←
            f↓vd← = 650000 == 650000
          }
          Test "200kNm,15kN,30kN,20e-6MPa,2.5m,300mm,mortar" PASSED.
        }
        Test: 2000kNm,15kN,300kN,20e-6MPa,2.5m,150mm,mortar {
          Inputs: {
            L: 2.5  ->  2.5
            M↓Ed←: 2∙10↑6←  ->  2∙10↑6←
            N↓Ed←: 15000  ->  15000
            V↓Ed←: 300000  ->  300000
            t: 0.15  ->  0.15
            γ↓M←: 2  ->  2
            K: 0.45  ->  0.45
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            f↓vk0←: 20∙10↑6←  ->  20∙10↑6←
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
          }
          Results: {
            e↓Ed← = 133 == 133
            c↓v← = 3 == 3
            f↓k← = 5.94∙10↑6← == 5.94∙10↑6←
            f↓d← = 2.97∙10↑6← == 2.97∙10↑6←
            σ↓d← = 40000 == 40000
            f↓vk← = 1.3∙10↑6← == 1.3∙10↑6←
            f↓vd0← = 10∙10↑6← == 10∙10↑6←
            N↓lim← = 556667 == 556667
            V↓Rd← = -594∙10↑6← == -594∙10↑6←
            fb = 20∙10↑6← == 20∙10↑6←
            f↓vd← = 650000 == 650000
          }
          Test "2000kNm,15kN,300kN,20e-6MPa,2.5m,150mm,mortar" PASSED.
        }
        Test: 2000kNm,15kN,300kN,200e-6MPa,2.5m,150mm,mortar {
          Inputs: {
            L: 2.5  ->  2.5
            M↓Ed←: 2∙10↑6←  ->  2∙10↑6←
            N↓Ed←: 15000  ->  15000
            V↓Ed←: 300000  ->  300000
            t: 0.15  ->  0.15
            γ↓M←: 2  ->  2
            K: 0.45  ->  0.45
            f↓b←: 200  ->  200
            f↓m←: 5  ->  5
            f↓vk0←: 20∙10↑6←  ->  20∙10↑6←
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
          }
          Results: {
            e↓Ed← = 133 == 133
            c↓v← = 3 == 3
            f↓k← = 29.8∙10↑6← == 29.8∙10↑6←
            f↓d← = 14.9∙10↑6← == 14.9∙10↑6←
            σ↓d← = 40000 == 40000
            f↓vk← = 13∙10↑6← == 13∙10↑6←
            f↓vd0← = 10∙10↑6← == 10∙10↑6←
            N↓lim← = 2.79∙10↑6← == 2.79∙10↑6←
            V↓Rd← = -594∙10↑6← == -594∙10↑6←
            fb = 200∙10↑6← == 200∙10↑6←
            f↓vd← = 6.5∙10↑6← == 6.5∙10↑6←
          }
          Test "2000kNm,15kN,300kN,200e-6MPa,2.5m,150mm,mortar" PASSED.
        }