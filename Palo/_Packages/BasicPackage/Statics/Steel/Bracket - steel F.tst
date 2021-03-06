        Test: 6m,2m,15kN,10kN,IPE200 {
          Inputs: {
            L: 6  ->  6
            a: 2  ->  2
            b: 4  ->  4
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 19.4∙10↑-6←  ->  19.4∙10↑-6←
            W↓y←: 194∙10↑-6←  ->  194∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Bracket - steel - force  ->  Bracket - steel - force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 15000  ->  15000
            F↓k←: 10000  ->  10000
            SectionName: IPE 200  ->  IPE 200
            height: 0.2  ->  0.2
            width: 0.1  ->  0.1
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            ϕ↓b←: 4.9∙10↑-3←  ->  4.9∙10↑-3←
          }
          Results: {
            M↓Rd← = 39705 == 39705
            M↓Ed← = 30000 == 30000
            s = 0.756 == 0.756
            w↓b← = 6.54∙10↑-3← == 6.54∙10↑-3←
            w↓L← = 0.0261 == 0.0261
          }
          Test "6m,2m,15kN,10kN,IPE200" PASSED.
        }
        Test: 10m,5m,15kN,12kN,IPE200 {
          Inputs: {
            L: 10  ->  10
            a: 5  ->  5
            b: 5  ->  5
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 19.4∙10↑-6←  ->  19.4∙10↑-6←
            W↓y←: 194∙10↑-6←  ->  194∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Bracket - steel - force  ->  Bracket - steel - force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 15000  ->  15000
            F↓k←: 12000  ->  12000
            SectionName: IPE 200  ->  IPE 200
            height: 0.2  ->  0.2
            width: 0.1  ->  0.1
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            ϕ↓b←: 0.0368  ->  0.0368
          }
          Results: {
            M↓Rd← = 39705 == 39705
            M↓Ed← = 75000 == 75000
            s = 1.89 == 1.89
            w↓b← = 0.123 == 0.123
            w↓L← = 0.306 == 0.306
          }
          Test "10m,5m,15kN,12kN,IPE200" PASSED.
        }
        Test: 10m,5m,15kN,12kN,HE200B {
          Inputs: {
            L: 10  ->  10
            a: 5  ->  5
            b: 5  ->  5
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 57∙10↑-6←  ->  57∙10↑-6←
            W↓y←: 570∙10↑-6←  ->  570∙10↑-6←
            SectionImage: SSL_HEB  ->  SSL_HEB
            Caption: Bracket - steel - force  ->  Bracket - steel - force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 15000  ->  15000
            F↓k←: 12000  ->  12000
            SectionName: HE 200B  ->  HE 200B
            height: 0.2  ->  0.2
            width: 0.2  ->  0.2
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            ϕ↓b←: 0.0125  ->  0.0125
          }
          Results: {
            M↓Rd← = 116397 == 116397
            M↓Ed← = 75000 == 75000
            s = 0.644 == 0.644
            w↓b← = 0.0418 == 0.0418
            w↓L← = 0.105 == 0.105
          }
          Test "10m,5m,15kN,12kN,HE200B" PASSED.
        }
        Test: 8m,3m,50kN,35kN,HE200B {
          Inputs: {
            L: 8  ->  8
            a: 3  ->  3
            b: 5  ->  5
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 57∙10↑-6←  ->  57∙10↑-6←
            W↓y←: 570∙10↑-6←  ->  570∙10↑-6←
            SectionImage: SSL_HEB  ->  SSL_HEB
            Caption: Bracket - steel - force  ->  Bracket - steel - force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 50000  ->  50000
            F↓k←: 35000  ->  35000
            SectionName: HE 200B  ->  HE 200B
            height: 0.2  ->  0.2
            width: 0.2  ->  0.2
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            ϕ↓b←: 0.0132  ->  0.0132
          }
          Results: {
            M↓Rd← = 116397 == 116397
            M↓Ed← = 150000 == 150000
            s = 1.29 == 1.29
            w↓b← = 0.0263 == 0.0263
            w↓L← = 0.0922 == 0.0922
          }
          Test "8m,3m,50kN,35kN,HE200B" PASSED.
        }
        Test: 8m,3m,25kN,35kN,UPE220 {
          Inputs: {
            L: 8  ->  8
            a: 3  ->  3
            b: 5  ->  5
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 21.3∙10↑-6←  ->  21.3∙10↑-6←
            W↓y←: 194∙10↑-6←  ->  194∙10↑-6←
            SectionImage: SSL_UPE  ->  SSL_UPE
            Caption: Bracket - steel - force  ->  Bracket - steel - force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 25000  ->  25000
            F↓k←: 35000  ->  35000
            SectionName: UPE 220  ->  UPE 220
            height: 0.22  ->  0.22
            width: 0.082  ->  0.082
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            ϕ↓b←: 0.0352  ->  0.0352
          }
          Results: {
            M↓Rd← = 39643 == 39643
            M↓Ed← = 75000 == 75000
            s = 1.89 == 1.89
            w↓b← = 0.0704 == 0.0704
            w↓L← = 0.246 == 0.246
          }
          Test "8m,3m,25kN,35kN,UPE220" PASSED.
        }
        Test: 8m,3m,25kN,35kN,Q60x60x3.2 {
          Inputs: {
            L: 8  ->  8
            a: 3  ->  3
            b: 5  ->  5
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 387∙10↑-9←  ->  387∙10↑-9←
            W↓y←: 12.9∙10↑-6←  ->  12.9∙10↑-6←
            SectionImage: SSL_Qe  ->  SSL_Qe
            Caption: Bracket - steel - force  ->  Bracket - steel - force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 25000  ->  25000
            F↓k←: 35000  ->  35000
            SectionName: Q 60x60x3,2  ->  Q 60x60x3,2
            height: 0.06  ->  0.06
            width: 0.06  ->  0.06
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            ϕ↓b←: 1.94  ->  1.94
          }
          Results: {
            M↓Rd← = 2636 == 2636
            M↓Ed← = 75000 == 75000
            s = 28.5 == 28.5
            w↓b← = 3.88 == 3.88
            w↓L← = 13.6 == 13.6
          }
          Test "8m,3m,25kN,35kN,Q60x60x3.2" PASSED.
        }
        Test: 3m,1m,2kN,2kN,L50x32x3 {
          Inputs: {
            L: 3  ->  3
            a: 1  ->  1
            b: 2  ->  2
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 62∙10↑-9←  ->  62∙10↑-9←
            W↓y←: 1.83∙10↑-6←  ->  1.83∙10↑-6←
            SectionImage: SSL_Ln  ->  SSL_Ln
            Caption: Bracket - steel - force  ->  Bracket - steel - force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 2000  ->  2000
            F↓k←: 2000  ->  2000
            SectionName: L 50x32x3  ->  L 50x32x3
            height: 0.05  ->  0.05
            width: 0.032  ->  0.032
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            ϕ↓b←: 0.0768  ->  0.0768
          }
          Results: {
            M↓Rd← = 374 == 374
            M↓Ed← = 2000 == 2000
            s = 5.35 == 5.35
            w↓b← = 0.0512 == 0.0512
            w↓L← = 0.205 == 0.205
          }
          Test "3m,1m,2kN,2kN,L50x32x3" PASSED.
        }