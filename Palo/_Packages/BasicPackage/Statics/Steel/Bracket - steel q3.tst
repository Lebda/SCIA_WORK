        Test: 6m,2m,1.5kN/m,2m,1kN/m,IPE200 {
          Inputs: {
            L: 6  ->  6
            a: 2  ->  2
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 19.4∙10↑-6←  ->  19.4∙10↑-6←
            W↓y←: 194∙10↑-6←  ->  194∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Bracket - steel - triangular increasing force  ->  Bracket - steel - triangular increasing force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: IPE 200  ->  IPE 200
            height: 0.2  ->  0.2
            width: 0.1  ->  0.1
            s: 0.126  ->  0.126
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
            M↓Ed← = 5000 == 5000
            w↓b← = 3.95∙10↑-3← == 3.95∙10↑-3←
            w↓L← = 6.73∙10↑-3← == 6.73∙10↑-3←
            ϕ↓b← = 1.39∙10↑-3← == 1.39∙10↑-3←
          }
          Test "6m,2m,1.5kN/m,2m,1kN/m,IPE200" PASSED.
        }
        Test: 6m,2m,1.5kN/m,2m,1kN/m,Q80x40x4 {
          Inputs: {
            L: 6  ->  6
            a: 2  ->  2
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 648∙10↑-9←  ->  648∙10↑-9←
            W↓y←: 16.2∙10↑-6←  ->  16.2∙10↑-6←
            SectionImage: SSL_Qn  ->  SSL_Qn
            Caption: Bracket - steel - triangular increasing force  ->  Bracket - steel - triangular increasing force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: Q 80x40x4  ->  Q 80x40x4
            height: 0.08  ->  0.08
            width: 0.04  ->  0.04
            s: 1.51  ->  1.51
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 1500  ->  1500
            c: 2  ->  2
            q↓k←: 1000  ->  1000
            d: 2  ->  2
          }
          Results: {
            M↓Rd← = 3310 == 3310
            M↓Ed← = 5000 == 5000
            w↓b← = 0.119 == 0.119
            w↓L← = 0.202 == 0.202
            ϕ↓b← = 0.0416 == 0.0416
          }
          Test "6m,2m,1.5kN/m,2m,1kN/m,Q80x40x4" PASSED.
        }
        Test: 6m,2m,2kN/m,3m,1kN/m,Q80x40x4 {
          Inputs: {
            L: 6  ->  6
            a: 2  ->  2
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 648∙10↑-9←  ->  648∙10↑-9←
            W↓y←: 16.2∙10↑-6←  ->  16.2∙10↑-6←
            SectionImage: SSL_Qn  ->  SSL_Qn
            Caption: Bracket - steel - triangular increasing force  ->  Bracket - steel - triangular increasing force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: Q 80x40x4  ->  Q 80x40x4
            height: 0.08  ->  0.08
            width: 0.04  ->  0.04
            s: 3.62  ->  3.62
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 2000  ->  2000
            c: 3  ->  3
            q↓k←: 1000  ->  1000
            d: 1  ->  1
          }
          Results: {
            M↓Rd← = 3310 == 3310
            M↓Ed← = 12000 == 12000
            w↓b← = 0.326 == 0.326
            w↓L← = 0.417 == 0.417
            ϕ↓b← = 0.0909 == 0.0909
          }
          Test "6m,2m,2kN/m,3m,1kN/m,Q80x40x4" PASSED.
        }