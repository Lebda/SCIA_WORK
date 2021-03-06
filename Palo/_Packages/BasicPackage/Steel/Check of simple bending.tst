        Test: S235,IPE200,25kNm,5kNm {
          Inputs: {
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            SectionClass: 1  ->  1
            W↓pl,y←: 221∙10↑-6←  ->  221∙10↑-6←
            W↓pl,z←: 44.6∙10↑-6←  ->  44.6∙10↑-6←
            W↓el,y←: 194∙10↑-6←  ->  194∙10↑-6←
            W↓el,z←: 28.5∙10↑-6←  ->  28.5∙10↑-6←
            M↓Ed,y←: 25000  ->  25000
            M↓Ed,z←: 5000  ->  5000
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
            SectionName: IPE 200  ->  IPE 200
          }
          Results: {
            M↓Rd,y← = 45079 == 45079
            M↓Rd,z← = 9116 == 9116
            s↓y← = 0.555 == 0.555
            s↓z← = 0.548 == 0.548
            s↓max← = 0.555 == 0.555
          }
          Test "S235,IPE200,25kNm,5kNm" PASSED.
        }
        Test: S235,IPE240,25kNm,5kNm {
          Inputs: {
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            SectionClass: 1  ->  1
            W↓pl,y←: 367∙10↑-6←  ->  367∙10↑-6←
            W↓pl,z←: 73.9∙10↑-6←  ->  73.9∙10↑-6←
            W↓el,y←: 324∙10↑-6←  ->  324∙10↑-6←
            W↓el,z←: 47.3∙10↑-6←  ->  47.3∙10↑-6←
            M↓Ed,y←: 25000  ->  25000
            M↓Ed,z←: 5000  ->  5000
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
            SectionName: IPE 240  ->  IPE 240
          }
          Results: {
            M↓Rd,y← = 74914 == 74914
            M↓Rd,z← = 15105 == 15105
            s↓y← = 0.334 == 0.334
            s↓z← = 0.331 == 0.331
            s↓max← = 0.334 == 0.334
          }
          Test "S235,IPE240,25kNm,5kNm" PASSED.
        }
        Test: S235,IPE240,15kNm,10kNm {
          Inputs: {
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            γ↓M0←: 1.15  ->  1.15
            SectionClass: 1  ->  1
            W↓pl,y←: 367∙10↑-6←  ->  367∙10↑-6←
            W↓pl,z←: 73.9∙10↑-6←  ->  73.9∙10↑-6←
            W↓el,y←: 324∙10↑-6←  ->  324∙10↑-6←
            W↓el,z←: 47.3∙10↑-6←  ->  47.3∙10↑-6←
            M↓Ed,y←: 15000  ->  15000
            M↓Ed,z←: 10000  ->  10000
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
            SectionName: IPE 240  ->  IPE 240
          }
          Results: {
            M↓Rd,y← = 74914 == 74914
            M↓Rd,z← = 15105 == 15105
            s↓y← = 0.2 == 0.2
            s↓z← = 0.662 == 0.662
            s↓max← = 0.662 == 0.662
          }
          Test "S235,IPE240,15kNm,10kNm" PASSED.
        }