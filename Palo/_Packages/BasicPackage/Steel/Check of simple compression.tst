        Test: S235,HEB200,50kN {
          Inputs: {
            A: 7.81∙10↑-3←  ->  7.81∙10↑-3←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            N↓Ed←: 50000  ->  50000
            SectionClass: 1  ->  1
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            SectionImage: SSL_HEB  ->  SSL_HEB
            h: 0.2  ->  0.2
            b: 0.2  ->  0.2
            G: 61.3  ->  61.3
            h1: True  ->  True
            SectionName: HEB 200  ->  HEB 200
          }
          Results: {
            s = 0.0313 == 0.0313
            N↓c,Rd← = 1.596∙10↑6← == 1.6∙10↑6←
          }
          Test "S235,HEB200,50kN" PASSED.
        }
        Test: S355,HEB200,50kN {
          Inputs: {
            A: 7.81∙10↑-3←  ->  7.81∙10↑-3←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            N↓Ed←: 50000  ->  50000
            SectionClass: 1  ->  1
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            SectionImage: SSL_HEB  ->  SSL_HEB
            h: 0.2  ->  0.2
            b: 0.2  ->  0.2
            G: 61.3  ->  61.3
            h1: True  ->  True
            SectionName: HEB 200  ->  HEB 200
          }
          Results: {
            s = 0.0313 == 0.0313
            N↓c,Rd← = 1.596∙10↑6← == 1.6∙10↑6←
          }
          Test "S355,HEB200,50kN" PASSED.
        }
        Test: S355,HEB200,55kN {
          Inputs: {
            A: 7.81∙10↑-3←  ->  7.81∙10↑-3←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            N↓Ed←: 55000  ->  55000
            SectionClass: 1  ->  1
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            SectionImage: SSL_HEB  ->  SSL_HEB
            h: 0.2  ->  0.2
            b: 0.2  ->  0.2
            G: 61.3  ->  61.3
            h1: True  ->  True
            SectionName: HEB 200  ->  HEB 200
          }
          Results: {
            s = 0.0345 == 0.0345
            N↓c,Rd← = 1.596∙10↑6← == 1.6∙10↑6←
          }
          Test "S355,HEB200,55kN" PASSED.
        }