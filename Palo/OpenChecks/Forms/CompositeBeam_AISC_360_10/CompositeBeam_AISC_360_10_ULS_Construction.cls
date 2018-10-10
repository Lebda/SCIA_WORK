<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="170001" GUID="3f48e0f8-0174-4f29-96ae-df33a4195bed">
  <CodeEditor>
    <SourceCode Collapsed="0|93|320" BreakPoints="">→INI400_014981BLOCK { // About
    //    
    // US Composites - ConstructionAndFinalSLS
    // Author: Garrett Peters
    //  
    // 
    //
} 

→INI400_016755BLOCK { // Functions 

    bool ValidateInput(object Input) { 
        DesignMethod →INI400_015232= Input.Get("DesignMethod"); 
        A↓s← →INI400_011213= Input.Get("CS.A"); 
        I↓x← →INI400_011247= Input.Get("CS.Iy"); 
        I↓y← →INI400_013230= Input.Get("CS.Iz"); 
        S↓x← →INI400_011248= Input.Get("CS.Wely"); 
        r↓y← →INI400_012864= Input.Get("CS.iz"); 
        Z↓x← →INI400_011246= Input.Get("CS.Wply"); 
        C↓w← →INI400_012865= Input.Get("CS.Iw"); 
        J →INI400_012870= Input.Get("CS.It"); 
        b →INI400_011214= Input.Get("CS.Geometry.b"); 
        d →INI400_011222= Input.Get("CS.Geometry.h"); 
        r →INI400_014988= Input.Get("CS.Geometry.r"); 
        t↓f← →INI400_014989= Input.Get("CS.Geometry.t"); 
        t↓w← →INI400_014990= Input.Get("CS.Geometry.s"); 
        Name↓steel_mat← →INI400_014991= Input.Get("Steel.Name"); 
        E↓s← →INI400_011225= Input.Get("Steel.IBC.E"); 
        F↓y← →INI400_011228= Input.Get("Steel.IBC.fy"); 
        L →INI400_011233= Input.Get("PlateRib.Span.Length.Current"); 
        V↓u← →INI400_011242= Input.Get("InternalForces.V↓u,ULS,Con←"); 
        M↓u+← →INI400_011212= Input.Get("InternalForces.M↓y+,ULS,Con←"); 
        M↓u-← →INI400_014983= Input.Get("InternalForces.M↓y-,ULS,Con←"); 
        L↓b← →INI400_012862= Input.Get("L↓b←"); 
        rib_dir →INI400_011258= Input.Get("Slab.SheetingAngle"); 
        NegCompAction →GMP011_000001= Input.Get("NegCompAction"); 
        WO →GMP011_000027= Input.Get("WebOpenings.WO"); 
        a↓wo← →GMP011_000016= Input.Get("WebOpenings.a↓wo←"); 
        h↓wo← →GMP011_000017= Input.Get("WebOpenings.h↓wo←"); 
        A↓ro← →GMP011_000018= Input.Get("WebOpenings.A↓ro←"); 
        d↓rbo← →GMP011_000019= Input.Get("WebOpenings.d↓rbo←"); 
        d↓rto← →GMP011_000171= Input.Get("WebOpenings.d↓rto←"); 
        d↓o← →GMP011_000075= Input.Get("WebOpenings.d↓o←"); 
        l↓1← →GMP011_000020= Input.Get("WebOpenings.l↓1←"); 
        b↓ro← →GMP198_000003= Input.Get("WebOpenings.b↓ro←"); 
        t↓ro← →GMP198_000004= Input.Get("WebOpenings.t↓ro←"); 
        e↓wo← →GMP011_000051= Input.Get("WebOpenings.e↓wo←"); 
        d↓o← →GMP011_000073= Input.Get("WebOpenings.d↓o←"); 
        CWO →GMP011_000079= Input.Get("WebOpenings.CWO"); 
        RWO →GMP011_000174= Input.Get("WebOpenings.RWO"); 
        RWOBS →GMP011_000240= Input.Get("WebOpenings.RWOBS"); 
        M↓yo,ULS,Con← →GMP011_000081= Input.Get("WebOpenings.M↓yo,ULS,Con←"); 
        M↓yos,ULS,Con← →GMP011_000082= Input.Get("WebOpenings.M↓yos,ULS,Con←"); 
        M↓yoe,ULS,Con← →GMP011_000083= Input.Get("WebOpenings.M↓yoe,ULS,Con←"); 
        V↓uo,ULS,Con← →GMP011_000084= Input.Get("WebOpenings.V↓uo,ULS,Con←"); 
        V↓uos,ULS,Con← →GMP011_000085= Input.Get("WebOpenings.V↓uos,ULS,Con←"); 
        V↓uoe,ULS,Con← →GMP011_000086= Input.Get("WebOpenings.V↓uoe,ULS,Con←"); 
        D↓wo← →GMP011_000233= Input.Get("WebOpenings.D↓wo←"); 
        
        
        return true; 
    } 
    
    object GetOutput() { 
        object Result →INI400_013228= new Structure(
        "UC↓ULS,Con←", UC↓ULS,Con←, 
        "M↓n,s←", M↓n,s←, 
        "M↓n←", M↓n←, 
        "I↓x←", I↓x←); 
        return Result; 
    } 
    void PrintCheck(double Value) { 
        IF(Value &lt;= 1) { 
            →INI400_016537TEXT("≤ 1.00"); 
            →INI400_016538G_PASS.Draw(1); 
        } ELSE { 
            →INI400_016539TEXT("&gt; 1.00"); 
            →INI400_016540G_FAIL.Draw(1); 
        } 
    } 
} 

→INI400_012925BLOCK { // Calculated Properties &amp; Pi

    π →INI400_000561= Math.PI; 
    k →INI400_004673= t↓f←+r; 
    h →INI400_012921= d-2*(r+t↓f←); 
    h↓o← →UNK000_000001= d-t↓f←; 
    double r↓ts← →INI400_016764= SQRT(SQRT(I↓y←*C↓w←)/S↓x←); 
    c →INI400_016765= 1; 
    
} 

→INI400_012803BLOCK { // Title
    IF(DesignMethod == 0) { 
        →INI400_012673TEXT("Construction Stage - Beam Strength (LRFD)"); 
        
    } ELSE { 
        →INI400_012675TEXT("Construction Stage - Beam Strength (ASD)"); 
    } 
    →INI400_012676TEXT("AISC 360-10 Specification Chapters F &amp; G"); 
} 

→INI400_010999BLOCK { // Flexure (Chapter F)

    →INI400_011325TEXT("Beam Flexural Strength - AISC 360-10 Chapter F"); 
    compact →INI400_011176= (0.5*b)/t↓f← &lt;= 0.38*SQRT(E↓s←/F↓y←); 
    
    →INI400_012951BLOCK { // Limiting Slenderness and UBL Parameters
        
        double k↓c← →INI400_013224= 4/(SQRT(d/t↓w←)); 
        
        // Table B4.1 Cases 2, 5, 11, &amp; 15
        double λ↓fl← →INI400_012934= b/(2*t↓f←); //b = 1/2 * b for flange of I-shaped members
        double λ↓wb← →INI400_013270= h/t↓w←; 
        
        double λ↓p,fl,Flex← →INI400_016759= 0.38*SQRT(E↓s←/F↓y←); 
        double λ↓r,fl,Flex← →INI400_016760= 0.95*SQRT(k↓c←*E↓s←/F↓y←); 
        
        double λ↓p,wb,Flex← →INI400_013273= 3.76*SQRT(E↓s←/F↓y←); 
        double λ↓r,wb,Flex← →INI400_013274= 5.70*SQRT(k↓c←*E↓s←/F↓y←); 
        
        
        // equations F2-5 &amp; F2-6
        double L↓p← →INI400_012941= 1.76*r↓y←*SQRT(E↓s←/F↓y←); 
        double L↓r← →INI400_013367= 1.95*r↓ts←*(E↓s←/(0.7*F↓y←))*SQRT(((J*c)/(S↓x←*h↓o←))+SQRT(((J*c)/(S↓x←*h↓o←))↑2←+6.76*((0.7*F↓y←)/E↓s←)↑2←)); // F4-8 
    } 
    
    
    →INI400_013005BLOCK { // Check for slenderness/compactness and LTB
        →INI400_012952BLOCK { // Table B4.1 

            // B4.1b Case 11 - Flange under Flexure 
            IF(λ↓fl← &lt;= λ↓p,fl,Flex←) { 
                double fl_flex_compact →INI400_016761= 0; // flange is compact under flexure
                →INI400_016762TEXT("- Subject to Flexure: Flange is compact"); 
            } IF(λ↓p,fl,Flex← &lt; λ↓fl← &amp;&amp; λ↓fl← &lt;= λ↓r,fl,Flex←) { 
                double fl_flex_compact →INI400_012938= 1; // flange is non-compact under flexure
                →INI400_016763TEXT("- Subject to Flexure: Flange is non-compact"); 
            } IF(λ↓fl← &gt; λ↓r,fl,Flex←) { 
                double fl_flex_compact →INI400_012939= 2; // flange is slender under flexure
                →INI400_012955TEXT("- Subject to Flexure: Flange is slender"); 
            } 
            
            // B4.1b Case 15 - Web under Flexure
            IF(λ↓wb← &lt;= λ↓p,wb,Flex←) { 
                double wb_flex_compact →INI400_013275= 0; // Web is compact under flexure
                →INI400_013276TEXT("- Subject to Flexure: Web is compact"); 
            } IF(λ↓p,wb,Flex← &lt; λ↓wb← &amp;&amp; λ↓wb← &lt;= λ↓r,wb,Flex←) { 
                double wb_flex_compact →INI400_013277= 1; // Web is non-compact under flexure
                →INI400_013278TEXT("- Subject to Flexure: Web is non-compact"); 
            } IF(λ↓wb← &gt; λ↓r,wb,Flex←) { 
                double wb_flex_compact →INI400_013279= 2; // Web is slender under flexure
                →INI400_013280TEXT("- Subject to Flexure: Web is slender"); 
            } 
        } 
        
        →INI400_012953BLOCK { // F2.2 - Check to see if continually braced
            IF(ABS(rib_dir) &lt;= 5 || (ABS(rib_dir) &lt;= 185 &amp;&amp; ABS(rib_dir) &gt;= 175) || ABS(rib_dir) &gt;= 355) { 
                ribsParal →INI400_011120= TRUE; 
                DeckDirection →INI400_012898= 1; 
            } ELSE { 
                ribsParal →INI400_011121= FALSE; 
                DeckDirection →INI400_012899= 0; 
            } 
            
            IF(ribsParal == False) { 
                ContBraced →INI400_012942= True; 
                →INI400_012897TEXT("- Deck ribs not parallel to member. Continuous lateral bracing of compression flange is assumed: No check for LTB req'd"); 
            } ELSE { 
                IF(L↓b← &lt; L↓p←) { 
                    ContBraced →INI400_016768= True; 
                    →INI400_016769TEXT("L↓b← is less than L↓p←: No check for LTB needed"); 
                } ELSE { 
                    ContBraced →INI400_012943= False; 
                    →INI400_012950TEXT("- Not continually braced: Check for LTB"); 
                    →INI400_013291TEXT("L↓b← = " &amp; L↓b←) @REF("Controlling Unbraced Length"); 
                    →INI400_013293TEXT("L↓p← = " &amp; L↓p←) @REF("Laterally Unbraced Length for Yielding Limit State"); 
                    →INI400_013296TEXT("L↓r← = " &amp; L↓r←) @REF("Laterally Unbraced Length for Inelastic Limit State"); 
                    double C↓b← →INI400_013299= 1; 
                } 
            } 
        } 
    } 
    
    →INI400_012984BLOCK { // Flexure Check (AISC 360-10 Section F)
        
        // F2. Doubly Symmetric Compact I-Shaped Members (Compact Web and Flanges)
        IF(wb_flex_compact == 0 &amp;&amp; fl_flex_compact == 0) { 
            
            // F2.1. Yielding        
            M↓p← →INI400_013289= F↓y←*Z↓x← @REF("(F2-1)"); 
            
            // F2.2. LTB        
            IF(ContBraced) { // F2.2(a) LTB does not apply           
                M↓n← →INI400_013290= M↓p← @REF("Nominal flexural strength"); 
            } ELSE { // F2.2(b) and (c) LTB does apply 
                double r↓ts← →INI400_013301= SQRT(SQRT(I↓y←*C↓w←)/S↓x←); 
                IF(L↓p← &lt; L↓b← &amp;&amp; L↓b← &lt;= L↓r←) { 
                    M↓n-LTB← →INI400_013307= C↓b←*[M↓p←-[M↓p←-0.7*F↓y←*S↓x←]*[(L↓b←-L↓p←)/(L↓r←-L↓p←)]] @REF("(F2-2)"); 
                } 
                IF(L↓b← &gt; L↓r←) { 
                    double F↓cr← →INI400_013314= ((C↓b←*π^2*E↓s←)/[L↓b←/r↓ts←]↑2←)*SQRT(1+0.078*((J*c)/(S↓x←*h↓o←))*(L↓b←/r↓ts←)↑2←) @REF("(F4-5)"); 
                    M↓n-LTB← →INI400_013316= F↓cr←*S↓x← @REF("(F2-3)"); 
                } 
                M↓n← →INI400_013318= MIN(M↓n-LTB←, M↓p←) @REF("Nominal flexural strength"); 
            } 
        } 
        
        // F3. Doubly Symmetric with Compact Web and Non Compact or Slender Flanges
        IF(wb_flex_compact == 0 &amp;&amp; fl_flex_compact &gt; 0) { 
            M↓p← →INI400_013319= F↓y←*Z↓x← @REF("(F2-1)"); 
            
            // F3.2. Compression Flange Local Buckling        
            IF(fl_flex_compact == 1) { // Non Compact Flange
                M↓n-cflb← →INI400_013321= M↓p←-(M↓p←-0.7*F↓y←*S↓x←)*((λ↓fl←-λ↓p,fl,Flex←)/(λ↓r,fl,Flex←-λ↓p,fl,Flex←)) @REF("(F3-1)"); 
            } IF(fl_flex_compact == 2) { // Slender Flange
                k↓c← →INI400_013322= MIN(MAX(4/SQRT(d/t↓w←), 0.35), 0.76); 
                M↓n-cflb← →INI400_013323= 0.9*E↓s←*k↓c←*S↓x←/(λ↓fl←^2) @REF("(F3-2)"); 
            } 
            
            // F3.1. LTB (See Section F2.2)
            IF(ContBraced) { // F2.2(a) LTB does not apply 
                M↓n← →INI400_013324= MIN(M↓p←, M↓n-cflb←) @REF("Nominal flexural strength"); 
            } ELSE { // F2.2(b) and (c) LTB does apply 
                double r↓ts← →INI400_013335= SQRT(SQRT(I↓y←*C↓w←)/S↓x←); 
                
                IF(L↓p← &lt; L↓b← &amp;&amp; L↓b← &lt;= L↓r←) { 
                    M↓n-LTB← →INI400_013341= C↓b←*[M↓p←-[M↓p←-0.7*F↓y←*S↓x←]*[(L↓b←-L↓p←)/(L↓r←-L↓p←)]] @REF("(F2-2)"); 
                } 
                IF(L↓b← &gt; L↓r←) { 
                    double F↓cr← →INI400_013348= ((C↓b←*π^2*E↓s←)/[L↓b←/r↓ts←]↑2←)*SQRT(1+0.078*((J*c)/(S↓x←*h↓o←))*(L↓b←/r↓ts←)↑2←) @REF("(F4-5)"); 
                    M↓n-LTB← →INI400_013350= F↓cr←*S↓x← @REF("(F2-3)"); 
                } 
                M↓n← →INI400_013356= MIN(M↓p←, M↓n-LTB←, M↓n-cflb←) @REF("Nominal flexural strength"); 
            } 
        } 
        
        // F4. Doubly Symmetric with Non Compact Web
        IF(wb_flex_compact == 1) { 
            double S↓xc← →INI400_013357= S↓x←; // Doubly symmetric so compression and tension flanges are same
            double M↓p← →INI400_013358= MIN(F↓y←*Z↓x←, 1.6*F↓y←*S↓xc←) @REF("(F2-1)"); 
            double M↓yc← →INI400_013359= F↓y←*S↓xc←; 
            double R↓pc← →INI400_013360= MIN((M↓p←/M↓yc←-(M↓p←/M↓yc←-1)*((λ↓wb←-λ↓p,wb,Flex←)/(λ↓r,wb,Flex←-λ↓p,wb,Flex←))), M↓p←/M↓yc←); // F4-9b - Since doubly symmetric, web is non compact, and no need for F4-9a
            
            // F4.1. Compression Flange Yielding
            double M↓n-CFY← →INI400_013361= R↓pc←*M↓yc← @REF("(F4-1)"); 
            
            // F4.3. Compression Flange Local Buckling        
            IF(fl_flex_compact == 1) { // Non Compact Flange
                M↓n-cflb← →INI400_013385= M↓n-CFY←-(M↓n-CFY←-0.7*F↓y←*S↓x←)*((λ↓fl←-λ↓p,fl,Flex←)/(λ↓r,fl,Flex←-λ↓p,fl,Flex←)) @REF("(F4-13)"); 
            } IF(fl_flex_compact == 2) { // Slender Flange
                k↓c← →INI400_013386= MIN(MAX(4/SQRT(d/t↓w←), 0.35), 0.76); 
                M↓n-cflb← →INI400_013387= 0.9*E↓s←*k↓c←*S↓x←/(λ↓fl←^2) @REF("(F4-14)"); 
            } 
            // F4.2. LTB
            IF(ContBraced) { // F4.2(a) LTB does not apply 
                M↓n← →INI400_013362= MIN(M↓p←, M↓n-CFY←, M↓n-cflb←) @REF("Nominal flexural strength"); 
            } ELSE { // F4.2(b) and (c) LTB does apply 
                double r↓ts← →INI400_013375= b/(SQRT(12*(1+(d*t↓w←)/(6*b*t↓f←)))); // User Note Pg 16.1-52

                IF(L↓p← &lt; L↓b← &amp;&amp; L↓b← &lt;= L↓r←) { 
                    double M↓n-LTB← →INI400_013378= C↓b←*[M↓n-CFY←-[M↓n-CFY←-0.7*F↓y←*S↓x←]*[(L↓b←-L↓p←)/(L↓r←-L↓p←)]] @REF("(F4-2)"); 
                } 
                IF(L↓b← &gt; L↓r←) { 
                    double F↓cr← →INI400_013380= ((C↓b←*π^2*E↓s←)/[L↓b←/r↓ts←]↑2←)*SQRT(1+0.078*((J)/(S↓x←*h↓o←))*(L↓b←/r↓ts←)↑2←) @REF("(F4-5)"); 
                    →INI400_013381TEXT(Description("F↓cr←")); 
                    M↓n-LTB← →INI400_013382= F↓cr←*S↓x← @REF("(F4-3)"); 
                } 
                M↓n← →INI400_013384= MIN(M↓p←, M↓n-CFY←, M↓n-cflb←, M↓n-LTB←) @REF("Nominal flexural strength"); 
            } 
            // F4.4. Tension Flange Yielding - Not applicable w/ Doubly Symmetric (S↓xt← = S↓xc←) (4.(a) pg 16.1-53)
        } 
        
        IF(wb_flex_compact == 2) { 
            M↓n← →INI400_016766= 0; 
            →INI400_016767TEXT("Check not supported for members with slender web"); 
        } 
        
    } 
    
    
    double ϕ↓b← →INI400_012935= 0.9; 
    double Ω↓b← →INI400_012936= 1.67; 
    
    →GMP119_000001PAGEBREAK(); 
    
} 


→INI400_004846BLOCK { // Shear (Chapter G)

    →INI400_011326TEXT("Beam Shear Strength - AISC 360-10 Chapter G"); 
    h →INI400_004703= d-2*(t↓f←+r) @REF("Height of web"); 
    IF(h/t↓w← &lt;= 2.24*SQRT(E↓s←/F↓y←)) { 
        C↓v← →INI400_004696= 1.0; 
        ϕ↓v← →INI400_011194= 1.0; 
        Ω↓v← →INI400_011202= 1.5; 
    } ELSE { 
        ϕ↓v← →INI400_011200= 0.9; 
        Ω↓v← →INI400_011201= 1.67; 
        k↓v← →INI400_004697= 5; 
        →INI400_011096TEXT("Assumed that h/t↓w ←&lt; 260 &amp; no transverse stiffeners per AISC 360-10 G1.i"); 
        IF(COMPARE(h/t↓w←, 1.1*SQRT(k↓v←*E↓s←/F↓y←), 6) != 1) { 
            C↓v← →INI400_004698= 1.0; 
        } ELSE { 
            IF(h/t↓w← &gt; 1.1*SQRT(k↓v←*E↓s←/F↓y←) &amp;&amp; COMPARE(h/t↓w←, 1.37*SQRT(k↓v←*E↓s←/F↓y←), 6) != 1) { 
                C↓v← →INI400_004699= (1.1*SQRT(k↓v←*E↓s←/F↓y←))/(h/t↓w←); 
            } ELSE { 
                C↓v← →INI400_004700= (1.51*k↓v←*E↓s←)/(POWER(h/t↓w←, 2)*F↓y←); 
            } 
        } 
    } 
    
    A↓w← →INI400_004705= h*t↓w← @REF("Area of web"); 
    V↓n← →INI400_004706= 0.6*F↓y←*A↓w←*C↓v← @REF("Nominal shear strength (G2-1)"); 
    →GMP119_000002PAGEBREAK(); 
    
} 

→INI400_012937BLOCK { // Results
    object G_PASS →INI400_011327= new Graphics(); 
    →INI400_011328G_PASS.DrawText("PASS", new Font("Calibri", Convert.ToSingle(10.5), FontStyle.Bold), 0, 0, ContentAlignment.BottomLeft, Color.Green); 
    object G_FAIL →INI400_011329= new Graphics(); 
    →INI400_011330G_FAIL.DrawText("FAIL", new Font("Calibri", Convert.ToSingle(10.5), FontStyle.Bold), 0, 0, ContentAlignment.BottomLeft, Color.Red); 
} 

double M↓u← →INI400_014986= MAX(ABS(M↓u+←), ABS(M↓u-←)); 

→GMP011_000182BLOCK { // Web Opening
    double M↓uo← →GMP011_000188= M↓yo,ULS,Con←; 
    double V↓uo← →GMP011_000189= V↓uo,ULS,Con←; 
    IF(WO) { 
        ϕ↓wo← →GMP011_000193= 0.90; 
        
        IF(CWO) { 
            h↓wo← →GMP011_000351= D↓wo← @REF("Equation 3-30a"); 
            a↓wo← →GMP011_000352= 0.45*D↓wo← @REF("Equation 3-30b"); 
        } 
        
        double s↓t← →GMP011_000296= d/2-h↓wo←/2-e↓wo←; 
        double s↓b← →GMP011_000297= d-h↓wo←-s↓t←; 
        
        IF((COMPARE(s↓t←, 0, 3) != 1) || (COMPARE(s↓b←, 0, 3) != 1)) { 
            →GMP011_000301TEXT("Strength of Beam at Web Opening"); 
            →GMP011_000298TEXT("Warning: Web opening extends outside of cross-section's web"); 
            
        } ELSE { 
            
            
            IF(RWO) { // Reinforced
                IF(CWO) { 
                    h↓wo← →GMP011_000349= D↓wo← @REF("Equation 3-30a"); 
                    a↓wo← →GMP011_000350= 0.45*D↓wo← @REF("Equation 3-30b"); 
                } 
                →GMP011_000115TEXT("Flexural Strength of Beam at Web Opening"); 
                IF((wb_flex_compact != 0) || (fl_flex_compact != 0) || ((a↓wo←/h↓wo←+6*h↓wo←/d) &gt; 5.6)) { 
                    IF((wb_flex_compact != 0 || fl_flex_compact != 0)) { 
                        →GMP011_000294TEXT("Warning: Section has web-opening but is not compact!"); 
                    } 
                    IF((a↓wo←/h↓wo←+6*h↓wo←/d) &gt; 5.6) { 
                        →GMP011_000219TEXT("Warning: Web buckling criteria for opening not met!"); 
                    } 
                } ELSE { 
                    
                    IF(ContBraced) { // F2.2(a) LTB does not apply      
                        double ΔΑ↓s← →GMP011_000178= h↓wo←*t↓w←-2*A↓ro← @REF("Net reduction in steel from presence of opening &amp; reinf."); 
                        IF(t↓w←*ABS(e↓wo←) &lt; A↓ro←) { 
                            double M↓mo← →GMP011_000100= MIN(F↓y←*Z↓x←*(1-((t↓w←*(h↓wo←^2/4+h↓wo←*ABS(e↓wo←)-ABS(e↓wo←)^2)-A↓ro←*h↓wo←)/Z↓x←)), F↓y←*Z↓x←) @REF("Bending moment at CL of opening"); 
                        } ELSE { 
                            double M↓mo← →GMP011_000132= MIN(F↓y←*Z↓x←*(1-((ΔΑ↓s←*(h↓wo←/4+ABS(e↓wo←)-A↓ro←/(2*t↓w←)))/Z↓x←)), F↓y←*Z↓x←) @REF("Bending moment at CL of opening"); 
                        } 
                    } ELSE { 
                        IF(L↓p← &lt; L↓b← &amp;&amp; L↓b← &lt;= L↓r←) { 
                            double M↓mo← →GMP011_000244= C↓b←*[M↓p←-[M↓p←-0.7*F↓y←*S↓x←]*[(L↓b←-L↓p←)/(L↓r←-L↓p←)]]; 
                        } ELSE { 
                            IF(RWOBS) { ΔΑ↓s← →GMP011_000242= h↓wo←*t↓w←-2*A↓ro←; } ELSE { ΔΑ↓s← →GMP011_000243= h↓wo←*t↓w←; } 
                            J →GMP011_000239= J*(1-(a↓wo←/L↓b←)*ΔΑ↓s←/(t↓w←*(d+2*b↓f←)))^2 @REF("Modified Torsional Constant"); 
                            double F↓cr← →GMP011_000236= ((C↓b←*π^2*E↓s←)/[L↓b←/r↓ts←]↑2←)*SQRT(1+0.078*((J)/(S↓x←*h↓wo←))*(L↓b←/r↓ts←)↑2←) @REF("(F4-5)"); 
                            M↓mo← →GMP011_000238= F↓cr←*S↓x← @REF("(F4-3)"); 
                            
                        } 
                        
                    } 
                } 
                →GMP119_000003PAGEBREAK(); 
                
                →GMP011_000116TEXT("Shear Strength of Beam at Web Opening"); 
                
                double s↓t← →GMP011_000184= d/2-h↓wo←/2-e↓wo← @REF("Depth of top tee"); 
                double s↓b← →GMP011_000185= d-h↓wo←-s↓t← @REF("Depth of bottom tee"); 
                
                
                
                double P↓r← →GMP011_000130= MIN(F↓y←*A↓ro←, F↓y←*t↓w←*a↓wo←/(2*SQRT(3))) @REF("Axial force in opening reinforcement"); 
                
                double V↓pb← →GMP011_000117= F↓y←*t↓w←*s↓b←/(SQRT(3)) @REF("Plastic shear capacity of bottom tee"); 
                double μ↓b← →GMP011_000118= P↓r←*d↓rbo←/(V↓pb←*s↓b←); 
                double ν↓b← →GMP011_000119= a↓wo←/(s↓b←-A↓ro←/(2*b)); 
                →GMP011_000120double α↓vb← →GMP011_000121= MIN((SQRT(6)+μ↓b←)/(ν↓b←+SQRT(3)), 1); 
                double V↓mb← →GMP011_000122= V↓pb←*α↓vb← @REF("Maximum nominal shear capacity of bottom tee"); 
                
                double V↓pt← →GMP011_000123= F↓y←*t↓w←*s↓t←/(SQRT(3)) @REF("Plastic shear capacity of top tee"); 
                double μ↓t← →GMP011_000131= P↓r←*d↓rto←/(V↓pt←*s↓t←); 
                double ν↓t← →GMP011_000125= a↓wo←/(s↓t←-A↓ro←/(2*b)); 
                →GMP011_000126double α↓vt← →GMP011_000127= MIN((SQRT(6)+μ↓t←)/(ν↓t←+SQRT(3)), 1); 
                double V↓mt← →GMP011_000128= V↓pt←*α↓vt← @REF("Maximum nominal shear capacity of top tee"); 
                
                double V↓mo← →GMP011_000129= MIN(V↓mb←+V↓mt←, 0.66*V↓n←) @REF("Maximum nominal shear capacity at the location of an opening"); 
                
                →GMP119_000004PAGEBREAK(); 
            } ELSE { // Unreinforced

                →GMP011_000094TEXT("Flexural Strength of Beam at Web Opening"); 
                IF((wb_flex_compact != 0) || (fl_flex_compact != 0) || ((a↓wo←/h↓wo←+6*h↓wo←/d) &gt; 5.6)) { 
                    
                    IF((wb_flex_compact != 0 || fl_flex_compact != 0)) { 
                        →GMP011_000292TEXT("Warning: Section has web-opening but is not compact!"); 
                    } 
                    IF((a↓wo←/h↓wo←+6*h↓wo←/d) &gt; 5.6) { 
                        →GMP011_000263TEXT("Warning: Web buckling criteria for opening not met!"); 
                    } 
                } ELSE { 
                    
                    IF(CWO) { 
                        h↓wo← →GMP011_000353= D↓wo← @REF("Equation 3-29a"); 
                        a↓wo← →GMP011_000354= 0.45*D↓wo← @REF("Equation 3-29c"); 
                    } 
                    
                    IF(ContBraced) { // F2.2(a) LTB does not apply      
                        double ΔΑ↓s← →GMP011_000253= h↓wo←*t↓w← @REF("Net reduction in steel from presence of an opening"); 
                        double M↓mo← →GMP011_000262= F↓y←*Z↓x←*(1-((ΔΑ↓s←*(h↓wo←/4+ABS(e↓wo←)))/Z↓x←)) @REF("Bending moment at center line of opening"); 
                    } ELSE { 
                        IF(L↓p← &lt; L↓b← &amp;&amp; L↓b← &lt;= L↓r←) { 
                            double M↓mo← →GMP011_000256= C↓b←*[M↓p←-[M↓p←-0.7*F↓y←*S↓x←]*[(L↓b←-L↓p←)/(L↓r←-L↓p←)]]; 
                        } ELSE { 
                            J →GMP011_000259= J*(1-(a↓wo←/L↓b←)*ΔΑ↓s←/(t↓w←*(d+2*b↓f←)))^2 @REF("Modified Torsional Constant"); 
                            double F↓cr← →GMP011_000260= ((C↓b←*π^2*E↓s←)/[L↓b←/r↓ts←]↑2←)*SQRT(1+0.078*((J)/(S↓x←*h↓wo←))*(L↓b←/r↓ts←)↑2←) @REF("(F4-5)"); 
                            M↓mo← →GMP011_000261= F↓cr←*S↓x← @REF("(F4-3)"); 
                            
                        } 
                        
                    } 
                    
                } 
                →GMP119_000005PAGEBREAK(); 
                →GMP011_000101TEXT("Shear Strength of Beam at Web Opening"); 
                IF(CWO) { 
                    h↓wo← →GMP011_000355= 0.9*D↓wo← @REF("Equation 3-29b"); 
                    a↓wo← →GMP011_000356= 0.45*D↓wo← @REF("Equation 3-29c"); 
                } 
                double s↓t← →GMP011_000186= d/2-h↓wo←/2-e↓wo← @REF("Depth of top tee"); 
                double s↓b← →GMP011_000187= d-h↓wo←-s↓t← @REF("Depth of bottom tee"); 
                
                // bottom tee        
                double V↓pb← →GMP011_000113= F↓y←*t↓w←*s↓b←/(SQRT(3)) @REF("Plastic shear capacity of bottom tee"); 
                double μ↓b← →GMP011_000102= 0; 
                double ν↓b← →GMP011_000103= a↓wo←/s↓b←; 
                →GMP011_000104double α↓vb← →GMP011_000105= MIN((SQRT(6)+μ↓b←)/(ν↓b←+SQRT(3)), 1); 
                double V↓mb← →GMP011_000106= V↓pb←*α↓vb← @REF("Maximum nominal shear capacity of bottom tee"); 
                
                // top tee
                double V↓pt← →GMP011_000114= F↓y←*t↓w←*s↓t←/(SQRT(3)) @REF("Plastic shear capacity of top tee"); 
                double μ↓t← →GMP011_000107= 0; 
                double ν↓t← →GMP011_000108= a↓wo←/s↓t←; 
                →GMP011_000109double α↓vt← →GMP011_000110= MIN((SQRT(6)+μ↓t←)/(ν↓t←+SQRT(3)), 1); 
                double V↓mt← →GMP011_000111= V↓pt←*α↓vt← @REF("Maximum nominal shear capacity of top tee"); 
                
                double V↓mo← →GMP011_000112= MIN(V↓mb←+V↓mt←, 0.66*V↓n←) @REF("Maximum nominal shear capacity at the location of an opening"); 
                →GMP119_000006PAGEBREAK(); 
            } 
            
        } 
    } 
} 

→INI400_004849BLOCK { // Strength Checks
    →INI400_011331TEXT("Strength Check"); 
    IF(DesignMethod == 0) { //LRFD
        →INI400_011206TEXT("ϕ↓b← = " &amp; ϕ↓b←); 
        →INI400_011207TEXT("ϕ↓v← = " &amp; ϕ↓v←); 
        UC↓b← →INI400_004684= ABS(M↓u←/(ϕ↓b←*M↓n←)); →INI400_016541PrintCheck(UC↓b←); 
        UC↓v← →INI400_004828= ABS(V↓u←)/(ϕ↓v←*V↓n←); →INI400_016545PrintCheck(UC↓v←); 
        double UC↓wo← →GMP011_000290= (ABS(M↓uo←/(ϕ↓wo←*M↓mo←))^3+ABS(V↓uo←/(ϕ↓wo←*V↓mo←))^3)^0.33; 
        IF(WO) { 
            
            IF((COMPARE(s↓t←, 0, 3) != 1) || (COMPARE(s↓b←, 0, 3) != 1)) { 
                →GMP011_000342TEXT("Warning: Web opening extends outside of cross-section's web"); 
                UC↓wo← →GMP011_000343= 999; 
            } 
            
            
            IF((COMPARE(d↓o←, L, 3) &gt; 0)) { 
                →GMP011_000344TEXT("Warning: Web opening position beyond length of member"); 
                UC↓wo← →GMP011_000345= 999; 
            } 
            
            
            IF((wb_flex_compact != 0 || fl_flex_compact != 0)) { 
                →GMP011_000226TEXT("Warning: Section has web-opening but is not compact!"); 
                UC↓wo← →GMP011_000227= 999; →GMP011_000228PrintCheck(UC↓wo←); 
            } 
            IF(F↓y← &gt; PhysConst(65, "ksi")) { 
                →GMP011_000229TEXT("Warning: Yield strength must be less than 65 ksi when web opening exists in member!"); 
                UC↓wo← →GMP011_000230= 999; →GMP011_000231PrintCheck(UC↓wo←); 
            } 
            IF(b/(2*t↓f←) &gt; PhysConst(65, "ksi")/SQRT(F↓y←)) { 
                →GMP011_000213TEXT("Warning: Local buckling of compression flange when b/(2*t↓f←) &gt; 65/SQRT(F↓y←)!"); 
                UC↓wo← →GMP011_000214= 999; →GMP011_000215PrintCheck(UC↓wo←); 
            } 
            IF(((a↓wo←/h↓wo←+6*h↓wo←/d) &gt; 5.6)) { 
                →GMP011_000304TEXT("Warning: Web buckling occurs when a↓wo←/h↓wo←+6*h↓wo←/d &gt; 5.6!"); 
                UC↓wo← →GMP011_000217= 999; →GMP011_000218PrintCheck(UC↓wo←); 
            } 
            
            IF((COMPARE((d-2*t↓f←)/t↓w←, PhysConst(420, "ksi")/SQRT(F↓y←), 3) &lt; 1) &amp;&amp; (COMPARE(a↓wo←/h↓wo←, 3.0, 3) &gt; 0)) { 
                →GMP011_000220TEXT("Warning: The upper limit for a↓o←/h↓o← is 3.0!"); 
                UC↓wo← →GMP011_000221= 999; →GMP011_000222PrintCheck(UC↓wo←); 
            } 
            IF((COMPARE((d-2*t↓f←)/t↓w←, PhysConst(520, "ksi")/SQRT(F↓y←), 3) &lt; 1) &amp;&amp; (COMPARE((d-2*t↓f←)/t↓w←, PhysConst(420, "ksi")/SQRT(F↓y←), 3) == 1) &amp;&amp; (COMPARE(a↓wo←/h↓wo←, 2.2, 3) &gt; 0)) { 
                →GMP011_000223TEXT("Warning: The upper limit for a↓o←/h↓o← is 2.2!"); 
                UC↓wo← →GMP011_000224= 999; →GMP011_000225PrintCheck(UC↓wo←); 
            } 
            IF(RWO) { 
                IF(COMPARE(b↓ro←/t↓ro←, (PhysConst(65, "ksi")/SQRT(F↓y←)), 3) &gt; 0) { 
                    →GMP011_000305TEXT("Warning: Local buckling of reinforcement occurs when b↓ro←/t↓ro← &gt; 65/SQRT(F↓y←)!"); 
                    UC↓wo← →GMP011_000306= 999; 
                } 
            } 
            
            IF(UC↓wo← == 999) { 
                →GMP011_000287TEXT("UC↓wo← = " &amp; UC↓wo←); →GMP011_000288PrintCheck(UC↓wo←); 
            } ELSE { 
                double UC↓wo← →GMP011_000190= (ABS(M↓uo←/(ϕ↓wo←*M↓mo←))^3+ABS(V↓uo←/(ϕ↓wo←*V↓mo←))^3)^0.33; →GMP011_000203PrintCheck(UC↓wo←); 
            } 
        } 
        
        double M↓n,s← →INI400_016757= ϕ↓b←*M↓n←; 
    } ELSE { //ASD
        →INI400_011208TEXT("Ω↓b← = " &amp; Ω↓b←); →INI400_011209TEXT("Ω↓v← = " &amp; Ω↓v←); 
        UC↓b← →INI400_016770= ABS(M↓u←/(M↓n←/Ω↓b←)); →INI400_016771PrintCheck(UC↓b←); 
        UC↓v← →INI400_016772= ABS(V↓u←)/(V↓n←/Ω↓v←); →INI400_016773PrintCheck(UC↓v←); 
        double M↓n,s← →INI400_016758= M↓n←/Ω↓b←; 
        
    } 
    
    
    IF(DesignMethod == 0) { //LRFD
        IF(WO) { 
            UC↓ULS,Con← →GMP011_000196= MAX(UC↓b←, UC↓v←, UC↓wo←); 
        } ELSE { 
            UC↓ULS,Con← →GMP011_000202= MAX(UC↓b←, UC↓v←); 
        } 
    } ELSE { 
        UC↓ULS,Con← →GMP011_000201= MAX(UC↓b←, UC↓v←); 
    } 
    
    
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="" Autor2="" Version="1" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English " />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://designforms.net</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Calculation</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|1|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" />
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="NormReference" X="625" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Input Table" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Base Plate Title" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Label Right" X="250" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Label Way Right" X="420" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Limit State Outcome" X="250" Y="0" Hor="0" Ver="2" SpX="20" SpY="-8" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="" X="625" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="A↓ro←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_A↓ro←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>A↓ro←</ENU>
        </LocalNames>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓s←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_A↓s←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>A↓s←</ENU>
        </LocalNames>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓w←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_A↓w←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>A↓w←</ENU>
        </LocalNames>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="a↓wo←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_a↓wo←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>a↓wo←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_b">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="b↓f←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_b↓f←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓f←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="b↓ro←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_b↓ro←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b↓ro←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_c">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>c</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓b←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_C↓b←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>C↓b←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓v←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_C↓v←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>C↓v←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓w←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_C↓w←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>C↓w←</ENU>
        </LocalNames>
        <Unit m="6" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="268.5359e-12" Dim="in↑6←" />
      </Variable>
      <Variable Modifier="Public" Name="compact" ESA_ID="" Type="Boolean">
        <Description TranslateID="VAR_DESC_compact">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>compact</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="ContBraced" ESA_ID="" Type="Boolean">
        <Description TranslateID="VAR_DESC_ContBraced">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>ContBraced</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="CWO" ESA_ID="" Type="Boolean">
        <Description TranslateID="VAR_DESC_CWO">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>CWO</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_d">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>d</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="d↓o←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_d↓o←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>d↓o←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="d↓r←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_d↓r←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>d↓r←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="d↓rbo←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_d↓rbo←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>d↓rbo←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="d↓rto←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_d↓rto←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>d↓rto←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="D↓wo←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_D↓wo←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>D↓wo←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="DeckDirection" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_DeckDirection">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>DeckDirection</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DesignMethod" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_DesignMethod">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>DesignMethod</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="E↓s←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_E↓s←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>E↓s←</ENU>
        </LocalNames>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Modifier="Public" Name="e↓wo←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_e↓wo←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>e↓wo←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="F↓cr←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_F↓cr←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>F↓cr←</ENU>
        </LocalNames>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Modifier="Public" Name="F↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_F↓y←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>F↓y←</ENU>
        </LocalNames>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Modifier="Public" Name="fl_flex_compact" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_fl_flex_compact">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>fl_flex_compact</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="G_FAIL" ESA_ID="" Type="Object">
        <Description TranslateID="VAR_DESC_G_FAIL">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>G_FAIL</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="G_PASS" ESA_ID="" Type="Object">
        <Description TranslateID="VAR_DESC_G_PASS">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>G_PASS</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_h">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>h</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="h↓o←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_h↓o←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>h↓o←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="h↓wo←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_h↓wo←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>h↓wo←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="I↓x←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_I↓x←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>I↓x←</ENU>
        </LocalNames>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="416.2314e-9" Dim="in↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="I↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_I↓y←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>I↓y←</ENU>
        </LocalNames>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="416.2314e-9" Dim="in↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="J" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_J">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>J</ENU>
        </LocalNames>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="416.2314e-9" Dim="in↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="k" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_k">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>k</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="k↓c←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_k↓c←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>k↓c←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓v←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_k↓v←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>k↓v←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="L" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_L">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>L</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="304.8e-3" Dim="ft" />
      </Variable>
      <Variable Modifier="Public" Name="l↓1←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_l↓1←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>l↓1←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="L↓b←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_L↓b←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓b←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="304.8e-3" Dim="ft" />
      </Variable>
      <Variable Modifier="Public" Name="L↓p←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_L↓p←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓p←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="304.8e-3" Dim="ft" />
      </Variable>
      <Variable Modifier="Public" Name="L↓r←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_L↓r←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>L↓r←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="304.8e-3" Dim="ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓mo←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓mo←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓mo←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓n,s←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓n,s←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓n,s←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓n←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓n←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓n←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓n-cflb←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓n-cflb←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓n-cflb←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓n-CFY←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓n-CFY←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓n-CFY←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓n-LTB←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓n-LTB←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓n-LTB←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓p←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓p←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓p←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓u+←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓u+←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓u+←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓u←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓u←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓u←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓u-←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓u-←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓u-←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓uo←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓uo←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓uo←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓yc←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓yc←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓yc←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓yo,ULS,Con←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓yo,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓yo,ULS,Con←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓yoe,ULS,Con←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓yoe,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓yoe,ULS,Con←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓yos,ULS,Con←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_M↓yos,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>M↓yos,ULS,Con←</ENU>
        </LocalNames>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip∙ft" />
      </Variable>
      <Variable Modifier="Public" Name="Name↓steel_mat←" ESA_ID="" Type="String">
        <Description TranslateID="VAR_DESC_Name↓steel_mat←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>Name↓steel_mat←</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="NegCompAction" ESA_ID="" Type="Boolean">
        <Description TranslateID="VAR_DESC_NegCompAction">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>NegCompAction</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="P↓r←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_P↓r←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>P↓r←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="r" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_r">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>r</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="R↓pc←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_R↓pc←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>R↓pc←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="r↓ts←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_r↓ts←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>r↓ts←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="r↓y←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_r↓y←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>r↓y←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="rib_dir" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_rib_dir">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>rib_dir</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ribsParal" ESA_ID="" Type="Boolean">
        <Description TranslateID="VAR_DESC_ribsParal">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>ribsParal</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="RWO" ESA_ID="" Type="Boolean">
        <Description TranslateID="VAR_DESC_RWO">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>RWO</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="RWOBS" ESA_ID="" Type="Boolean">
        <Description TranslateID="VAR_DESC_RWOBS">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>RWOBS</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="s↓b←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_s↓b←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>s↓b←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="s↓t←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_s↓t←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>s↓t←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="S↓x←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_S↓x←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>S↓x←</ENU>
        </LocalNames>
        <Unit m="3" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="16.38706e-6" Dim="in↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="S↓xc←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_S↓xc←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>S↓xc←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="t↓f←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_t↓f←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>t↓f←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="t↓ro←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_t↓ro←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>t↓ro←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="t↓w←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_t↓w←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>t↓w←</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="tmp" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_tmp">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>tmp</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓b←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_UC↓b←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>UC↓b←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓ULS,Con←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_UC↓ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>UC↓ULS,Con←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓v←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_UC↓v←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>UC↓v←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓wo←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_UC↓wo←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>UC↓wo←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="V↓mb←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_V↓mb←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>V↓mb←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓mo←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_V↓mo←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>V↓mo←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓mt←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_V↓mt←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>V↓mt←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓n←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_V↓n←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>V↓n←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓pb←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_V↓pb←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>V↓pb←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓pt←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_V↓pt←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>V↓pt←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓u←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_V↓u←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>V↓u←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓uo,ULS,Con←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_V↓uo,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>V↓uo,ULS,Con←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓uo←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_V↓uo←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>V↓uo←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓uoe,ULS,Con←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_V↓uoe,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>V↓uoe,ULS,Con←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓uos,ULS,Con←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_V↓uos,ULS,Con←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>V↓uos,ULS,Con←</ENU>
        </LocalNames>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="wb_flex_compact" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_wb_flex_compact">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>wb_flex_compact</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="WO" ESA_ID="" Type="Boolean">
        <Description TranslateID="VAR_DESC_WO">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>WO</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="Z↓x←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_Z↓x←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>Z↓x←</ENU>
        </LocalNames>
        <Unit m="3" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="16.38706e-6" Dim="in↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="α↓vb←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_α↓vb←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>α↓vb←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓vt←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_α↓vt←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>α↓vt←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ΔΑ↓s←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_ΔΑ↓s←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>ΔΑ↓s←</ENU>
        </LocalNames>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓fl←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_λ↓fl←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>λ↓fl←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓p,fl,Flex←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_λ↓p,fl,Flex←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>λ↓p,fl,Flex←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓p,wb,Flex←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_λ↓p,wb,Flex←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>λ↓p,wb,Flex←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓r,fl,Flex←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_λ↓r,fl,Flex←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>λ↓r,fl,Flex←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓r,wb,Flex←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_λ↓r,wb,Flex←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>λ↓r,wb,Flex←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓wb←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_λ↓wb←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>λ↓wb←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓b←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_μ↓b←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>μ↓b←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓t←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_μ↓t←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>μ↓t←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ν↓b←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_ν↓b←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>ν↓b←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ν↓t←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_ν↓t←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>ν↓t←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="π" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_π">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>π</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓b←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_ϕ↓b←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>ϕ↓b←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓v←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_ϕ↓v←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>ϕ↓v←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓wo←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_ϕ↓wo←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>ϕ↓wo←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Ω↓b←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_Ω↓b←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>Ω↓b←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Ω↓v←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VAR_DESC_Ω↓v←">
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>Ω↓v←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
    </Variables>
    <DrawingGroups />
    <ResultTables />
    <ResultGroups />
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Layout 0</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_1">
          <ENU>Layout 1</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_2">
          <ENU>Layout 2</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_3">
          <ENU>Layout 3</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_4">
          <ENU>Layout 4</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_5">
          <ENU>Layout 5</ENU>
        </Names>
      </Layout>
    </Layouts>
    <VisualComponents>
      <VC ID="GMP011_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000016">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000018">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000019">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000020">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000027">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000051">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000073">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000075">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000079">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000081">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000082">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000083">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000084">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000085">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000086">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000094">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000100">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000101">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000102">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000103">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000105">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000106">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000107">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000108">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000110">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000111">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000112">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000113">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000114">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000115">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000116">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000117">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000118">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000119">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000121">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000122">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000123">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000125">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000127">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000128">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000129">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000130">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000131">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000132">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000171">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000174">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000178">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000182">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000184">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000185">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000186">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000187">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000188">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000189">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000190">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011208" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000193">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000196">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000201">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="GMP011_000202">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="GMP011_000203">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000204">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000205">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000206">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000207">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000208">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000213">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000214">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000215">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_016522" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000217">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000218">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_016522" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000219">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000220">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000221">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000222">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_016522" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000223">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000224">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000225">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_016522" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000226">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000227">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000228">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_016522" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000229">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000230">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000231">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_016522" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000233">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000234">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000236">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="GMP011_000238">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="GMP011_000239">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000240">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000242">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000243">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000244">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="29" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="GMP011_000251">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000253">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000256">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="29" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="GMP011_000259">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000260">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="GMP011_000261">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="GMP011_000262">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000263">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000264">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000269">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000270">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000272">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000273">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000275">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000276">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000278">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000279">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000281">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000282">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000284">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000285">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000287">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000288">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_016522" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000289">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000290">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011208" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000292">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000293">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000294">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000295">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000296">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000297">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000298">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000299">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000300">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000301">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000302">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000303">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000304">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000305">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000306">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000342">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000343">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000344">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000345">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000346">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000347">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_016522" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000348">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000349">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000350">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000351">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000352">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000353">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000354">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000355">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP011_000356">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP119_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP198_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011267" Style="0" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP198_000002">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="INI400_011206" Style="2" StyleName="" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP198_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP198_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_000561">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004673">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="0" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004684">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004696">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004697">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004698">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004699">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004700">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004703">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004705">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004706">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004828">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="INI400_004827" Style="2" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="INI400_004827" Style="2" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004846">
        <Set Vis="1" Prev="INI400_010999" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Calibri|11|0|2" Font2="Calibri|11|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004849">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Calibri|11|0|2" Font2="Calibri|11|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_010999">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Calibri|11|0|2" Font2="Calibri|11|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011096">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_011120">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011121">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011176">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="12" Y="138" Hor="0" Ver="4" SpX="5" SpY="3" Font1="Calibri|13|0|2" Font2="Calibri|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011194">
        <Set Vis="1" Prev="INI400_000609" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_011200">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_011201">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011202">
        <Set Vis="1" Prev="INI400_004830" Style="2" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011206">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011207">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011208">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011209">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011212">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011213">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011214">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011222">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011225">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011228">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011233">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011242">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011246">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011247">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011248">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011258">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011325">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011326">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_011327">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_011328">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="19" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_011329">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_011330">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="19" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_011331">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012673">
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|5|2" EqStyle="15" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_012675">
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|5|2" EqStyle="15" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="172" Y="11.2" Hor="2" Ver="4" SpX="332" SpY="0" Font1="Calibri|20|5|2" Font2="Calibri|20|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_012676">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|16|0|2" Font2="Segoe UI|16|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000001" Style="0" StyleName="" X="172" Y="34.5" Hor="2" Ver="4" SpX="-36" SpY="6" Font1="Calibri|13|0|2" Font2="Calibri|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_012803">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="150" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="150" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="150" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_012862">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012864">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012865">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012870">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012897">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012898">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012899">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012921">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="15" SpY="3" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012925">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012934">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="336" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012935">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012936">
        <Set Vis="0" Prev="INI400_004830" Style="0" StyleName="" X="21" Y="336" Hor="4" Ver="3" SpX="20" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012937">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012938">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012939">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012941">
        <Set Vis="0" Prev="" Style="2" StyleName="Input Table" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012942">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012943">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012950">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012951">
        <Set Vis="1" Prev="" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012952">
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012953">
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012955">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_012984">
        <Set Vis="1" Prev="INI400_013005" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013005">
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013224">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="336" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013228">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013230">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013270">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013273">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="336" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013274">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="336" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013275">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013276">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013277">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013278">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013279">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013280">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013289">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013290">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013291">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013293">
        <Set Vis="1" Prev="INI400_013291" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013296">
        <Set Vis="1" Prev="INI400_013293" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013299">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013301">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013307">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013314">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013316">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013318">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013319">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013321">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013322">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013323">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013324">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013335">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013341">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013348">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013350">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013356">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013357">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013358">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013359">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013360">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013361">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013362">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013367">
        <Set Vis="0" Prev="" Style="2" StyleName="Input Table" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013375">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013378">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013380">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013381">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013382">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013384">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013385">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013386">
        <Set Vis="0" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_013387">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_014981">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_014983">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_014986">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_014988">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_014989">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_014990">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_014991">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015232">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016537">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="INI400_004828" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Calibri|13|0|2" Font2="Calibri|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016538">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="0" Hor="0" Ver="1" SpX="27" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="370" Y="0" Hor="0" Ver="1" SpX="27" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_004828" Style="0" StyleName="" X="370" Y="0" Hor="0" Ver="1" SpX="27" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_016539">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Calibri|13|0|2" Font2="Calibri|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="INI400_004828" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Calibri|13|0|2" Font2="Calibri|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016540">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="0" Hor="0" Ver="1" SpX="27" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="370" Y="0" Hor="0" Ver="1" SpX="27" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_004828" Style="0" StyleName="" X="370" Y="0" Hor="0" Ver="1" SpX="27" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_016541">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016545">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016755">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016757">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016758">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016759">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="336" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016760">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="336" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016761">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016762">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016763">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016764">
        <Set Vis="1" Prev="INI400_013321" Style="2" StyleName="Input Table" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016765">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016766">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016767">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016768">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016769">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016770">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016771">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_016772">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="INI400_004827" Style="2" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="INI400_004827" Style="2" StyleName="" X="15" Y="336" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_016773">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="400">
      <TEMDLoader Name="" ID="1" Translate="1" Left="16" Top="20" Width="350" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="0" Anchor="5" Padding="3|3|3|3" MinSize="350|4" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="2" Font="Microsoft Sans Serif|8.25|0|3" Active="0" PreDef="0" MemberDirectory="" MemberID="Beam.69" SectionID="-1" CombiID="-1" />
    </Main>
    <MemberData Width="400" />
    <Setup Width="400" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="TEXT_">
      <ENU>"Ω↓v← = " &amp; Ω↓v←</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000094">
      <ENU>"Flexural Strength of Beam at Web Opening"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000101">
      <ENU>"Shear Strength of Beam at Web Opening"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000115">
      <ENU>"Flexural Strength of Beam at Web Opening"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000116">
      <ENU>"Shear Strength of Beam at Web Opening"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000213">
      <ENU>"Warning: Local buckling of compression flange when b/(2*t↓f←) &gt; 65/SQRT(F↓y←)!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000219">
      <ENU>"Warning: Web buckling criteria for opening not met!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000220">
      <ENU>"Warning: The upper limit for a↓o←/h↓o← is 3.0!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000223">
      <ENU>"Warning: The upper limit for a↓o←/h↓o← is 2.2!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000226">
      <ENU>"Warning: Section has web-opening but is not compact!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000229">
      <ENU>"Warning: Yield strength must be less than 65 ksi when web opening exists in member!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000251">
      <ENU>"Warning: Local buckling of compression flange criteria not met for section!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000263">
      <ENU>"Warning: Web buckling criteria for opening not met!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000264">
      <ENU>"Warning: Local buckling of compression flange criteria not met for section!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000269">
      <ENU>"Warning: Section has web-opening but is not compact!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000272">
      <ENU>"Warning: Yield strength must be less than 65 ksi when web opening exists in member!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000275">
      <ENU>"Warning: Local buckling of compression flange criteria not met for section!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000278">
      <ENU>"Warning: Web buckling criteria for opening (a↓wo←/h↓wo←+6*h↓wo←/d &lt; 5.6) not met!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000281">
      <ENU>"Warning: The upper limit for a↓wo←/h↓wo← is 3.0!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000284">
      <ENU>"Warning: The upper limit for a↓wo←/h↓wo← is 2.2!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000287">
      <ENU>"UC↓wo← = " &amp; UC↓wo←</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000292">
      <ENU>"Warning: Section has web-opening but is not compact!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000294">
      <ENU>"Warning: Section has web-opening but is not compact!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000298">
      <ENU>"Warning: Web opening extends outside of cross-section's web"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000299">
      <ENU>"Warning: Web opening extends outside of cross-section's web"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000301">
      <ENU>"Strength of Beam at Web Opening"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000304">
      <ENU>"Warning: Web buckling occurs when a↓wo←/h↓wo←+6*h↓wo←/d &gt; 5.6!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000305">
      <ENU>"Warning: Local buckling of reinforcement occurs when b↓ro←/t↓ro← &gt; 65/SQRT(F↓y←)!"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000342">
      <ENU>"Warning: Web opening extends outside of cross-section's web"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP011_000344">
      <ENU>"Warning: Web opening position beyond length of member"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP198_000001">
      <ENU>"Warning: Local buckling of reinforcement occurs when b↓ro←/t↓ro← &gt; 65/SQRT(F↓y←)!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_011096">
      <ENU>"Assumed that h/t↓w ←&lt; 260 &amp; no transverse stiffeners per AISC 360-10 G1.i"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_011206">
      <ENU>"ϕ↓b← = " &amp; ϕ↓b←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_011207">
      <ENU>"ϕ↓v← = " &amp; ϕ↓v←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_011208">
      <ENU>"Ω↓b← = " &amp; Ω↓b←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_011209">
      <ENU>"Ω↓v← = " &amp; Ω↓v←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_011325">
      <ENU>"Beam Flexural Strength - AISC 360-10 Chapter F"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_011326">
      <ENU>"Beam Shear Strength - AISC 360-10 Chapter G"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_011331">
      <ENU>"Strength Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_012673">
      <ENU>"Construction Stage - Beam Strength (LRFD)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_012675">
      <ENU>"Construction Stage - Beam Strength (ASD)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_012676">
      <ENU>"AISC 360-10 Specification Chapters F &amp; G"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_012897">
      <ENU>"- Deck ribs not parallel to member. Continuous lateral bracing of compression flange is assumed: No check for LTB req'd"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_012950">
      <ENU>"- Not continually braced: Check for LTB"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_012955">
      <ENU>"- Subject to Flexure: Flange is slender"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013276">
      <ENU>"- Subject to Flexure: Web is compact"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013278">
      <ENU>"- Subject to Flexure: Web is non-compact"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013280">
      <ENU>"- Subject to Flexure: Web is slender"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013291">
      <ENU>"L↓b← = " &amp; L↓b←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013293">
      <ENU>"L↓p← = " &amp; L↓p←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013296">
      <ENU>"L↓r← = " &amp; L↓r←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013381">
      <ENU>Description("F↓cr←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_016537">
      <ENU>"≤ 1.00"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_016539">
      <ENU>"&gt; 1.00"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_016762">
      <ENU>"- Subject to Flexure: Flange is compact"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_016763">
      <ENU>"- Subject to Flexure: Flange is non-compact"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_016767">
      <ENU>"Check not supported for members with slender web"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_016769">
      <ENU>"L↓b← is less than L↓p←: No check for LTB needed"</ENU>
    </Item>
  </Texts>
</Root>