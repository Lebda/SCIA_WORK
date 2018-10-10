<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="170001" GUID="c2743f51-c641-4a38-9cf2-b3351bb500a5">
  <CodeEditor>
    <SourceCode Collapsed="81|153|192|277|351|601|802|833|852|869|880|928|942|953" BreakPoints="">//EC_CompositeBeam_ULS_Final.cls

class ULSFinalStageCheckOpening { 
    
    //--------------------------variables------------------------------------
    //ExternalCLC
    →KRS00014_000815object Functions_general; 
    →KRS00014_000816object Functions_NA; 
    →KRS00014_000817object Functions_properties; 
    →KRS00014_001415object Functions_beff; 
    →KRS00014_000818object FontsAndColors; 
    →KRS00014_000824object DataExchange; //Structure with all variables

    //Additional data for drawings
    →KRS00014_000616double SizeDrawings; 
    →KRS00014_000617double UserDimFont; 
    →KRS00014_001108double CN; 
    
    //Variables used during calculation
    →KRS00014_001194object Properties; 
    //section
    →KRS00014_002745double&lt;mm,0&gt; h; 
    →KRS00014_001010double&lt;mm,0&gt; h↓w←; 
    →KRS00014_002746double&lt;mm,0&gt; b↓f←; 
    →KRS00014_002747double&lt;mm,0&gt; t↓f←; 
    →KRS00014_002748double&lt;mm,0&gt; t↓w←; 
    →KRS00014_002749double&lt;mm,0&gt; r; 
    →KRS00014_002756double&lt;mm↑2←,0&gt; A↓a←; 
    →KRS00014_002757double&lt;mm↑3←,0&gt; W↓pl,y←; 
    →KRS00014_002758double&lt;MPa,0&gt; f↓yb←; 
    →GMP01026_000860double&lt;MPa,0&gt; f↓ub←; 
    →GMP01026_000857double&lt;mm,0&gt; dx_span; 
    
    //Opening
    →KRS00014_002800double WOShape; 
    →KRS00014_002801double&lt;mm,0&gt; h↓o←; 
    →KRS00014_002802double&lt;mm,0&gt; l↓o←; 
    →KRS18100_000008double&lt;mm,0&gt; d↓o←; 
    →KRS00014_002803double&lt;mm,0&gt; e↓o←; 
    →KRS00014_003126double&lt;mm,0&gt; s↓e←; 
    →KRS00014_003130double&lt;mm,0&gt; x; 
    →GMP01026_000849double&lt;mm,0&gt; HS_offset; 
    →GMP01026_000850double&lt;mm,0&gt; HS_tr; 
    →GMP01026_000851double HS_type; 
    →GMP01026_000852double&lt;mm,0&gt; HS_br; 
    →GMP01026_000853double&lt;MPa,0&gt; HS_fy; 
    →GMP01026_000854double&lt;MPa,0&gt; HS_fu; 
    →GMP01026_000855double&lt;mm,0&gt; HS_weld_a; 
    →GMP01026_000856bool bHS; 
    →GMP01026_000839double&lt;mm,0&gt; HS_lv; 
    →GMP01026_000863double&lt;mm,0&gt; MinSpacing; 
    →GMP01026_000862bool bfabrication; 
    →KRS18100_000015string WOName; 
    
    //NA values  
    →KRS00014_001212double γ↓M0←; 
    →KRS01026_000071double γ↓M2←; 
    →KRS00014_001213double γ↓C←; 
    →KRS00014_001214double η↓sb←; 
    
    //Slab nad reinf
    →KRS00014_002810double&lt;mm,0&gt; h↓s←; 
    →KRS00014_002811double&lt;mm,0&gt; h↓c←; 
    →KRS00014_002812double&lt;MPa,0&gt; f↓ck←; 
    →KRS00014_002859bool bfabrication; 
    
    →KRS00014_002889double&lt;m,0&gt; L↓e←; 
    →KRS00014_002898double n↓sc←; 
    →KRS00014_003071double n↓r←; 
    →KRS00014_003067double&lt;mm,0&gt; s; 
    →KRS00014_002899double&lt;kN,0&gt; P↓Rd←; 
    →KRS00014_002995double ε; 
    
    //results
    →KRS00014_001001double&lt;,-2&gt; UC↓fin,ULS,o←; //Unity check of ULS final stage
    →KRS00014_001290double&lt;,-2&gt; UC↓fin,M,o←; 
    →KRS00014_001002double&lt;,-2&gt; UC↓fin,V,o←; 
    →KRS00014_001606double&lt;,-2&gt; UC↓fin,VB,o←; 
    →KRS00014_001626double&lt;,-2&gt; UC↓fin,SB,o←; 
    
    //-----------------------------------Constructor-------------------------
    public void ULSFinalStageCheckOpening(double i, object _DataExchange) { 
        DataExchange →KRS00014_000003= _DataExchange; 
        →KRS00014_000036LoadExternCLCs(); 
        
        //Additional data for drawings
        SizeDrawings →KRS00014_000625= _DataExchange.Get("SizeDrawings"); 
        UserDimFont →KRS00014_000626= _DataExchange.Get("UserDimFont"); 
        CN →KRS00014_001175= _DataExchange.Get("CN"); 
        
        //Variables used during calculation
        Properties →KRS00014_001189= new Functions_properties.→KRS00014_001190Properties(DataExchange); 
        
        //Opening parameters adding to main DataExchange from array
        →KRS00014_003213Functions_general.SetOpeningPropsToDataExchange(i, DataExchange); 
        
        IF(_DataExchange.bULS_Fin_Loads) { 
            //section
            h →KRS00014_002750= _DataExchange.h_a; 
            b↓f← →KRS00014_002751= _DataExchange.b; 
            t↓f← →KRS00014_002752= _DataExchange.t_f; 
            t↓w← →KRS00014_002753= _DataExchange.t_w; 
            r →KRS00014_002754= _DataExchange.r; 
            h↓w← →KRS00014_002755= h-2*t↓f←; 
            A↓a← →KRS00014_002759= _DataExchange.A_a; 
            W↓pl,y← →KRS00014_002760= _DataExchange.Wpl_y; 
            f↓yb← →KRS00014_002761= _DataExchange.f_yb; 
            f↓ub← →GMP01026_000859= _DataExchange.f_ub; 
            dx_span →GMP01026_000858= _DataExchange.dx_span; 
            
            //opening
            WOShape →KRS00014_002805= _DataExchange.WOShape; 
            h↓o← →KRS00014_002806= _DataExchange.ho; 
            l↓o← →KRS00014_002807= _DataExchange.lo; 
            e↓o← →KRS00014_002808= _DataExchange.eo; 
            s↓e← →KRS00014_002809= _DataExchange.se; 
            x →KRS00014_003131= _DataExchange.x_opening; 
            d↓o← →KRS18100_000009= _DataExchange.d_x_opening; 
            HS_offset →GMP01026_000830= _DataExchange.HS_offset; 
            HS_tr →GMP01026_000831= _DataExchange.HS_tr; 
            HS_type →GMP01026_000832= _DataExchange.HS_type; 
            HS_br →GMP01026_000833= _DataExchange.HS_br; 
            HS_fy →GMP01026_000834= _DataExchange.HS_fy; 
            HS_fu →GMP01026_000835= _DataExchange.HS_fu; 
            HS_weld_a →GMP01026_000836= _DataExchange.HS_weld_a; 
            bHS →GMP01026_000837= _DataExchange.bHS; 
            HS_lv →GMP01026_000838= _DataExchange.HS_lv; 
            MinSpacing →GMP01026_000861= _DataExchange.MinSpacing; 
            bfabrication →GMP01026_000864= _DataExchange.bfabrication; 
            WOName →KRS18100_000014= _DataExchange.WOName; 
            
            //NA values
            γ↓M0← →KRS00014_000600= _DataExchange.γ_M0; 
            γ↓M2← →KRS01026_000070= _DataExchange.γ_M2; 
            γ↓C← →KRS00014_000601= _DataExchange.γ_C; 
            η↓sb← →KRS00014_000612= _DataExchange.η_sb; 
            
            L↓e← →KRS00014_002890= _DataExchange.L; 
            n↓sc← →KRS00014_002900= _DataExchange.N_studsTo_opening; 
            n↓r← →KRS00014_003072= _DataExchange.n_r; 
            s →KRS00014_003068= _DataExchange.rib_dir == 0 ? _DataExchange.LongSpacing : _DataExchange.b_s*_DataExchange.trough; 
            P↓Rd← →KRS00014_002901= _DataExchange.P_Rd; 
            ε →KRS00014_002994= SQRT(235/CUnit(f↓yb←, "MPa")); 
            
            //Slab and reinf 
            h↓s← →KRS00014_002813= _DataExchange.h_s; 
            h↓c← →KRS00014_002814= _DataExchange.h_s-_DataExchange.h_p-_DataExchange.h_d; //height of full concrete
            f↓ck← →KRS00014_002815= _DataExchange.f_ck; 
            bfabrication →KRS00014_002860= _DataExchange.bfabrication; 
        } 
    } 
    
    //---------------------------Public functions----------------------------
    public void ULSFinStageCheckOpening(out double CN) { 
        //Subchapter numbering
        double SCN →KRS00014_000605= 0; 
        //→KRS00014_001234CN++; 
        string sconstr_stage →KRS00014_001235= TR("Opening"); 
        →KRS00014_000972TEXT(sconstr_stage &amp; " " &amp; WOName); 
        IF(DataExchange.bULS_Fin_Loads) { 
            
            //Detailed output
            →KRS00014_002789Properties.PrintDesignValuesOfLoadsInOpening(2); 
            IF(bHS) { →GMP01026_000780CheckStiffenedOpenings(); } 
            
            →KRS00014_002799PAGEBREAK(); 
            →KRS00014_002816SCN++; →KRS00014_002817GlobalBending(CN, SCN, out UC↓fin,M,o←); 
            →KRS00014_002841SCN++; →KRS00014_002842VerticalShear(CN, SCN, out UC↓fin,V,o←); 
            →KRS00014_002968SCN++; →KRS00014_002969VierendeelBending(CN, SCN, out UC↓fin,VB,o←); 
            →KRS00014_003090SCN++; →KRS00014_003091ShearBuckling(CN, SCN, out UC↓fin,SB,o←); 
            
            string sText →KRS00014_001311= TR("Unity check"); 
            →KRS00014_001291SCN++; →KRS00014_001292TEXT(CN &amp; "." &amp; SCN &amp; " " &amp; sText); 
            UC↓fin,ULS,o← →KRS00014_001267= MAX(UC↓fin,M,o←, UC↓fin,V,o←, UC↓fin,VB,o←, UC↓fin,SB,o←); 
            IF(COMPARE(UC↓fin,ULS,o←, 1, 6) != 1) { 
                →KRS00014_001165TEXT("≤ 1"); 
                →KRS00014_001166TEXT("OK"); 
                →KRS00014_001163TEXT("ULS check of Final stage is OK."); 
            } ELSE { 
                →KRS00014_001167TEXT("&gt; 1"); 
                →KRS00014_001168TEXT("NOT OK"); 
                →KRS00014_001164TEXT("ULS check of Final stage is NOT OK."); 
            } 
            
            //Standard output (table of UC)
            →KRS00014_002264PrintStandardOutput(); 
        } ELSE { 
            →KRS00014_002368Functions_general.AddEWN(DataExchange, "N/08"); 
        } 
        →KRS00014_001266PAGEBREAK(); 
    } 
    
    public void CheckStiffenedOpenings() { 
        →KRS01026_000092double A↓r←; 
        
        
        →GMP01026_000187BLOCK { 
            →KRS01026_000099double DistanceToTopFlange →GMP01026_000787= (h-h↓o←)/2-e↓o←-t↓f←-HS_offset-(HS_tr/2); 
            →KRS01026_000100double DistanceToBotFlange →GMP01026_000788= (h-h↓o←)/2+e↓o←-t↓f←-HS_offset-(HS_tr/2); 
            →KRS01026_000091Get_Ar(out A↓r←); 
            →KRS01026_000097double F↓r← →GMP01026_000806= (A↓r←*HS_fy)/γ↓M0←; 
            →KRS01026_000098double β↓w← →GMP01026_000817= Get_Beta_w(); 
            double f↓vw,d← →GMP01026_000816= (MIN(HS_fu, f↓ub←)/SQRT(3))/(β↓w←*γ↓M2←); 
            IF(HS_type == 0) { // Single sided only
                double lv_condition_a →GMP01026_000807= F↓r←/(2*1*HS_weld_a); 
                double lv_condition_b →GMP01026_000811= F↓r←/((1*HS_tr*HS_fy)/(γ↓M0←*SQRT(3))); 
                double lv_condition_c →GMP01026_000813= F↓r←/((2*1*t↓w←*HS_fy)/(γ↓M0←*SQRT(3))); 
            } ELSE { 
                double lv_condition_a →GMP01026_000810= F↓r←/(2*2*HS_weld_a); 
                double lv_condition_b →GMP01026_000812= F↓r←/((2*HS_tr*HS_fy)/(γ↓M0←*SQRT(3))); 
                double lv_condition_c →GMP01026_000814= F↓r←/((2*2*t↓w←*HS_fy)/(γ↓M0←*SQRT(3))); 
            } 
            bool bAreaOfTheStiffener_OK →GMP01026_000789= (COMPARE(A↓r←, (0.5*h↓o←*t↓w←), 6) != 1); 
            bool bDistanceToFlange_OK →GMP01026_000790= (COMPARE(MIN(DistanceToTopFlange, DistanceToBotFlange), PhysConst(50, "mm"), 6) != -1); 
            bool bMinOffset_OK →GMP01026_000791= (COMPARE(HS_offset, PhysConst(8, "mm"), 6) != -1); 
            bool bWeldThroat_OK →GMP01026_000792= (COMPARE(HS_weld_a, MAX(PhysConst(5, "mm"), 0.5*HS_tr)) != -1); 
            IF(COMPARE(dx_span+d↓o←, L↓e←-(dx_span+d↓o←), 6) != 1) { 
                bool bDistanceToSupport_OK →GMP01026_000796= (COMPARE((d↓o←-l↓o←/2+dx_span), MAX(l↓o←, h), 6) != -1); //from left
            } ELSE { 
                bool bDistanceToSupport_OK →KRS18100_000007= (COMPARE((L↓e←-(dx_span+d↓o←)-l↓o←/2), MAX(l↓o←, h), 6) != -1); //from right
            } 
            bool bStudSpacing_OK →GMP01026_000797= (COMPARE(MinSpacing, PhysConst(300, "mm"), 6) != 1); 
            bool bLengthOfOpening_OK →GMP01026_000794= (COMPARE(l↓o←, 2.5*h↓o←, 6) != 1); 
            IF(HS_type == 0) { // Single sided only
                bool bThicknessOfStiffener_OK →GMP01026_000800= (COMPARE(HS_tr, PhysConst(8, "mm"), 6) != -1 &amp;&amp; COMPARE(HS_tr, PhysConst(20, "mm"), 6) != 1 &amp;&amp; COMPARE((HS_tr/t↓w←), MIN(0.96*(HS_lv/2*HS_br), 1.0), 6) != 1); 
                bool bAnchorageLength_OK →GMP01026_000865= (COMPARE(HS_lv, MAX(0.25*l↓o←, 2*HS_br, PhysConst(150, "mm"), lv_condition_a, lv_condition_b, lv_condition_c), 6) != -1); 
                IF(bfabrication) { // Fabricated
                    bool bWidthOfStiffener_OK →GMP01026_000801= (COMPARE(HS_br, MAX(PhysConst(80, "mm"), (l↓o←/6)), 6) != -1 &amp;&amp; COMPARE(HS_br, MIN(PhysConst(200, "mm"), 10*HS_tr*ε), 6) != 1); 
                } ELSE { // Rolled
                    bool bWidthOfStiffener_OK →GMP01026_000802= (COMPARE(HS_br, MAX(PhysConst(80, "mm"), (l↓o←/4)), 6) != -1 &amp;&amp; COMPARE(HS_br, MIN(PhysConst(200, "mm"), 10*HS_tr*ε), 6) != 1); 
                } 
            } ELSE { 
                bool bThicknessOfStiffener_OK →GMP01026_000793= (COMPARE(HS_tr, PhysConst(8, "mm"), 6) != -1 &amp;&amp; COMPARE(HS_tr, PhysConst(20, "mm"), 6) != 1); 
                bool bAnchorageLength_OK →GMP01026_000798= (COMPARE(HS_lv, MAX(0.25*l↓o←, 2*HS_br, PhysConst(150, "mm"), lv_condition_a, lv_condition_b, lv_condition_c), 6) != -1); 
                bool bWidthOfStiffener_OK →GMP01026_000795= (COMPARE(HS_br, MAX(PhysConst(80, "mm"), (l↓o←/10)), 6) != -1 &amp;&amp; COMPARE(HS_br, MIN(PhysConst(200, "mm"), 10*HS_tr*ε), 6) != 1); 
            } 
            bool bWebThickness_OK →GMP01026_000799= (HS_type == 0) &amp;&amp; (COMPARE(t↓w←, 70*ε, 6) != 1); 
            
            object T →GMP01026_000188= new Table(2); 
            T[0][0].Value →GMP01026_000189= TR("Check"); 
            T[0][1].Value →GMP01026_000190= TR("Status"); 
            T[1][0].Value →GMP01026_000201= TR("Area of stiffener"); 
            T[2][0].Value →GMP01026_000559= TR("Distance to the inner surface of the flange"); 
            T[3][0].Value →GMP01026_000560= TR("Minimum offset from opening"); 
            T[4][0].Value →GMP01026_000561= TR("Thickness of the stiffener"); 
            T[5][0].Value →GMP01026_000562= TR("Width of the stiffener"); 
            T[6][0].Value →GMP01026_000563= TR("Weld throat thickness"); 
            T[7][0].Value →GMP01026_000564= TR("Distance from the closest support"); 
            T[8][0].Value →GMP01026_000565= TR("Distance between studs"); 
            T[9][0].Value →GMP01026_000566= TR("Length of the opening"); 
            T[10][0].Value →GMP01026_000820= TR("Anchorage length"); 
            IF(HS_type == 0) { T[11][0].Value →GMP01026_000824= TR("Web thickness"); } // Single sided only
            
            →GMP01026_000510SetTable(T); 
            T.Columns[1].Alignment →GMP01026_000508= ContentAlignment.MiddleCenter; 
        } 
        
        →GMP01026_000186TEXT("Geometry recommendations for stiffened openings"); 
        →KRS01026_000079bool Status →KRS01026_000089= true; //Status starts on true and can be changed only to false. When it happend, it remains false
        →KRS01026_000076DrawStatusStiffeners(T, 1, bAreaOfTheStiffener_OK, out Status); 
        →KRS01026_000080DrawStatusStiffeners(T, 2, bDistanceToFlange_OK, out Status); 
        →KRS01026_000081DrawStatusStiffeners(T, 3, bMinOffset_OK, out Status); 
        →KRS01026_000082DrawStatusStiffeners(T, 4, bThicknessOfStiffener_OK, out Status); 
        →KRS01026_000083DrawStatusStiffeners(T, 5, bWidthOfStiffener_OK, out Status); 
        →KRS01026_000084DrawStatusStiffeners(T, 6, bWeldThroat_OK, out Status); 
        →KRS01026_000085DrawStatusStiffeners(T, 7, bDistanceToSupport_OK, out Status); 
        →KRS01026_000086DrawStatusStiffeners(T, 8, bStudSpacing_OK, out Status); 
        →KRS01026_000087DrawStatusStiffeners(T, 9, bLengthOfOpening_OK, out Status); 
        →KRS01026_000088DrawStatusStiffeners(T, 10, bAnchorageLength_OK, out Status); 
        IF(HS_type == 0) { →KRS01026_000090DrawStatusStiffeners(T, 11, bWebThickness_OK, out Status); } 
        
        →GMP01026_000509T.Draw(); 
        IF(!Status) { 
            →GMP01026_000828Functions_general.AddEWN(DataExchange, "W/54"); 
        } 
    } 
    
    public void VerticalShear(double CN, double SCN, out double UC↓fin,V,o←) { 
        →KRS00014_003160double&lt;kN,-2&gt; V↓Ed,fin,o← →KRS00014_003161= DataExchange.ULS_Fin_Forces_Opening.Vz; 
        →KRS00014_002867double&lt;kN,2&gt; V↓pl,Rd←; 
        →KRS00014_002935double&lt;mm,2&gt; d↓l← →KRS00014_002936= DataExchange.d_l; 
        →KRS00014_002937double&lt;mm,2&gt; s↓l← →KRS00014_002938= DataExchange.s_l; 
        
        →KRS00014_002940double&lt;mm↑2←,2&gt; A↓sl←; 
        →KRS00014_002946double&lt;kN,2&gt; N↓c,Ed←; 
        →KRS00014_002951double&lt;kN,-2&gt; N↓bT,Ed← →KRS00014_002955= →KRS00014_002952DataExchange.N_bT_Ed; 
        →KRS00014_002953double&lt;kN,-2&gt; N↓c,Rd← →KRS00014_002956= →KRS00014_002954DataExchange.N_c_Rd; 
        →KRS00014_002962double&lt;mm,2&gt; b↓eff,o← →KRS00014_002963= →KRS00014_002964DataExchange.b_eff_o; 
        →KRS00014_002967double&lt;mm,2&gt; b↓w←; 
        →KRS00014_003144double&lt;mm,2&gt; h↓s,eff←; 
        →KRS00014_002959double&lt;MPa,2&gt; σ↓cp←; 
        →KRS00014_002960double&lt;kN,2&gt; V↓c,Rd←; 
        →KRS00014_003149double&lt;kN,2&gt; V↓c,Rd,min←; 
        →KRS00014_002966double&lt;kN,2&gt; V↓Rd←; 
        →KRS00014_003146double&lt;,-4&gt; ρ↓l←; 
        →KRS00014_003200double&lt;,-2&gt; UC↓fin,V,o←; 
        
        string sText →KRS00014_002839= TR("Vertical shear"); 
        →KRS00014_002840TEXT(CN &amp; "." &amp; SCN &amp; " " &amp; sText); 
        
        →KRS00100_000001Functions_general.→KRS00014_002868GetVplRd(DataExchange, out V↓pl,Rd←); 
        IF(DataExchange.UseConcrShearRes) { //DataExchange.UseConcrShearRes
            →KRS00014_002929TEXT("Concrete slab resistance"); 
            C↓Rdc← →KRS00014_002930= 0.18/γ↓C←; 
            k↓l← →KRS00014_002931= 0.15; 
            k →KRS00014_002932= MIN(1+SQRT(200/CUnit(h↓c←, "mm")), 2); 
            h↓s,eff← →KRS00014_002933= 0.75*h↓s←; 
            b↓w← →KRS00014_002934= b↓f←+2*h↓s,eff←; 
            double π →KRS00014_003145= Math.PI; 
            A↓sl← →KRS00014_002939= π*d↓l←↑2←/4*1/s↓l←; 
            ρ↓l← →KRS00014_002941= A↓sl←/h↓c←; 
            IF(N↓bT,Ed← &lt; N↓c,Rd←) { 
                N↓c,Ed← →KRS00014_002944= N↓bT,Ed←; 
            } ELSE { 
                N↓c,Ed← →KRS00014_002945= N↓c,Rd←; 
            } 
            σ↓cp← →KRS00014_002957= MIN(N↓c,Ed←/(b↓eff,o←*h↓c←), 0.2*f↓ck←/γ↓C←); 
            
            
            V↓c,Rd← →KRS00014_003147= 10↑6←*(C↓Rdc←*k*(100*ρ↓l←*CUnit(f↓ck←, "MPa"))↑1/3←+k↓l←*CUnit(σ↓cp←, "MPa"))*b↓w←*h↓c←; 
            V↓c,Rd,min← →KRS00014_003148= 10↑6←*(0.035*k↑3/2←*CUnit(f↓ck←, "MPa")↑1/2←+k↓l←*CUnit(σ↓cp←, "MPa"))*b↓w←*h↓c←; 
            
            V↓c,Rd← →KRS00014_002958= MAX(V↓c,Rd←, V↓c,Rd,min←); 
            →KRS00014_003204PAGEBREAK(); 
            
            →KRS00014_003205TEXT("Total resistance"); 
            V↓Rd← →KRS00014_002965= V↓pl,Rd←+V↓c,Rd←; 
        } ELSE { 
            →KRS00014_003206TEXT("Total resistance"); 
            V↓Rd← →KRS00014_003150= V↓pl,Rd←; 
        } 
        →KRS00014_002981DataExchange.Set("V_c_Rd", V↓c,Rd←); 
        IF(COMPARE(V↓Rd←, 0, 6) == 1) { 
            UC↓fin,V,o← →KRS00014_003151= (ABS(V↓Ed,fin,o←)/V↓Rd←); 
        } ELSE { 
            UC↓fin,V,o← →KRS00014_003152= 999; 
        } 
        IF(IO.IsDrawing) { 
            IF(COMPARE(UC↓fin,V,o←, 1, 6) != 1) { 
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
    
    public void GlobalBending(double CN, double SCN, out double UC↓fin,M,o←) { 
        →KRS00014_002701double&lt;kN,-2&gt; V↓Ed,fin,o← →KRS00014_002702= DataExchange.ULS_Fin_Forces_Opening.Vz; 
        →KRS00014_002923double&lt;kN,-2&gt; M↓Ed,fin,o← →KRS00014_002924= DataExchange.ULS_Fin_Forces_Opening.My; 
        
        →KRS00014_003109double Entity↓left← →KRS00014_003110= DataExchange.Entity_left; 
        →KRS00014_003113double&lt;m,2&gt; L↓left← →KRS00014_003114= DataExchange.L_left; 
        →KRS00014_003111double Entity↓right← →KRS00014_003112= DataExchange.Entity_right; 
        →KRS00014_003115double&lt;m,2&gt; L↓right← →KRS00014_003116= DataExchange.L_right; 
        →KRS00014_003117double&lt;m,2&gt; b↓l←; 
        →KRS00014_003122double&lt;m,2&gt; b↓r←; 
        
        →KRS00014_003107double&lt;mm,2&gt; h↓o,eq←; 
        →KRS00014_003108double&lt;mm,2&gt; l↓o,eq←; 
        →KRS00014_002825double&lt;mm,2&gt; h↓wt←; 
        →KRS00014_002827double&lt;mm↑2←,2&gt; A↓tT←; 
        →KRS00014_002828double&lt;mm,2&gt; z↓t←; 
        →KRS00014_002831double&lt;mm,2&gt; h↓wb←; 
        →KRS00014_002832double&lt;mm↑2←,2&gt; A↓bT←; 
        →KRS00014_002833double&lt;mm,2&gt; z↓b←; 
        →KRS00014_002837double&lt;mm,2&gt; h↓eff←; 
        →KRS00014_002875double&lt;kN,2&gt; V↓pl,Rd←; 
        →KRS00014_002878double ρ →KRS00100_000003= 0; 
        →KRS00014_002885double&lt;kN,2&gt; N↓bT,Rd←; 
        →KRS00014_002886double&lt;kN,2&gt; N↓tT,Rd←; 
        →KRS00014_002891double&lt;m,2&gt; b↓eff,o←; 
        →KRS00014_002894double&lt;kN,2&gt; N↓c,Rd1←; 
        →KRS00014_002895double&lt;kN,2&gt; N↓c,Rd2←; 
        →KRS00014_002905double&lt;kN,2&gt; N↓c,Rd←; 
        →KRS00014_002906double PNAPos; 
        →KRS00014_002911double&lt;mm,2&gt; z↓c←; 
        →KRS00014_002913double&lt;kNm,2&gt; M↓o,Rd←; 
        →KRS00014_002916double&lt;mm↑2←,2&gt; A↓tT,cap←; 
        →KRS00014_002922double&lt;kN,2&gt; N↓bT,Ed← →KRS00100_000006= 0; 
        →KRS00014_003140double&lt;,-2&gt; UC↓fin,M,o←; 
        
        //Stiffener parameters
        →KRS01026_000056double&lt;mm,2&gt; t↓r← →KRS01026_000057= DataExchange.HS_tr; 
        →KRS01026_000058double&lt;mm,2&gt; b↓r← →KRS01026_000059= DataExchange.HS_br; 
        →KRS01026_000060double&lt;mm,2&gt; e↓r← →KRS01026_000061= DataExchange.HS_offset+t↓r←/2; //distance from the edge of opening to the centreline of stiffener
        →KRS01026_000062double&lt;mm↑2←,2&gt; A↓r←; 
        →KRS01026_000063double&lt;MPa,2&gt; f↓yr← →KRS01026_000064= DataExchange.HS_fy; 
        
        string sText →KRS00014_001658= TR("Global bending"); 
        →KRS00014_000973TEXT(CN &amp; "." &amp; SCN &amp; " " &amp; sText); 
        
        SWITCH(WOShape) { 
            CASE 0 :  { //Rectangle
                l↓o,eq← →KRS00014_003103= l↓o←; 
                h↓o,eq← →KRS00014_003104= h↓o←; 
                →KRS00014_003105RenameVar(l↓o,eq←, "l↓o←"); 
                →KRS00014_003106RenameVar(h↓o,eq←, "h↓o←"); 
            } 
            CASE 1 :  { //Circle
                →KRS00014_002818TEXT("Equivalent opening geometry"); 
                h↓o,eq← →KRS00014_002822= 0.9*h↓o←; 
                l↓o,eq← →KRS00014_002820= 0.45*h↓o←; 
            } 
            CASE 4 :  { //Elongated
                →KRS00400_000001TEXT("Equivalent opening geometry"); 
                h↓o,eq← →KRS00400_000002= h↓o←; 
                l↓o,eq← →KRS00400_000003= l↓o←-0.55*h↓o←; 
            } 
            DEFAULT :  { 
                →KRS00400_000017TEXT("Not supported"); 
                l↓o,eq← →KRS00400_000015= 0; 
                h↓o,eq← →KRS00400_000016= 0; 
            } 
        } 
        
        →KRS00014_002823TEXT("Top tee"); 
        h↓wt← →KRS00014_002824= h↓w←/2-h↓o,eq←/2-e↓o←; 
        A↓tT← →KRS00014_002826= (A↓a←-h↓w←*t↓w←)/2+h↓wt←*t↓w←; 
        →KRS01026_000050Get_Ar(out A↓r←); 
        IF(bHS) { 
            z↓t← →KRS01026_000054= (b↓f←*t↓f←↑2←/2+h↓wt←*t↓w←*(t↓f←+h↓wt←/2)+A↓r←*(t↓f←+h↓wt←-e↓r←))/(b↓f←*t↓f←+h↓wt←*t↓w←+A↓r←); 
        } ELSE { 
            z↓t← →KRS00014_002829= (b↓f←*t↓f←↑2←/2+h↓wt←*t↓w←*(t↓f←+h↓wt←/2))/(b↓f←*t↓f←+h↓wt←*t↓w←); 
        } 
        →KRS01026_000101DataExchange.Set("z_t", z↓t←); 
        →KRS00014_003132PAGEBREAK(); 
        
        →KRS00014_002830TEXT("Bottom tee"); 
        h↓wb← →KRS00014_002834= h↓w←-h↓wt←-h↓o,eq←; 
        A↓bT← →KRS00014_002835= (A↓a←-h↓w←*t↓w←)/2+h↓wb←*t↓w←; 
        →KRS01026_000051Get_Ar(out A↓r←); 
        IF(bHS) { 
            z↓b← →KRS01026_000065= (b↓f←*t↓f←↑2←/2+h↓wb←*t↓w←*(t↓f←+h↓wb←/2)+A↓r←*(t↓f←+h↓wb←-e↓r←))/(b↓f←*t↓f←+h↓wt←*t↓w←+A↓r←); 
        } ELSE { 
            z↓b← →KRS00014_002836= (b↓f←*t↓f←↑2←/2+h↓wb←*t↓w←*(t↓f←+h↓wb←/2))/(b↓f←*t↓f←+h↓wt←*t↓w←); 
        } 
        
        h↓eff← →KRS00014_002838= h-z↓t←-z↓b←; 
        →KRS01026_000102DataExchange.Set("h_eff", h↓eff←); 
        →KRS00014_003133PAGEBREAK(); 
        
        →KRS00014_002883TEXT("Effect of high shear"); 
        →KRS00100_000002Functions_general.→KRS00014_002876GetVplRd(DataExchange, out V↓pl,Rd←); 
        
        IF(V↓Ed,fin,o← &gt;= 0.5*V↓pl,Rd←) { 
            V↓pl,Rd← →KRS00014_002877= V↓pl,Rd←; 
            ρ →KRS00014_002879= (2*V↓Ed,fin,o←/V↓pl,Rd←-1)↑2←; 
            IF(ρ &gt;= 0.5) { 
                f↓yb← →KRS00014_002882= f↓yb←*(1-ρ); 
            } 
        } ELSE { 
            →KRS00014_001121TEXT("The influence of the vertical shear on the bending moment resistance may be neglected."); 
        } 
        →KRS00014_003134PAGEBREAK(); 
        
        IF(COMPARE(ρ, 1, 6) != 1) { 
            →KRS00014_002884TEXT("Resistance"); 
            IF(bHS) { 
                N↓bT,Rd← →KRS01026_000066= A↓bT←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0←; 
                N↓tT,Rd← →KRS01026_000067= A↓tT←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0←; 
            } ELSE { 
                N↓bT,Rd← →KRS00014_002887= A↓bT←*f↓yb←/γ↓M0←; 
                N↓tT,Rd← →KRS00014_002888= A↓tT←*f↓yb←/γ↓M0←; 
            } 
            
            IF(x &lt;= L↓e←/4) { 
                b↓eff,o← →KRS00014_003125= 3*L↓e←/16+x/4; 
            } ELSE { 
                b↓eff,o← →KRS00014_002893= L↓e←/4; 
            } 
            
            IF(COMPARE(Entity↓left←, 0, 2) == 0) { 
                →INI00400_001734TEXT("No adjacent member or slab edge was found on the left side."); 
                b↓l← →INI00400_001739= 0; 
            } ELSE { 
                IF(COMPARE(Entity↓left←, 2, 2) == 0) { // Distinction between edge and mid span on the left
                    b↓l← →INI00400_000938= L↓left←; 
                } ELSE { 
                    b↓l← →INI00400_000939= L↓left←/2; 
                } 
            } 
            
            IF(COMPARE(Entity↓right←, 0, 2) == 0) { 
                →KRS00014_003118TEXT("No adjacent member or slab edge was found on the right side."); 
                b↓r← →KRS00014_003119= 0; 
            } ELSE { 
                IF(COMPARE(Entity↓right←, 2, 2) == 0) { // Distinction between edge and mid span on the right
                    b↓r← →KRS00014_003120= L↓right←; 
                } ELSE { 
                    b↓r← →KRS00014_003121= L↓right←/2; 
                } 
            } 
            
            IF(COMPARE(b↓l←, 0, 6) == 1 &amp;&amp; COMPARE(b↓r←, 0, 6) == 1) { 
                b↓eff,o← →KRS00014_003123= MIN(b↓eff,o←/2, b↓l←)+MIN(b↓eff,o←/2, b↓r←); 
            } ELSE { 
                IF(COMPARE(b↓l←, 0, 6) == 0 &amp;&amp; COMPARE(b↓r←, 0, 6) == 0) { 
                    b↓eff,o← →KRS00400_000020= b↓eff,o←/2+b↓eff,o←/2; 
                } ELSE { 
                    IF(COMPARE(b↓l←, 0, 6) == 1) { 
                        b↓eff,o← →KRS00400_000018= MIN(b↓eff,o←/2, b↓l←)+b↓eff,o←/2; 
                    } ELSE { 
                        b↓eff,o← →KRS00400_000019= b↓eff,o←/2+MIN(b↓eff,o←/2, b↓r←); 
                    } 
                } 
            } 
            
            N↓c,Rd1← →KRS00014_002896= 0.85*f↓ck←/γ↓C←*b↓eff,o←*h↓c←; 
            N↓c,Rd2← →KRS00014_002897= n↓sc←*P↓Rd←; 
            N↓c,Rd← →KRS00014_002904= MIN(N↓c,Rd1←, N↓c,Rd2←); 
            
            PNAPos →KRS00014_002907= N↓c,Rd← &gt;= N↓bT,Rd← ? 1 : 2; 
            →KRS00014_003136PAGEBREAK(); 
            IF(PNAPos == 1) { 
                →KRS00014_002908TEXT("PNA in concrete"); 
                →KRS00014_003207TEXT("N↓c,Rd← ≥ N↓bT,Rd←"); 
                z↓c← →KRS00014_002912= MIN(N↓bT,Rd←/(0.85*f↓ck←/γ↓C←*b↓eff,o←), h↓c←); 
            } ELSE { 
                →KRS00014_002909TEXT("PNA in top Tee"); 
                →KRS00014_003208TEXT("N↓c,Rd← &lt; N↓bT,Rd←"); 
                z↓c← →KRS00014_003139= h↓c←; 
            } 
            
            IF(PNAPos == 1) { 
                M↓o,Rd← →KRS00014_002914= N↓bT,Rd←*(h↓eff←+z↓t←+h↓s←-0.5*z↓c←); 
            } ELSE { 
                M↓o,Rd← →KRS00014_002915= N↓bT,Rd←*h↓eff←+N↓c,Rd←*(z↓t←+h↓s←-0.5*h↓c←); 
            } 
            
            IF(PNAPos == 2) { 
                IF(bHS) { 
                    A↓tT,cap← →KRS18100_000001= A↓tT←; //
                    IF(A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0← &lt; N↓bT,Rd←-N↓c,Rd←) { 
                        →KRS18100_000002TEXT('A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0←' &amp; " &lt; " &amp; 'N↓bT,Rd←-N↓c,Rd←' &amp; "  -&gt;  " &amp; A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0← &amp; " &lt; " &amp; N↓bT,Rd←-N↓c,Rd← &amp; "  -&gt;  " &amp; Val((A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0←)*10↑-3←, 2) &amp; " kN &lt; " &amp; Val((N↓bT,Rd←-N↓c,Rd←)*10↑-3←, 2) &amp; " kN"); 
                        IF(!DataExchange.IsDesignRunning) { →KRS18100_000003Functions_general.AddEWN(DataExchange, "E/26"); } 
                        M↓o,Rd← →KRS18100_000004= 0; 
                    } ELSE { 
                        →KRS18100_000005TEXT('A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0←' &amp; " ≥ " &amp; 'N↓bT,Rd←-N↓c,Rd←' &amp; "  -&gt;  " &amp; A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0← &amp; " ≥ " &amp; N↓bT,Rd←-N↓c,Rd← &amp; "  -&gt;  " &amp; Val((A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0←)*10↑-3←, 2) &amp; " kN ≥ " &amp; Val((N↓bT,Rd←-N↓c,Rd←)*10↑-3←, 2) &amp; " kN"); 
                        →KRS18100_000006TEXT("Compression capacity of top Tee is sufficient."); 
                    } 
                } ELSE { 
                    A↓tT,cap← →KRS00014_002917= A↓tT←-h↓wt←*t↓w←+t↓w←*MIN(10*ε*t↓w←, h↓wt←); 
                    IF(A↓tT,cap←*f↓yb←/γ↓M0← &lt; N↓bT,Rd←-N↓c,Rd←) { 
                        →KRS00014_003212TEXT('A↓tT,cap←*f↓yb←/γ↓M0←' &amp; " &lt; " &amp; 'N↓bT,Rd←-N↓c,Rd←' &amp; "  -&gt;  " &amp; A↓tT,cap←*f↓yb←/γ↓M0← &amp; " &lt; " &amp; N↓bT,Rd←-N↓c,Rd← &amp; "  -&gt;  " &amp; Val((A↓tT,cap←*f↓yb←/γ↓M0←)*10↑-3←, 2) &amp; " kN &lt; " &amp; Val((N↓bT,Rd←-N↓c,Rd←)*10↑-3←, 2) &amp; " kN"); 
                        IF(!DataExchange.IsDesignRunning) { →KRS00014_003137Functions_general.AddEWN(DataExchange, "E/26"); } 
                        M↓o,Rd← →KRS00100_000005= 0; 
                    } ELSE { 
                        →KRS00014_003211TEXT('A↓tT,cap←*f↓yb←/γ↓M0←' &amp; " ≥ " &amp; 'N↓bT,Rd←-N↓c,Rd←' &amp; "  -&gt;  " &amp; A↓tT,cap←*f↓yb←/γ↓M0← &amp; " ≥ " &amp; N↓bT,Rd←-N↓c,Rd← &amp; "  -&gt;  " &amp; Val((A↓tT,cap←*f↓yb←/γ↓M0←)*10↑-3←, 2) &amp; " kN ≥ " &amp; Val((N↓bT,Rd←-N↓c,Rd←)*10↑-3←, 2) &amp; " kN"); 
                        →KRS00014_003138TEXT("Compression capacity of top Tee is sufficient."); 
                    } 
                } 
            } 
            IF(COMPARE(M↓o,Rd←, 0, 6) == 1) { 
                N↓bT,Ed← →KRS00014_002925= M↓Ed,fin,o←/(h↓eff←+z↓t←+h↓s←-0.5*z↓c←); 
                IF(PNAPos == 2) { 
                    IF(N↓bT,Ed← &gt; N↓c,Rd←) { 
                        N↓bT,Ed← →KRS00014_002927= (M↓Ed,fin,o←-N↓c,Rd←*(z↓t←+h↓s←-0.5*h↓c←))/h↓eff←; 
                    } 
                } 
            } 
        } ELSE { 
            M↓o,Rd← →KRS00100_000004= 0; 
            →KRS00014_001656Functions_general.AddEWN(DataExchange, "E6/09"); //Extreme shear. Bending moment resistance not designable.
        } 
        
        IF(COMPARE(M↓o,Rd←, 0, 6) == 1) { 
            UC↓fin,M,o← →KRS00014_001125= (ABS(M↓Ed,fin,o←)/M↓o,Rd←); 
        } ELSE { 
            UC↓fin,M,o← →KRS00014_002662= 999; 
        } 
        IF(IO.IsDrawing) { 
            IF(COMPARE(UC↓fin,M,o←, 1, 6) != 1) { 
                →KRS00014_001128TEXT("≤ 1"); 
                →KRS00014_001129TEXT("OK"); 
                →KRS00014_001126TEXT("The bending moment resistance of the section is adequate."); 
            } ELSE { 
                →KRS00014_001130TEXT("&gt; 1"); 
                →KRS00014_001131TEXT("NOT OK"); 
                →KRS00014_001127TEXT("The bending moment resistance of the section is not adequate."); 
            } 
            →KRS00014_001132PAGEBREAK(); 
        } 
        →KRS00014_003173DataExchange.Set("lo_eq", l↓o,eq←); 
        →KRS00014_002947DataExchange.Set("N_bT_Ed", N↓bT,Ed←); 
        →KRS00014_002948DataExchange.Set("N_c_Rd", N↓c,Rd←); 
        →KRS00014_002961DataExchange.Set("b_eff_o", b↓eff,o←); 
        →KRS00014_002979DataExchange.Set("A_tT", A↓tT←); 
        →KRS00014_002992DataExchange.Set("h_wt", h↓wt←); 
        →KRS00014_002980DataExchange.Set("A_bT", A↓bT←); 
        →KRS00014_002993DataExchange.Set("h_wb", h↓wb←); 
        →KRS00014_003017DataExchange.Set("PNAPos", PNAPos); 
        →KRS00014_003031DataExchange.Set("N_tT_Rd", N↓tT,Rd←); 
        →KRS00014_003064DataExchange.Set("N_bT_Rd", N↓bT,Rd←); 
        →KRS00014_003078DataExchange.Set("z_t", z↓t←); 
    } 
    
    public void VierendeelBending(double CN, double SCN, out double UC↓fin,VB,o←) { 
        →KRS00014_002977double&lt;kN,-2&gt; V↓Ed,fin,o← →KRS00014_002978= DataExchange.ULS_Fin_Forces_Opening.Vz; 
        →KRS00014_003086double&lt;kN,-2&gt; V↓Ed,fin,o,edge← →KRS00014_003087= DataExchange.Open_V_Design; 
        →KRS00014_002974double&lt;mm,2&gt; l↓o,eff←; 
        →KRS00014_003174double&lt;mm,2&gt; l↓o,eq← →KRS00014_003175= DataExchange.lo_eq; 
        →KRS00014_002983double&lt;mm↑2←,2&gt; A↓tT← →KRS00014_002984= DataExchange.A_tT; 
        →KRS00014_002985double&lt;mm↑2←,2&gt; A↓bT← →KRS00014_002986= DataExchange.A_bT; 
        →KRS00014_002987double&lt;kN,2&gt; V↓t,Rd← →KRS00014_002988= DataExchange.V_t_Rd; 
        →KRS00014_003037double&lt;kN,2&gt; V↓b,Rd← →KRS00014_003038= DataExchange.V_b_Rd; 
        →KRS00014_002998double&lt;mm,2&gt; h↓wt← →KRS00014_002999= DataExchange.h_wt; 
        →KRS00014_003045double&lt;mm,2&gt; h↓wb← →KRS00014_003046= DataExchange.h_wb; 
        →KRS01026_000037double&lt;mm,2&gt; h →KRS01026_000038= DataExchange.h_a; 
        →KRS01026_000039double&lt;mm,2&gt; h↓o← →KRS01026_000040= DataExchange.ho; 
        →KRS01026_000041double&lt;mm,2&gt; e↓o← →KRS01026_000042= DataExchange.eo; 
        →KRS00014_003006double&lt;mm↑2←,2&gt; A↓f←; 
        →KRS00014_003007double&lt;mm↑2←,2&gt; A↓wtT←; 
        →KRS00014_003052double&lt;mm↑2←,2&gt; A↓wbT←; 
        →KRS00014_003012double&lt;mm,2&gt; z↓pl←; 
        →KRS00014_003013double&lt;kNm,2&gt; M↓tT,V,Rd←; 
        →KRS00014_003055double&lt;kNm,2&gt; M↓bT,V,Rd←; 
        double PNAPos →KRS00014_003019= DataExchange.PNAPos; 
        →KRS00014_003022double&lt;kN,2&gt; N↓bT,Ed← →KRS00014_003023= →KRS00014_003024DataExchange.N_bT_Ed; 
        →KRS00014_003032double&lt;kN,2&gt; N↓tT,Rd← →KRS00014_003033= →KRS00014_003034DataExchange.N_tT_Rd; 
        →KRS00014_003061double&lt;kN,2&gt; N↓bT,Rd← →KRS00014_003062= →KRS00014_003063DataExchange.N_bT_Rd; 
        →KRS00014_003025double&lt;kN,2&gt; N↓c,Rd← →KRS00014_003026= →KRS00014_003027DataExchange.N_c_Rd; 
        →KRS00014_003028double&lt;kN,2&gt; N↓Ed←; 
        →KRS00014_003029double&lt;kNm,2&gt; M↓tT,NV,Rd←; 
        →KRS00014_003056double&lt;kNm,2&gt; M↓bT,NV,Rd←; 
        →KRS00014_003074double&lt;kN,2&gt; ΔN↓c,Rd←; 
        →KRS00014_003079double&lt;mm,2&gt; z↓t← →KRS00014_003080= DataExchange.z_t; 
        →KRS00014_003081double&lt;kNm,2&gt; M↓vc,Rd←; 
        →KRS00014_003083double&lt;kNm,2&gt; M↓Vb,Res←; 
        →KRS00014_003084double&lt;kNm,2&gt; M↓Vb,Lim←; 
        →KRS00014_003191double&lt;,-2&gt; UC↓fin,VB,o←; 
        →KRS00400_000021double&lt;,-3&gt; μ; 
        //Stiffener parameters
        →KRS01026_000004double&lt;mm,2&gt; t↓r← →KRS01026_000005= DataExchange.HS_tr; 
        →KRS01026_000006double&lt;mm,2&gt; b↓r← →KRS01026_000007= DataExchange.HS_br; 
        →KRS01026_000008double&lt;mm,2&gt; e↓r← →KRS01026_000009= DataExchange.HS_offset+t↓r←/2; //distance from the edge of opening to the centreline of stiffener
        →KRS01026_000010double&lt;mm↑2←,2&gt; A↓r←; 
        →KRS01026_000013double&lt;MPa,2&gt; f↓yr← →KRS01026_000014= DataExchange.HS_fy; 
        
        string sText →KRS00014_002970= TR("Vierendeel bending"); 
        →KRS00014_002971TEXT(CN &amp; "." &amp; SCN &amp; " " &amp; sText); 
        
        IF(!bHS) { 
            SWITCH(WOShape) { 
                CASE 0 :  { //Rectangle
                    l↓o,eff← →KRS00014_002975= l↓o←; 
                } 
                CASE 1 :  { //Circle
                    l↓o,eff← →KRS00014_002976= 0.7*h↓o←; 
                } 
                CASE 4 :  { //Elongated
                    l↓o,eff← →KRS00400_000014= l↓o←-0.3*h↓o←; 
                } 
            } 
        } 
        
        →KRS00014_002989TEXT("Top tee resistance"); 
        μ →KRS00014_002982= (ABS(V↓Ed,fin,o←)*A↓tT←/(A↓tT←+A↓bT←))/V↓t,Rd←; 
        IF(μ &gt;= 0.5) { 
            t↓w← →KRS00014_002991= t↓w←*(1-(2*μ-1)↑2←); 
        } 
        
        IF(bHS) { 
            h↓wt← →KRS18100_000010= h↓wt←; 
            →KRS18100_000011TEXT("Top Tee is assumed to fulfil the Classification limit for Class 2."); 
        } ELSE { 
            IF(COMPARE(l↓o,eff←, 32*ε*t↓w←, 6) == 1) { 
                h↓wt← →KRS00014_003000= MIN(h↓wt←, (10*ε*t↓w←)/SQRT(1-(32*ε*t↓w←/l↓o,eff←)↑2←)); 
            } ELSE { 
                h↓wt← →POR01026_000001= h↓wt←; 
            } 
            →KRS00014_003170TEXT("Top Tee fulfils the Classification limit for Class 2."); 
        } 
        
        A↓f← →KRS00014_003005= b↓f←*t↓f←; 
        A↓wtT← →KRS00014_003008= h↓wt←*t↓w←; 
        →KRS01026_000068Get_Ar(out A↓r←); 
        
        IF(bHS) { 
            IF(A↓f← &gt;= A↓wtT←+A↓r←) { //PNA in flange stiffened
                z↓pl← →KRS01026_000019= (A↓f←+A↓wtT←+A↓r←)/(2*b↓f←); 
                M↓tT,V,Rd← →KRS01026_000020= A↓wtT←*f↓yb←/γ↓M0←*(h↓wt←/2+t↓f←-z↓pl←)+A↓f←*f↓yb←/γ↓M0←*(t↓f←/2-z↓pl←+z↓pl←↑2←/t↓f←)+A↓r←*f↓yr←/γ↓M0←*(t↓f←+h↓wt←-e↓r←-z↓pl←); 
            } ELSE { 
                z↓pl← →KRS01026_000031= (A↓wtT←+A↓r←-A↓f←)/(2*t↓w←); //PNA in web stiffened
                M↓tT,V,Rd← →KRS01026_000022= A↓wtT←*f↓yb←/γ↓M0←*(h↓wt←/2+t↓f←-z↓pl←)+A↓f←*f↓yb←/γ↓M0←*(t↓f←/2-z↓pl←+z↓pl←↑2←/t↓f←)+A↓r←*f↓yr←/γ↓M0←*(h↓wt←-z↓pl←-e↓r←); 
            } 
        } ELSE { 
            IF(A↓f← &gt;= A↓wtT←) { 
                z↓pl← →KRS00014_003009= (A↓f←+A↓wtT←)/(2*b↓f←); //PNA in flange 
                M↓tT,V,Rd← →KRS00014_003014= A↓wtT←*f↓yb←/γ↓M0←*(0.5*h↓wt←+t↓f←-z↓pl←)+A↓f←*f↓yb←/γ↓M0←*(0.5*t↓f←-z↓pl←+z↓pl←↑2←/t↓f←); 
            } ELSE { 
                z↓pl← →KRS00014_003010= (A↓wtT←-A↓f←)/(2*t↓w←); //PNA in web
                M↓tT,V,Rd← →KRS00014_003015= A↓wtT←*f↓yb←/γ↓M0←*(0.5*h↓wt←-z↓pl←+z↓pl←↑2←/h↓wt←)+A↓f←*f↓yb←/γ↓M0←*(0.5*t↓f←+z↓pl←); 
            } 
        } 
        
        IF(PNAPos == 1) { 
            N↓Ed← →KRS00014_003020= 0; 
        } ELSE { 
            N↓Ed← →KRS00014_003021= MAX(N↓bT,Ed←-N↓c,Rd←, 0); 
        } 
        M↓tT,NV,Rd← →KRS00014_003030= MAX(M↓tT,V,Rd←*(1-(N↓Ed←/N↓tT,Rd←)↑2←), 0); 
        →KRS00014_003163PAGEBREAK(); 
        
        →KRS00014_003035TEXT("Bottom tee resistance"); 
        μ →KRS00014_003036= (ABS(V↓Ed,fin,o←)*A↓bT←/(A↓tT←+A↓bT←))/V↓b,Rd←; 
        IF(μ &gt;= 0.5) { 
            t↓w← →KRS00014_003041= t↓w←*(1-(2*μ-1)↑2←); 
        } 
        IF(bHS) { 
            h↓wb← →KRS18100_000012= h↓wb←; 
            →KRS18100_000013TEXT("Bottom Tee is assumed to fulfil the Classification limit for Class 2."); 
        } ELSE { 
            IF(COMPARE(l↓o,eff←, 32*ε*t↓w←, 6) == 1) { 
                h↓wb← →KRS00014_003043= MIN(h↓wb←, (10*ε*t↓w←)/SQRT(1-(32*ε*t↓w←/l↓o,eff←)↑2←)); 
            } ELSE { 
                h↓wb← →POR01026_000005= h↓wb←; 
            } 
            →KRS00014_003171TEXT("Bottom Tee fulfils the Classification limit for Class 2."); 
        } 
        
        A↓f← →KRS00014_003050= b↓f←*t↓f←; 
        A↓wbT← →KRS00014_003051= h↓wb←*t↓w←; 
        →KRS01026_000069Get_Ar(out A↓r←); 
        
        IF(bHS) { 
            IF(A↓f← &gt;= A↓wbT←+A↓r←) { //PNA in flange stiffened
                z↓pl← →KRS01026_000032= (A↓f←+A↓wbT←+A↓r←)/(2*b↓f←); 
                M↓bT,V,Rd← →KRS01026_000024= A↓wbT←*f↓yb←/γ↓M0←*(h↓wb←/2+t↓f←-z↓pl←)+A↓f←*f↓yb←/γ↓M0←*(t↓f←/2-z↓pl←+z↓pl←↑2←/t↓f←)+A↓r←*f↓yr←/γ↓M0←*(t↓f←+h↓wb←-e↓r←-z↓pl←); 
            } ELSE { //PNA in web stiffened
                z↓pl← →KRS01026_000033= (A↓wbT←+A↓r←-A↓f←)/(2*t↓w←); 
                M↓bT,V,Rd← →KRS01026_000025= A↓wbT←*f↓yb←/γ↓M0←*(h↓wb←/2+t↓f←-z↓pl←)+A↓f←*f↓yb←/γ↓M0←*(t↓f←/2-z↓pl←+z↓pl←↑2←/t↓f←)+A↓r←*f↓yr←/γ↓M0←*(h↓wb←-z↓pl←-e↓r←); 
            } 
        } ELSE { 
            IF(A↓f← &gt;= A↓wbT←) { //PNA in flange
                z↓pl← →KRS00014_003053= (A↓f←+A↓wbT←)/(2*b↓f←); 
                M↓bT,V,Rd← →KRS00014_003057= A↓wbT←*f↓yb←/γ↓M0←*(0.5*h↓wb←+t↓f←-z↓pl←)+A↓f←*f↓yb←/γ↓M0←*(0.5*t↓f←-z↓pl←+z↓pl←↑2←/t↓f←); 
            } ELSE { //PNA in web
                z↓pl← →KRS00014_003054= (A↓wbT←-A↓f←)/(2*t↓w←); 
                M↓bT,V,Rd← →KRS00014_003058= A↓wbT←*f↓yb←/γ↓M0←*(0.5*h↓wb←-z↓pl←+z↓pl←↑2←/h↓wb←)+A↓f←*f↓yb←/γ↓M0←*(0.5*t↓f←+z↓pl←); 
            } 
        } 
        
        N↓Ed← →KRS00014_003059= N↓bT,Ed←; 
        IF(bHS) { 
            M↓bT,NV,Rd← →KRS01026_000026= MAX(M↓bT,V,Rd←*(1-(N↓Ed←/N↓bT,Rd←)), 0); 
        } ELSE { 
            M↓bT,NV,Rd← →KRS00014_003060= MAX(M↓bT,V,Rd←*(1-(N↓Ed←/N↓bT,Rd←)↑2←), 0); 
        } 
        →KRS01026_000001DataExchange.Set("M_bT_NV_Rd", M↓bT,NV,Rd←); 
        →KRS00014_003165PAGEBREAK(); 
        
        →KRS00014_003065TEXT("Vierendeel resistance due to local composite action"); 
        IF(WOShape == 0) { 
            →KRS00014_003181RenameVar(l↓o,eq←, "l↓o←"); 
        } 
        IF(FLOOR(l↓o,eq←/s) == 0) { 
            n↓sco← →KRS00014_003069= 0; 
        } ELSE { 
            n↓sco← →KRS00014_003070= FLOOR(l↓o,eq←/s)*n↓r←; 
        } 
        ΔN↓c,Rd← →KRS00014_003073= n↓sco←*P↓Rd←; 
        
        IF(l↓o,eq← &lt;= 5*(t↓f←+h↓wt←)) { 
            k↓o← →KRS00014_003075= 1; 
        } ELSE { 
            IF(bHS) { 
                k↓o← →KRS01026_000030= 1-l↓o,eq←/(35*(t↓f←+h↓wt←)); 
            } ELSE { 
                k↓o← →KRS00014_003076= 1-l↓o,eq←/(25*(t↓f←+h↓wt←)); 
            } 
        } 
        M↓vc,Rd← →KRS00014_003077= ΔN↓c,Rd←*(h↓s←+z↓t←-0.5*h↓c←)*k↓o←; 
        →KRS00014_003210PAGEBREAK(); 
        
        →KRS00014_003209TEXT("Total resistance"); 
        M↓Vb,Res← →KRS00014_003082= 2*M↓tT,NV,Rd←+2*M↓bT,NV,Rd←+M↓vc,Rd←; 
        M↓Vb,Lim← →KRS00014_003085= ABS(V↓Ed,fin,o,edge←)*l↓o,eq←; 
        
        IF(COMPARE(M↓Vb,Res←, 0, 6) == 1) { 
            UC↓fin,VB,o← →KRS00014_003182= M↓Vb,Lim←/M↓Vb,Res←; 
        } ELSE { 
            UC↓fin,VB,o← →KRS00014_003183= 999; 
        } 
        IF(IO.IsDrawing) { 
            IF(COMPARE(UC↓fin,VB,o←, 1, 6) != 1) { 
                →KRS00014_003184TEXT("≤ 1"); 
                →KRS00014_003185TEXT("OK"); 
                →KRS00014_003186TEXT("The Vierendeel bending resistance of the section is adequate."); 
            } ELSE { 
                →KRS00014_003187TEXT("&gt; 1"); 
                →KRS00014_003188TEXT("NOT OK"); 
                →KRS00014_003189TEXT("The Vierendeel bending resistance of the section is not adequate."); 
            } 
            →KRS00014_003190PAGEBREAK(); 
        } 
    } 
    
    public void ShearBuckling(double CN, double SCN, out double UC↓fin,SB,o←) { 
        →KRS00014_003100double&lt;kN,2&gt; V↓b,Rd←; 
        →KRS00014_003101double&lt;kN,2&gt; V↓wo,Rd←; 
        →KRS00014_003197double&lt;kN,-2&gt; V↓Ed,fin,o← →KRS00014_003198= DataExchange.ULS_Fin_Forces_Opening.Vz; 
        →KRS00014_003199double&lt;,-2&gt; UC↓fin,SB,o←; 
        
        string sText →KRS00014_003092= TR("Shear buckling"); 
        →KRS00014_003093TEXT(CN &amp; "." &amp; SCN &amp; " " &amp; sText); 
        IF(!DataExchange.Contains("h_w")) { //can be already calculated
            →KRS00014_003194DataExchange.Set("h_w", h↓w←); 
            →KRS00014_001276DataExchange.Set("ε", ε); 
        } 
        →KRS00014_003195Functions_general.→KRS00014_003196ShearBucklingCheck(DataExchange, false, true, out V↓b,Rd←); 
        UC↓fin,SB,o← →KRS00014_002667= ABS(V↓Ed,fin,o←)/V↓b,Rd← @REF("(5.10)"); 
        
        IF(IO.IsDrawing) { 
            IF(COMPARE(UC↓fin,SB,o←, 1, 6) != 1) { 
                →KRS00014_001299TEXT("≤ 1"); 
                →KRS00014_001300TEXT("OK"); 
                →KRS00014_001301TEXT("The shear buckling of the section is adequate."); 
            } ELSE { 
                →KRS00014_001302TEXT("&gt; 1"); 
                →KRS00014_001303TEXT("NOT OK"); 
                →KRS00014_001304TEXT("The shear buckling of the section is not adequate."); 
            } 
            →KRS00014_001305PAGEBREAK(); 
        } 
    } 
    
    
    //---------------------------Private functions-----------------------------  
    private void Get_Ar(out double A↓r←) { 
        bool bHS →KRS01026_000043= DataExchange.bHS; 
        →KRS01026_000011double&lt;-,0&gt; HS_type →KRS01026_000012= DataExchange.HS_type; 
        →KRS01026_000046double&lt;mm,2&gt; t↓r← →KRS01026_000047= DataExchange.HS_tr; 
        →KRS01026_000048double&lt;mm,2&gt; b↓r← →KRS01026_000049= DataExchange.HS_br; 
        
        IF(bHS) { //Horizontal stiffener
            SWITCH(HS_type) { 
                CASE 0 :  { //single side stiffener
                    A↓r← →KRS01026_000016= t↓r←*MIN(b↓r←, 10*ε*t↓r←); 
                } 
                CASE 1 :  { //double side stiffener
                    A↓r← →KRS01026_000017= 2*t↓r←*MIN(b↓r←, 10*ε*t↓r←); 
                } 
                DEFAULT :  { A↓r← →KRS01026_000018= 0; } 
            } 
        } 
    } 
    
    private double Get_Beta_w() { 
        IF(COMPARE(HS_fy, 235000000, 6) != 1) { 
            return 0.8; 
        } ELSE { 
            IF(COMPARE(HS_fy, 275000000, 6) != 1) { 
                return 0.85; 
            } ELSE { 
                IF(COMPARE(HS_fy, 355000000, 6) != 1) { 
                    return 0.9; 
                } ELSE { 
                    return 1.0; 
                } 
            } 
        } 
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
            
            T[1][0].Value →KRS00014_002310= TR("Global bending"); 
            T[1][1].Value →KRS00014_002311= "UC↓fin,M,o←"; 
            T[1][2].Value →KRS00014_002312= UC↓fin,M,o←.ToString("0.00"); 
            
            T[2][0].Value →KRS00014_002313= TR("Vertical shear"); 
            T[2][1].Value →KRS00014_002314= "UC↓fin,V,o←"; 
            T[2][2].Value →KRS00014_002315= UC↓fin,V,o←.ToString("0.00"); 
            
            T[3][0].Value →KRS00014_002316= TR("Vierendeel bending"); 
            T[3][1].Value →KRS00014_002317= "UC↓fin,VB,o←"; 
            T[3][2].Value →KRS00014_002318= UC↓fin,VB,o←.ToString("0.00"); 
            
            T[4][0].Value →KRS00014_002319= TR("Shear buckling"); 
            T[4][1].Value →KRS00014_002320= "UC↓fin,SB,o←"; 
            T[4][2].Value →KRS00014_002321= UC↓fin,SB,o←.ToString("0.00"); 
            
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
            →KRS00014_002686DrawStatus(T, 1, UC↓fin,M,o←); 
            →KRS00014_002687DrawStatus(T, 2, UC↓fin,V,o←); 
            →KRS00014_002688DrawStatus(T, 3, UC↓fin,VB,o←); 
            →KRS00014_002689DrawStatus(T, 4, UC↓fin,SB,o←); 
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
    
    private void DrawStatusStiffeners(object T, double row, bool IsOK, out bool Status) { 
        //Add colored status OK/Not OK
        IF(IsOK) { 
            T[row][1].Value =  { →KRS01026_000074FontsAndColors.DrawGraphicsForCheckStatus(1); } 
            IF(Status) { Status →KRS01026_000077= true; } //Status starts on true and can be changed only to false. When it happend, it remains false
        } ELSE { 
            T[row][1].Value =  { →KRS01026_000075FontsAndColors.DrawGraphicsForCheckStatus(0); } 
            Status →KRS01026_000078= false; 
        } 
    } 
    
    private void SetTable(object T) { 
        T.BorderPen →INI00400_018670= FontsAndColors.TableBorderPen(); 
        T[0].BorderPen →INI00400_018671= FontsAndColors.TableBorderPen(); 
        T.GridPen →INI00400_018672= FontsAndColors.TableGridPen(); 
        T.Rows[0].Font →INI00400_018673= FontsAndColors.TableHeaderFont(); 
        T.Font →INI00400_018674= FontsAndColors.TableCellsFont(); 
        T.Padding.All →INI00400_018675= 5; 
        T.Padding.Top →INI00400_018676= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
        T.Padding.Bottom →INI00400_018677= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
    } 
    
} 
//-----------------------------calculation----------------------------

→KRS00014_000043BLOCK { //standalone drawing of output
    IF(!IO.IsExternCLC) { 
        object Functions_general →KRS00014_001216= LoadExternCLC(Tools.Dir_Forms &amp; "Composite\EC\EC_Functions\Functions_general.CLC"); 
        object Functions_NA →KRS00014_001221= LoadExternCLC(Tools.Dir_Forms &amp; "Composite\EC\EC_Functions\Functions_NA.CLC"); 
        object DataExchange →KRS00014_000808= Functions_general.GetMemberDataStandalone(); // fill DataExchange for standalone
        double γ↓M0← →KRS00014_001218= Functions_NA.GetGammasSteel().γ_M0; 
        double γ↓M2← →KRS01026_000072= Functions_NA.GetGammasConnection().γ_M2; 
        double γ↓C← →KRS00014_000589= Functions_NA.GetGammas(DataExchange.ULS_Fin_Loads_M).γ_C; 
        →KRS00014_000960DataExchange.Set("γ_M0", γ↓M0←); 
        →KRS01026_000073DataExchange.Set("γ_M2", γ↓M2←); 
        →KRS00014_000961DataExchange.Set("γ_C", γ↓C←); 
        double η↓sb← →KRS00014_001220= Functions_NA.GetEtaSb(DataExchange.f_yb, 20, false); //20 - temperature 20°C, false - bridge
        →KRS00014_000963DataExchange.Set("η_sb", η↓sb←); 
        
        →KRS00014_002902DataExchange.Set("n_sp", 8); 
        →KRS00014_002903DataExchange.Set("P_Rd", 145000); 
        
        double CN →KRS00014_001217= 3; 
        IF(DataExchange.bDrawAllOpenings) { 
            FOR(i, 0, DataExchange.Openings.Count-1) { 
                object FinalULS →KRS00014_001022= new ULSFinalStageCheckOpening(i, DataExchange); 
                →KRS00014_001222FinalULS.ULSFinStageCheckOpening(out CN); 
            } 
        } ELSE { 
            object FinalULS →KRS00014_003214= new ULSFinalStageCheckOpening(0, DataExchange); 
            →KRS00014_003215FinalULS.ULSFinStageCheckOpening(out CN); 
        } 
    } 
} 
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="" Autor2="" Version="1" EWNSource="Composite.xml" Icon="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">
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
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" />
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|1|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="NormReference" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Subchapter 1 row" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
      <Style Key="Text 3 Bold" X="30" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" />
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
      <Variable Modifier="Public" Name="FinalULS" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>FinalULS</ENU>
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
      <Variable Modifier="Public" Name="γ↓C←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>γ↓C←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
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
      <Variable Modifier="Public" Name="γ↓M2←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>γ↓M2←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="η↓sb←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>η↓sb←</ENU>
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
      <VC ID="GMP01026_000186">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000187">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000188">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000189">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000190">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000201">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000508">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000509">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000510">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000559">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000560">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000561">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000562">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000563">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000564">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000565">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000566">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000780">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000787">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000788">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000789">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000790">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000791">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000792">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000793">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000794">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000795">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000796">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000797">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000798">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000799">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000800">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000801">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000802">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000806">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000807">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000810">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000811">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000812">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000813">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000814">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000816">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000817">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000820">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000824">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000828">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000830">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000831">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000832">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000833">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000834">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000835">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000836">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000837">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000838">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000858">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000859">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000861">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000864">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="GMP01026_000865">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000938">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_000939">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001734">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI00400_001739">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="INI00400_018670">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018671">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018672">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018673">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018674">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018675">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018676">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI00400_018677">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
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
      <VC ID="KRS00014_000589">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000600">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000601">
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
      <VC ID="KRS00014_000612">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000625">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000626">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
      <VC ID="KRS00014_000961">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_000963">
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
      <VC ID="KRS00014_000973">
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
      <VC ID="KRS00014_001121">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001125">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001126">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001127">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001128">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001129">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001130">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001131">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001132">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
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
      <VC ID="KRS00014_001189">
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
      <VC ID="KRS00014_001220">
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
      <VC ID="KRS00014_001222">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="None" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
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
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001276">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001291">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001292">
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001299">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001300">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001301">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001302">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001303">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001304">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001305">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
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
      <VC ID="KRS00014_001656">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_001658">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
      <VC ID="KRS00014_002313">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002314">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002315">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002316">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002317">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002318">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002319">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002320">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002321">
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
      <VC ID="KRS00014_002368">
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
      <VC ID="KRS00014_002662">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_002667">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002688">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002689">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002702">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002750">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002751">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002752">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002753">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002754">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002755">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002759">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002760">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002761">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002789">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002799">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002805">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002806">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002807">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002808">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002809">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002813">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002814">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002815">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002816">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002817">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="None" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002818">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002820">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002822">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002823">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002824">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002826">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002829">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002830">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002834">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002835">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002836">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002838">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
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
      <VC ID="KRS00014_002841">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002842">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002860">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002877">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_002879">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002882">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002883">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002884">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002887">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002888">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002890">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002893">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002896">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002897">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002900">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002901">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
      <VC ID="KRS00014_002904">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002907">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002908">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002909">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002912">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002914">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002915">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002917">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002924">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002925">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002927">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002929">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002930">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002931">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002932">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002933">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002934">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002936">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002938">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002939">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002941">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002944">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002945">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002947">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002948">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002955">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002956">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002957">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002958">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002961">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002963">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002965">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002968">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002969">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002970">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002971">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002975">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="21" />
      </VC>
      <VC ID="KRS00014_002976">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002978">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002979">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002980">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002981">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002982">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002984">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002986">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002988">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002989">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002991">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_002992">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002993">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002994">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_002999">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003000">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_003005">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003008">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003009">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003010">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003014">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
      </VC>
      <VC ID="KRS00014_003015">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
      </VC>
      <VC ID="KRS00014_003017">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003019">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003020">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_003021">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003023">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003026">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003030">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003031">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003033">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003035">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003036">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003038">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003041">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_003043">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_003046">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003050">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003051">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003053">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003054">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003057">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
      </VC>
      <VC ID="KRS00014_003058">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
      </VC>
      <VC ID="KRS00014_003059">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003060">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003062">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003064">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003065">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003068">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003069">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003070">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003072">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003073">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003075">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_003076">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003077">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003078">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003080">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003082">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003085">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003087">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003090">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003091">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003092">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003093">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003103">
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003104">
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003105">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003106">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003110">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003112">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003114">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003116">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003118">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003119">
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_003120">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003121">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003123">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003125">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003131">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003132">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003133">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003134">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003136">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003137">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003138">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003139">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003145">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003147">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003148">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003150">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
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
      <VC ID="KRS00014_003161">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003163">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003165">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003170">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003171">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003173">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003175">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003181">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003182">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003183">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS00014_003184">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003185">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003186">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003187">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003188">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3 Bold" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003189">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003190">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003194">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003195">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003198">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003204">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003205">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003206">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003207">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003208">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003209">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003210">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003211">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00014_003212">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
      <VC ID="KRS00014_003215">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00100_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00100_000002">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS00100_000003">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00100_000004">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00100_000005">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00100_000006">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000002">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000003">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000014">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000015">
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000016">
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000018">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000019">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS00400_000020">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000001">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000005">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000007">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000009">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000012">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000014">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000016">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000017">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000018">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000019">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000020">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
      </VC>
      <VC ID="KRS01026_000022">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
      </VC>
      <VC ID="KRS01026_000024">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
      </VC>
      <VC ID="KRS01026_000025">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="31" />
      </VC>
      <VC ID="KRS01026_000026">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000030">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000031">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000032">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000033">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000038">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000040">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000042">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000043">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000047">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000049">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000050">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000051">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000054">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000057">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000059">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000061">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000064">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000065">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000066">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000067">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000068">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000069">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000070">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
      <VC ID="KRS01026_000073">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000074">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000075">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000076">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
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
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000080">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000081">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000082">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000083">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000084">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000085">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000086">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000087">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000088">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000089">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000090">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000091">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000101">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS01026_000102">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000004">
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000007">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000009">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000010">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS18100_000011">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000012">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="KRS18100_000013">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="KRS18100_000014">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="POR01026_000001">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
      </VC>
      <VC ID="POR01026_000005">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
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
    <Images>
      <Image Name="beff" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TCustomLibrary Name="" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="British BS-EN">
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
    <Item TranslateID="STRING_08301A70">
      <ENU>"Distance to the inner surface of the flange"</ENU>
    </Item>
    <Item TranslateID="STRING_2F1EB77D">
      <ENU>"Area of stiffener"</ENU>
    </Item>
    <Item TranslateID="STRING_347A34E7">
      <ENU>"Unity check"</ENU>
    </Item>
    <Item TranslateID="STRING_36BB6DBE">
      <ENU>"Global bending"</ENU>
    </Item>
    <Item TranslateID="STRING_41486B05">
      <ENU>"Minimum offset from opening"</ENU>
    </Item>
    <Item TranslateID="STRING_45BD6CF1">
      <ENU>"Distance from the closest support"</ENU>
    </Item>
    <Item TranslateID="STRING_6F45EF7A">
      <ENU>"Check"</ENU>
    </Item>
    <Item TranslateID="STRING_875E924A">
      <ENU>"Vierendeel bending"</ENU>
    </Item>
    <Item TranslateID="STRING_9541CFA7">
      <ENU>"Opening"</ENU>
    </Item>
    <Item TranslateID="STRING_B44050BB">
      <ENU>"Shear buckling"</ENU>
    </Item>
    <Item TranslateID="STRING_C130CB0F">
      <ENU>"Distance between studs"</ENU>
    </Item>
    <Item TranslateID="STRING_C1549C5D">
      <ENU>"Thickness of the stiffener"</ENU>
    </Item>
    <Item TranslateID="STRING_C93E6D9A">
      <ENU>"Length of the opening"</ENU>
    </Item>
    <Item TranslateID="STRING_CA6A86ED">
      <ENU>"Width of the stiffener"</ENU>
    </Item>
    <Item TranslateID="STRING_CB914422">
      <ENU>"Vertical shear"</ENU>
    </Item>
    <Item TranslateID="STRING_D1132318">
      <ENU>"Anchorage length"</ENU>
    </Item>
    <Item TranslateID="STRING_D5DBECED">
      <ENU>"Status"</ENU>
    </Item>
    <Item TranslateID="STRING_E183C52F">
      <ENU>"Symbol"</ENU>
    </Item>
    <Item TranslateID="STRING_F4FC5297">
      <ENU>"Web thickness"</ENU>
    </Item>
    <Item TranslateID="STRING_F889AF9B">
      <ENU>"Weld throat thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_GMP01026_000186">
      <ENU>"Geometry recommendations for stiffened openings"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI00400_001734">
      <ENU>"No adjacent member or slab edge was found on the left side."</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_000972">
      <ENU>sconstr_stage &amp; " " &amp; WOName</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_000973">
      <ENU>CN &amp; "." &amp; SCN &amp; " " &amp; sText</ENU>
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
    <Item TranslateID="TEXT_KRS00014_001121">
      <ENU>"The influence of the vertical shear on the bending moment resistance may be neglected."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001126">
      <ENU>"The bending moment resistance of the section is adequate."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001127">
      <ENU>"The bending moment resistance of the section is not adequate."</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_001128">
      <ENU>"≤ 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001129">
      <ENU>"OK"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_001130">
      <ENU>"&gt; 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001131">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001163">
      <ENU>"ULS check of Final stage is OK."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001164">
      <ENU>"ULS check of Final stage is NOT OK."</ENU>
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
    <Item ID="TEXT_KRS00014_001299">
      <ENU>"≤ 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001300">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001301">
      <ENU>"The shear buckling of the section is adequate."</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_001302">
      <ENU>"&gt; 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001303">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_001304">
      <ENU>"The shear buckling of the section is not adequate."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_002818">
      <ENU>"Equivalent opening geometry"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_002823">
      <ENU>"Top tee"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_002830">
      <ENU>"Bottom tee"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_002840">
      <ENU>CN &amp; "." &amp; SCN &amp; " " &amp; sText</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_002883">
      <ENU>"Effect of high shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_002884">
      <ENU>"Resistance"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_002908">
      <ENU>"PNA in concrete"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_002909">
      <ENU>"PNA in top Tee"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_002929">
      <ENU>"Concrete slab resistance"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_002971">
      <ENU>CN &amp; "." &amp; SCN &amp; " " &amp; sText</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_002989">
      <ENU>"Top tee resistance"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003035">
      <ENU>"Bottom tee resistance"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003065">
      <ENU>"Vierendeel resistance due to local composite action"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_003093">
      <ENU>CN &amp; "." &amp; SCN &amp; " " &amp; sText</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003118">
      <ENU>"No adjacent member or slab edge was found on the right side."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003138">
      <ENU>"Compression capacity of top Tee is sufficient."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003170">
      <ENU>"Top Tee fulfils the Classification limit for Class 2."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003171">
      <ENU>"Bottom Tee fulfils the Classification limit for Class 2."</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_003184">
      <ENU>"≤ 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003185">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003186">
      <ENU>"The Vierendeel bending resistance of the section is adequate."</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_003187">
      <ENU>"&gt; 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003188">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003189">
      <ENU>"The Vierendeel bending resistance of the section is not adequate."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003205">
      <ENU>"Total resistance"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003206">
      <ENU>"Total resistance"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_003207">
      <ENU>"N↓c,Rd← ≥ N↓bT,Rd←"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_003208">
      <ENU>"N↓c,Rd← &lt; N↓bT,Rd←"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00014_003209">
      <ENU>"Total resistance"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_003211">
      <ENU>'A↓tT,cap←*f↓yb←/γ↓M0←' &amp; " ≥ " &amp; 'N↓bT,Rd←-N↓c,Rd←' &amp; "  -&gt;  " &amp; A↓tT,cap←*f↓yb←/γ↓M0← &amp; " ≥ " &amp; N↓bT,Rd←-N↓c,Rd← &amp; "  -&gt;  " &amp; Val((A↓tT,cap←*f↓yb←/γ↓M0←)*10↑-3←, 2) &amp; " kN ≥ " &amp; Val((N↓bT,Rd←-N↓c,Rd←)*10↑-3←, 2) &amp; " kN"</ENU>
    </Item>
    <Item ID="TEXT_KRS00014_003212">
      <ENU>'A↓tT,cap←*f↓yb←/γ↓M0←' &amp; " &lt; " &amp; 'N↓bT,Rd←-N↓c,Rd←' &amp; "  -&gt;  " &amp; A↓tT,cap←*f↓yb←/γ↓M0← &amp; " &lt; " &amp; N↓bT,Rd←-N↓c,Rd← &amp; "  -&gt;  " &amp; Val((A↓tT,cap←*f↓yb←/γ↓M0←)*10↑-3←, 2) &amp; " kN &lt; " &amp; Val((N↓bT,Rd←-N↓c,Rd←)*10↑-3←, 2) &amp; " kN"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00400_000001">
      <ENU>"Equivalent opening geometry"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS00400_000017">
      <ENU>"Not supported"</ENU>
    </Item>
    <Item ID="TEXT_KRS18100_000002">
      <ENU>'A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0←' &amp; " &lt; " &amp; 'N↓bT,Rd←-N↓c,Rd←' &amp; "  -&gt;  " &amp; A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0← &amp; " &lt; " &amp; N↓bT,Rd←-N↓c,Rd← &amp; "  -&gt;  " &amp; Val((A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0←)*10↑-3←, 2) &amp; " kN &lt; " &amp; Val((N↓bT,Rd←-N↓c,Rd←)*10↑-3←, 2) &amp; " kN"</ENU>
    </Item>
    <Item ID="TEXT_KRS18100_000005">
      <ENU>'A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0←' &amp; " ≥ " &amp; 'N↓bT,Rd←-N↓c,Rd←' &amp; "  -&gt;  " &amp; A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0← &amp; " ≥ " &amp; N↓bT,Rd←-N↓c,Rd← &amp; "  -&gt;  " &amp; Val((A↓tT,cap←*f↓yb←/γ↓M0←+A↓r←*f↓yr←/γ↓M0←)*10↑-3←, 2) &amp; " kN ≥ " &amp; Val((N↓bT,Rd←-N↓c,Rd←)*10↑-3←, 2) &amp; " kN"</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS18100_000006">
      <ENU>"Compression capacity of top Tee is sufficient."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS18100_000011">
      <ENU>"Top Tee is assumed to fulfil the Classification limit for Class 2."</ENU>
    </Item>
    <Item TranslateID="TEXT_KRS18100_000013">
      <ENU>"Bottom Tee is assumed to fulfil the Classification limit for Class 2."</ENU>
    </Item>
  </Texts>
</Root>