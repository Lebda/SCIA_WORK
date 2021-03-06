        Test: 6m,15kN,10kN,IPE200,S235 {
          Inputs: {
            L: 6  ->  6
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 19.4∙10↑-6←  ->  19.4∙10↑-6←
            W↓y←: 194∙10↑-6←  ->  194∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Simple member - steel - simple force 2x  ->  Simple member - steel - simple force 2x
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 15000  ->  15000
            F↓k←: 10000  ->  10000
            SectionName: IPE 200  ->  IPE 200
            height: 0.2  ->  0.2
            width: 0.1  ->  0.1
            s: 0.756  ->  0.756
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
          }
          Results: {
            M↓Rd← = 39705 == 39705
            M↓Ed← = 30000 == 30000
            w = 0.0188 == 0.0188
            ϕ↓a← = 9.8∙10↑-3← == 9.8∙10↑-3←
          }
          Test "6m,15kN,10kN,IPE200,S235" PASSED.
        }
        Test: 6m,15kN,10kN,IPE220,S237 {
          Inputs: {
            L: 6  ->  6
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 27.7∙10↑-6←  ->  27.7∙10↑-6←
            W↓y←: 252∙10↑-6←  ->  252∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Simple member - steel - simple force 2x  ->  Simple member - steel - simple force 2x
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 15000  ->  15000
            F↓k←: 10000  ->  10000
            SectionName: IPE 220  ->  IPE 220
            height: 0.22  ->  0.22
            width: 0.11  ->  0.11
            s: 0.583  ->  0.583
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
          }
          Results: {
            M↓Rd← = 51496 == 51496
            M↓Ed← = 30000 == 30000
            w = 0.0132 == 0.0132
            ϕ↓a← = 6.87∙10↑-3← == 6.87∙10↑-3←
          }
          Test "6m,15kN,10kN,IPE220,S237" PASSED.
        }
        Test: 6m,25kN,15kN,IPE220,S237 {
          Inputs: {
            L: 6  ->  6
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 27.7∙10↑-6←  ->  27.7∙10↑-6←
            W↓y←: 252∙10↑-6←  ->  252∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Simple member - steel - simple force 2x  ->  Simple member - steel - simple force 2x
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 25000  ->  25000
            F↓k←: 15000  ->  15000
            SectionName: IPE 220  ->  IPE 220
            height: 0.22  ->  0.22
            width: 0.11  ->  0.11
            s: 0.971  ->  0.971
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
          }
          Results: {
            M↓Rd← = 51496 == 51496
            M↓Ed← = 50000 == 50000
            w = 0.0198 == 0.0198
            ϕ↓a← = 0.0103 == 0.0103
          }
          Test "6m,25kN,15kN,IPE220,S237" PASSED.
        }
        Test: 15m,25kN,15kN,IPE220,S237 {
          Inputs: {
            L: 15  ->  15
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 27.7∙10↑-6←  ->  27.7∙10↑-6←
            W↓y←: 252∙10↑-6←  ->  252∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Simple member - steel - simple force 2x  ->  Simple member - steel - simple force 2x
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            F↓d←: 25000  ->  25000
            F↓k←: 15000  ->  15000
            SectionName: IPE 220  ->  IPE 220
            height: 0.22  ->  0.22
            width: 0.11  ->  0.11
            s: 2.43  ->  2.43
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
          }
          Results: {
            M↓Rd← = 51496 == 51496
            M↓Ed← = 125000 == 125000
            w = 0.309 == 0.309
            ϕ↓a← = 0.0644 == 0.0644
          }
          Test "15m,25kN,15kN,IPE220,S237" PASSED.
        }