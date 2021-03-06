        Test: 300x500,330kNm,90kN,diam22,diam8 {
          Inputs: {
            λ: 0.8  ->  0.8
            η: 1  ->  1
            α↓cc←: 1  ->  1
            γ↓S←: 1.15  ->  1.15
            γ↓c←: 1.5  ->  1.5
            b: 0.3  ->  0.3
            h: 0.5  ->  0.5
            d: 0.454  ->  0.454
            f↓ctm←: 2.9∙10↑6←  ->  2.9∙10↑6←
            f↓ck←: 30∙10↑6←  ->  30∙10↑6←
            f↓cd←: 20∙10↑6←  ->  20∙10↑6←
            f↓yk←: 500∙10↑6←  ->  500∙10↑6←
            f↓yd←: 435∙10↑6←  ->  435∙10↑6←
            c: 0.035  ->  0.035
            ε↓cu3←: 3.5∙10↑-3←  ->  3.5∙10↑-3←
            ε↓yd←: 2.07∙10↑-3←  ->  2.07∙10↑-3←
            E↓s←: 210∙10↑9←  ->  210∙10↑9←
            x: 0.168  ->  0.168
            x↓c←: 0.134  ->  0.134
            ε↓cd←: 606∙10↑-6←  ->  606∙10↑-6←
            E: 33∙10↑9←  ->  33∙10↑9←
            A↓cc←: 0.0403  ->  0.0403
            x↓bal1←: 0.285  ->  0.285
            N↓Ed←: 90000  ->  90000
            z↓1←: 0.204  ->  0.204
            z↓2←: 0.211  ->  0.211
            ξ↓bal1←: 0.628  ->  0.628
            i: 0.625  ->  0.625
            tension: 1  ->  1
            compression: 0  ->  0
            ε↓c2←: 2∙10↑-3←  ->  2∙10↑-3←
            σ↓s←: 420∙10↑6←  ->  420∙10↑6←
            M↓Edmin←: -50000  ->  -50000
            e↓0←: 0.0167  ->  0.0167
            x↓bal2←: 0.0955  ->  0.0955
            D: 0.496  ->  0.496
            xNotReal: 0  ->  0
            A↓sreq←: 147∙10↑-6←  ->  147∙10↑-6←
            fck: 30  ->  30
            N↓c,bal←: 1.16∙10↑6←  ->  1.16∙10↑6←
            ξ↓bal2←: 2.45  ->  2.45
            symetric: False  ->  False
            z↓s←: 0.413  ->  0.413
            n↓1←: 6  ->  6
            π: 3.14  ->  3.14
            n↓2←: 3  ->  3
            Φ↓1←: 0.022  ->  0.022
            Φ↓2←: 8∙10↑-3←  ->  8∙10↑-3←
            M↓Edy←: 330000  ->  330000
            A↓syreq←: 228∙10↑-6←  ->  228∙10↑-6←
            x1: 0.0188  ->  0.0188
            PrintMainCaption: True  ->  True
            PrintUserDefined: False  ->  False
            UserDefined: uživatelský popis  ->  uživatelský popis
            load: True  ->  True
            CSS: True  ->  True
            reinf: True  ->  True
            CON: True  ->  True
            minimum: True  ->  True
            NA: ČSN EN 1992-1-1  ->  ČSN EN 1992-1-1
          }
          Results: {
            d↓2← = 0.039 == 0.039
            d↓1← = 0.046 == 0.046
            M↓Edy1← = 311640 == 311640
            M↓Edy2← = 348990 == 348990
            A↓sy2req← = 150∙10↑-6← == 150∙10↑-6←
            A↓sy1req← = 2.06∙10↑-3← == 2.06∙10↑-3←
            A↓sy1← = 2.28∙10↑-3← == 2.28∙10↑-3←
            A↓sy2← = 151∙10↑-6← == 151∙10↑-6←
          }
          Test "300x500,330kNm,90kN,diam22,diam8" PASSED.
        }
        Test: 150x500,-5kNm,150kN,diam=22,diam=8 {
          Inputs: {
            λ: 0.8  ->  0.8
            η: 1  ->  1
            α↓cc←: 1  ->  1
            γ↓S←: 1.15  ->  1.15
            γ↓c←: 1.5  ->  1.5
            b: 0.15  ->  0.15
            h: 0.5  ->  0.5
            d: 0.454  ->  0.454
            f↓ctm←: 2.9∙10↑6←  ->  2.9∙10↑6←
            f↓ck←: 30∙10↑6←  ->  30∙10↑6←
            f↓cd←: 20∙10↑6←  ->  20∙10↑6←
            f↓yk←: 500∙10↑6←  ->  500∙10↑6←
            f↓yd←: 435∙10↑6←  ->  435∙10↑6←
            c: 0.035  ->  0.035
            ε↓cu3←: 3.5∙10↑-3←  ->  3.5∙10↑-3←
            ε↓yd←: 2.07∙10↑-3←  ->  2.07∙10↑-3←
            E↓s←: 210∙10↑9←  ->  210∙10↑9←
            x: -0.0318  ->  -0.0318
            x↓c←: -0.0254  ->  -0.0254
            ε↓cd←: 606∙10↑-6←  ->  606∙10↑-6←
            E: 33∙10↑9←  ->  33∙10↑9←
            A↓cc←: -3.81∙10↑-3←  ->  -3.81∙10↑-3←
            x↓bal1←: 0.285  ->  0.285
            N↓Ed←: 150000  ->  150000
            z↓1←: 0.204  ->  0.204
            z↓2←: 0.211  ->  0.211
            ξ↓bal1←: 0.628  ->  0.628
            i: 0.625  ->  0.625
            tension: 1  ->  1
            compression: 0  ->  0
            ε↓c2←: 2∙10↑-3←  ->  2∙10↑-3←
            σ↓s←: 420∙10↑6←  ->  420∙10↑6←
            M↓Edmin←: -50000  ->  -50000
            e↓0←: 0.0167  ->  0.0167
            x↓bal2←: 0.0955  ->  0.0955
            D: 1.12  ->  1.12
            xNotReal: 0  ->  0
            A↓sreq←: 147∙10↑-6←  ->  147∙10↑-6←
            fck: 30  ->  30
            N↓c,bal←: 1.16∙10↑6←  ->  1.16∙10↑6←
            ξ↓bal2←: 2.45  ->  2.45
            symetric: False  ->  False
            z↓s←: 0.413  ->  0.413
            n↓1←: 1  ->  1
            π: 3.14  ->  3.14
            n↓2←: 4  ->  4
            Φ↓1←: 0.022  ->  0.022
            Φ↓2←: 8∙10↑-3←  ->  8∙10↑-3←
            M↓Edy←: -5000  ->  -5000
            A↓syreq←: 228∙10↑-6←  ->  228∙10↑-6←
            x1: 0.0625  ->  0.0625
            PrintMainCaption: True  ->  True
            PrintUserDefined: False  ->  False
            UserDefined: uživatelský popis  ->  uživatelský popis
            load: True  ->  True
            CSS: True  ->  True
            reinf: True  ->  True
            CON: True  ->  True
            minimum: True  ->  True
            NA: ČSN EN 1992-1-1  ->  ČSN EN 1992-1-1
          }
          Results: {
            d↓2← = 0.039 == 0.039
            d↓1← = 0.046 == 0.046
            M↓Edy1← = -35600 == -35600
            M↓Edy2← = 26650 == 26650
            A↓sy2req← = 197∙10↑-6← == 197∙10↑-6←
            A↓sy1req← = 148∙10↑-6← == 148∙10↑-6←
            A↓sy1← = 380∙10↑-6← == 380∙10↑-6←
            A↓sy2← = 201∙10↑-6← == 201∙10↑-6←
          }
          Test "150x500,-5kNm,150kN,diam=22,diam=8" PASSED.
        }
        Test: 150x500,150kNm,-5kN,diam=22,diam=8 {
          Inputs: {
            λ: 0.8  ->  0.8
            η: 1  ->  1
            α↓cc←: 1  ->  1
            γ↓S←: 1.15  ->  1.15
            γ↓c←: 1.5  ->  1.5
            b: 0.15  ->  0.15
            h: 0.5  ->  0.5
            d: 0.454  ->  0.454
            f↓ctm←: 2.9∙10↑6←  ->  2.9∙10↑6←
            f↓ck←: 30∙10↑6←  ->  30∙10↑6←
            f↓cd←: 20∙10↑6←  ->  20∙10↑6←
            f↓yk←: 500∙10↑6←  ->  500∙10↑6←
            f↓yd←: 435∙10↑6←  ->  435∙10↑6←
            c: 0.035  ->  0.035
            ε↓cu3←: 3.5∙10↑-3←  ->  3.5∙10↑-3←
            ε↓yd←: 2.07∙10↑-3←  ->  2.07∙10↑-3←
            E↓s←: 210∙10↑9←  ->  210∙10↑9←
            x: 0.159  ->  0.159
            x↓c←: 0.127  ->  0.127
            ε↓cd←: 606∙10↑-6←  ->  606∙10↑-6←
            E: 33∙10↑9←  ->  33∙10↑9←
            A↓cc←: 0.0191  ->  0.0191
            x↓bal1←: 0.285  ->  0.285
            N↓Ed←: 5000  ->  5000
            z↓1←: 0.204  ->  0.204
            z↓2←: 0.211  ->  0.211
            ξ↓bal1←: 0.628  ->  0.628
            i: 0.625  ->  0.625
            tension: 1  ->  1
            compression: 0  ->  0
            ε↓c2←: 2∙10↑-3←  ->  2∙10↑-3←
            σ↓s←: 420∙10↑6←  ->  420∙10↑6←
            M↓Edmin←: -50000  ->  -50000
            e↓0←: 0.0167  ->  0.0167
            x↓bal2←: 0.0955  ->  0.0955
            D: 0.518  ->  0.518
            xNotReal: 0  ->  0
            A↓sreq←: 147∙10↑-6←  ->  147∙10↑-6←
            fck: 30  ->  30
            N↓c,bal←: 1.16∙10↑6←  ->  1.16∙10↑6←
            ξ↓bal2←: 2.45  ->  2.45
            symetric: False  ->  False
            z↓s←: 0.413  ->  0.413
            n↓1←: 3  ->  3
            π: 3.14  ->  3.14
            n↓2←: 2  ->  2
            Φ↓1←: 0.022  ->  0.022
            Φ↓2←: 8∙10↑-3←  ->  8∙10↑-3←
            M↓Edy←: 150000  ->  150000
            A↓syreq←: 228∙10↑-6←  ->  228∙10↑-6←
            x1: 2.08∙10↑-3←  ->  2.08∙10↑-3←
            PrintMainCaption: True  ->  True
            PrintUserDefined: False  ->  False
            UserDefined: uživatelský popis  ->  uživatelský popis
            load: True  ->  True
            CSS: True  ->  True
            reinf: True  ->  True
            CON: True  ->  True
            minimum: True  ->  True
            NA: ČSN EN 1992-1-1  ->  ČSN EN 1992-1-1
          }
          Results: {
            d↓2← = 0.039 == 0.039
            d↓1← = 0.046 == 0.046
            M↓Edy1← = 148980 == 148980
            M↓Edy2← = 151055 == 151055
            A↓sy2req← = 75∙10↑-6← == 75∙10↑-6←
            A↓sy1req← = 889∙10↑-6← == 889∙10↑-6←
            A↓sy1← = 1.14∙10↑-3← == 1.14∙10↑-3←
            A↓sy2← = 100∙10↑-6← == 100∙10↑-6←
          }
          Test "150x500,150kNm,-5kN,diam=22,diam=8" PASSED.
        }