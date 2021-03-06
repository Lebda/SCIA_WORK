        Test: 6m,1.5kN/m,1kN/m,IPE200,S235 {
          Inputs: {
            L: 6  ->  6
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 19.4∙10↑-6←  ->  19.4∙10↑-6←
            W↓y←: 194∙10↑-6←  ->  194∙10↑-6←
            SectionImage: SSL_IPE  ->  SSL_IPE
            Caption: Simple member - steel - uniform force  ->  Simple member - steel - uniform force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: IPE 200  ->  IPE 200
            height: 0.2  ->  0.2
            width: 0.1  ->  0.1
            s: 0.17  ->  0.17
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
          }
          Results: {
            M↓Rd← = 39705 == 39705
            M↓Ed← = 6750 == 6750
            w = 4.14∙10↑-3← == 4.14∙10↑-3←
            ϕ↓ab← = 2.21∙10↑-3← == 2.21∙10↑-3←
          }
          Test "6m,1.5kN/m,1kN/m,IPE200,S235" PASSED.
        }
        Test: 15m,2.5kN/m,2kN/m,IPN160,S355 {
          Inputs: {
            L: 15  ->  15
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 9.35∙10↑-6←  ->  9.35∙10↑-6←
            W↓y←: 117∙10↑-6←  ->  117∙10↑-6←
            SectionImage: SSL_IPN  ->  SSL_IPN
            Caption: Simple member - steel - uniform force  ->  Simple member - steel - uniform force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: IPN 160  ->  IPN 160
            height: 0.16  ->  0.16
            width: 0.074  ->  0.074
            s: 2.94  ->  2.94
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 2500  ->  2500
            q↓k←: 2000  ->  2000
          }
          Results: {
            M↓Rd← = 23882 == 23882
            M↓Ed← = 70313 == 70313
            w = 0.671 == 0.671
            ϕ↓ab← = 0.143 == 0.143
          }
          Test "15m,2.5kN/m,2kN/m,IPN160,S355" PASSED.
        }
        Test: 15m,1.5kN/m,1kN/m,IPN160,S355 {
          Inputs: {
            L: 15  ->  15
            γ↓M0←: 1.15  ->  1.15
            E: 210∙10↑9←  ->  210∙10↑9←
            f↓y←: 235∙10↑6←  ->  235∙10↑6←
            I↓y←: 9.35∙10↑-6←  ->  9.35∙10↑-6←
            W↓y←: 117∙10↑-6←  ->  117∙10↑-6←
            SectionImage: SSL_IPN  ->  SSL_IPN
            Caption: Simple member - steel - uniform force  ->  Simple member - steel - uniform force
            PrintCaption: True  ->  True
            PrintSection: True  ->  True
            SectionName: IPN 160  ->  IPN 160
            height: 0.16  ->  0.16
            width: 0.074  ->  0.074
            s: 1.77  ->  1.77
            PrintSchema: True  ->  True
            PrintULS: True  ->  True
            PrintSLS: True  ->  True
            q↓d←: 1500  ->  1500
            q↓k←: 1000  ->  1000
          }
          Results: {
            M↓Rd← = 23882 == 23882
            M↓Ed← = 42188 == 42188
            w = 0.336 == 0.336
            ϕ↓ab← = 0.0716 == 0.0716
          }
          Test "15m,1.5kN/m,1kN/m,IPN160,S355" PASSED.
        }