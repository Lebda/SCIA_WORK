        Test: 6m,2m,15kN,10kN,IPE200,1.15 {
          Inputs: {
            L: 6  ->  6
            a: 2  ->  2
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 19.4∙10↑-6←  ->  19.4∙10↑-6←
            W↓y←: 194∙10↑-6←  ->  194∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Bracket - steel - bending moment  ->  Bracket - steel - bending moment
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: IPE 200  ->  IPE 200
            height: 0.2  ->  0.2
            width: 0.1  ->  0.1
            s: 0.378  ->  0.378
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            M↓d←: 15000  ->  15000
            M↓k←: 10000  ->  10000
            Arr: List`1  ->  List`1
          }
          Results: {
            b = 4 == 4
            M↓Rd← = 39705 == 39705
            M↓Ed← = 15000 == 15000
            w↓L← = 0.0245 == 0.0245
            ϕ↓b← = 4.9∙10↑-3← == 4.9∙10↑-3←
          }
          Test "6m,2m,15kN,10kN,IPE200,1.15" PASSED.
        }
        Test: 15m,2m,15kN,10kN,UPN300,1.15 {
          Inputs: {
            L: 15  ->  15
            a: 2  ->  2
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 80.3∙10↑-6←  ->  80.3∙10↑-6←
            W↓y←: 535∙10↑-6←  ->  535∙10↑-6←
            SectionImage: SSL_UPN  ->  SSL_UPN
            Caption: Bracket - steel - bending moment  ->  Bracket - steel - bending moment
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: UPN300  ->  UPN300
            height: 0.3  ->  0.3
            width: 0.1  ->  0.1
            s: 0.137  ->  0.137
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            M↓d←: 15000  ->  15000
            M↓k←: 10000  ->  10000
            Arr: List`1  ->  List`1
          }
          Results: {
            b = 13 == 13
            M↓Rd← = 109326 == 109326
            M↓Ed← = 15000 == 15000
            w↓L← = 0.0166 == 0.0166
            ϕ↓b← = 1.19∙10↑-3← == 1.19∙10↑-3←
          }
          Test "15m,2m,15kN,10kN,UPN300,1.15" PASSED.
        }
        Test: 15m,2m,15kN,10kN,UPN300,1.2 {
          Inputs: {
            L: 15  ->  15
            a: 2  ->  2
            γ↓M0←: 1.2  ->  1.2
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 80.3∙10↑-6←  ->  80.3∙10↑-6←
            W↓y←: 535∙10↑-6←  ->  535∙10↑-6←
            SectionImage: SSL_UPN  ->  SSL_UPN
            Caption: Bracket - steel - bending moment  ->  Bracket - steel - bending moment
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: UPN300  ->  UPN300
            height: 0.3  ->  0.3
            width: 0.1  ->  0.1
            s: 0.143  ->  0.143
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            M↓d←: 15000  ->  15000
            M↓k←: 10000  ->  10000
            Arr: List`1  ->  List`1
          }
          Results: {
            b = 13 == 13
            M↓Rd← = 104771 == 104771
            M↓Ed← = 15000 == 15000
            w↓L← = 0.0166 == 0.0166
            ϕ↓b← = 1.19∙10↑-3← == 1.19∙10↑-3←
          }
          Test "15m,2m,15kN,10kN,UPN300,1.2" PASSED.
        }
        Test: 15m,2m,25kN,10kN,UPN300,1.15 {
          Inputs: {
            L: 15  ->  15
            a: 2  ->  2
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 80.3∙10↑-6←  ->  80.3∙10↑-6←
            W↓y←: 535∙10↑-6←  ->  535∙10↑-6←
            SectionImage: SSL_UPN  ->  SSL_UPN
            Caption: Bracket - steel - bending moment  ->  Bracket - steel - bending moment
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: UPN300  ->  UPN300
            height: 0.3  ->  0.3
            width: 0.1  ->  0.1
            s: 0.229  ->  0.229
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            M↓d←: 25000  ->  25000
            M↓k←: 10000  ->  10000
            Arr: List`1  ->  List`1
          }
          Results: {
            b = 13 == 13
            M↓Rd← = 109326 == 109326
            M↓Ed← = 25000 == 25000
            w↓L← = 0.0166 == 0.0166
            ϕ↓b← = 1.19∙10↑-3← == 1.19∙10↑-3←
          }
          Test "15m,2m,25kN,10kN,UPN300,1.15" PASSED.
        }
        Test: 15m,2m,25kN,10kN,HEAT240,1.15 {
          Inputs: {
            L: 15  ->  15
            a: 2  ->  2
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 2.74∙10↑-6←  ->  2.74∙10↑-6←
            W↓y←: 28.3∙10↑-6←  ->  28.3∙10↑-6←
            SectionImage: SSL_T  ->  SSL_T
            Caption: Bracket - steel - bending moment  ->  Bracket - steel - bending moment
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: HEA T 240  ->  HEA T 240
            height: 0.115  ->  0.115
            width: 0.24  ->  0.24
            s: 4.33  ->  4.33
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            M↓d←: 25000  ->  25000
            M↓k←: 10000  ->  10000
            Arr: List`1  ->  List`1
          }
          Results: {
            b = 13 == 13
            M↓Rd← = 5775 == 5775
            M↓Ed← = 25000 == 25000
            w↓L← = 0.487 == 0.487
            ϕ↓b← = 0.0348 == 0.0348
          }
          Test "15m,2m,25kN,10kN,HEAT240,1.15" PASSED.
        }