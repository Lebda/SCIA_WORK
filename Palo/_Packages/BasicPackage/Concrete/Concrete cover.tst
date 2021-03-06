        Test: dg=16,diam=8,S3,XC4,XD3 {
          Inputs: {
            d↓g←: 0.016  ->  0.016
            ϕ: 8∙10↑-3←  ->  0.008
            c↓mindur←: 0.04  ->  0.04
            Δc↓durγ←: 5∙10↑-3←  ->  5∙10↑-3←
            Δc↓durst←: 0  ->  0
            Δc↓duradd←: 5∙10↑-3←  ->  5∙10↑-3←
            Δc↓dev←: 0  ->  0
            S: 3  ->  3
            XC: 4  ->  4
            XD: 3  ->  3
            XS: 0  ->  0
            XF: 0  ->  0
            XA: 0  ->  0
            A: 35  ->  35
            B: 45  ->  45
            B1: False  ->  False
            H1: True  ->  True
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
          }
          Results: {
            c↓minb← = 0.008 == 8∙10↑-3←
            c↓min← = 0.04 == 0.04
            c↓nom← = 0.04 == 0.04
          }
          Test "dg=16,diam=8,S3,XC4,XD3" PASSED.
        }
        Test: dg=25,diam=16,S2,XC4,XD3,CS2 {
          Inputs: {
            d↓g←: 0.025  ->  0.025
            ϕ: 0.016  ->  0.016
            c↓mindur←: 0.035  ->  0.035
            Δc↓durγ←: 5∙10↑-3←  ->  5∙10↑-3←
            Δc↓durst←: 0  ->  0
            Δc↓duradd←: 5∙10↑-3←  ->  5∙10↑-3←
            Δc↓dev←: 0  ->  0
            S: 2  ->  2
            XC: 4  ->  4
            XD: 3  ->  3
            XS: 2  ->  2
            XF: 0  ->  0
            XA: 0  ->  0
            A: 35  ->  35
            B: 45  ->  45
            B1: False  ->  False
            H1: True  ->  True
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
          }
          Results: {
            c↓minb← = 0.016 == 0.016
            c↓min← = 0.035 == 0.035
            c↓nom← = 0.035 == 0.035
          }
          Test "dg=25,diam=16,S2,XC4,XD3,CS2" PASSED.
        }
        Test: dg=10,diam=6,S5,XC2,XD3,XS2,XF3,XA2 {
          Inputs: {
            d↓g←: 0.01  ->  0.01
            ϕ: 6∙10↑-3←  ->  0.006
            c↓mindur←: 0.05  ->  0.05
            Δc↓durγ←: 5∙10↑-3←  ->  5∙10↑-3←
            Δc↓durst←: 0  ->  0
            Δc↓duradd←: 5∙10↑-3←  ->  5∙10↑-3←
            Δc↓dev←: 0  ->  0
            S: 5  ->  5
            XC: 2  ->  2
            XD: 3  ->  3
            XS: 2  ->  2
            XF: 3  ->  3
            XA: 2  ->  2
            A: 35  ->  35
            B: 45  ->  45
            B1: False  ->  False
            H1: True  ->  True
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
          }
          Results: {
            c↓minb← = 0.006 == 6∙10↑-3←
            c↓min← = 0.05 == 0.05
            c↓nom← = 0.05 == 0.05
          }
          Test "dg=10,diam=6,S5,XC2,XD3,XS2,XF3,XA2" PASSED.
        }
        Test: dg=10,diam=6,S1,X0 {
          Inputs: {
            d↓g←: 0.01  ->  0.01
            ϕ: 6∙10↑-3←  ->  0.006
            c↓mindur←: 0.01  ->  0.01
            Δc↓durγ←: 5∙10↑-3←  ->  5∙10↑-3←
            Δc↓durst←: 0  ->  0
            Δc↓duradd←: 5∙10↑-3←  ->  5∙10↑-3←
            Δc↓dev←: 0  ->  0
            S: 1  ->  1
            XC: 0  ->  0
            XD: 0  ->  0
            XS: 0  ->  0
            XF: 0  ->  0
            XA: 0  ->  0
            A: 12  ->  12
            B: 15  ->  15
            B1: False  ->  False
            H1: True  ->  True
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
          }
          Results: {
            c↓minb← = 0.006 == 6∙10↑-3←
            c↓min← = 0.01 == 0.01
            c↓nom← = 0.01 == 0.01
          }
          Test "dg=10,diam=6,S1,X0" PASSED.
        }