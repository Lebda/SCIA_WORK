        Test: S235,TR102/5,NoOpen,NoC,15kN,1030mm2 {
          Inputs: {
            A: 1.52∙10↑-3←  ->  1.52∙10↑-3←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            N↓u,Rd←: 266976  ->  266976
            A↓net←: 1.03∙10↑-3←  ->  1.03∙10↑-3←
            f↓u←: 360∙10↑6←  ->  360∙10↑6←
            γ↓M2←: 1.25  ->  1.25
            N↓Ed←: 15000  ->  15000
            N↓net,Rd←: 210478  ->  210478
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            B0: False  ->  False
            B1: False  ->  False
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            h: 0.102  ->  0.102
            b: 0.102  ->  0.102
            SectionImage: SSL_TR  ->  SSL_TR
            h1: True  ->  True
            SectionName: TR 102/5  ->  TR 102/5
            G: 12  ->  12
          }
          Results: {
            N↓pl,Rd← = 311426 == 311426
            s = 0.0482 == 0.0482
            N↓t,Rd← = 311426 == 311426
          }
          Test "S235,TR102/5,NoOpen,NoC,15kN,1030mm2" PASSED.
        }
        Test: S235,TR102/5,Open,NoC,15kN,1030mm2 {
          Inputs: {
            A: 1.52∙10↑-3←  ->  1.52∙10↑-3←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            N↓u,Rd←: 266976  ->  266976
            A↓net←: 1.03∙10↑-3←  ->  1.03∙10↑-3←
            f↓u←: 360∙10↑6←  ->  360∙10↑6←
            γ↓M2←: 1.25  ->  1.25
            N↓Ed←: 15000  ->  15000
            N↓net,Rd←: 210478  ->  210478
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            B0: True  ->  True
            B1: False  ->  False
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            h: 0.102  ->  0.102
            b: 0.102  ->  0.102
            SectionImage: SSL_TR  ->  SSL_TR
            h1: True  ->  True
            SectionName: TR 102/5  ->  TR 102/5
            G: 12  ->  12
          }
          Results: {
            N↓pl,Rd← = 311426 == 311426
            s = 0.0562 == 0.0562
            N↓t,Rd← = 266976 == 266976
          }
          Test "S235,TR102/5,Open,NoC,15kN,1030mm2" PASSED.
        }
        Test: S235,TR102/5,Open,C,15kN,1030mm2 {
          Inputs: {
            A: 1.52∙10↑-3←  ->  1.52∙10↑-3←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            N↓u,Rd←: 266976  ->  266976
            A↓net←: 1.03∙10↑-3←  ->  1.03∙10↑-3←
            f↓u←: 360∙10↑6←  ->  360∙10↑6←
            γ↓M2←: 1.25  ->  1.25
            N↓Ed←: 15000  ->  15000
            N↓net,Rd←: 210478  ->  210478
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            B0: True  ->  True
            B1: True  ->  True
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            h: 0.102  ->  0.102
            b: 0.102  ->  0.102
            SectionImage: SSL_TR  ->  SSL_TR
            h1: True  ->  True
            SectionName: TR 102/5  ->  TR 102/5
            G: 12  ->  12
          }
          Results: {
            N↓pl,Rd← = 311426 == 311426
            s = 0.0713 == 0.0713
            N↓t,Rd← = 210478 == 210478
          }
          Test "S235,TR102/5,Open,C,15kN,1030mm2" PASSED.
        }
        Test: S235,TR20/2.9,Open,C,15kN,1030mm2 {
          Inputs: {
            A: 156∙10↑-6←  ->  156∙10↑-6←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            N↓u,Rd←: 266976  ->  266976
            A↓net←: 1.03∙10↑-3←  ->  1.03∙10↑-3←
            f↓u←: 360∙10↑6←  ->  360∙10↑6←
            γ↓M2←: 1.25  ->  1.25
            N↓Ed←: 15000  ->  15000
            N↓net,Rd←: 210478  ->  210478
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            B0: True  ->  True
            B1: True  ->  True
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            h: 0.02  ->  0.02
            b: 0.02  ->  0.02
            SectionImage: SSL_TR  ->  SSL_TR
            h1: True  ->  True
            SectionName: TR 20/2,9  ->  TR 20/2,9
            G: 1.22  ->  1.22
          }
          Results: {
            N↓pl,Rd← = 31878 == 31878
            s = 0.471 == 0.471
            N↓t,Rd← = 31878 == 31878
          }
          Test "S235,TR20/2.9,Open,C,15kN,1030mm2" PASSED.
        }