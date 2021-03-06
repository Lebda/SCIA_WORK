        Test: HEA200,S235,10kN,2m,2m,1.15 {
          Inputs: {
            π: 3.14  ->  3.14
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            N↓Ed←: 10000  ->  10000
            L↓y←: 2  ->  2
            L↓z←: 2  ->  2
            A: 5.38∙10↑-3←  ->  5.38∙10↑-3←
            i↓y←: 0.0828  ->  0.0828
            i↓z←: 0.0498  ->  0.0498
            α↓y←: 0.34  ->  0.34
            α↓z←: 0.49  ->  0.49
            γ↓M0←: 1.15  ->  1.15
            χ↓y←: 0.98  ->  0.98
            λ↓z←: 40.2  ->  40.2
            λ↓jed,z←: 0.428  ->  0.428
            Φ↓z←: 0.647  ->  0.647
            χ↓z←: 0.882  ->  0.882
            χ↓min←: 0.882  ->  0.882
            s: 0.0103  ->  0.0103
            h: 0.19  ->  0.19
            b: 0.2  ->  0.2
            I↓y←: 36.9∙10↑-6←  ->  36.9∙10↑-6←
            I↓z←: 13.4∙10↑-6←  ->  13.4∙10↑-6←
            CalcCaption: uživatelský popis  ->  uživatelský popis
            SectionName: HEA 200  ->  HEA 200
            SectionImage: SSL_HEA  ->  SSL_HEA
            PrintCaption: False  ->  False
            PrintSection: True  ->  True
            PrintMaterial: True  ->  True
            G: 42.3  ->  42.3
            PrintLoad: True  ->  True
            h1: True  ->  True
          }
          Results: {
            λ↓srov← = 93.9 == 93.9
            λ↓y← = 24.2 == 24.2
            λ↓jed,y← = 0.257 == 0.257
            Φ↓y← = 0.543 == 0.543
            N↓Rd← = 970741 == 970741
          }
          Test "HEA200,S235,10kN,2m,2m,1.15" PASSED.
        }
        Test: 2xU260,S235,2kN,1.5m,3m,1.2 {
          Inputs: {
            π: 3.14  ->  3.14
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            N↓Ed←: 2000  ->  2000
            L↓y←: 1.5  ->  1.5
            L↓z←: 3  ->  3
            A: 9.79∙10↑-3←  ->  9.79∙10↑-3←
            i↓y←: 0.1  ->  0.1
            i↓z←: 0.071  ->  0.071
            α↓y←: 0.34  ->  0.34
            α↓z←: 0.34  ->  0.34
            γ↓M0←: 1.2  ->  1.2
            χ↓y←: 1  ->  1
            λ↓z←: 42.3  ->  42.3
            λ↓jed,z←: 0.45  ->  0.45
            Φ↓z←: 0.644  ->  0.644
            χ↓z←: 0.906  ->  0.906
            χ↓min←: 0.906  ->  0.906
            s: 1.15∙10↑-3←  ->  1.15∙10↑-3←
            h: 0.26  ->  0.26
            b: 0.18  ->  0.18
            I↓y←: 98.2∙10↑-6←  ->  98.2∙10↑-6←
            I↓z←: 49.1∙10↑-6←  ->  49.1∙10↑-6←
            CalcCaption: uživatelský popis  ->  uživatelský popis
            SectionName: 2xU260  ->  2xU260
            SectionImage: SSL_Ubox  ->  SSL_Ubox
            PrintCaption: False  ->  False
            PrintSection: True  ->  True
            PrintMaterial: True  ->  True
            G: 76.8  ->  76.8
            PrintLoad: True  ->  True
            h1: True  ->  True
          }
          Results: {
            λ↓srov← = 93.9 == 93.9
            λ↓y← = 15 == 15
            λ↓jed,y← = 0.16 == 0.16
            Φ↓y← = 0.506 == 0.506
            N↓Rd← = 1.74∙10↑6← == 1.74∙10↑6←
          }
          Test "2xU260,S235,2kN,1.5m,3m,1.2" PASSED.
        }