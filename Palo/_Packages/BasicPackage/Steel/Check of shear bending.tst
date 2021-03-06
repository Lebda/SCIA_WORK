        Test: S235,IPE120,150kNm,10kN {
          Inputs: {
            M↓Ed←: 150000  ->  150000
            V↓Ed←: 10000  ->  10000
            SectionClass: 1  ->  1
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            f↓y,Red←: 78.4∙10↑6←  ->  78.4∙10↑6←
            ρ: 0.666  ->  0.666
            A↓vz←: 631∙10↑-6←  ->  631∙10↑-6←
            W↓pl,y←: 60.7∙10↑-6←  ->  60.7∙10↑-6←
            W↓el,y←: 53∙10↑-6←  ->  53∙10↑-6←
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            b: 0.064  ->  0.064
            SectionImage: SSL_IPE  ->  SSL_IPE
            W↓el,z←: 8.65∙10↑-6←  ->  8.65∙10↑-6←
            W↓pl,z←: 13.6∙10↑-6←  ->  13.6∙10↑-6←
            A: 1.32∙10↑-3←  ->  1.32∙10↑-3←
            h: 0.12  ->  0.12
            G: 10.4  ->  10.4
            H1: True  ->  True
            SectionName: IPE 120  ->  IPE 120
          }
          Results: {
            s = 12.1 == 12.1
            V↓pl,Rd← = 74446 == 74446
            M↓Rd,y← = 12410 == 12410
          }
          Test "S235,IPE120,150kNm,10kN" PASSED.
        }
        Test: S235,IPE120,15kNm,10kN {
          Inputs: {
            M↓Ed←: 15000  ->  15000
            V↓Ed←: 10000  ->  10000
            SectionClass: 1  ->  1
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            f↓y,Red←: 78.4∙10↑6←  ->  78.4∙10↑6←
            ρ: 0.666  ->  0.666
            A↓vz←: 631∙10↑-6←  ->  631∙10↑-6←
            W↓pl,y←: 60.7∙10↑-6←  ->  60.7∙10↑-6←
            W↓el,y←: 53∙10↑-6←  ->  53∙10↑-6←
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            b: 0.064  ->  0.064
            SectionImage: SSL_IPE  ->  SSL_IPE
            W↓el,z←: 8.65∙10↑-6←  ->  8.65∙10↑-6←
            W↓pl,z←: 13.6∙10↑-6←  ->  13.6∙10↑-6←
            A: 1.32∙10↑-3←  ->  1.32∙10↑-3←
            h: 0.12  ->  0.12
            G: 10.4  ->  10.4
            H1: True  ->  True
            SectionName: IPE 120  ->  IPE 120
          }
          Results: {
            s = 1.21 == 1.21
            V↓pl,Rd← = 74446 == 74446
            M↓Rd,y← = 12410 == 12410
          }
          Test "S235,IPE120,15kNm,10kN" PASSED.
        }
        Test: S235,HEA120,15kNm,10kN {
          Inputs: {
            M↓Ed←: 15000  ->  15000
            V↓Ed←: 10000  ->  10000
            SectionClass: 1  ->  1
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            f↓y,Red←: 78.4∙10↑6←  ->  78.4∙10↑6←
            ρ: 0.666  ->  0.666
            A↓vz←: 850∙10↑-6←  ->  850∙10↑-6←
            W↓pl,y←: 120∙10↑-6←  ->  120∙10↑-6←
            W↓el,y←: 106∙10↑-6←  ->  106∙10↑-6←
            Caption: uživatelský popis  ->  uživatelský popis
            PrintCaption: False  ->  False
            PrintLoad: True  ->  True
            PrintSection: True  ->  True
            b: 0.12  ->  0.12
            SectionImage: SSL_HEA  ->  SSL_HEA
            W↓el,z←: 38.5∙10↑-6←  ->  38.5∙10↑-6←
            W↓pl,z←: 58.9∙10↑-6←  ->  58.9∙10↑-6←
            A: 2.53∙10↑-3←  ->  2.53∙10↑-3←
            h: 0.114  ->  0.114
            G: 19.9  ->  19.9
            H1: True  ->  True
            SectionName: HEA 120  ->  HEA 120
          }
          Results: {
            s = 0.614 == 0.614
            V↓pl,Rd← = 100283 == 100283
            M↓Rd,y← = 24420 == 24420
          }
          Test "S235,HEA120,15kNm,10kN" PASSED.
        }