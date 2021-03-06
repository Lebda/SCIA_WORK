        Test: 6m,1.5kN/m,1kN/m,1m,3m,IPE200,S235 {
          Inputs: {
            L: 6  ->  6
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 19.4∙10↑-6←  ->  19.4∙10↑-6←
            W↓y←: 194∙10↑-6←  ->  194∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Simple member - steel - uniform free force  ->  Simple member - steel - uniform free force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: IPE 200  ->  IPE 200
            height: 0.2  ->  0.2
            width: 0.1  ->  0.1
            s: 0.124  ->  0.124
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
            a: 1  ->  1
            c: 3  ->  3
          }
          Results: {
            M↓Rd← = 39705 == 39705
            M↓Ed← = 4922 == 4922
            w = 2.78∙10↑-3← == 2.78∙10↑-3←
            d = 2.5 == 2.5
            e = 3.5 == 3.5
            x = 2.75 == 2.75
            ϕ↓9a← = 1.54∙10↑-3← == 1.54∙10↑-3←
            ϕ↓9b← = 1.4∙10↑-3← == 1.4∙10↑-3←
          }
          Test "6m,1.5kN/m,1kN/m,1m,3m,IPE200,S235" PASSED.
        }
        Test: 6m,1.5kN/m,1kN/m,1m,3m,L100x10,S450 {
          Inputs: {
            L: 6  ->  6
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 1.77∙10↑-6←  ->  1.77∙10↑-6←
            W↓y←: 24.7∙10↑-6←  ->  24.7∙10↑-6←
            SectionImage: SSL_Le  ->  SSL_Le
            Caption: Simple member - steel - uniform free force  ->  Simple member - steel - uniform free force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: L 100 x 10  ->  L 100 x 10
            height: 0.1  ->  0.1
            width: 0.1  ->  0.1
            s: 0.975  ->  0.975
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
            a: 1  ->  1
            c: 3  ->  3
          }
          Results: {
            M↓Rd← = 5047 == 5047
            M↓Ed← = 4922 == 4922
            w = 0.0305 == 0.0305
            d = 2.5 == 2.5
            e = 3.5 == 3.5
            x = 2.75 == 2.75
            ϕ↓9a← = 0.0169 == 0.0169
            ϕ↓9b← = 0.0154 == 0.0154
          }
          Test "6m,1.5kN/m,1kN/m,1m,3m,L100x10,S450" PASSED.
        }
        Test: 3m,1.5kN/m,1kN/m,0.3m,2m,L100x10,S450 {
          Inputs: {
            L: 3  ->  3
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 1.77∙10↑-6←  ->  1.77∙10↑-6←
            W↓y←: 24.7∙10↑-6←  ->  24.7∙10↑-6←
            SectionImage: SSL_Le  ->  SSL_Le
            Caption: Simple member - steel - uniform free force  ->  Simple member - steel - uniform free force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: L 100 x 10  ->  L 100 x 10
            height: 0.1  ->  0.1
            width: 0.1  ->  0.1
            s: 0.292  ->  0.292
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
            a: 0.3  ->  0.3
            c: 2  ->  2
          }
          Results: {
            M↓Rd← = 5047 == 5047
            M↓Ed← = 1473 == 1473
            w = 2.37∙10↑-3← == 2.37∙10↑-3←
            d = 1.3 == 1.3
            e = 1.7 == 1.7
            x = 1.43 == 1.43
            ϕ↓9a← = 2.6∙10↑-3← == 2.6∙10↑-3←
            ϕ↓9b← = 2.45∙10↑-3← == 2.45∙10↑-3←
          }
          Test "3m,1.5kN/m,1kN/m,0.3m,2m,L100x10,S450" PASSED.
        }