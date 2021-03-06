        Test: IPE200,S235,15kN,1.15 {
          Inputs: {
            A↓vz←: 1.4∙10↑-3←  ->  1.4∙10↑-3←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            V↓Ed←: 15000  ->  15000
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            h: 0.2  ->  0.2
            b: 0.1  ->  0.1
            SectionImage: SSL_IPE  ->  SSL_IPE
            A: 2.85∙10↑-3←  ->  2.85∙10↑-3←
            G: 22.4  ->  22.4
            h1: True  ->  True
          }
          Results: {
            V↓pl,Rd← = 495517 == 495517
            s = 0.0303 == 0.0303
          }
          Test "IPE200,S235,15kN,1.15" PASSED.
        }
        Test: IPE240,S235,15kN,1.15 {
          Inputs: {
            A↓vz←: 1.91∙10↑-3←  ->  1.91∙10↑-3←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            V↓Ed←: 15000  ->  15000
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            h: 0.24  ->  0.24
            b: 0.12  ->  0.12
            SectionImage: SSL_IPE  ->  SSL_IPE
            A: 3.91∙10↑-3←  ->  3.91∙10↑-3←
            G: 30.7  ->  30.7
            h1: True  ->  True
          }
          Results: {
            V↓pl,Rd← = 677443 == 677443
            s = 0.0221 == 0.0221
          }
          Test "IPE240,S235,15kN,1.15" PASSED.
        }
        Test: IPE240,S235,25kN,1.15 {
          Inputs: {
            A↓vz←: 1.91∙10↑-3←  ->  1.91∙10↑-3←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            V↓Ed←: 25000  ->  25000
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            h: 0.24  ->  0.24
            b: 0.12  ->  0.12
            SectionImage: SSL_IPE  ->  SSL_IPE
            A: 3.91∙10↑-3←  ->  3.91∙10↑-3←
            G: 30.7  ->  30.7
            h1: True  ->  True
          }
          Results: {
            V↓pl,Rd← = 677443 == 677443
            s = 0.0369 == 0.0369
          }
          Test "IPE240,S235,25kN,1.15" PASSED.
        }