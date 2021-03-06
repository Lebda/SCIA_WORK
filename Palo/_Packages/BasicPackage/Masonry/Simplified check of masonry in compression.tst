        Test: 300kN,2kN/m,20e-6MPa,300mm,3m,ceiling,roof {
          Inputs: {
            N↓Ed←: 300000  ->  300000
            q↓Ewd←: 2000  ->  2000
            t: 0.3  ->  0.3
            h: 3  ->  3
            b: 1  ->  1
            t↓min←: 0.107  ->  0.107
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 2  ->  2
            λ: 10  ->  10
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            α↓N←: 0.276  ->  0.055
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            input: True  ->  True
          }
          Results: {
            Φ↓s← = 0.5 == 0.5
            N↓Rd← = 544297 == 544297
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
          }
          Test "300kN,2kN/m,20e-6MPa,300mm,3m,ceiling,roof" PASSED.
        }
        Test: 300kN,2kN/m,20e-6MPa,300mm,3m,NOceiling,roof {
          Inputs: {
            N↓Ed←: 300000  ->  300000
            q↓Ewd←: 2000  ->  2000
            t: 0.3  ->  0.3
            h: 3  ->  3
            b: 1  ->  1
            t↓min←: 0.107  ->  0.107
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 2  ->  2
            λ: 10  ->  10
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            α↓N←: 0.276  ->  0.276
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: False  ->  False
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            input: True  ->  True
          }
          Results: {
            Φ↓s← = 0.5 == 0.5
            N↓Rd← = 544297 == 544297
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
          }
          Test "300kN,2kN/m,20e-6MPa,300mm,3m,NOceiling,roof" PASSED.
        }
        Test: 300kN,2kN/m,20e-6MPa,300mm,3m,ceiling,NOroof {
          Inputs: {
            N↓Ed←: 300000  ->  300000
            q↓Ewd←: 2000  ->  2000
            t: 0.3  ->  0.3
            h: 3  ->  3
            b: 1  ->  1
            t↓min←: 0.107  ->  0.107
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 2  ->  2
            λ: 10  ->  10
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            α↓N←: 0.276  ->  0.276
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            B2: False  ->  False
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            input: True  ->  True
          }
          Results: {
            Φ↓s← = 0.74 == 0.74
            N↓Rd← = 805560 == 805560
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
          }
          Test "300kN,2kN/m,20e-6MPa,300mm,3m,ceiling,NOroof" PASSED.
        }
        Test: 300kN,2kN/m,20e-6MPa,300mm,3m,NOceiling,NOroof {
          Inputs: {
            N↓Ed←: 300000  ->  300000
            q↓Ewd←: 2000  ->  2000
            t: 0.3  ->  0.3
            h: 3  ->  3
            b: 1  ->  1
            t↓min←: 0.107  ->  0.107
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 2  ->  2
            λ: 10  ->  10
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            α↓N←: 0.276  ->  0.276
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: False  ->  False
            B2: False  ->  False
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            input: True  ->  True
          }
          Results: {
            Φ↓s← = 0.74 == 0.74
            N↓Rd← = 805560 == 805560
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
          }
          Test "300kN,2kN/m,20e-6MPa,300mm,3m,NOceiling,NOroof" PASSED.
        }
        Test: 3000kN,2kN/m,20e-6MPa,300mm,3m,ceiling,roof {
          Inputs: {
            N↓Ed←: 3∙10↑6←  ->  3∙10↑6←
            q↓Ewd←: 2000  ->  2000
            t: 0.3  ->  0.3
            h: 3  ->  3
            b: 1  ->  1
            t↓min←: 0.0944  ->  0.0944
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 2  ->  2
            λ: 10  ->  10
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            α↓N←: 2.76  ->  2.76
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            input: True  ->  True
          }
          Results: {
            Φ↓s← = 0.5 == 0.5
            N↓Rd← = 544297 == 544297
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
          }
          Test "3000kN,2kN/m,20e-6MPa,300mm,3m,ceiling,roof" PASSED.
        }
        Test: 150kN,5kN/m,20e-6MPa,300mm,3m,ceiling,roof {
          Inputs: {
            N↓Ed←: 150000  ->  150000
            q↓Ewd←: 5000  ->  5000
            t: 0.3  ->  0.3
            h: 3  ->  3
            b: 1  ->  1
            t↓min←: 0.162  ->  0.162
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 2  ->  2
            λ: 10  ->  10
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            α↓N←: 0.138  ->  0.138
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            input: True  ->  True
          }
          Results: {
            Φ↓s← = 0.5 == 0.5
            N↓Rd← = 544297 == 544297
            l↓f,max← = 7 == 7
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
          }
          Test "150kN,5kN/m,20e-6MPa,300mm,3m,ceiling,roof" PASSED.
        }
        Test: 300kN,2kN/m,20e-6MPa,30mm,5m,ceiling,roof {
          Inputs: {
            N↓Ed←: 300000  ->  300000
            q↓Ewd←: 2000  ->  2000
            t: 0.03  ->  0.03
            h: 5  ->  5
            b: 1  ->  1
            t↓min←: 0.193  ->  0.193
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 2  ->  2
            λ: 100  ->  100
            K: 0.55  ->  0.55
            f↓b←: 20  ->  20
            f↓m←: 5  ->  5
            α↓N←: 2.76  ->  2.76
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            input: True  ->  True
          }
          Results: {
            Φ↓s← = -10.2 == -10.2
            N↓Rd← = -1.1∙10↑6← == -1.1∙10↑6←
            l↓f,max← = 4.8 == 4.8
            f↓k← = 7.26∙10↑6← == 7.26∙10↑6←
            f↓d← = 3.63∙10↑6← == 3.63∙10↑6←
          }
          Test "300kN,2kN/m,20e-6MPa,30mm,5m,ceiling,roof" PASSED.
        }
        Test: 300kN,2kN/m,200e-6MPa,300mm,3m,ceiling,roof {
          Inputs: {
            N↓Ed←: 300000  ->  300000
            q↓Ewd←: 2000  ->  2000
            t: 0.03  ->  0.03
            h: 5  ->  5
            b: 1  ->  1
            t↓min←: 0.193  ->  0.193
            k: 0.1  ->  0.1
            c↓1←: 0.23  ->  0.23
            c↓2←: 0.031  ->  0.031
            γ↓M←: 2  ->  2
            h↓ef←: 3  ->  3
            l↓f,ef←: 2  ->  2
            λ: 100  ->  100
            K: 0.55  ->  0.55
            f↓b←: 200  ->  200
            f↓m←: 5  ->  5
            α↓N←: 2.76  ->  2.76
            α: 0.7  ->  0.7
            β: 0.3  ->  0.3
            B1: True  ->  True
            B2: True  ->  True
            Headline: True  ->  True
            PrintCaption: False  ->  False
            caption: uživatelský popis  ->  uživatelský popis
            input: True  ->  True
          }
          Results: {
            Φ↓s← = -10.2 == -10.2
            N↓Rd← = -5.54∙10↑6← == -5.54∙10↑6←
            l↓f,max← = 4.8 == 4.8
            f↓k← = 36.4∙10↑6← == 36.4∙10↑6←
            f↓d← = 18.2∙10↑6← == 18.2∙10↑6←
          }
          Test "300kN,2kN/m,200e-6MPa,300mm,3m,ceiling,roof" PASSED.
        }