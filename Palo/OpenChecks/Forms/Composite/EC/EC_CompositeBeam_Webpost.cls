<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="170001" GUID="e22b8092-346b-4073-b6f7-0d836969123c">
  <CodeEditor>
    <SourceCode Collapsed="52|98|139|181|232|300|383|388|404|425|430|442|453|462|476|487|543" BreakPoints="">//EC_CompositeBeam_Webpost.cls

class WebpostsChecks { 
    //--------------------------variables------------------------------------
    //ExternalCLC
    →KRS00014_000815object Functions_general; 
    →KRS00014_000816object Functions_NA; 
    →KRS00014_000817object Functions_properties; 
    →KRS00014_001415object Functions_beff; 
    →KRS00014_000818object FontsAndColors; 
    →KRS00014_000824object DataExchange; //Structure with all variables

    //Additional data for drawings
    →KRS00014_001108double CN; 
    
    //WP parameters
    →KRS01026_000005double WPType; 
    →KRS01026_000088double WPAdjOpenShape; 
    →KRS01026_000028string WPName; 
    →KRS01026_000007double&lt;mm,0&gt; h↓eff←; 
    →KRS01026_000008double n↓sc,s←; 
    →KRS01026_000009double&lt;mm,0&gt; s; 
    →KRS01026_000010double&lt;mm,0&gt; s↓o←; 
    →KRS01026_000081double&lt;mm,0&gt; h↓o←; 
    →KRS01026_000204double&lt;mm,0&gt; e↓o←; 
    →KRS01026_000243double&lt;mm,0&gt; l↓o←; 
    →KRS01026_000011double&lt;kN,0&gt; V↓Ed←; 
    →KRS01026_000232double&lt;kN,0&gt; V↓Ed,mid←; 
    →KRS01026_000079double&lt;kN,0&gt; M↓Ed←; 
    →KRS01026_000012double&lt;mm,0&gt; z↓t←; 
    
    //composite parameters
    →KRS01026_000029double&lt;mm,0&gt; h↓s←; 
    →KRS01026_000030double&lt;mm,0&gt; h↓c←; 
    →KRS01026_000034double&lt;kN,0&gt; P↓Rd←; 
    
    //section parameters
    →KRS01026_000040double&lt;mm,0&gt; t↓w←; 
    →KRS01026_000041double&lt;MPa,0&gt; f↓y←; 
    →KRS01026_000095double&lt;MPa,0&gt; E; 
    
    //National annex parameters
    →KRS01026_000291double γ↓M0←; 
    →KRS01026_000292double γ↓M1←; 
    
    //results
    →KRS00014_001001double&lt;,-2&gt; UC↓wp,Vy←; 
    →KRS01026_000054double&lt;,-2&gt; UC↓wp,N←; 
    →KRS01026_000055double&lt;,-2&gt; UC↓wp,M←; 
    →KRS01026_000206double&lt;,-2&gt; UC↓wp,Vz←; 
    
    //-----------------------------------Constructor-------------------------
    public void WebpostsChecks(double i, object _DataExchange) { 
        DataExchange →KRS00014_000003= _DataExchange; 
        →KRS00014_000036LoadExternCLCs(); 
        
        //Opening parameters adding to main DataExchange from array
        →KRS01026_000027Functions_general.SetWebPostPropsToDataExchange(i, DataExchange); 
        
        //Additional data for drawings
        CN →KRS00014_001175= _DataExchange.Get("CN"); 
        
        //WP parameters
        WPType →KRS01026_000013= _DataExchange.WPType; 
        WPAdjOpenShape →KRS01026_000089= _DataExchange.WPAdjOpenShape; 
        WPName →KRS01026_000014= _DataExchange.WPName; 
        h↓eff← →KRS01026_000021= _DataExchange.WP_h_eff; 
        n↓sc,s← →KRS01026_000022= _DataExchange.WP_n_scs; 
        s →KRS01026_000023= _DataExchange.WP_s; 
        s↓o← →KRS01026_000024= _DataExchange.WP_s_o; 
        h↓o← →KRS01026_000080= _DataExchange.WP_h_o; 
        e↓o← →KRS01026_000205= _DataExchange.WP_e_o; 
        l↓o← →KRS01026_000244= _DataExchange.WP_l_o; 
        V↓Ed← →KRS01026_000025= _DataExchange.WP_V_Ed; 
        V↓Ed,mid← →KRS01026_000233= _DataExchange.WP_V_mid_Ed; 
        M↓Ed← →KRS01026_000078= _DataExchange.WP_M_Ed; 
        z↓t← →KRS01026_000026= _DataExchange.WP_z_t; 
        
        //composite parameters
        h↓s← →KRS01026_000031= _DataExchange.h_s; 
        h↓c← →KRS01026_000032= _DataExchange.h_s-_DataExchange.h_p; 
        P↓Rd← →KRS01026_000035= _DataExchange.P_Rd; 
        
        //section parameters
        t↓w← →KRS01026_000042= _DataExchange.t_w; 
        f↓y← →KRS01026_000043= _DataExchange.f_yb; 
        E →KRS01026_000096= _DataExchange.E_b; 
        
        //National annex parameters
        γ↓M0← →KRS01026_000293= _DataExchange.γ_M0; 
        γ↓M1← →KRS01026_000294= _DataExchange.γ_M1; 
        
        //Webpost parameters adding to main DataExchange from array
        →KRS00014_003213Functions_general.SetWebPostPropsToDataExchange(i, DataExchange); 
        
    } 
    
    //---------------------------Public functions----------------------------
    public void WebpostChecks(out double CN) { 
        →KRS01026_000304double&lt;,-2&gt; UC↓wp←; 
        //Subchapter numbering
        double SCN →KRS00014_000605= 0; 
        //→KRS00014_001234CN++; 
        string sconstr_stage →KRS00014_001235= TR("Web-post"); 
        →KRS00014_000972TEXT(sconstr_stage &amp; " " &amp; WPName); 
        
        //Detailed output
        →KRS01026_000003SCN++; →KRS01026_000004LongitudinalShear(CN, SCN, out UC↓wp,Vy←); 
        →KRS01026_000189SCN++; →KRS01026_000190Bending(CN, SCN, out UC↓wp,M←); 
        →KRS01026_000052SCN++; →KRS01026_000053Buckling(CN, SCN, out UC↓wp,N←); 
        IF(WPType == 0) { //only for closely spaced openings
            →KRS01026_000227SCN++; →KRS01026_000228VerticalShear(CN, SCN, out UC↓wp,Vz←); 
        } ELSE { 
            UC↓wp,Vz← →KRS01026_000229= 0; 
        } 
        
        string sText →KRS00014_001311= TR("Unity check"); 
        →KRS00014_001291SCN++; →KRS00014_001292TEXT(CN &amp; "." &amp; SCN &amp; " " &amp; sText); 
        IF(WPType == 0) { 
            UC↓wp← →KRS01026_000231= MAX(UC↓wp,Vy←, UC↓wp,N←, UC↓wp,M←, UC↓wp,Vz←); 
        } ELSE { 
            UC↓wp← →KRS00014_001267= MAX(UC↓wp,Vy←, UC↓wp,N←, UC↓wp,M←); 
        } 
        IF(COMPARE(UC↓wp←, 1, 6) != 1) { 
            →KRS00014_001165TEXT("≤ 1"); 
            →KRS00014_001166TEXT("OK"); 
            →KRS00014_001163TEXT("Web-post check is OK."); 
        } ELSE { 
            →KRS00014_001167TEXT("&gt; 1"); 
            →KRS00014_001168TEXT("NOT OK"); 
            →KRS00014_001164TEXT("Web-post check is NOT OK."); 
        } 
        
        //Standard output (table of UC)
        →KRS00014_002264PrintStandardOutput(); 
        
        →KRS00014_001266PAGEBREAK(); 
    } 
    
    public void LongitudinalShear(double CN, double SCN, out double UC↓wp,Vy←) { 
        →KRS00014_002867double&lt;kN,2&gt; V↓wp,Ed←; 
        →KRS01026_000044double&lt;kN,2&gt; V↓wp,Rd←; 
        →KRS01026_000036double&lt;kN,2&gt; ΔN↓cs,Rd←; 
        →KRS01026_000305double&lt;,-2&gt; UC↓wp,Vy←; 
        
        string sText →KRS00014_002839= TR("Longitudinal shear"); 
        →KRS00014_002840TEXT(CN &amp; "." &amp; SCN &amp; " " &amp; sText); 
        
        V↓wp,Ed← →KRS01026_000033= (V↓Ed←*s)/(h↓eff←+z↓t←+h↓s←-0.5*h↓c←) @REF("(SCI P355 (29))"); 
        ΔN↓cs,Rd← →KRS01026_000037= n↓sc,s←*P↓Rd← @REF("(SCI P355 (30))"); 
        IF(ABS(V↓wp,Ed←) &gt; ΔN↓cs,Rd←) { 
            IF(COMPARE(V↓wp,Ed←, 0, 6) == 1) { //V↓Ed← is positive
                V↓wp,Ed← →KRS01026_000038= (V↓Ed←*s-ΔN↓cs,Rd←*(z↓t←+h↓s←-0.5*h↓c←))/h↓eff← @REF("(SCI P355 (31))"); 
            } ELSE { //V↓Ed← is negative
                V↓wp,Ed← →KRS18100_000005= (V↓Ed←*s+ΔN↓cs,Rd←*(z↓t←+h↓s←-0.5*h↓c←))/h↓eff← @REF("(SCI P355 (31))"); 
            } 
        } 
        →KRS00014_002981DataExchange.Set("V_wp_Ed", V↓wp,Ed←); //Because it is needed in next checks
        →KRS01026_000201DataExchange.Set("ΔN_cs_Rd", ΔN↓cs,Rd←); //Because it is needed in next checks
        
        V↓wp,Rd← →KRS01026_000039= ((s↓o←*t↓w←)*f↓y←)/(γ↓M0←*SQRT(3)) @REF("(SCI P355 (36))"); 
        
        IF(COMPARE(V↓wp,Rd←, 0, 6) == 1) { 
            UC↓wp,Vy← →KRS00014_003151= (ABS(V↓wp,Ed←)/V↓wp,Rd←); 
        } ELSE { 
            UC↓wp,Vy← →KRS00014_003152= 999; 
        } 
        IF(IO.IsDrawing) { 
            IF(COMPARE(UC↓wp,Vy←, 1, 6) != 1) { 
                →KRS00014_001105TEXT("≤ 1"); 
                →KRS00014_001104TEXT("OK"); 
                →KRS00014_001014TEXT("The shear resistance of the section is adequate."); 
            } ELSE { 
                →KRS00014_001106TEXT("&gt; 1"); 
                →KRS00014_001107TEXT("NOT OK"); 
                →KRS00014_001016TEXT("The shear resistance of the section is not adequate."); 
            } 
            →KRS00014_003159PAGEBREAK(); 
        } 
    } 
    
    public void Bending(double CN, double SCN, out double UC↓wp,M←) { 
        →KRS01026_000191double&lt;kNm,2&gt; M↓wp,Ed←; 
        →KRS01026_000214double&lt;kNm,2&gt; M↓wp,Rd←; 
        →KRS01026_000198double&lt;kN,2&gt; V↓wp,Ed← →KRS01026_000199= DataExchange.V_wp_Ed; 
        →KRS01026_000202double&lt;kN,2&gt; ΔN↓cs← →KRS01026_000203= DataExchange.ΔN_cs_Rd; 
        →KRS01026_000306double&lt;,-2&gt; UC↓wp,M←; 
        →KRS18100_000006double&lt;kN,2&gt; V↓b,Ed←; 
        →KRS18100_000007double&lt;kN,2&gt; V↓t,Ed←; 
        →KRS18100_000008double&lt;kN,2&gt; V↓c,Ed←; 
        
        string sText →KRS01026_000187= TR("Bending"); 
        →KRS01026_000188TEXT(CN &amp; "." &amp; SCN &amp; " " &amp; sText); 
        
        IF(COMPARE(e↓o←, 0, 6) != 0) { 
            →KRS18100_000016Get_V_Ed(out V↓b,Ed←, out V↓t,Ed←, out V↓c,Ed←); 
            IF(COMPARE(V↓wp,Ed←, 0, 6) == 1) { //V↓Ed← is positive
                M↓wp,Ed← →KRS01026_000200= (V↓t,Ed←+V↓c,Ed←-V↓b,Ed←)*(s/2)+V↓wp,Ed←*e↓o←-ΔN↓cs←*((z↓t←+h↓s←-0.5*h↓c←)/2) @REF("(SCI P355 (34))"); 
            } ELSE { //V↓Ed← is negative
                M↓wp,Ed← →KRS18100_000012= (V↓t,Ed←+V↓c,Ed←-V↓b,Ed←)*(s/2)+V↓wp,Ed←*e↓o←+ΔN↓cs←*((z↓t←+h↓s←-0.5*h↓c←)/2) @REF("(SCI P355 (34))"); 
            } 
        } ELSE { 
            M↓wp,Ed← →KRS01026_000208= 0; 
        } 
        →KRS01026_000209DataExchange.Set("M_wp_Ed", M↓wp,Ed←); //Because it is needed in next checks
        
        M↓wp,Rd← →KRS01026_000215= (s↓o←↑2←*t↓w←)/6*(f↓y←/γ↓M0←) @REF("(SCI P355 (44))"); 
        →KRS01026_000236DataExchange.Set("M_wp_Rd", M↓wp,Rd←); //Because it is needed in next checks

        SWITCH(WPAdjOpenShape) { 
            CASE 0 :  { //For rectangular openings
                UC↓wp,M← →KRS01026_000216= (ABS(V↓wp,Ed←)*h↓o←/2+ABS(M↓wp,Ed←))/M↓wp,Rd← @REF("(SCI P355 (45))"); 
            } 
            DEFAULT :  { //For all other openings
                UC↓wp,M← →KRS01026_000217= ABS(M↓wp,Ed←)/M↓wp,Rd←; 
            } 
        } 
        IF(IO.IsDrawing) { 
            IF(COMPARE(UC↓wp,M←, 1, 6) != 1) { 
                →KRS01026_000218TEXT("≤ 1"); 
                →KRS01026_000219TEXT("OK"); 
                →KRS01026_000220TEXT("The bending resistance of the section is adequate."); 
            } ELSE { 
                →KRS01026_000221TEXT("&gt; 1"); 
                →KRS01026_000222TEXT("NOT OK"); 
                →KRS01026_000223TEXT("The bending resistance of the section is not adequate."); 
            } 
            →KRS01026_000224PAGEBREAK(); 
        } 
        
    } 
    
    public void Buckling(double CN, double SCN, out double UC↓wp,N←) { 
        →KRS01026_000065double&lt;kN,2&gt; N↓wp,Ed←; 
        →KRS01026_000066double&lt;kN,2&gt; N↓wp,Rd←; 
        →KRS01026_000069double&lt;kN,2&gt; V↓t,Ed←; 
        →KRS01026_000098double λ↓1←; 
        →KRS01026_000110double λ↓rel←; 
        →KRS01026_000117double α; 
        →KRS01026_000134double χ; 
        →KRS01026_000143bool bBucking; 
        →KRS01026_000076double&lt;kN,2&gt; V↓wp,Ed← →KRS01026_000077= DataExchange.V_wp_Ed; 
        →KRS01026_000083double&lt;kN,2&gt; M↓wp,Ed← →KRS01026_000084= DataExchange.M_wp_Ed; 
        →KRS01026_000307double&lt;,-2&gt; UC↓wp,N←; 
        
        string sText →KRS01026_000050= TR("Buckling"); 
        →KRS01026_000051TEXT(CN &amp; "." &amp; SCN &amp; " " &amp; sText); 
        
        SWITCH(WPType) { 
            CASE 0 :  { //closely spaced
                bBucking →KRS01026_000162= true; 
                N↓wp,Ed← →KRS01026_000082= ABS(V↓wp,Ed←)+ABS(M↓wp,Ed←)/(h↓o←/2) @REF("(SCI P355 (33))"); 
            } 
            DEFAULT :  { //widely and isolated spaced
                SWITCH(WPAdjOpenShape) { 
                    CASE 0 :  { →KRS01026_000171Get_bBuckling(20, out bBucking); } //Rectangle 
                    CASE 1 :  { →KRS01026_000172Get_bBuckling(25, out bBucking); } //Circle
                    CASE 4 :  { →KRS01026_000173Get_bBuckling(25, out bBucking); } //Elongated
                    DEFAULT :  { →KRS01026_000174Get_bBuckling(0, out bBucking); } 
                } 
                IF(bBucking) { 
                    →KRS18100_000021Get_V_Ed(); 
                    →KRS01026_000071double&lt;kN,2&gt; V↓b,Ed← →KRS01026_000072= DataExchange.V_b_Ed; 
                    →KRS01026_000073double&lt;kN,2&gt; V↓t,Ed← →KRS01026_000074= DataExchange.V_t_Ed; 
                    →KRS01026_000067double&lt;kN,2&gt; V↓c,Ed← →KRS01026_000068= DataExchange.V_c_Ed; 
                    V↓t,Ed← →KRS01026_000070= MAX(V↓c,Ed←+V↓t,Ed←, V↓b,Ed←); 
                    N↓wp,Ed← →KRS01026_000075= V↓t,Ed← @REF("(SCI P355 (32))"); 
                } 
            } 
        } 
        
        IF(bBucking) { 
            →KRS01026_000115Get_λ_one(out λ↓1←); //Get lambda_1
            →KRS01026_000175Get_λ_rel(λ↓1←, out λ↓rel←); 
            →KRS01026_000123Get_α(out α); //Get buckling coefficient alpha according buckling curve
            →KRS01026_000133Get_χ(α, λ↓rel←, out χ); 
            →KRS01026_000181Get_Nwp_Rd(bBucking, χ, out N↓wp,Rd←); 
            →KRS01026_000285DataExchange.Set("N_wp_Rd", N↓wp,Rd←); //Because it is needed in next checks
            IF(COMPARE(N↓wp,Rd←, 0, 6) == 1) { 
                UC↓wp,N← →KRS01026_000063= (ABS(N↓wp,Ed←)/N↓wp,Rd←); 
            } ELSE { 
                UC↓wp,N← →KRS01026_000064= 999; 
            } 
        } ELSE { 
            UC↓wp,N← →KRS01026_000146= 0; 
        } 
        IF(IO.IsDrawing) { 
            IF(COMPARE(UC↓wp,N←, 1, 6) != 1) { 
                →KRS01026_000056TEXT("≤ 1"); 
                →KRS01026_000057TEXT("OK"); 
                →KRS01026_000058TEXT("The buckling resistance of the section is adequate."); 
            } ELSE { 
                →KRS01026_000059TEXT("&gt; 1"); 
                →KRS01026_000060TEXT("NOT OK"); 
                →KRS01026_000061TEXT("The buckling resistance of the section is not adequate."); 
            } 
            →KRS01026_000062PAGEBREAK(); 
        } 
    } 
    
    public void VerticalShear(double CN, double SCN, out double UC↓wp,Vz←) { 
        →KRS01026_000235double&lt;kN,2&gt; V↓Ed←; 
        →KRS01026_000239double&lt;kN,2&gt; V↓Rd←; 
        →KRS01026_000247double&lt;kN,2&gt; V↓Rd,N←; 
        →KRS01026_000248double&lt;kN,2&gt; V↓Rd,M←; 
        →KRS01026_000302double&lt;kN,2&gt; V↓Rd,P←; 
        →KRS01026_000308double&lt;,-2&gt; UC↓wp,Vz←; 
        →KRS01026_000237double&lt;kNm,2&gt; M↓wp,Rd← →KRS01026_000238= DataExchange.M_wp_Rd; 
        IF(DataExchange.Contains("N_wp_Rd")) { →KRS01026_000286double&lt;kNm,2&gt; N↓wp,Rd← →KRS01026_000287= DataExchange.N_wp_Rd; } 
        →KRS01026_000241double&lt;kNm,2&gt; M↓bT,NV,Rd← →KRS01026_000242= DataExchange.M_bT_NV_Rd; 
        →KRS01026_000245double&lt;kN,2&gt; ΔN↓cs,Rd← →KRS01026_000246= DataExchange.ΔN_cs_Rd; 
        →KRS01026_000272double&lt;kN,2&gt; V↓wp,Ed← →KRS01026_000273= DataExchange.V_wp_Ed; 
        →KRS01026_000296double&lt;kN,2&gt; V↓b,Rd← →KRS01026_000297= DataExchange.V_b_Rd; 
        →KRS01026_000298double&lt;kN,2&gt; V↓t,Rd← →KRS01026_000299= DataExchange.V_t_Rd; 
        →KRS01026_000300double&lt;kN,2&gt; V↓c,Rd← →KRS01026_000301= DataExchange.V_c_Rd; 
        
        IF(WPType == 0) { //only for closely spaced openings
            string FS →KRS01026_000276= TR("Full shear connection"); 
            string PS →KRS01026_000277= TR("Partial shear connection"); 
            string sText →KRS01026_000225= TR("Vertical shear"); 
            →KRS01026_000226TEXT(CN &amp; "." &amp; SCN &amp; " " &amp; sText); 
            
            V↓Ed← →KRS01026_000234= V↓Ed,mid←; 
            →KRS01026_000295TEXT("Resistance governed by perforated section"); 
            V↓Rd,P← →KRS01026_000303= V↓b,Rd←+V↓t,Rd←+V↓c,Rd←; 
            
            IF(ABS(V↓wp,Ed←) &gt; ΔN↓cs,Rd←) { 
                →KRS01026_000288TEXT("V↓wp,Ed← &gt; ΔN↓cs,Rd← =&gt; " &amp; ABS(V↓wp,Ed←) &amp; " &gt; " &amp; ΔN↓cs,Rd← &amp; " =&gt; " &amp; PS); 
            } ELSE { 
                →KRS01026_000289TEXT("V↓wp,Ed← ≤ ΔN↓cs,Rd← =&gt; " &amp; ABS(V↓wp,Ed←) &amp; " ≤ " &amp; ΔN↓cs,Rd← &amp; " =&gt; " &amp; FS); 
            } 
            →KRS01026_000268TEXT("Resistance governed by web-post bending"); 
            SWITCH(WPAdjOpenShape) { 
                CASE 0 :  { //Rectangle 
                    IF(ABS(V↓wp,Ed←) &gt; ΔN↓cs,Rd←) { 
                        V↓Rd,M← →KRS01026_000265= (2*M↓wp,Rd←/s+4*M↓bT,NV,Rd←/l↓o←)/(1+(2*e↓o←+h↓o←)/h↓eff←)+ΔN↓cs,Rd←/s*(z↓t←+h↓s←-0.5*h↓c←) @REF("(SCI P355 (50))"); 
                    } ELSE { 
                        V↓Rd,M← →KRS01026_000266= (2*M↓wp,Rd←/s+4*M↓bT,NV,Rd←/l↓o←)*((h↓eff←+h↓s←-0.5*h↓c←)/(h↓eff←+2*e↓o←+h↓o←)) @REF("(SCI P355 (51))"); 
                    } 
                } 
                DEFAULT :  { //All others (Circ and Elongated)
                    IF(ABS(V↓wp,Ed←) &gt; ΔN↓cs,Rd←) { 
                        V↓Rd,M← →KRS01026_000240= (2*M↓wp,Rd←/s+4*M↓bT,NV,Rd←/l↓o←)/(1+2*e↓o←/h↓eff←)+ΔN↓cs,Rd←/s*(z↓t←+h↓s←-0.5*h↓c←) @REF("(SCI P355 (47))"); 
                    } ELSE { 
                        V↓Rd,M← →KRS01026_000249= (2*M↓wp,Rd←/s+4*M↓bT,NV,Rd←/l↓o←)*((h↓eff←+h↓s←-0.5*h↓c←)/(h↓eff←+2*e↓o←)) @REF("(SCI P355 (48))"); 
                    } 
                } 
            } 
            →KRS01026_000269PAGEBREAK(); 
            IF(DataExchange.Contains("N_wp_Rd")) { 
                →KRS01026_000270TEXT("Resistance governed by web-post buckling"); 
                IF(ABS(V↓wp,Ed←) &gt; ΔN↓cs,Rd←) { 
                    V↓Rd,N← →KRS01026_000271= (N↓wp,Rd←*(h↓o←/s)+4*M↓bT,NV,Rd←/l↓o←)/(1+h↓o←/h↓eff←)+ΔN↓cs,Rd←/s*(z↓t←+h↓s←-0.5*h↓c←) @REF("(SCI P355 (52))"); 
                } ELSE { 
                    V↓Rd,N← →KRS01026_000284= (N↓wp,Rd←*(h↓o←/s)+4*M↓bT,NV,Rd←/l↓o←)*((h↓eff←+h↓s←-0.5*h↓c←)/(h↓eff←+h↓o←+2*e↓o←)) @REF("(SCI P355 (53))"); 
                } 
                V↓Rd← →KRS18100_000004= MIN(V↓Rd,M←, V↓Rd,N←, V↓Rd,P←); 
            } ELSE { 
                V↓Rd← →KRS01026_000280= MIN(V↓Rd,M←, V↓Rd,P←); 
            } 
            IF(COMPARE(V↓Rd←, 0, 6) == 1) { 
                UC↓wp,Vz← →KRS01026_000251= (ABS(V↓Ed←)/V↓Rd←); 
            } ELSE { 
                UC↓wp,Vz← →KRS01026_000259= 999; 
            } 
            IF(IO.IsDrawing) { 
                IF(COMPARE(UC↓wp,Vz←, 1, 6) != 1) { 
                    →KRS01026_000252TEXT("≤ 1"); 
                    →KRS01026_000253TEXT("OK"); 
                    →KRS01026_000254TEXT("The vertical shear resistance of the section is adequate."); 
                } ELSE { 
                    →KRS01026_000255TEXT("&gt; 1"); 
                    →KRS01026_000256TEXT("NOT OK"); 
                    →KRS01026_000257TEXT("The vertical shear resistance of the section is not adequate."); 
                } 
                →KRS01026_000258PAGEBREAK(); 
            } 
        } ELSE { 
            UC↓wp,Vz← →KRS01026_000230= 0; 
        } 
    } 
    
    //---------------------------Private functions-----------------------------  
    private void Get_λ_one(out double λ↓1←) { 
        double π →KRS01026_000097= Math.PI; 
        λ↓1← →KRS01026_000099= π*SQRT(E/f↓y←) @REF("(BS EN 1993-1-1 §6.3.1.3)"); 
    } 
    
    private void Get_α(out double α) { 
        IF(DataExchange.bfabrication) { 
            →KRS01026_000128TEXT("Rolled section"); 
            →KRS01026_000130TEXT("=&gt;"); 
            →KRS01026_000124TEXT("Buckling curve b"); 
            →KRS01026_000126TEXT("=&gt;"); 
            double α →KRS01026_000120= 0.34 @REF("(EN 1993-1-1 §6.3.1.2(2))"); 
        } ELSE { 
            →KRS01026_000129TEXT("Welded section"); 
            →KRS01026_000131TEXT("=&gt;"); 
            →KRS01026_000125TEXT("Buckling curve c"); 
            →KRS01026_000127TEXT("=&gt;"); 
            double α →KRS01026_000122= 0.49 @REF("(EN 1993-1-1 §6.3.1.2(2))"); 
        } 
    } 
    
    private void Get_λ_rel(double λ↓1←, out double λ↓rel←) { 
        SWITCH(WPType) { 
            CASE 0 :  { //closely spaced
                SWITCH(WPAdjOpenShape) { 
                    CASE 0 :  { λ↓rel← →KRS01026_000106= (2.5*SQRT(s↓o←↑2←+h↓o←↑2←))/t↓w←*(1/λ↓1←) @REF("(SCI P355 (41))"); } //Rectangle
                    CASE 1 :  { λ↓rel← →KRS01026_000111= (1.75*SQRT(s↓o←↑2←+h↓o←↑2←))/t↓w←*(1/λ↓1←) @REF("(SCI P355 (40))"); } //Circle
                    CASE 4 :  { λ↓rel← →KRS01026_000158= (1.75*SQRT(s↓o←↑2←+h↓o←↑2←))/t↓w←*(1/λ↓1←) @REF("(SCI P355 (40))"); } //Elongated
                    DEFAULT :  { λ↓rel← →KRS01026_000157= 0; } 
                } 
            } 
            DEFAULT :  { //widely and isolated spaced
                SWITCH(WPAdjOpenShape) { 
                    CASE 0 :  { λ↓rel← →KRS01026_000163= (3.5*h↓o←)/t↓w←*(1/λ↓1←) @REF("(SCI P355 (38))"); } //Rectangle
                    CASE 1 :  { λ↓rel← →KRS01026_000164= (2.5*h↓o←)/t↓w←*(1/λ↓1←) @REF("(SCI P355 (37))"); } //Circle
                    CASE 4 :  { λ↓rel← →KRS01026_000165= (2.5*h↓o←)/t↓w←*(1/λ↓1←) @REF("(SCI P355 (37))"); } //Elongated
                    DEFAULT :  { λ↓rel← →KRS01026_000166= 0; } 
                } 
            } 
        } 
    } 
    
    private void Get_χ(double α, double λ↓rel←, out double χ) { 
        double Φ →KRS01026_000132= 0.5*(1+α*(λ↓rel←-0.2)+λ↓rel←↑2←) @REF("(EN 1993-1-1 §6.3.1.2(1))"); 
        χ →KRS01026_000135= MIN(1/(Φ+SQRT(Φ↑2←-λ↓rel←↑2←)), 1) @REF("(EN 1993-1-1 (6.49))"); 
    } 
    
    private void Get_bBuckling(double Limit, out bool bBucking) { 
        IF(h↓o←/t↓w← &lt;= Limit) { 
            →KRS01026_000147TEXT('h↓o←/t↓w←' &amp; " = " &amp; h↓o←/t↓w← &amp; " = " &amp; Val(h↓o←/t↓w←, -1) &amp; " ≤ " &amp; Limit &amp; " =&gt; "); 
            →KRS01026_000148TEXT("Web-post buckling effects can be ignored.") @REF("(SCI P355 (43))"); 
            bBucking →KRS01026_000149= false; 
        } ELSE { 
            →KRS01026_000150TEXT('h↓o←/t↓w←' &amp; " = " &amp; h↓o←/t↓w← &amp; " = " &amp; Val(h↓o←/t↓w←, -1) &amp; " &gt; " &amp; Limit &amp; " =&gt; "); 
            →KRS01026_000151TEXT("Web-post buckling effects has to be checked.") @REF("(SCI P355 (43))"); 
            bBucking →KRS01026_000152= true; 
        } 
    } 
    
    private void Get_Nwp_Rd(bool bBucking, double χ, out double N↓wp,Rd←) { 
        SWITCH(WPType) { 
            CASE 0 :  { //closely spaced
                N↓wp,Rd← →KRS01026_000137= χ*(s↓o←*t↓w←*f↓y←/γ↓M1←) @REF("(SCI P355 (42))"); 
            } 
            DEFAULT :  { //widely and isolated spaced
                N↓wp,Rd← →KRS01026_000180= χ*(0.5*h↓o←*t↓w←*f↓y←/γ↓M1←) @REF("(SCI P355 (39))"); 
            } 
        } 
    } 
    
    private void Get_V_Ed() { 
        IF(COMPARE(DataExchange.M_wp_Ed, 0, 6) == 0) { 
            →KRS18100_000018double&lt;kN,2&gt; V↓b,Ed←; 
            →KRS18100_000019double&lt;kN,2&gt; V↓t,Ed←; 
            →KRS18100_000020double&lt;kN,2&gt; V↓c,Ed←; 
            →KRS18100_000017Get_V_Ed(out V↓b,Ed←, out V↓t,Ed←, out V↓c,Ed←); 
        } 
    } 
    
    private void Get_V_Ed(out double V↓b,Ed←, out double V↓t,Ed←, out double V↓c,Ed←) { 
        →KRS01026_000192double&lt;kN,2&gt; V↓b,Rd← →KRS01026_000193= DataExchange.V_b_Rd; 
        →KRS01026_000194double&lt;kN,2&gt; V↓t,Rd← →KRS01026_000195= DataExchange.V_t_Rd; 
        →KRS01026_000196double&lt;kN,2&gt; V↓c,Rd← →KRS01026_000197= DataExchange.V_c_Rd; 
        
        V↓b,Ed← →KRS18100_000009= V↓Ed←*(V↓b,Rd←/(V↓b,Rd←+V↓t,Rd←+V↓c,Rd←)); 
        V↓t,Ed← →KRS18100_000010= V↓Ed←*(V↓t,Rd←/(V↓b,Rd←+V↓t,Rd←+V↓c,Rd←)); 
        V↓c,Ed← →KRS18100_000011= V↓Ed←*(V↓c,Rd←/(V↓b,Rd←+V↓t,Rd←+V↓c,Rd←)); 
        →KRS18100_000013DataExchange.Set("V_b_Ed", V↓b,Ed←); //Because it is needed in next checks
        →KRS18100_000014DataExchange.Set("V_t_Ed", V↓t,Ed←); //Because it is needed in next checks
        →KRS18100_000015DataExchange.Set("V_c_Ed", V↓c,Ed←); //Because it is needed in next checks
    } 
    
    //---------------------------Other private functions-----------------------------  
    private void LoadExternCLCs() { 
        →KRS00014_000825BLOCK { //Load extern CLC
            Functions_general →KRS00014_000035= LoadExternCLC(Tools.Dir_Forms &amp; "Composite\EC\EC_Functions\Functions_general.CLC"); 
            Functions_beff →KRS00014_001414= LoadExternCLC(Tools.Dir_Forms &amp; "Composite\EC\EC_Functions\Functions_Beff.CLC"); 
            Functions_NA →KRS00014_000588= LoadExternCLC(Tools.Dir_Forms &amp; "Composite\EC\EC_Functions\Functions_NA.CLC"); 
            Functions_properties →KRS00014_000814= LoadExternCLC(Tools.Dir_Forms &amp; "Composite\EC\EC_Functions\Functions_properties.CLC"); 
            object fontsColors →UNK00000_019243= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\FontsAndColors.CLC"); 
            FontsAndColors →UNK00000_019244= fontsColors.GetFontsAndColors(); 
        } 
    } 
    
    private void PrintStandardOutput() { 
        →KRS00014_002299BLOCK { //Hidden block
            object T →KRS00014_002300= new Table(4); 
            
            T[0][0].Value →KRS00014_002301= TR("Check"); 
            T[0][1].Value →KRS00014_002302= TR("Symbol"); 
            T[0][2].Value →KRS00014_002303= TR("Unity check"); 
            T[0][3].Value →KRS00014_002304= TR("Status"); 
            
            double r →KRS01026_000046= 1; 
            
            T[r][0].Value →KRS00014_002310= TR("Longitudinal shear"); 
            T[r][1].Value →KRS00014_002311= "UC↓wp,Vy←"; 
            T[r][2].Value →KRS00014_002312= UC↓wp,Vy←.ToString("0.00"); 
            →KRS01026_000047r++; 
            
            T[r][0].Value →KRS01026_000210= TR("Bending"); 
            T[r][1].Value →KRS01026_000211= "UC↓wp,M←"; 
            T[r][2].Value →KRS01026_000212= UC↓wp,M←.ToString("0.00"); 
            →KRS01026_000213r++; 
            
            T[r][0].Value →KRS01026_000183= TR("Buckling"); 
            T[r][1].Value →KRS01026_000184= "UC↓wp,N←"; 
            T[r][2].Value →KRS01026_000185= UC↓wp,N←.ToString("0.00"); 
            →KRS01026_000186r++; 
            
            IF(WPType == 0) { //only for closely spaced openings
                T[r][0].Value →KRS01026_000260= TR("Vertical shear"); 
                T[r][1].Value →KRS01026_000261= "UC↓wp,Vz←"; 
                T[r][2].Value →KRS01026_000262= UC↓wp,Vz←.ToString("0.00"); 
                →KRS01026_000263r++; 
            } 
            
            T.Font →KRS00014_002322= FontsAndColors.TableCellsFont(); 
            T.BorderPen →KRS00014_002323= FontsAndColors.TableBorderPen(); 
            T.GridPen →KRS00014_002324= FontsAndColors.TableGridPen(); 
            T[0].BorderPen →KRS00014_002325= FontsAndColors.TableBorderPen(); 
            T[0].Font →KRS00014_002326= FontsAndColors.TableHeaderFont(); 
            T.Padding.All →KRS00014_002327= 5; 
            T.Padding.Top →KRS00014_002328= 1; 
            T.Padding.Bottom →KRS00014_002329= 1; 
            //Column alignment
            T.Columns[2].Alignment →KRS00014_002330= ContentAlignment.MiddleCenter; 
            T.Columns[3].Alignment →KRS00014_002331= ContentAlignment.MiddleCenter; 
        } 
        →KRS00014_002332BLOCK { // visible block
            →KRS00014_002686DrawStatus(T, 1, UC↓wp,Vy←); 
            →KRS01026_000207DrawStatus(T, 2, UC↓wp,M←); 
            →KRS00014_002687DrawStatus(T, 3, UC↓wp,N←); 
            IF(WPType == 0) { →KRS01026_000264DrawStatus(T, 4, UC↓wp,Vz←); } 
        } 
        
        →KRS00014_002343T.Draw(); 
        →KRS00014_002344PAGEBREAK(); 
    } 
    
    private void DrawStatus(object T, double row, double UC) { 
        //set UC to bold if &gt; 1
        IF(COMPARE(UC, 1, 6) == 1) { 
            T[row][2].Font →KRS00014_002392= FontsAndColors.TableHeaderFont(); 
        } 
        
        //Add colored status OK/Not OK
        IF(COMPARE(UC, 1, 6) != 1) { 
            T[row][3].Value =  { →KRS00014_001590FontsAndColors.DrawGraphicsForCheckStatus(1); } 
        } ELSE { 
            T[row][3].Value =  { →KRS00014_001591FontsAndColors.DrawGraphicsForCheckStatus(0); } 
        } 
    } 
} 

//-----------------------------calculation----------------------------

→KRS00014_000043BLOCK { //standalone drawing of output
    IF(!IO.IsExternCLC) { 
        object Functions_general →KRS00014_001216= LoadExternCLC(Tools.Dir_Forms &amp; "Composite\EC\EC_Functions\Functions_general.CLC"); 
        object Functions_NA →KRS00014_001221= LoadExternCLC(Tools.Dir_Forms &amp; "Composite\EC\EC_Functions\Functions_NA.CLC"); 
        object DataExchange →KRS00014_000808= Functions_general.GetMemberDataStandalone(); // fill DataExchange for standalone
        double γ↓M0← →KRS00014_001218= Functions_NA.GetGammasSteel().γ_M0; 
        double γ↓M1← →KRS01026_000136= Functions_NA.GetGammasSteel().γ_M1; 
        →KRS00014_000960DataExchange.Set("γ_M0", γ↓M0←); 
        →KRS01026_000290DataExchange.Set("γ_M1", γ↓M1←); 
        
        →KRS00014_002903DataExchange.Set("P_Rd", 145000); 
        →KRS00014_002902DataExchange.Webposts[0].Set("WPAdjOpenShape", 0); 
        →KRS01026_000140DataExchange.Webposts[0].Set("WPType", 1); 
        
        double CN →KRS00014_001217= 3; 
        IF(DataExchange.bDrawAllOpenings) { 
            FOR(i, 0, DataExchange.Webposts.Count-1) { 
                object Webpost →KRS00014_001022= new WebpostsChecks(i, DataExchange); 
                
                →KRS01026_000001Webpost.WebpostChecks(out CN); 
            } 
        } ELSE { 
            object Webpost →KRS00014_003214= new WebpostsChecks(0, DataExchange); 
            →KRS01026_000002Webpost.WebpostChecks(out CN); 
        } 
    } 
} 
</SourceCode>
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
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 3 Bold" X="30" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" />
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|1|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="NormReference" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="NormReference" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="CN" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>CN</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DataExchange" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>DataExchange</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="Functions_general" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>Functions_general</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="Functions_NA" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>Functions_NA</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>i</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Webpost" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>Webpost</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="γ↓M0←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>γ↓M0←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓M1←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>γ↓M1←</ENU>
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
          <ENU>Standard</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Detailed</ENU>
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
      <VC ID="">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000035">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000036">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000043">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000588">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000605">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000808">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000814">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000825">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000960">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000972">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001014">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001016">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001022">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001104">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001105">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001106">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001107">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001163">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001164">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001165">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001166">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001167">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001168">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001175">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001216">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001217">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001218">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001221">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001235">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001266">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001267">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001291">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001292">
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001311">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001414">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001590">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001591">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002264">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002299">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002300">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002301">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002302">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002303">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002304">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002310">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002311">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002312">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002322">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002323">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002324">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002325">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002326">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002327">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002328">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002329">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002330">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002331">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002332">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002343">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002344">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002392">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002686">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002687">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002839">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002840">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002902">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002903">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002981">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003151">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003152">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_003159">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003213">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003214">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000003">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000004">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000013">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000014">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000021">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000022">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000023">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000024">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000025">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000026">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000027">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000031">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000032">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000033">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000035">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000037">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000038">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000039">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000042">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000043">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000046">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000047">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000050">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000051">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000052">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000053">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000056">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000057">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000058">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000059">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000060">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000061">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000062">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000063">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000064">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS01026_000068">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000070">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000072">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000074">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000075">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000077">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000078">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000080">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000082">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000084">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000089">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000096">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000097">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000099">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000106">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000111">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000115">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000120">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000122">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000123">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000124">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000125">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000126">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000127">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000128">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000129">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000130">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000131">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000132">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000133">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000135">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000136">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000137">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000140">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000146">
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS01026_000147">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000148">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000149">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000150">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000151">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000152">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000157">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000158">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000162">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000163">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000164">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000165">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000166">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000171">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000172">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000173">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000174">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000175">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000180">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000181">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000183">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000184">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000185">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000186">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000187">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000188">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000189">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000190">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000193">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000195">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000197">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000199">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000200">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000201">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000203">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000205">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000207">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000208">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000209">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000210">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000211">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000212">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000213">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000215">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000216">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000217">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000218">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000219">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000220">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000221">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000222">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000223">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000224">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000225">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000226">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000227">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000228">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000229">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000230">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000231">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000233">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000234">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000236">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000238">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000240">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000242">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000244">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000246">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000249">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000251">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000252">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000253">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000254">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000255">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000256">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000257">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000258">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000259">
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000260">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000261">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000262">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000263">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000264">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000265">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000266">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000268">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000269">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000270">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000271">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000273">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000276">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000277">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000280">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000284">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000285">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000287">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000288">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000289">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000290">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000293">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000294">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000295">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000297">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000299">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000301">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000303">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000009">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000011">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000012">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000013">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000014">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000015">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000016">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000021">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="UNK00000_019243">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK00000_019244">
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
    <Main Width="500">
      <TCustomLibrary Name="" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="British BS-EN">
        <Data>
          <Header>
            <PropertySet Symbol="Code" ESA_ID="EC_NA.Code" Unit="" Type="String" />
            <PropertySet Symbol="Index" ESA_ID="EC_NA.Index" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1990 - Name" ESA_ID="EC_1990.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1991.1.1 - Name" ESA_ID="EC_1991_1_1.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1991.1.2 - Name" ESA_ID="EC_1991_1_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1991.1.3 - Name" ESA_ID="EC_1991_1_3.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1991.1.3 - AnnexA" ESA_ID="EC_1991_1_3.AnnexA" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.3 - s↓k←" ESA_ID="EC_1991_1_3.s_k" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.3 - C↓esl←" ESA_ID="EC_1991_1_3.C_esl" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="Use_C_esl" Type="Bool" Unit="" />
                <StructMember Symbol="C_esl" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1991.1.3 - SnowRedi" ESA_ID="EC_1991_1_3.Snow_Redi" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.3 - C↓e←" ESA_ID="EC_1991_1_3.C_e" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.3 - C↓t←" ESA_ID="EC_1991_1_3.C_t" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.3 - μ↓1←" ESA_ID="EC_1991_1_3.μ_1_pitched" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.3 - Annex B" ESA_ID="EC_1991_1_3.Annex_B_5_3_4_3" Unit="" Type="Bool" />
            <PropertySet Symbol="EC 1991.1.3 - μ↓2←" ESA_ID="EC_1991_1_3.μ_2" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.3 - μ↓3,max←" ESA_ID="EC_1991_1_3.μ_3_max" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.3 - μ↓3←" ESA_ID="EC_1991_1_3.μ_3" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.3 - μ↓W←, l↓s←" ESA_ID="EC_1991_1_3.μ_W" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="μ_W_min" Type="Numeric" Unit="" />
                <StructMember Symbol="μ_W_max" Type="Numeric" Unit="" />
                <StructMember Symbol="l_s_min" Type="Numeric" Unit="m" />
                <StructMember Symbol="l_s_max" Type="Numeric" Unit="m" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1991.1.3 - Annex B" ESA_ID="EC_1991_1_3.Annex_B_5_3_6_3" Unit="" Type="Bool" />
            <PropertySet Symbol="EC 1991.1.3 - Annex B" ESA_ID="EC_1991_1_3.Annex_B_6_2_2" Unit="" Type="Bool" />
            <PropertySet Symbol="EC 1991.1.3 - Usage" ESA_ID="EC_1991_1_3.Usage_6_2_2" Unit="" Type="Bool" />
            <PropertySet Symbol="EC 1991.1.3 - k" ESA_ID="EC_1991_1_3.k" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.4 - Name" ESA_ID="EC_1991_1_4.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1991.1.4 - v↓m←" ESA_ID="EC_1991_1_4.v_m" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.4 - v↓b,0←" ESA_ID="EC_1991_1_4.v_b_0" Unit="m/s" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.4 - c↓dir←" ESA_ID="EC_1991_1_4.c_dir" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.4 - c↓season←" ESA_ID="EC_1991_1_4.c_season" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.4 - K, n" ESA_ID="EC_1991_1_4.K_n" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="K" Type="Numeric" Unit="" />
                <StructMember Symbol="n" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1991.1.4 - DesChar" ESA_ID="EC_1991_1_4.Des_Char" Unit="" Type="Bool" />
            <PropertySet Symbol="EC 1991.1.4 - c↓r←(z)" ESA_ID="EC_1991_1_4.c_r" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.4 - c↓O←" ESA_ID="EC_1991_1_4.c_O" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="OrtInBasic" Type="Bool" Unit="" />
                <StructMember Symbol="cO" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1991.1.4 - Use of A.4" ESA_ID="EC_1991_1_4.Use_A4" Unit="" Type="Bool" />
            <PropertySet Symbol="EC 1991.1.4 - Use A.5" ESA_ID="EC_1991_1_4.Use_A5" Unit="" Type="Bool" />
            <PropertySet Symbol="EC 1991.1.4 - k↓I←" ESA_ID="EC_1991_1_4.k_I" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.4 - q↓p←" ESA_ID="EC_1991_1_4.q_p" Unit="kPa" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.4 - ρ" ESA_ID="EC_1991_1_4.roo" Unit="kg/m↑3←" Type="Numeric" />
            <PropertySet Symbol="c↓s←c↓d←_sep" ESA_ID="EC_1991_1_4.cs_cd_sep" Unit="" Type="Bool" />
            <PropertySet Symbol="Use B" ESA_ID="EC_1991_1_4.Use_B" Unit="" Type="Bool" />
            <PropertySet Symbol="C↓pe←" ESA_ID="EC_1991_1_4.C_pe" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1991.1.5 - Name" ESA_ID="EC_1991_1_5.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1991.1.6 - Name" ESA_ID="EC_1991_1_6.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1991.1.7 - Name" ESA_ID="EC_1991_1_7.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1991.2 - Name" ESA_ID="EC_1991_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1991.3 - Name" ESA_ID="EC_1991_3.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1991.4 - Name" ESA_ID="EC_1991_4.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1992.1.1 - Name" ESA_ID="EC_1992_1_1.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1992.1.1 - γ↓SH←" ESA_ID="EC_1992_1_1.γ_SH" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - γ↓P,fav←" ESA_ID="EC_1992_1_1.γ_P_fav" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - γ↓P,unfav←" ESA_ID="EC_1992_1_1.γ_P_unfav" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - γ↓P,unfav,l←" ESA_ID="EC_1992_1_1.γ_P_unfav_l" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - Table 2.1N" ESA_ID="EC_1992_1_1.T_21N" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ_C_Per" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_SR_Per" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_SP_Per" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_C_Acc" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_SR_Acc" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_SP_Acc" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - γ↓Ser←" ESA_ID="EC_1992_1_1.γ_Ser" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ_C_Ser" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_S_Ser" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - C↓max←" ESA_ID="EC_1992_1_1.C_max" Unit="MPa" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - k↓t←" ESA_ID="EC_1992_1_1.k_t" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - α↓cc←" ESA_ID="EC_1992_1_1.α_cc" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - α↓ct←" ESA_ID="EC_1992_1_1.α_ct" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - f↓yk,max←" ESA_ID="EC_1992_1_1.f_yk_max" Unit="MPa" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - X*ε↓uk←" ESA_ID="EC_1992_1_1.X_ε_uk" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - k" ESA_ID="EC_1992_1_1.k" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - ε↓ud←" ESA_ID="EC_1992_1_1.ε_ud" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="X_ε_uk" Type="Numeric" Unit="" />
                <StructMember Symbol="ε_ud" Type="Numeric" Unit="" />
                <StructMember Symbol="f_p01k_fpk" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - c↓min,b,coef←" ESA_ID="EC_1992_1_1.c_min_b_coef" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="pre_strand_wire" Type="Numeric" Unit="" />
                <StructMember Symbol="pre_indented_wire" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - Δc↓dur,γ←" ESA_ID="EC_1992_1_1.Δc_dur_γ" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - Δc↓dur,st←" ESA_ID="EC_1992_1_1.Δc_dur_st" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - Δc↓dur,add←" ESA_ID="EC_1992_1_1.Δc_dur_add" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - Δc↓min,abr←" ESA_ID="EC_1992_1_1.Δc_min_abr" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="k_1" Type="Numeric" Unit="mm" />
                <StructMember Symbol="k_2" Type="Numeric" Unit="mm" />
                <StructMember Symbol="k_3" Type="Numeric" Unit="mm" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - Δc↓dev←" ESA_ID="EC_1992_1_1.Δ_c_dev0" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - Δc↓dev←" ESA_ID="EC_1992_1_1.Δc_dev" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="Δc_dev_min_acc" Type="Numeric" Unit="mm" />
                <StructMember Symbol="Δc_dev_min" Type="Numeric" Unit="mm" />
                <StructMember Symbol="Δc_dev_max" Type="Numeric" Unit="mm" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - c↓min,une←" ESA_ID="EC_1992_1_1.c_min_une" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="k_1" Type="Numeric" Unit="mm" />
                <StructMember Symbol="k_2" Type="Numeric" Unit="mm" />
                <StructMember Symbol="k_3" Type="Numeric" Unit="mm" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - θ↓0←" ESA_ID="EC_1992_1_1.θ_0" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - k↓lin←" ESA_ID="EC_1992_1_1.k_lin" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="k_1" Type="Numeric" Unit="" />
                <StructMember Symbol="k_2" Type="Numeric" Unit="" />
                <StructMember Symbol="k_3" Type="Numeric" Unit="" />
                <StructMember Symbol="k_4" Type="Numeric" Unit="" />
                <StructMember Symbol="k_5" Type="Numeric" Unit="" />
                <StructMember Symbol="k_6" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - λ↓lim←" ESA_ID="EC_1992_1_1.λ_lim" Unit="" Type="Numeric" />
            <PropertySet Symbol="γ↓cE←" ESA_ID="EC_1992_1_1.γ_cE" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - k↓5.10.2.1.1←" ESA_ID="EC_1992_1_1.k_5_10_2_1_1" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="k_1" Type="Numeric" Unit="" />
                <StructMember Symbol="k_2" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - k↓5.10.2.1.2←" ESA_ID="EC_1992_1_1.k_5_10_2_1_2" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - k↓5.10.2.2.4←" ESA_ID="EC_1992_1_1.k_5_10_2_2_4" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="k_4" Type="Numeric" Unit="%" />
                <StructMember Symbol="k_5" Type="Numeric" Unit="%" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - k↓5.10.2.2.5←" ESA_ID="EC_1992_1_1.k_5_10_2_2_5" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - k↓5.10.3.2←" ESA_ID="EC_1992_1_1.k_5_10_3_2" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="k_7" Type="Numeric" Unit="" />
                <StructMember Symbol="k_8" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - r↓sup,inf←" ESA_ID="EC_1992_1_1.r_sup_inf" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="r_sup_preten" Type="Numeric" Unit="" />
                <StructMember Symbol="r_inf_preten" Type="Numeric" Unit="" />
                <StructMember Symbol="r_sup_postten" Type="Numeric" Unit="" />
                <StructMember Symbol="r_inf_postten" Type="Numeric" Unit="" />
                <StructMember Symbol="r_sup_precise" Type="Numeric" Unit="" />
                <StructMember Symbol="r_inf_precise" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - C↓Rd,c←, v↓min←, k↓1←" ESA_ID="EC_1992_1_1.C_6_2_2_1" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="C_Rd_c" Type="Numeric" Unit="" />
                <StructMember Symbol="v_min" Type="Numeric" Unit="" />
                <StructMember Symbol="k_1" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - ν" ESA_ID="EC_1992_1_1.ν" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - θ" ESA_ID="EC_1992_1_1.θ" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="θ_min" Type="Numeric" Unit="rad" />
                <StructMember Symbol="θ_max" Type="Numeric" Unit="rad" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - ν↓1←_α↓cw←" ESA_ID="EC_1992_1_1.ν_1_α_cw" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="ν_1" Type="Numeric" Unit="" />
                <StructMember Symbol="α_cw" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - θ↓f,lim←" ESA_ID="EC_1992_1_1.θ_f_lim" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="θ_f_min_comp" Type="Numeric" Unit="°" />
                <StructMember Symbol="θ_f_max_comp" Type="Numeric" Unit="°" />
                <StructMember Symbol="θ_f_min_tens" Type="Numeric" Unit="°" />
                <StructMember Symbol="θ_f_max_tens" Type="Numeric" Unit="°" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - k↓6.2.4.6←" ESA_ID="EC_1992_1_1.k_6_2_4_6" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - β" ESA_ID="EC_1992_1_1.β" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="β_A" Type="Numeric" Unit="" />
                <StructMember Symbol="β_B" Type="Numeric" Unit="" />
                <StructMember Symbol="β_C" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - c↓Rd,c,punch←" ESA_ID="EC_1992_1_1.c_Rd_c_punch" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="c_Rd_c" Type="Numeric" Unit="" />
                <StructMember Symbol="ν_min" Type="Numeric" Unit="" />
                <StructMember Symbol="k_1" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - v↓Rd,max←" ESA_ID="EC_1992_1_1.v_Rd_max" Unit="MPa" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - ν↓strut←" ESA_ID="EC_1992_1_1.ν_strut" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - k↓6.5.4.4←" ESA_ID="EC_1992_1_1.k_6_5_4_4" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="k_1" Type="Numeric" Unit="" />
                <StructMember Symbol="k_2" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - k↓1←" ESA_ID="EC_1992_1_1.k_1" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - k↓2←" ESA_ID="EC_1992_1_1.k_2" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - k↓3←, k↓4←, k↓5←" ESA_ID="EC_1992_1_1.k_7_2_5" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="k_3" Type="Numeric" Unit="" />
                <StructMember Symbol="k_4" Type="Numeric" Unit="" />
                <StructMember Symbol="k_5" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - w↓max←" ESA_ID="EC_1992_1_1.w_max" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="Quasi_X0_XC1" Type="Numeric" Unit="mm" />
                <StructMember Symbol="Quasi_XC2_XC3_XC4" Type="Numeric" Unit="mm" />
                <StructMember Symbol="Quasi_XD1_XD2_XS1_XS2_XS3" Type="Numeric" Unit="mm" />
                <StructMember Symbol="Freq_X0_XC1" Type="Numeric" Unit="mm" />
                <StructMember Symbol="Freq_XC2_XC3_XC4" Type="Numeric" Unit="mm" />
                <StructMember Symbol="Freq_XD1_XD2_XS1_XS2_XS3" Type="Numeric" Unit="mm" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - k↓3←, k↓4←" ESA_ID="EC_1992_1_1.k_7_3_4_3" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="k_3" Type="Numeric" Unit="" />
                <StructMember Symbol="k_4" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - k↓8.2.2←" ESA_ID="EC_1992_1_1.k_8_2_2" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="k_1" Type="Numeric" Unit="" />
                <StructMember Symbol="k_2" Type="Numeric" Unit="mm" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - ϕ↓m,min←" ESA_ID="EC_1992_1_1.ϕ_m_min" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - F↓btd←" ESA_ID="EC_1992_1_1.F_btd" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - ϕ↓large←" ESA_ID="EC_1992_1_1.ϕ_large" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - A↓s,min←" ESA_ID="EC_1992_1_1.A_s_min" Unit="mm↑2←" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - A↓s,max←" ESA_ID="EC_1992_1_1.A_s_max" Unit="mm↑2←" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - β↓1←" ESA_ID="EC_1992_1_1.β_1" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - β↓2←" ESA_ID="EC_1992_1_1.β_2" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - β↓3←" ESA_ID="EC_1992_1_1.β_3" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - ρ↓w,min←" ESA_ID="EC_1992_1_1.ρ_w_min" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - s↓l,max←" ESA_ID="EC_1992_1_1.s_l_max" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - s↓b,max←" ESA_ID="EC_1992_1_1.s_b_max" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - s↓t,max←" ESA_ID="EC_1992_1_1.s_t_max" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - s↓max,slab←" ESA_ID="EC_1992_1_1.s_max_slab" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - ϕ↓min←" ESA_ID="EC_1992_1_1.ϕ_min" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - A↓s,min←" ESA_ID="EC_1992_1_1.A_s_min_det" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - A↓s,max←" ESA_ID="EC_1992_1_1.A_s_max_det" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - s↓cl,tmax←" ESA_ID="EC_1992_1_1.s_cl_tmax" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - A↓s,vmin← A↓s,vmax←" ESA_ID="EC_1992_1_1.A_sv" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - A↓s,hmin←" ESA_ID="EC_1992_1_1.A_s_hmin" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - A↓s,dbmin←" ESA_ID="EC_1992_1_1.A_s_dbmin" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - ϕ↓min←" ESA_ID="EC_1992_1_1.ϕ_min_pile" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - ϕ↓min←" ESA_ID="EC_1992_1_1.ϕ_min_gen" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - ϕ↓min←" ESA_ID="EC_1992_1_1.ϕ_min_tie" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - q↓1←" ESA_ID="EC_1992_1_1.q_1" Unit="kN/m" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - ϕ↓min←, q↓2←" ESA_ID="EC_1992_1_1.q_2" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="q_2" Type="Numeric" Unit="MPa" />
                <StructMember Symbol="ϕ_min" Type="Numeric" Unit="mm" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - h↓1←, A↓s,bpmin←" ESA_ID="EC_1992_1_1.h_1" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="h1" Type="Numeric" Unit="mm" />
                <StructMember Symbol="A↓s,bpmin←" Type="Numeric" Unit="mm↑2←" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - α↓cc,pl←, α↓ct,pl←" ESA_ID="EC_1992_1_1.α_cpl" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="α↓cc,pl←" Type="Numeric" Unit="" />
                <StructMember Symbol="α↓ct,pl←" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1992.1.1 - k" ESA_ID="EC_1992_1_1.k_12_6_3_2" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - k↓1←" ESA_ID="EC_1992_1_1.J3_k1" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.1 - k↓2←" ESA_ID="EC_1992_1_1.J3_k2" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1992.1.2 - Name" ESA_ID="EC_1992_1_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1992.2 - Name" ESA_ID="EC_1992_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1992.3 - Name" ESA_ID="EC_1992_3.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.1 - Name" ESA_ID="EC_1993_1_1.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.1 - f↓y← f↓u←" ESA_ID="EC_1993_1_1.f" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="f_y" Type="Numeric" Unit="MPa" />
                <StructMember Symbol="f_u" Type="Numeric" Unit="MPa" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1993.1.1 - γ↓M←" ESA_ID="EC_1993_1_1.γ_M" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ_M0" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M1" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M2" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1993.1.2 - Name" ESA_ID="EC_1993_1_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.3 - Name" ESA_ID="EC_1993_1_3.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.4 - Name" ESA_ID="EC_1993_1_4.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.5 - Name" ESA_ID="EC_1993_1_5.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.5 - η" ESA_ID="EC_1993_1_5.eta_sb1" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1993.1.6 - Name" ESA_ID="EC_1993_1_6.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.7 - Name" ESA_ID="EC_1993_1_7.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.8 - Name" ESA_ID="EC_1993_1_8.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.8 - γ↓M←" ESA_ID="EC_1993_1_8.γ_M" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ_M2" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M3" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M3_ser" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M4" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M5" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M6_ser" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M7" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1993.1.9 - Name" ESA_ID="EC_1993_1_9.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.10 - Name" ESA_ID="EC_1993_1_10.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.11 - Name" ESA_ID="EC_1993_1_11.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.1.12 - Name" ESA_ID="EC_1993_1_12.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.2 - Name" ESA_ID="EC_1993_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.2 - γ↓Mi←" ESA_ID="EC_1993_2.γ_Mi" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ_M0" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M1" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M2" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M3" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M3_ser" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M4" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M5" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M6_ser" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_M7" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1993.3.1 - Name" ESA_ID="EC_1993_3_1.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.3.2 - Name" ESA_ID="EC_1993_3_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.4.1 - Name" ESA_ID="EC_1993_4_1.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.4.2 - Name" ESA_ID="EC_1993_4_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.4.3 - Name" ESA_ID="EC_1993_4_3.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.5 - Name" ESA_ID="EC_1993_5.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1993.6 - Name" ESA_ID="EC_1993_6.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1994.1.1 - Name" ESA_ID="EC_1994_1_1.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1994.1.1 - γ↓P←" ESA_ID="EC_1994_1_1.γ_P" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ_P_fav" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_P_unfav" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1994.1.1 - γ↓V←" ESA_ID="EC_1994_1_1.γ_V_1" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - γ↓VS←" ESA_ID="EC_1994_1_1.γ_VS_1" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - γ↓Mf,s←" ESA_ID="EC_1994_1_1.γ_Mf_s_1" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - δ" ESA_ID="EC_1994_1_1.δ" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="δ_dry_nc" Type="Numeric" Unit="" />
                <StructMember Symbol="δ_dry_lc" Type="Numeric" Unit="" />
                <StructMember Symbol="δ_other_nc" Type="Numeric" Unit="" />
                <StructMember Symbol="δ_other_lc" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1994.1.1 - t↓min←" ESA_ID="EC_1994_1_1.t_min" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - h↓max←" ESA_ID="EC_1994_1_1.h_max" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - γ↓V←" ESA_ID="EC_1994_1_1.γ_V_2" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ_V1" Type="Numeric" Unit="" />
                <StructMember Symbol="γ_V2" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1994.1.1 - rec" ESA_ID="EC_1994_1_1.rec" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - 6.6.4.1" ESA_ID="EC_1994_1_1.6_6_4_1" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - γ↓Mf,s←" ESA_ID="EC_1994_1_1.γ_Mf_s_2" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - γ↓Ff←" ESA_ID="EC_1994_1_1.γ_Ff" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - (b↓r←/b↓s←)↓max←" ESA_ID="EC_1994_1_1.br_bs_max" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - δ↓s,max←" ESA_ID="EC_1994_1_1.δ_s_max" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - γ↓VS←" ESA_ID="EC_1994_1_1.γ_VS_2" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - γ↓VS←" ESA_ID="EC_1994_1_1.γ_VS_3" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - μ" ESA_ID="EC_1994_1_1.mu" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - γ↓V←" ESA_ID="EC_1994_1_1.γ_V_3" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.1 - γ↓VS←" ESA_ID="EC_1994_1_1.γ_VS_4" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1994.1.2 - Name" ESA_ID="EC_1994_1_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1994.2 - Name" ESA_ID="EC_1994_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1995.1.1 - Name" ESA_ID="EC_1995_1_1.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1995.1.1 - γ↓M←" ESA_ID="EC_1995_1_1.γ_M" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1995.1.1 - k↓cr←" ESA_ID="EC_1995_1_1.k_cr" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="Solid" Type="Numeric" Unit="" />
                <StructMember Symbol="Glued" Type="Numeric" Unit="" />
                <StructMember Symbol="Other" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1995.1.2 - Name" ESA_ID="EC_1995_1_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1995.2 - Name" ESA_ID="EC_1995_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1996.1.1 - Name" ESA_ID="EC_1996_1_1.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1996.1.1 - γ↓M←" ESA_ID="EC_1996_1_1.γ_M" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1996.1.1 - γ↓M←" ESA_ID="EC_1996_1_1.γ_M_ser" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1996.1.1 - M" ESA_ID="EC_1996_1_1.M" Unit="" Type="Numeric">
              <StructMembers>
                <StructMember Symbol="Cement" Type="Numeric" Unit="" />
                <StructMember Symbol="Lime" Type="Numeric" Unit="" />
                <StructMember Symbol="Sand" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1996.1.1 - Method" ESA_ID="EC_1996_1_1.Method" Unit="" Type="Bool">
              <StructMembers>
                <StructMember Symbol="I" Type="Bool" Unit="" />
                <StructMember Symbol="II" Type="Bool" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1996.1.1 - K↓E←" ESA_ID="EC_1996_1_1.K_E" Unit="" Type="Numeric" />
            <PropertySet Symbol="EC 1996.1.1 - Coef" ESA_ID="EC_1996_1_1.Coef" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="ϕ_unlim" Type="Numeric" Unit="" />
                <StructMember Symbol="shrinkage" Type="Numeric" Unit="mm/m" />
                <StructMember Symbol="α_t" Type="Numeric" Unit="10↑-6←/K" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1996.1.1 - t↓min←" ESA_ID="EC_1996_1_1.t_min" Unit="mm" Type="Numeric">
              <StructMembers>
                <StructMember Symbol="t_min_struct" Type="Numeric" Unit="mm" />
                <StructMember Symbol="t_min_ret" Type="Numeric" Unit="mm" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1996.1.2 - Name" ESA_ID="EC_1996_1_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1996.2 - Name" ESA_ID="EC_1996_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1996.3 - Name" ESA_ID="EC_1996_3.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1997.1 - Name" ESA_ID="EC_1997_1.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1997.1 - γ↓F←" ESA_ID="EC_1997_1.EQU.γF" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ↓G,dst←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓G,stb←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓Q,dst←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓Q,stb←" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1997.1 - γ↓M←" ESA_ID="EC_1997_1.EQU.γM" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ↓ϕ'←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓c'←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓cu←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓qu←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓γ←" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1997.1 - γ↓F←" ESA_ID="EC_1997_1.STRGEO.γF" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ↓G,dst,A1←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓G,stb,A1←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓Q,dst,A1←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓Q,stb,A1←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓G,dst,A2←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓G,stb,A2←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓Q,dst,A2←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓Q,stb,A2←" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1997.1 - γ↓M←" ESA_ID="EC_1997_1.STRGEO.γM" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ↓ϕ',M1←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓c',M1←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓cu,M1←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓qu,M1←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓γ,M1←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓ϕ',M2←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓c',M2←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓cu,M2←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓qu,M2←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓γ,M2←" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1997.1 - γ↓R←" ESA_ID="EC_1997_1.STRGEO.γR" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="γ↓R,v,R1←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓R,h,R1←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓R,v,R2←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓R,h,R2←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓R,v,R3←" Type="Numeric" Unit="" />
                <StructMember Symbol="γ↓R,h,R3←" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="EC 1997.2 - Name" ESA_ID="EC_1997_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1998.1 - Name" ESA_ID="EC_1998_1.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1998.2 - Name" ESA_ID="EC_1998_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1998.3 - Name" ESA_ID="EC_1998_3.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1998.4 - Name" ESA_ID="EC_1998_4.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1998.5 - Name" ESA_ID="EC_1998_5.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1998.6 - Name" ESA_ID="EC_1998_6.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1999.1.1 - Name" ESA_ID="EC_1999_1_1.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1999.1.2 - Name" ESA_ID="EC_1999_1_2.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1999.1.3 - Name" ESA_ID="EC_1999_1_3.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1999.1.4 - Name" ESA_ID="EC_1999_1_4.Name" Unit="" Type="String" />
            <PropertySet Symbol="EC 1999.1.5 - Name" ESA_ID="EC_1999_1_5.Name" Unit="" Type="String" />
          </Header>
          <Items>
            <Item>
              <P>Eurocode NA</P>
              <P>British BS-EN</P>
              <P>BS</P>
              <P>3</P>
              <P>BS EN 1990</P>
              <P>BS EN 1991-1-1</P>
              <P>BS EN 1991-1-2</P>
              <P>BS EN 1991-1-3</P>
              <P>0</P>
              <P>NaN</P>
              <P>True;2;</P>
              <P>NaN</P>
              <P>1.0</P>
              <P>1.0</P>
              <P>NaN</P>
              <P>True</P>
              <P>2.0</P>
              <P>2.0</P>
              <P>NaN</P>
              <P>NaN;NaN;5;15;</P>
              <P>True</P>
              <P>True</P>
              <P>True</P>
              <P>NaN</P>
              <P>BS EN 1991-1-4</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>0.2;0.5;</P>
              <P>False</P>
              <P>NaN</P>
              <P>False;1;</P>
              <P>True</P>
              <P>True</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>1.226</P>
              <P>True</P>
              <P>True</P>
              <P>NaN</P>
              <P>BS EN 1991-1-5</P>
              <P>BS EN 1991-1-6</P>
              <P>BS EN 1991-1-7</P>
              <P>BS EN 1991-2</P>
              <P>BS EN 1991-3</P>
              <P>BS EN 1991-4</P>
              <P>BS EN 1992-1-1/NA: 2005-12</P>
              <P>1</P>
              <P>0.9</P>
              <P>1.1</P>
              <P>1.2</P>
              <P>1.5;1.15;1.15;1.2;1.0;1.0;</P>
              <P>1;1;</P>
              <P>90</P>
              <P>1</P>
              <P>NaN</P>
              <P>1</P>
              <P>600</P>
              <P>0.9</P>
              <P>1.1</P>
              <P>0.9;0.02;0.9;</P>
              <P>1.5;2.5;</P>
              <P>0</P>
              <P>0</P>
              <P>0</P>
              <P>5;10;15;</P>
              <P>10</P>
              <P>0;5;10;</P>
              <P>40;65;5;</P>
              <P>0.005</P>
              <P>0.4;NaN;0.4;NaN;0.7;0.8;</P>
              <P>NaN</P>
              <P>1.2</P>
              <P>0.8;0.9;</P>
              <P>0.95</P>
              <P>50;30;</P>
              <P>0.7</P>
              <P>0.75;0.85;</P>
              <P>1.05;0.95;1.1;0.9;1;1;</P>
              <P>NaN;NaN;0.15;</P>
              <P>NaN</P>
              <P>0.380482;0.785398;</P>
              <P>NaN;NaN;</P>
              <P>26.5;45;38.6;45;</P>
              <P>0.4</P>
              <P>1.15;1.4;1.5;</P>
              <P>NaN;NaN;0.1;</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>1;0.85;</P>
              <P>0.6</P>
              <P>0.45</P>
              <P>0.8;1;0.75;</P>
              <P>0.3;0.3;0.3;0.2;0.2;0.2;</P>
              <P>3.4;0.425;</P>
              <P>1;5;</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>40</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>0.25</P>
              <P>0.25</P>
              <P>0.5</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>12</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>8</P>
              <P>8</P>
              <P>8</P>
              <P>10</P>
              <P>5;8;</P>
              <P>600;NaN;</P>
              <P>0.8;0.8;</P>
              <P>1.5</P>
              <P>0.25</P>
              <P>0.5</P>
              <P>BS EN 1992-1-2</P>
              <P>BS EN 1992-2</P>
              <P>BS EN 1992-3</P>
              <P>BS EN 1993-1-1</P>
              <P>NaN;NaN;</P>
              <P>1;1;1.10;</P>
              <P>BS EN 1993-1-2</P>
              <P>BS EN 1993-1-3</P>
              <P>BS EN 1993-1-4</P>
              <P>BS EN 1993-1-5</P>
              <P>1.2</P>
              <P>BS EN 1993-1-6</P>
              <P>BS EN 1993-1-7</P>
              <P>BS EN 1993-1-8</P>
              <P>1.25;1.25;1.1;1.0;1.0;1.0;1.1;</P>
              <P>BS EN 1993-1-9</P>
              <P>BS EN 1993-1-10</P>
              <P>BS EN 1993-1-11</P>
              <P>BS EN 1993-1-12</P>
              <P>BS EN 1993-2</P>
              <P>1.0;1.1;1.25;1.25;1.1;1.1;1.1;1.0;1.1;</P>
              <P>BS EN 1993-3-1</P>
              <P>BS EN 1993-3-2</P>
              <P>BS EN 1993-4-1</P>
              <P>BS EN 1993-4-2</P>
              <P>BS EN 1993-4-3</P>
              <P>BS EN 1993-5</P>
              <P>BS EN 1993-6</P>
              <P>BS EN 1994-1-1</P>
              <P>1;1;</P>
              <P>1.25</P>
              <P>1.25</P>
              <P>1</P>
              <P>0.000325;0.000500;0.000200;0.000300;</P>
              <P>0.70</P>
              <P>NaN</P>
              <P>1.25;1.25;</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>1.0</P>
              <P>1.0</P>
              <P>0.6</P>
              <P>180</P>
              <P>1.25</P>
              <P>1.25</P>
              <P>0.5</P>
              <P>1.25</P>
              <P>1.25</P>
              <P>BS EN 1994-1-2</P>
              <P>BS EN 1994-2</P>
              <P>BS EN 1995-1-1</P>
              <P>NaN</P>
              <P>0.67;0.67;1.0;</P>
              <P>BS EN 1995-1-2</P>
              <P>BS EN 1995-2</P>
              <P>BS EN 1996-1-1</P>
              <P>NaN</P>
              <P>1</P>
              <P>NaN</P>
              <P>True</P>
              <P>1000</P>
              <P>NaN;NaN;NaN;</P>
              <P>NaN</P>
              <P>BS EN 1996-1-2</P>
              <P>BS EN 1996-2</P>
              <P>BS EN 1996-3</P>
              <P>BS EN 1997-1</P>
              <P>1.1;0.9;1.5;0;</P>
              <P>1.25;1.25;1.4;1.4;1.0;</P>
              <P>1.35;1;1.5;0;1;1;1.3;0;</P>
              <P>1;1;1;1;1;1.25;1.25;1.4;1.4;1;</P>
              <P>1;1;1.4;1.1;1;1;</P>
              <P>BS EN 1997-2</P>
              <P>BS EN 1998-1</P>
              <P>BS EN 1998-2</P>
              <P>BS EN 1998-3</P>
              <P>BS EN 1998-4</P>
              <P>BS EN 1998-5</P>
              <P>BS EN 1998-6</P>
              <P>BS EN 1999-1-1</P>
              <P>BS EN 1999-1-2</P>
              <P>BS EN 1999-1-3</P>
              <P>BS EN 1999-1-4</P>
              <P>BS EN 1999-1-5</P>
            </Item>
          </Items>
        </Data>
      </TCustomLibrary>
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="STRING_347A34E7">
      <ENU>"Unity check"</ENU>
    </Item>
    <Item TranslateID="STRING_6544AC02">
      <ENU>"Full shear connection"</ENU>
    </Item>
    <Item TranslateID="STRING_6921AA41">
      <ENU>"Partial shear connection"</ENU>
    </Item>
    <Item TranslateID="STRING_6F45EF7A">
      <ENU>"Check"</ENU>
    </Item>
    <Item TranslateID="STRING_71D1ED1F">
      <ENU>"Buckling"</ENU>
    </Item>
    <Item TranslateID="STRING_89F38C9E">
      <ENU>"Bending"</ENU>
    </Item>
    <Item TranslateID="STRING_A6E9FB40">
      <ENU>"Longitudinal shear"</ENU>
    </Item>
    <Item TranslateID="STRING_CB914422">
      <ENU>"Vertical shear"</ENU>
    </Item>
    <Item TranslateID="STRING_D4036A25">
      <ENU>"Web-post"</ENU>
    </Item>
    <Item TranslateID="STRING_D5DBECED">
      <ENU>"Status"</ENU>
    </Item>
    <Item TranslateID="STRING_E183C52F">
      <ENU>"Symbol"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_000972">
      <ENU>sconstr_stage &amp; " " &amp; WPName</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001014">
      <ENU>"The shear resistance of the section is adequate."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001016">
      <ENU>"The shear resistance of the section is not adequate."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001104">
      <ENU>"OK"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_001105">
      <ENU>"≤ 1"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_001106">
      <ENU>"&gt; 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001107">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001163">
      <ENU>"Web-post check is OK."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001164">
      <ENU>"Web-post check is NOT OK."</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_001165">
      <ENU>"≤ 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001166">
      <ENU>"OK"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_001167">
      <ENU>"&gt; 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001168">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_001292">
      <ENU>CN &amp; "." &amp; SCN &amp; " " &amp; sText</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_002840">
      <ENU>CN &amp; "." &amp; SCN &amp; " " &amp; sText</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000051">
      <ENU>CN &amp; "." &amp; SCN &amp; " " &amp; sText</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000056">
      <ENU>"≤ 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000057">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000058">
      <ENU>"The buckling resistance of the section is adequate."</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000059">
      <ENU>"&gt; 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000060">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000061">
      <ENU>"The buckling resistance of the section is not adequate."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000124">
      <ENU>"Buckling curve b"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000125">
      <ENU>"Buckling curve c"</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000126">
      <ENU>"=&gt;"</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000127">
      <ENU>"=&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000128">
      <ENU>"Rolled section"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000129">
      <ENU>"Welded section"</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000130">
      <ENU>"=&gt;"</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000131">
      <ENU>"=&gt;"</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000147">
      <ENU>'h↓o←/t↓w←' &amp; " = " &amp; h↓o←/t↓w← &amp; " = " &amp; Val(h↓o←/t↓w←, -1) &amp; " ≤ " &amp; Limit &amp; " =&gt; "</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000148">
      <ENU>"Web-post buckling effects can be ignored."</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000150">
      <ENU>'h↓o←/t↓w←' &amp; " = " &amp; h↓o←/t↓w← &amp; " = " &amp; Val(h↓o←/t↓w←, -1) &amp; " &gt; " &amp; Limit &amp; " =&gt; "</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000151">
      <ENU>"Web-post buckling effects has to be checked."</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000188">
      <ENU>CN &amp; "." &amp; SCN &amp; " " &amp; sText</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000218">
      <ENU>"≤ 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000219">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000220">
      <ENU>"The bending resistance of the section is adequate."</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000221">
      <ENU>"&gt; 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000222">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000223">
      <ENU>"The bending resistance of the section is not adequate."</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000226">
      <ENU>CN &amp; "." &amp; SCN &amp; " " &amp; sText</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000252">
      <ENU>"≤ 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000253">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000254">
      <ENU>"The vertical shear resistance of the section is adequate."</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000255">
      <ENU>"&gt; 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000256">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000257">
      <ENU>"The vertical shear resistance of the section is not adequate."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000268">
      <ENU>"Resistance governed by web-post bending"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000270">
      <ENU>"Resistance governed by web-post buckling"</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000288">
      <ENU>"V↓wp,Ed← &gt; ΔN↓cs,Rd← =&gt; " &amp; ABS(V↓wp,Ed←) &amp; " &gt; " &amp; ΔN↓cs,Rd← &amp; " =&gt; " &amp; PS</ENU>
    </Item>
    <Item ID="TEXT_KRS01026_000289">
      <ENU>"V↓wp,Ed← ≤ ΔN↓cs,Rd← =&gt; " &amp; ABS(V↓wp,Ed←) &amp; " ≤ " &amp; ΔN↓cs,Rd← &amp; " =&gt; " &amp; FS</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS01026_000295">
      <ENU>"Resistance governed by perforated section"</ENU>
    </Item>
  </Texts>
</Root>