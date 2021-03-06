        Test: 150kN,200kN,0.5kN/m,20e-6MPa,300mm,3m,ceiling,roof {
          Inputs: {
            q↓Ewd←: 500  ->  500
            t: 0.3  ->  0.3
            h: 3  ->  3
            b: 1  ->  1
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 3  ->  3
            λ: 10  ->  10
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            l: 0.2  ->  0.2
            d: 0.2  ->  0.2
            e↓d←: 0.05  ->  0.05
            a↓1←: 0.8  ->  0.8
            h↓c←: 3  ->  3
            N↓Ed1←: 150000  ->  150000
            N↓Ed2←: 200000  ->  200000
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            α↓N←: 0.322  ->  0.322
            B1: True  ->  True
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            N↓Rd←: 0  ->  0
            N↓Ed←: 0  ->  0
          }
          Results: {
            t↓min← = 0.096 == 0.096
            Φ↓s← = 0.5 == 0.5
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
            A↓b← = 0.04 == 0.04
            N↓Rd1← = 189657 == 189657
            N↓Rd2← = 544297 == 544297
          }
          Test "150kN,200kN,0.5kN/m,20e-6MPa,300mm,3m,ceiling,roof" PASSED.
        }
        Test: 150kN,200kN,0.5kN/m,20e-6MPa,300mm,3m,NOceiling,roof {
          Inputs: {
            q↓Ewd←: 500  ->  500
            t: 0.3  ->  0.3
            h: 3  ->  3
            b: 1  ->  1
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 3  ->  3
            λ: 10  ->  10
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            l: 0.2  ->  0.2
            d: 0.2  ->  0.2
            e↓d←: 0.05  ->  0.05
            a↓1←: 0.8  ->  0.8
            h↓c←: 3  ->  3
            N↓Ed1←: 150000  ->  150000
            N↓Ed2←: 200000  ->  200000
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            α↓N←: 0.322  ->  0.322
            B1: False  ->  False
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            N↓Rd←: 0  ->  0
            N↓Ed←: 0  ->  0
          }
          Results: {
            t↓min← = 0.096 == 0.096
            Φ↓s← = 0.5 == 0.5
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
            A↓b← = 0.04 == 0.04
            N↓Rd1← = 189657 == 189657
            N↓Rd2← = 544297 == 544297
          }
          Test "150kN,200kN,0.5kN/m,20e-6MPa,300mm,3m,NOceiling,roof" PASSED.
        }
        Test: 150kN,200kN,0.5kN/m,20e-6MPa,300mm,3m,NOceiling,NOroof {
          Inputs: {
            q↓Ewd←: 500  ->  500
            t: 0.3  ->  0.3
            h: 3  ->  3
            b: 1  ->  1
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 3  ->  3
            λ: 10  ->  10
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            l: 0.2  ->  0.2
            d: 0.2  ->  0.2
            e↓d←: 0.05  ->  0.05
            a↓1←: 0.8  ->  0.8
            h↓c←: 3  ->  3
            N↓Ed1←: 150000  ->  150000
            N↓Ed2←: 200000  ->  200000
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            α↓N←: 0.322  ->  0.322
            B1: False  ->  False
            B2: False  ->  False
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            N↓Rd←: 0  ->  0
            N↓Ed←: 0  ->  0
          }
          Results: {
            t↓min← = 0.096 == 0.096
            Φ↓s← = 0.74 == 0.74
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
            A↓b← = 0.04 == 0.04
            N↓Rd1← = 189657 == 189657
            N↓Rd2← = 805560 == 805560
          }
          Test "150kN,200kN,0.5kN/m,20e-6MPa,300mm,3m,NOceiling,NOroof" PASSED.
        }
        Test: 1500kN,200kN,0.5kN/m,20e-6MPa,300mm,3m,ceiling,roof {
          Inputs: {
            q↓Ewd←: 500  ->  500
            t: 0.3  ->  0.3
            h: 3  ->  3
            b: 1  ->  1
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 3  ->  3
            λ: 10  ->  10
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            l: 0.2  ->  0.2
            d: 0.2  ->  0.2
            e↓d←: 0.05  ->  0.05
            a↓1←: 0.8  ->  0.8
            h↓c←: 3  ->  3
            N↓Ed1←: 1.5∙10↑6←  ->  1.5∙10↑6←
            N↓Ed2←: 200000  ->  200000
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            α↓N←: 1.56  ->  1.56
            B1: True  ->  True
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            N↓Rd←: 0  ->  0
            N↓Ed←: 0  ->  0
          }
          Results: {
            t↓min← = 0.0936 == 0.0936
            Φ↓s← = 0.5 == 0.5
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
            A↓b← = 0.04 == 0.04
            N↓Rd1← = 189657 == 189657
            N↓Rd2← = 544297 == 544297
          }
          Test "1500kN,200kN,0.5kN/m,20e-6MPa,300mm,3m,ceiling,roof" PASSED.
        }
        Test: 150kN,2000kN,1kN/m,20e-6MPa,300mm,3m,ceiling,roof {
          Inputs: {
            q↓Ewd←: 1000  ->  1000
            t: 0.3  ->  0.3
            h: 3  ->  3
            b: 1  ->  1
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 3  ->  3
            λ: 10  ->  10
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            l: 0.2  ->  0.2
            d: 0.2  ->  0.2
            e↓d←: 0.05  ->  0.05
            a↓1←: 0.8  ->  0.8
            h↓c←: 3  ->  3
            N↓Ed1←: 150000  ->  150000
            N↓Ed2←: 2∙10↑6←  ->  2∙10↑6←
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            α↓N←: 1.98  ->  1.98
            B1: True  ->  True
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            N↓Rd←: 0  ->  0
            N↓Ed←: 0  ->  0
          }
          Results: {
            t↓min← = 0.094 == 0.094
            Φ↓s← = 0.5 == 0.5
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
            A↓b← = 0.04 == 0.04
            N↓Rd1← = 189657 == 189657
            N↓Rd2← = 544297 == 544297
          }
          Test "150kN,2000kN,1kN/m,20e-6MPa,300mm,3m,ceiling,roof" PASSED.
        }
        Test: 150kN,200kN,1kN/m,20e-6MPa,3000mm,5m,ceiling,roof {
          Inputs: {
            q↓Ewd←: 1000  ->  1000
            t: 3  ->  3
            h: 5  ->  5
            b: 1  ->  1
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 3  ->  3
            λ: 1  ->  1
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            l: 0.2  ->  0.2
            d: 0.2  ->  0.2
            e↓d←: 0.05  ->  0.05
            a↓1←: 0.8  ->  0.8
            h↓c←: 3  ->  3
            N↓Ed1←: 150000  ->  150000
            N↓Ed2←: 200000  ->  200000
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            α↓N←: 0.0322  ->  0.0322
            B1: True  ->  True
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            N↓Rd←: 0  ->  0
            N↓Ed←: 0  ->  0
          }
          Results: {
            t↓min← = 0.171 == 0.171
            Φ↓s← = 0.5 == 0.5
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
            A↓b← = 0.04 == 0.04
            N↓Rd1← = 189657 == 189657
            N↓Rd2← = 5.44∙10↑6← == 5.44∙10↑6←
          }
          Test "150kN,200kN,1kN/m,20e-6MPa,3000mm,5m,ceiling,roof" PASSED.
        }
        Test: 150kN,200kN,0.5kN/m,200e-6MPa,30mm,5m,ceiling,roof {
          Inputs: {
            q↓Ewd←: 500  ->  500
            t: 0.03  ->  0.03
            h: 5  ->  5
            b: 1  ->  1
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 3  ->  3
            λ: 100  ->  100
            K: 0.55  ->  0.55
            f↓b←: 200  ->  200
            f↓m←: 5  ->  5
            l: 0.2  ->  0.2
            d: 0.2  ->  0.2
            e↓d←: 0.05  ->  0.05
            a↓1←: 0.8  ->  0.8
            h↓c←: 3  ->  3
            N↓Ed1←: 150000  ->  150000
            N↓Ed2←: 200000  ->  200000
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            α↓N←: 0.642  ->  0.642
            B1: True  ->  True
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            N↓Rd←: 0  ->  0
            N↓Ed←: 0  ->  0
          }
          Results: {
            t↓min← = 0.163 == 0.163
            Φ↓s← = 0 == 0
            l↓f,max← = 4.8 == 4.8
            f↓k← = 36.4∙10↑6← == 36.4∙10↑6←
            f↓d← = 18.2∙10↑6← == 18.2∙10↑6←
            A↓b← = 0.04 == 0.04
            N↓Rd1← = 950538 == 950538
            N↓Rd2← = 0 == 0
          }
          Test "150kN,200kN,0.5kN/m,200e-6MPa,30mm,5m,ceiling,roof" PASSED.
        }