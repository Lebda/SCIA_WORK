        Test: 20kNm,250kN,100kN,20MPa,300mm,1m,mortar {
          Inputs: {
            M↓Ed←: 20000  ->  20000
            N↓Ed←: 250000  ->  250000
            V↓Ed←: 100000  ->  100000
            t: 0.3  ->  0.3
            γ↓M←: 2  ->  2
            K: 0.55  ->  0.55
            f↓b←: 20∙10↑6←  ->  20∙10↑6←
            f↓m←: 5  ->  5
            f↓vk0←: 20∙10↑6←  ->  20∙10↑6←
            b: 1  ->  1
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský nadpis  ->  uživatelský nadpis
          }
          Results: {
            e↓Ed← = 0.08 == 0.08
            c↓v← = 3 == 3
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
            σ↓d← = 833333 == 833333
            f↓vk← = 1.3∙10↑6← == 1.3∙10↑6←
            f↓vd0← = 10∙10↑6← == 10∙10↑6←
            N↓lim← = 544297 == 544297
            V↓Rd← = 136500 == 136500
            f↓vd← = 650000 == 650000
          }
          Test "20kNm,250kN,100kN,20MPa,300mm,1m,mortar" PASSED.
        }
        Test: 20kNm,250kN,100kN,20MPa,300mm,1m,NOmortar {
          Inputs: {
            M↓Ed←: 20000  ->  20000
            N↓Ed←: 250000  ->  250000
            V↓Ed←: 100000  ->  100000
            t: 0.3  ->  0.3
            γ↓M←: 2  ->  2
            K: 0.55  ->  0.55
            f↓b←: 20∙10↑6←  ->  20∙10↑6←
            f↓m←: 5  ->  5
            f↓vk0←: 20∙10↑6←  ->  20∙10↑6←
            b: 1  ->  1
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: False  ->  False
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský nadpis  ->  uživatelský nadpis
          }
          Results: {
            e↓Ed← = 0.08 == 0.08
            c↓v← = 1.5 == 1.5
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
            σ↓d← = 833333 == 833333
            f↓vk← = 900000 == 900000
            f↓vd0← = 10∙10↑6← == 10∙10↑6←
            N↓lim← = 544297 == 544297
            V↓Rd← = 94500 == 94500
            f↓vd← = 450000 == 450000
          }
          Test "20kNm,250kN,100kN,20MPa,300mm,1m,NOmortar" PASSED.
        }
        Test: 200kNm,25kN,10kN,20MPa,300mm,1m,mortar {
          Inputs: {
            M↓Ed←: 200000  ->  200000
            N↓Ed←: 25000  ->  25000
            V↓Ed←: 10000  ->  10000
            t: 0.3  ->  0.3
            γ↓M←: 2  ->  2
            K: 0.55  ->  0.55
            f↓b←: 20∙10↑6←  ->  20∙10↑6←
            f↓m←: 5  ->  5
            f↓vk0←: 20∙10↑6←  ->  20∙10↑6←
            b: 1  ->  1
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský nadpis  ->  uživatelský nadpis
          }
          Results: {
            e↓Ed← = 8 == 8
            c↓v← = 3 == 3
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
            σ↓d← = 83333 == 83333
            f↓vk← = 1.3∙10↑6← == 1.3∙10↑6←
            f↓vd0← = 10∙10↑6← == 10∙10↑6←
            N↓lim← = 544297 == 544297
            V↓Rd← = -235∙10↑6← == -235∙10↑6←
            f↓vd← = 650000 == 650000
          }
          Test "200kNm,25kN,10kN,20MPa,300mm,1m,mortar" PASSED.
        }
        Test: 200kNm,250kN,100kN,20MPa,30mm,1m,mortar {
          Inputs: {
            M↓Ed←: 200000  ->  200000
            N↓Ed←: 250000  ->  250000
            V↓Ed←: 100000  ->  100000
            t: 0.03  ->  0.03
            γ↓M←: 2  ->  2
            K: 0.55  ->  0.55
            f↓b←: 20∙10↑6←  ->  20∙10↑6←
            f↓m←: 5  ->  5
            f↓vk0←: 20∙10↑6←  ->  20∙10↑6←
            b: 1  ->  1
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský nadpis  ->  uživatelský nadpis
          }
          Results: {
            e↓Ed← = 0.8 == 0.8
            c↓v← = 3 == 3
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
            σ↓d← = 8.33∙10↑6← == 8.33∙10↑6←
            f↓vk← = 1.3∙10↑6← == 1.3∙10↑6←
            f↓vd0← = 10∙10↑6← == 10∙10↑6←
            N↓lim← = 54430 == 54430
            V↓Rd← = -23.5∙10↑6← == -23.5∙10↑6←
            f↓vd← = 650000 == 650000
          }
          Test "200kNm,250kN,100kN,20MPa,30mm,1m,mortar" PASSED.
        }
        Test: 200kNm,250kN,100kN,200MPa,30mm,1m,mortar {
          Inputs: {
            M↓Ed←: 200000  ->  200000
            N↓Ed←: 250000  ->  250000
            V↓Ed←: 100000  ->  100000
            t: 0.03  ->  0.03
            γ↓M←: 2  ->  2
            K: 0.55  ->  0.55
            f↓b←: 200∙10↑6←  ->  200∙10↑6←
            f↓m←: 5  ->  5
            f↓vk0←: 20∙10↑6←  ->  20∙10↑6←
            b: 1  ->  1
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský nadpis  ->  uživatelský nadpis
          }
          Results: {
            e↓Ed← = 0.8 == 0.8
            c↓v← = 3 == 3
            f↓k← = 36.4∙10↑6← == 36.4∙10↑6←
            f↓d← = 18.2∙10↑6← == 18.2∙10↑6←
            σ↓d← = 8.33∙10↑6← == 8.33∙10↑6←
            f↓vk← = 13∙10↑6← == 13∙10↑6←
            f↓vd0← = 10∙10↑6← == 10∙10↑6←
            N↓lim← = 272795 == 272795
            V↓Rd← = -23.5∙10↑6← == -23.5∙10↑6←
            f↓vd← = 6.5∙10↑6← == 6.5∙10↑6←
          }
          Test "200kNm,250kN,100kN,200MPa,30mm,1m,mortar" PASSED.
        }