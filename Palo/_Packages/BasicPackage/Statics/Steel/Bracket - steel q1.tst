        Test: 6m,2m,1,5kN/m,2m,1kN/m,IPE200 {
          Inputs: {
            L: 6  ->  6
            a: 2  ->  2
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 19.4∙10↑-6←  ->  19.4∙10↑-6←
            W↓y←: 194∙10↑-6←  ->  194∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Bracket - steel - uniform force  ->  Bracket - steel - uniform force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: IPE 200  ->  IPE 200
            height: 0.2  ->  0.2
            width: 0.1  ->  0.1
            s: 0.227  ->  0.227
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 1500  ->  1500
            c: 2  ->  2
            q↓k←: 1000  ->  1000
            d: 2  ->  2
          }
          Results: {
            M↓Rd← = 39705 == 39705
            M↓Ed← = 9000 == 9000
            w↓b← = 6.7∙10↑-3← == 6.7∙10↑-3←
            w↓L← = 0.0113 == 0.0113
            ϕ↓b← = 2.29∙10↑-3← == 2.29∙10↑-3←
          }
          Test "6m,2m,1,5kN/m,2m,1kN/m,IPE200" PASSED.
        }
        Test: 10m,2m,1,5kN/m,5m,1kN/m,IPE200 {
          Inputs: {
            L: 10  ->  10
            a: 2  ->  2
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 19.4∙10↑-6←  ->  19.4∙10↑-6←
            W↓y←: 194∙10↑-6←  ->  194∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Bracket - steel - uniform force  ->  Bracket - steel - uniform force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: IPE 200  ->  IPE 200
            height: 0.2  ->  0.2
            width: 0.1  ->  0.1
            s: 0.85  ->  0.85
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 1500  ->  1500
            c: 5  ->  5
            q↓k←: 1000  ->  1000
            d: 3  ->  3
          }
          Results: {
            M↓Rd← = 39705 == 39705
            M↓Ed← = 33750 == 33750
            w↓b← = 0.0714 == 0.0714
            w↓L← = 0.112 == 0.112
            ϕ↓b← = 0.0137 == 0.0137
          }
          Test "10m,2m,1,5kN/m,5m,1kN/m,IPE200" PASSED.
        }
        Test: 10m,2m,1,5kN/m,5m,1kN/m,HE180M {
          Inputs: {
            L: 10  ->  10
            a: 2  ->  2
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 74.8∙10↑-6←  ->  74.8∙10↑-6←
            W↓y←: 748∙10↑-6←  ->  748∙10↑-6←
            SectionImage: SSL_HEM  ->  SSL_HEM
            Caption: Bracket - steel - uniform force  ->  Bracket - steel - uniform force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: HE 180M  ->  HE 180M
            height: 0.2  ->  0.2
            width: 0.186  ->  0.186
            s: 0.221  ->  0.221
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 1500  ->  1500
            c: 5  ->  5
            q↓k←: 1000  ->  1000
            d: 3  ->  3
          }
          Results: {
            M↓Rd← = 152913 == 152914
            M↓Ed← = 33750 == 33750
            w↓b← = 0.0185 == 0.0185
            w↓L← = 0.0292 == 0.0292
            ϕ↓b← = 3.55∙10↑-3← == 3.55∙10↑-3←
          }
          Test "10m,2m,1,5kN/m,5m,1kN/m,HE180M" PASSED.
        }
        Test: 10m,5m,1,5kN/m,5m,2kN/m,HE180M {
          Inputs: {
            L: 10  ->  10
            a: 5  ->  5
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 74.8∙10↑-6←  ->  74.8∙10↑-6←
            W↓y←: 748∙10↑-6←  ->  748∙10↑-6←
            SectionImage: SSL_HEM  ->  SSL_HEM
            Caption: Bracket - steel - uniform force  ->  Bracket - steel - uniform force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: HE 180M  ->  HE 180M
            height: 0.2  ->  0.2
            width: 0.186  ->  0.186
            s: 0.368  ->  0.368
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 1500  ->  1500
            c: 5  ->  5
            q↓k←: 2000  ->  2000
            d: 0  ->  0
          }
          Results: {
            M↓Rd← = 152913 == 152914
            M↓Ed← = 56250 == 56250
            w↓b← = 0.136 == 0.136
            w↓L← = 0.136 == 0.136
            ϕ↓b← = 0.0186 == 0.0186
          }
          Test "10m,5m,1,5kN/m,5m,2kN/m,HE180M" PASSED.
        }
        Test: 10m,5m,1,5kN/m,5m,2kN/m,2xU120 {
          Inputs: {
            L: 10  ->  10
            a: 5  ->  5
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 7.43∙10↑-6←  ->  7.43∙10↑-6←
            W↓y←: 124∙10↑-6←  ->  124∙10↑-6←
            SectionImage: SSL_Ubox  ->  SSL_Ubox
            Caption: Bracket - steel - uniform force  ->  Bracket - steel - uniform force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: 2xU120  ->  2xU120
            height: 0.12  ->  0.12
            width: 0.11  ->  0.11
            s: 2.22  ->  2.22
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 1500  ->  1500
            c: 5  ->  5
            q↓k←: 2000  ->  2000
            d: 0  ->  0
          }
          Results: {
            M↓Rd← = 25302 == 25302
            M↓Ed← = 56250 == 56250
            w↓b← = 1.37 == 1.37
            w↓L← = 1.37 == 1.37
            ϕ↓b← = 0.187 == 0.187
          }
          Test "10m,5m,1,5kN/m,5m,2kN/m,2xU120" PASSED.
        }