<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="9446a8aa-280d-496e-ae78-67dc4711c342">
  <CodeEditor>
    <SourceCode Collapsed="61" BreakPoints="">→INI400_007174BLOCK { // using data exchange structure
    bool ValidateInput(object Input) { //Validate inputs from master to this form
        ReinfType →INI400_007180= Input.Get("ReinfType"); // type of reinforcement; 0 - normal, 1 - prestressed
        
        //For cmin,b normal reinf
        BondArrangement →INI400_007181= Input.Get("BondArrangement"); //Arrangement of bonds; 0 - separated, 1 - bundled
        d↓g← →INI400_007182= Input.Get("dg"); //Nominal aggregated size
        ϕ↓l← →INI400_007183= Input.Get("ϕl"); //diameter of longitudinal reinforcement
        ϕ↓s← →INI400_007184= Input.Get("ϕs"); //diameter of stirrups
        BundledType →INI400_007185= Input.Get("BundledType"); //Type of using of bundled reinforcement; 0 - Vertical bars in compression and for bars in a lapped joint, 1 - All other cases
        n↓b← →INI400_007197= Input.Get("nb"); //number of bars in the bundle
        
        //For cmin,b prestress reinf
        TensionType →INI400_000005= Input.Get("TensionType"); // type of prestressing reinforcement, 0 - post-tensioned, 1 - pre-tensioned
        DuctShape →INI400_000006= Input.Get("DuctShape"); // type of shape of duct, 0 - circular, 1 - rectangular
        WireType →INI400_000008= Input.Get("WireType"); // type of wire, 0 - strand or plain wire, 1 - indented wire
        ϕ↓duct← →INI400_000007= Input.Get("ϕduct"); // diameter of circular duct
        ϕ↓w← →INI400_000064= Input.Get("ϕw"); // diameter of wire
        a →INI400_000037= Input.Get("a"); // smaller dimension of rectangular duct
        b →INI400_000038= Input.Get("b"); // greater dimension of rectangular duct
        
        //For cmin,dur
        DesignLife →INI400_007186= Input.Get("DesignLife"); // design life of construction [years]
        SlabGeometry →INI400_007187= Input.Get("SlabGeometry"); // True - member with slab geometry
        SpecialQuality →INI400_007188= Input.Get("SpecialQuality"); // True - special quality control of the concete is ensured
        PrefabricatedSpecialQuality →INI400_007189= Input.Get("PrefabricatedSpecialQuality"); // True - special quality control for prefabricated - only ÖNORM
        ConstructionClass1 →INI400_007190= Input.Get("ConstructionClass1"); // True - construction class 1 is used (RakMK B4) - only SFS
        CemType →INI400_007192= Input.Get("CemType"); // cement/combination type - only for BS, IS, MAL, SIG - 0,1,2,...,26,27
        XC →INI400_007193= Input.Get("XC"); // Exposure class for corrosion by carbonation, 0,1,2,3,4
        XD →INI400_007194= Input.Get("XD"); // Exposure class for corrosion by chlorides, 0,1,2,3
        XS →INI400_007195= Input.Get("XS"); // Exposure class for corrosion by chlorides from sea water, 0,1,2,3
        vtc↓ekv← →INI400_007196= Input.Get("vtc_ekv"); // water ratio, only for SS, 0 - 1
        NormalReinf →INI400_007186= Input.Get("NormalReinf"); // True - normal reinforcement is used - only for SS
        f↓ck← →INI400_007205= Input.Get("fck"); // Characteristic compressive cylinder strength

        //For Δcdur,γ
        Quality →INI400_000052= Input.Get("Quality"); // True - Quality assurance system for prestress is used, only for IS
        
        XM →INI400_007179= Input.Get("XM"); //Abrasion class
        k↓2,user← →INI400_007199= Input.Get("k2_user"); // User defined increase of cover for concrete cast directly against soil, only for SFS
        UnevenSurf →INI400_011043= Input.Get("UnevenSurf"); //True - Uneven surface
        Unevenness →INI400_011044= Input.Get("Unevenness"); //Type of unevenes, 0 - concrete cast against prepared ground, 1 - concrete cast directly against soil

        //For Δcdev
        Deviation →INI400_011042= Input.Get("Deviation"); //Allowance in design for deviation, 0 - standard, 1 - quality assurance system , 2 - very accurate measurement device      

        bool Result →INI400_000020= true; 
        IF(ReinfType != 0 &amp;&amp; ReinfType != 1) { 
            →INI400_000050EWN.TraceEWN("E1_KRS_cover"); 
            Result →INI400_000051= False; 
        } 
        IF(BondArrangement != 0 &amp;&amp; BondArrangement != 1) { 
            →INI400_007200EWN.TraceEWN("E2_KRS_cover"); 
            Result →INI400_007201= False; 
        } 
        IF(d↓g← &lt; 0) { 
            →INI400_007202EWN.TraceEWN("E3_KRS_cover"); 
            Result →INI400_007203= False; 
        } 
        return Result; 
    } 
    object GetOutput() { //Outputs from this form to master
        object Output →INI400_011033= new Structure(); 
        →INI400_011034Output.Add("c_nom", c↓nom←); 
        →INI400_011035Output.Add("c_min", c↓min←); 
        →INI400_011036Output.Add("Δc_dev", Δc↓dev←); 
        →INI400_011037Output.Add("c_min_b", c↓min,b←); 
        →INI400_011038Output.Add("c_min_dur", c↓min,dur←); 
        →INI400_011039Output.Add("Δc_dur_st", Δc↓dur,st←); 
        →INI400_011040Output.Add("Δc_dur_add", Δc↓dur,add←); 
        →INI400_011041Output.Add("Δc_dur_γ", Δc↓dur,γ←); 
        →INI400_013801Output.Add("S", S); 
        return Output; 
    } 
} 
→INI400_012733BLOCK { 
    object fontsColors →INI400_012730= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete\Functions\FontsAndColors.CLC"); 
    object FontsAndColors →INI400_012732= fontsColors.GetFontsAndColors(); 
} 
object Input →INI400_006851= new Structure(); 
object Output →INI400_006878= new Structure(); 
string NormCode →INI400_006951= IO.SetupNA.EC_NA.Code; 
double S →INI400_013804= 0; 
IF(!IO.IsStandalone) { 
    SurfaceType →KRS106_000001= Unevenness; 
    ConcreteType →KRS106_000002= Deviation; 
} 

→INI400_010903TEXT("Calculation of required concrete cover c↓nom←"); 
→INI400_006469BLOCK { 
    →INI400_000003TEXT(Description("c↓min,b←")); 
    SWITCH(ReinfType) { 
        CASE 0 :  { 
            SWITCH(BondArrangement) { 
                CASE 0 :  { 
                    IF(COMPARE(d↓g←, 0.032, 6) != 1) { 
                        c↓min,b,l← →INI400_006465= ϕ↓l←; 
                        c↓min,b,s← →INI400_006466= ϕ↓s←; 
                    } ELSE { 
                        c↓min,b,l← →INI400_006470= ϕ↓l←+PhysConst(5, "mm"); 
                        c↓min,b,s← →INI400_006467= ϕ↓s←+PhysConst(5, "mm"); 
                    } 
                    c↓min,b← →INI400_006468= MAX(c↓min,b,l←-ϕ↓s←, c↓min,b,s←) @REF("§4.4.1.2(3)"); 
                } 
                CASE 1 :  { 
                    SWITCH(BundledType) { 
                        CASE 0 :  { 
                            c↓min,b← →INI400_000010= MIN(ϕ↓l←*SQRT(n↓b←), PhysConst(55, "mm")) @REF("8.14"); 
                        } 
                        CASE 1 :  { 
                            c↓min,b← →INI400_000012= MIN(ϕ↓l←*SQRT(n↓b←), PhysConst(55, "mm")) @REF("8.14"); 
                        } 
                    } 
                } 
            } 
        } 
        CASE 1 :  { 
            →INI400_005902BLOCK { //NA.2.18 Clause 4.4.1.2 Minimum cover c↓min←, Paragraph(3)
                object Clause4_4_1_2_3 →INI400_005903= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.2(3).CLC"); 
                →INI400_006879Input.Add("TensionType", TensionType); 
                →INI400_006880Input.Add("DuctShape", DuctShape); 
                →INI400_006881Input.Add("WireType", WireType); 
                →INI400_006882Input.Add("ϕ↓duct←", ϕ↓duct←); 
                →INI400_006883Input.Add("a", a); 
                →INI400_006884Input.Add("ϕ↓w←", ϕ↓w←); 
                →INI400_006885Input.Add("b", b); 
                →INI400_006886Clause4_4_1_2_3.Draw(Input, Output); 
                c↓min,b← →INI400_006859= Output.c_min_b; 
            } 
        } 
    } 
    →INI400_006322TEXT(Description("c↓min,dur←")); 
    →INI400_006324BLOCK { //NA.2.19 Clause 4.4.1.2 Minimum cover c↓min,dur←, Paragraph(5)
        object Clause4_4_1_2_5 →INI400_006325= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.2(5).CLC"); 
        →INI400_006891Input.Add("DesignLife", DesignLife); 
        →INI400_006892Input.Add("SlabGeometry", SlabGeometry); 
        →INI400_006893Input.Add("SpecialQuality", SpecialQuality); 
        →INI400_006894Input.Add("PrefabricatedSpecialQuality", PrefabricatedSpecialQuality); 
        →INI400_006895Input.Add("ConstructionClass1", ConstructionClass1); 
        →INI400_006887Input.Add("Prestress", ReinfType); 
        →INI400_006899Input.Add("CemType", CemType); 
        →INI400_006900Input.Add("XC", XC); 
        →INI400_006901Input.Add("XD", XD); 
        →INI400_006902Input.Add("XS", XS); 
        →INI400_006903Input.Add("vtc_ekv", vtc↓ekv←); 
        →INI400_006904Input.Add("NormalReinf", NormalReinf); 
        →INI400_006905Input.Add("fck", f↓ck←); 
        →INI400_006917Clause4_4_1_2_5.Draw(Input, Output, 0); 
        c↓min,dur← →INI400_006898= Output.c_min_dur; 
        S →INI400_013805= Output.S; 
    } 
    →INI400_006347TEXT(Description("Δc↓dur,γ←")); 
    →INI400_005927BLOCK { //NA.2.20 Clause 4.4.1.2 Minimum cover, Paragraph (6)
        object Clause4_4_1_2_6 →INI400_005928= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.2(6).CLC"); 
        →INI400_006921Input.Add("Prestres", ReinfType); 
        →INI400_006922Input.Add("Quality", Quality); 
        →INI400_006923Clause4_4_1_2_6.Calculate(Input, Output); 
        Δc↓dur,γ← →INI400_006890= Output.Δ_c_dur_γ @REF("§4.4.1.2(6)"); 
    } 
    →INI400_006349TEXT(Description("Δc↓dur,st←")); 
    IF(StainlessSteel) { 
        →INI400_005922BLOCK { //NA.2.21 Clause 4.4.1.2 Minimum cover, Paragraph (7)
            object Clause4_4_1_2_7 →INI400_005923= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.2(7).CLC"); 
            →INI400_006927Clause4_4_1_2_7.Calculate(Input, Output); 
            Δc↓dur,st← →INI400_006926= Output.Δ_c_dur_st @REF("§4.4.1.2(7)"); 
        } 
    } ELSE { 
        Δc↓dur,st← →INI400_006350= 0 @REF("§4.4.1.2(7)"); 
    } 
    →INI400_006351TEXT(Description("Δc↓dur,add←")); 
    →INI400_005915BLOCK { //NA.2.22 Clause 4.4.1.2 Minimum cover, Paragraph (8)
        object Clause4_4_1_2_8 →INI400_005916= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.2(8).CLC"); 
        →INI400_006930Clause4_4_1_2_8.Calculate(Input, Output); 
        Δc↓dur,add← →INI400_006929= Output.Δ_c_dur_add @REF("§4.4.1.2(8)"); 
    } 
    →INI400_006367TEXT(Description("c↓min←")); 
    c↓min← →INI400_006368= MAX(c↓min,b←, c↓min,dur←+Δc↓dur,γ←-Δc↓dur,st←-Δc↓dur,add←, PhysConst(10, "mm")) @REF("(4.2)"); 
    
    IF(!IO.IsStandalone) { 
        IF(SurfaceType == 3) { 
            k↓3← →INI400_006425= IO.SetupNA.EC_1992_1_1.c_min_une.k[2]; 
            c↓min← →INI400_006429= c↓min←+k↓3← @REF("§4.4.1.2(11)"); 
        } 
    } ELSE { 
        IF(UnevenSurf) { 
            →INI400_006370TEXT(Description("k↓3←")); 
            c↓min← →INI400_006369= c↓min←+PhysConst(5, "mm") @REF("§4.4.1.2(11)"); 
        } 
    } 
    
    IF(XM != 0) { 
        →INI400_006371TEXT(Description("k")); 
        →INI400_005932BLOCK { //NA.2.23 Clause 4.4.1.2 Partial factors for prestress, Paragraph (13)
            object Clause4_4_1_2_13 →INI400_005933= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.2(13).CLC"); 
            →INI400_006931Input.Add("XM", XM); 
            →INI400_006935Clause4_4_1_2_13.Calculate(Input, Output); 
            k →INI400_006934= Output.k; 
            c↓min← →INI400_006375= c↓min←+k @REF("§4.4.1.2(13)"); 
        } 
    } 
    →INI400_006376TEXT(Description("Δc↓dev←")); 
    IF(!IO.IsStandalone) { 
        →INI400_006431BLOCK { //NA.2.25 Clause 4.4.1.3 Allowance in design for deviation, Paragraph (3)
            object Clause4_4_1_3_3 →INI400_006432= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.3(3).CLC"); 
            →INI400_006433Clause4_4_1_3_3.Calculate(Input, Output); 
        } 
        Δc↓dev,acc← →INI400_006436= Output.Δ_c_dev_min_acc; //From SEN: Prefab
        Δc↓dev,min← →INI400_006437= Output.Δ_c_dev_min; //From SEN: In-situ
        Δc↓dev,max← →INI400_006438= Output.Δ_c_dev_max; //From SEN: reduction
        
        IF(SpecialQuality) { 
            IF(ConcreteType == 0) { 
                Δc↓dev← →INI400_006420= Δc↓dev,min←-Δc↓dev,max←; //(2-3)  //in-situ
            } ELSE { 
                Δc↓dev← →INI400_006421= Δc↓dev,acc←-Δc↓dev,max←; //(1-3)  //prefabricated
            } 
        } ELSE { 
            IF(ConcreteType == 0) { 
                Δc↓dev← →INI400_006422= Δc↓dev,min←; //(2)  //in-situ
            } ELSE { 
                Δc↓dev← →INI400_006423= Δc↓dev,acc←; //(1)  //prefabricated
            } 
        } 
    } ELSE { 
        SWITCH(Deviation) { 
            CASE 0 :  { 
                →INI400_006379BLOCK { //NA.2.24 Clause 4.4.1.3 Allowance in design for deviation, Paragraph (1)
                    object Clause4_4_1_3_1 →INI400_006380= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.3(1).CLC"); 
                    →INI400_006938Clause4_4_1_3_1.Calculate(Input, Output); 
                    Δc↓dev← →INI400_006937= Output.Δ_c_dev @REF("§4.4.1.3(1)"); 
                } 
            } 
            CASE 1 :  { 
                →INI400_006388BLOCK { //NA.2.25 Clause 4.4.1.3 Allowance in design for deviation, Paragraph (3)
                    object Clause4_4_1_3_3 →INI400_006389= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.3(3).CLC"); 
                    →INI400_006390Clause4_4_1_3_3.Calculate(Input, Output); 
                } 
                →INI400_006386TEXT("Δc↓dev← is reduced because fabrication is subjected to a quality assurance system, in which&lt;BR&gt;the monitoring includes measurements of the concrete cover."); 
                Δc↓dev← →INI400_006384= Output.Δ_c_dev_min @REF("§4.4.1.3(3)"); 
            } 
            CASE 2 :  { 
                →INI400_006391BLOCK { //NA.2.25 Clause 4.4.1.3 Allowance in design for deviation, Paragraph (3)
                    object Clause4_4_1_3_3 →INI400_006392= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.3(3).CLC"); 
                    →INI400_006393Clause4_4_1_3_3.Calculate(Input, Output); 
                } 
                →INI400_006394TEXT("Δc↓dev← is reduced because very accurate measurement device is used for monitoring and&lt;BR&gt;non conforming members are rejected."); 
                Δc↓dev← →INI400_006395= Output.Δ_c_dev_min_acc @REF("§4.4.1.3(3)"); 
            } 
        } 
    } 
    →INI400_006396TEXT(Description("c↓nom←")); 
    c↓nom← →INI400_006397= c↓min←+Δc↓dev← @REF("§4.4.1.3(1)"); 
    
    IF(!IO.IsStandalone) { 
        IF(SurfaceType &gt; 0) { 
            →INI400_006439TEXT("The influence of special conditions"); 
            →INI400_006440BLOCK { //NA.2.26 Clause 4.4.1.3 Allowance in design for deviation, Paragraph (4)
                object Clause4_4_1_3_4 →INI400_006441= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.3(4).CLC"); 
                →INI400_006942Input.Add("c_min_dur", c↓min,dur←); 
                →INI400_006939Input.Add("c_min", c↓min←); 
                →INI400_006940Input.Add("k2_user", k↓2,user←); 
                →INI400_006941Clause4_4_1_3_4.Calculate(Input, Output); 
            } 
            SWITCH(SurfaceType) { 
                CASE 1 :  { 
                    →INI400_006451TEXT(Description("k↓1←")); //Cast against prepared ground
                    k↓1← →INI400_006446= Output.k1; 
                    SWITCH(NormCode) { 
                        CASE "SFS" :  { 
                            c↓nom← →INI400_006460= k↓1←+Δc↓dev← @REF("§4.4.1.3(3)"); //k1 has already included (c↓min←+k1)
                        } 
                        DEFAULT :  { 
                            c↓nom← →INI400_006452= MAX(c↓nom←, k↓1←) @REF("§4.4.1.3(3)"); 
                        } 
                    } 
                } 
                CASE 2 :  { 
                    →INI400_006454TEXT(Description("k↓2←")); //Cast directly against soil
                    k↓2← →INI400_006447= Output.k2; 
                    SWITCH(NormCode) { 
                        CASE "SFS" :  { 
                            c↓nom← →INI400_006461= k↓2←+Δc↓dev← @REF("§4.4.1.3(3)"); //k1 has already included (c↓min←+k2)
                        } 
                        DEFAULT :  { 
                            c↓nom← →INI400_006462= MAX(c↓nom←, k↓2←) @REF("§4.4.1.3(3)"); 
                        } 
                    } 
                } 
            } 
        } 
    } ELSE { 
        IF(UnevenSurf) { 
            →INI400_006398TEXT("The influence of special conditions"); 
            →INI400_005946BLOCK { //NA.2.26 Clause 4.4.1.3 Allowance in design for deviation, Paragraph (4)
                object Clause4_4_1_3_4 →INI400_005947= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_4.4.1.3(4).CLC"); 
                →INI400_006947Input.Add("c_min_dur", c↓min,dur←); 
                →INI400_006948Input.Add("c_min", c↓min←); 
                →INI400_006949Input.Add("k2_user", k↓2,user←); 
                →INI400_006950Clause4_4_1_3_4.Calculate(Input, Output); 
            } 
            SWITCH(Unevenness) { 
                CASE 0 :  { 
                    k↓1← →INI400_005950= Output.k1; 
                    →INI400_006401TEXT(Description("k↓1←")); //Cast against prepared ground
                    SWITCH(NormCode) { 
                        CASE "SFS" :  { 
                            c↓nom← →INI400_006958= k↓1←+Δc↓dev← @REF("§4.4.1.3(3)"); //k↓1← has already included (c↓min←+k2)
                        } 
                        DEFAULT :  { 
                            c↓nom← →INI400_006959= MAX(c↓nom←, k↓1←) @REF("§4.4.1.3(3)"); 
                        } 
                    } 
                } 
                CASE 1 :  { 
                    k↓2← →INI400_005951= Output.k2; 
                    →INI400_006402TEXT(Description("k↓2←")); //Cast directly against soil
                    SWITCH(NormCode) { 
                        CASE "SFS" :  { 
                            c↓nom← →INI400_006960= k↓2←+Δc↓dev← @REF("§4.4.1.3(3)"); //k↓2← has already included (c↓min←+k2)
                        } 
                        DEFAULT :  { 
                            c↓nom← →INI400_006961= MAX(c↓nom←, k↓2←) @REF("§4.4.1.3(3)"); 
                        } 
                    } 
                } 
            } 
        } 
    } 
} 

IF(IO.IsDrawing &amp;&amp; IO.LayoutIndex == 1) { 
    object T →INI400_007206= new Table(8); 
    //1st row
    T[0][0].Value →INI400_007207= "c↓min,b←&lt;BR&gt;[mm]"; 
    T[0][1].Value →INI400_007209= "c↓min,dur←&lt;BR&gt;[mm]"; 
    T[0][2].Value →INI400_007210= "Δc↓dur,γ←&lt;BR&gt;[mm]"; 
    T[0][3].Value →INI400_007211= "Δc↓dur,st←&lt;BR&gt;[mm]"; 
    T[0][4].Value →INI400_007212= "Δc↓dur,add←&lt;BR&gt;[mm]"; 
    T[0][5].Value →INI400_007213= "c↓min←&lt;BR&gt;[mm]"; 
    T[0][6].Value →INI400_007214= "Δc↓dev←&lt;BR&gt;[mm]"; 
    T[0][7].Value →INI400_007215= "c↓nom←&lt;BR&gt;[mm]"; 
    
    //2nd row
    T[1][0].Value →INI400_007216= Val(c↓min,b←*10↑3←, 0); 
    T[1][1].Value →INI400_007217= Val(c↓min,dur←*10↑3←, 0); 
    T[1][2].Value →INI400_007218= Val(Δc↓dur,γ←*10↑3←, 0); 
    T[1][3].Value →INI400_007219= Val(Δc↓dur,st←*10↑3←, 0); 
    T[1][4].Value →INI400_007220= Val(Δc↓dur,add←*10↑3←, 0); 
    T[1][5].Value →INI400_007221= Val(c↓min←*10↑3←, 0); 
    T[1][6].Value →INI400_007222= Val(Δc↓dev←*10↑3←, 0); 
    T[1][7].Value →INI400_007223= Val(c↓nom←*10↑3←, 0); 
    
    FOR(i, 0, 7) { 
        T.Columns[i].Alignment →INI400_002898= ContentAlignment.MiddleCenter; 
        T.Columns[i].Width →INI400_003280= Convert.ToSingle(FontsAndColors.TableWidth()/8); 
    } 
    T.Padding.All →INI400_012734= 5; 
    T.Padding.Top →INI400_002899= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
    T.Padding.Bottom →INI400_002900= Convert.ToSingle(FontsAndColors.PaddingTableOverall()); 
    T.Font →INI400_002903= FontsAndColors.TableCellsFont(); 
    T.Rows[0].BackColor →INI400_010793= FontsAndColors.ColorTableHeader(); 
    T[0].Font →INI400_006012= FontsAndColors.TableHeaderFont(); 
    T.BorderPen →INI400_006013= FontsAndColors.TableBorderPen(); 
    T.GridPen →INI400_006014= FontsAndColors.TableGridPen(); 
    T[0].BorderPen →INI400_006015= FontsAndColors.TableBorderPen(); 
    
    →INI400_007208T.Draw(); 
} 
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10200" Autor="" Autor2="" Version="1" EWNSource="EWN_Clause.xml" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English " />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://sciadesignforms.com/</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Calculation of nominal cover</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" />
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|1|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="a" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Smaller dimension of rectangular duct</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Greater dimension of rectangular duct</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="BondArrangement" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Arrangement of bonds</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="BundledType" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Type of using of bundled reinforcement</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓min,b,l←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓min,b,s←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓min,b←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_c↓min,b←">
          <ENU>Minimal cover due to bond requirement</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓min,dur←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_c↓min,dur←">
          <ENU>Minimal cover due to environmental conditions</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓min←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_c↓min←">
          <ENU>Minimal concrete cover</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓nom←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_c↓nom←">
          <ENU>Required concrete cover</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="CemType" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Clause4_4_1_2_13" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause4_4_1_2_3" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause4_4_1_2_5" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause4_4_1_2_6" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause4_4_1_2_7" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause4_4_1_2_8" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause4_4_1_3_1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause4_4_1_3_3" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause4_4_1_3_4" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ColorTableHeader" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ConcreteType" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ConstructionClass1" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>Construction class 1 (RakMK B4) (!Other classes)</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d↓g←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Nominal aggregated size</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="DesignLife" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Design life in years</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Deviation" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Allowance in design for deviation</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DuctShape" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Duct shape</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ck←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="FontsAndColors" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="fontsColors" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Input" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="k" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_k">
          <ENU>Increasing required concrete cover due abrasion</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="k↓1←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_k↓1←">
          <ENU>Concrete cast against prepared ground (including blinding)</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="k↓2,user←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Increasing the cover for concrete cast directly against soil</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="k↓2←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_k↓2←">
          <ENU>Concrete cast directly against soil</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="k↓3←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_k↓3←">
          <ENU>Increasing required concrete cover due Uneven surface</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="n↓b←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_n↓b←">
          <ENU>Number of bars in the bundle</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NormalReinf" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="NormCode" ESA_ID="" Type="String">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Output" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PaddingTableOverall" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="PrefabricatedSpecialQuality" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_PrefabricatedSpecialQuality">
          <ENU>Precast concrete with special quality (!Normal concrete or normal quality)</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Quality" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>Factory controlled prestresses and satisfactory history (!All other cases)</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ReinfType" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Type of reinforcement</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="S" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_S">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="SlabGeometry" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>Member have slab geometry (!Member is a beam)</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SpecialQuality" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>Special Quality Control of the concrete production ensured (!Standard quality)</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="StainlessSteel" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>Stainless steel or other special measures (!Normal steel)</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SurfaceType" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="T" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableBorderPen" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableCellsFont" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableGridPen" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableHeaderFont" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableWidth" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TensionType" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Type of tension tendons</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Unevenness" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Unevenness</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UnevenSurf" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>Uneven surface (e.g. exposed aggregate)</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="vtc↓ekv←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="WireType" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Type of wire</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="XC" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Corrosion induced by carbonation</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="XD" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Corrosion induced by chlorides</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="XM" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Abrasion Class</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="XS" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Corrosion induced by chlorides from sea water</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Δc↓dev,acc←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Δc↓dev,max←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Δc↓dev,min←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Δc↓dev←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Δc↓dev←">
          <ENU>Allowance in design for deviation</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Δc↓dur,add←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Δc↓dur,add←">
          <ENU>Reduction of minimum cover for use of additional protection</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Δc↓dur,st←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Δc↓dur,st←">
          <ENU>Reduction of minimum cover for use of stainless steel</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Δc↓dur,γ←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Δc↓dur,γ←">
          <ENU>Additive safety element</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓duct←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Diameter of duct</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓l←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓s←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓w←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>Diameter of wire</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
    </Variables>
    <DrawingGroups />
    <ResultTables />
    <ResultGroups />
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Brief</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Standard</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_2">
          <ENU>Detailed</ENU>
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
      <VC ID="INI400_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000005">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000006">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000007">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000008">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000012">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000020">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_000037">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_000038">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_000050">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_000051">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_000052">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000064">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_002898">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3566" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="576" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="576" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1701" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="769" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="769" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_002899">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3585" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1720" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_002900">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3604" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1738" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="27.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="27.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_002903">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3620" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="96.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="96.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1756" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="81.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="81.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_003280">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_005902">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_005903">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="153" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|22|0|2" Font2="Segoe UI|22|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="153" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|22|0|2" Font2="Segoe UI|22|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="153" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|22|0|2" Font2="Segoe UI|22|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="153" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|22|0|2" Font2="Segoe UI|22|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="153" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|22|0|2" Font2="Segoe UI|22|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="153" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|22|0|2" Font2="Segoe UI|22|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005915">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_005916">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1079" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1079" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1079" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1079" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1079" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1079" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005922">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1020" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1020" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1020" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1020" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1020" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1020" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005923">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1033" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1033" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1033" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1033" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1033" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1033" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005927">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_005928">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005932">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_005933">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005946">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005947">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005950">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_005951">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006012">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3046" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1758" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="96.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="96.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006013">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3063" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="128" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="128" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1776" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="114" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="114" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006014">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3081" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="149" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="149" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1794" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="134" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="134" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006015">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3098" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="166" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="166" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1812" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006322">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006324">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006325">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="921" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="921" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="921" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="921" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="921" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="921" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006347">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006349">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006350">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006351">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006367">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006368">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006369">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006370">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006371">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006375">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006376">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006379">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006380">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006384">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006386">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006388">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006389">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006390">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006391">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006392">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006393">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006394">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006395">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006396">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006397">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006398">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006401">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006402">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006420">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006421">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006422">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
      </VC>
      <VC ID="INI400_006423">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
      </VC>
      <VC ID="INI400_006425">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006429">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006431">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006432">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1256" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006433">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1269" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006436">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006437">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006438">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006439">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006440">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006441">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006446">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006447">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006451">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006452">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006454">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006460">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006461">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006462">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006465">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006466">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006467">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006468">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006469">
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006470">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006851">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006859">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006878">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006879">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006880">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006881">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006882">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006883">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006884">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006885">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006886">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006887">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006890">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006891">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006892">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006893">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006894">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006895">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006898">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006899">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006900">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006901">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006902">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006903">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006904">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006905">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006917">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006921">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006922">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006923">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006926">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006927">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006929">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006930">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006931">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006934">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006935">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006937">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006938">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006939">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006940">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006941">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006942">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006947">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006948">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006949">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006950">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1400" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006951">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006958">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006959">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006960">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006961">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_007174">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007179">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007180">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007181">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007182">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007183">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007184">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007185">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007186">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007187">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007188">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|19|0|2" Font2="Arial|19|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007189">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007190">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007192">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007193">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007194">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007195">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007196">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007197">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007199">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007200">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007201">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007202">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007203">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007205">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007206">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007207">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007208">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007209">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007210">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007211">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007212">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007213">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007214">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007215">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007216">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007217">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007218">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007219">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007220">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007221">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007222">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007223">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010793">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010903">
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_011033">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011034">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011035">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011036">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011037">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011038">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011039">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011040">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011041">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011042">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011043">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011044">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012730">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012732">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012733">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012734">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3585" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1720" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_013801">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013804">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013805">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS106_000001">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="KRS106_000002">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TDoubleInput Name="k_2_user" ID="148" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="k↓2,user←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="40" MinValueWithDim="20" DescPos="1" />
      <TComboBox Name="Unevenness" ID="138" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Unevenness" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1" Index="1">
        <Texts>
          <ENU>Concrete cast against prepared ground|Concrete cast directly against soil</ENU>
        </Texts>
      </TComboBox>
      <TComboBox Name="" ID="137" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Deviation" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1|2" Index="0">
        <Texts>
          <ENU>Standard|Quality assurance system|Very accurate measurement</ENU>
        </Texts>
      </TComboBox>
      <TComboBox Name="XM" ID="142" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="XM" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1|2" Index="0">
        <Texts>
          <ENU>XM0|XM1|XM2</ENU>
        </Texts>
      </TComboBox>
      <TComboBox Name="XS" ID="141" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="XS" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1|2" Index="0">
        <Texts>
          <ENU>XS0|XS1|XS2</ENU>
        </Texts>
      </TComboBox>
      <TComboBox Name="XD" ID="140" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="XD" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1|2" Index="0">
        <Texts>
          <ENU>XD0|XD1|XD2</ENU>
        </Texts>
      </TComboBox>
      <TComboBox Name="XC_NBN" ID="144" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="XC" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="1|2|3|4" Index="2">
        <Texts>
          <ENU>XC1|XC2|XC3|XC4</ENU>
        </Texts>
      </TComboBox>
      <TComboBox Name="XC" ID="139" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="XC" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1|2|3|4" Index="3">
        <Texts>
          <ENU>XC0|XC1|XC2|XC3|XC4</ENU>
        </Texts>
      </TComboBox>
      <TComboBox Name="DesignLife_NEN" ID="146" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="DesignLife" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="50|75|100" Index="-1">
        <Texts>
          <ENU>50|75|100</ENU>
        </Texts>
      </TComboBox>
      <TComboBox Name="DesignLife_CSN" ID="145" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="DesignLife" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="50|80|100" Index="-1">
        <Texts>
          <ENU>50|80|100</ENU>
        </Texts>
      </TComboBox>
      <TComboBox Name="DesignLife" ID="121" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="DesignLife" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="50|100" Index="-1">
        <Texts>
          <ENU>50|100</ENU>
        </Texts>
      </TComboBox>
      <TCheckBox Name="ConstructionClass1" ID="147" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="ConstructionClass1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
        <Texts TranslateID="DIALOG_000147">
          <ENU>
          </ENU>
        </Texts>
      </TCheckBox>
      <TCheckBox Name="UnevenSurf" ID="135" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="UnevenSurf" BookMarkID="" ForeColor="-16711423" ChbRight="False">
        <Texts TranslateID="DIALOG_000135">
          <ENU>
          </ENU>
        </Texts>
      </TCheckBox>
      <TCheckBox Name="Prestress_A" ID="133" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" BookMarkID="" ForeColor="-16711423" ChbRight="False">
        <Texts TranslateID="DIALOG_000133">
          <ENU>
          </ENU>
        </Texts>
      </TCheckBox>
      <TCheckBox Name="Quality_A" ID="134" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Quality" BookMarkID="" ForeColor="-16711423" ChbRight="False">
        <Texts TranslateID="DIALOG_000134">
          <ENU>
          </ENU>
        </Texts>
      </TCheckBox>
      <TCheckBox Name="PrefabricatedSpecialQuality" ID="143" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="19" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="PrefabricatedSpecialQuality" BookMarkID="" ForeColor="-16711423" ChbRight="False">
        <Texts TranslateID="DIALOG_000143">
          <ENU>
          </ENU>
        </Texts>
      </TCheckBox>
      <TCheckBox Name="" ID="128" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" BookMarkID="" ForeColor="-16711423" ChbRight="False">
        <Texts TranslateID="DIALOG_000128">
          <ENU>
          </ENU>
        </Texts>
      </TCheckBox>
      <TCheckBox Name="" ID="127" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="SpecialQuality" BookMarkID="" ForeColor="-16711423" ChbRight="False">
        <Texts TranslateID="DIALOG_000127">
          <ENU>
          </ENU>
        </Texts>
      </TCheckBox>
      <TCheckBox Name="SlabGeometry" ID="126" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="SlabGeometry" BookMarkID="" ForeColor="-16711423" ChbRight="False">
        <Texts TranslateID="DIALOG_000126">
          <ENU>
          </ENU>
        </Texts>
      </TCheckBox>
      <TGroupBox Name="" ID="119" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
        <Texts>
          <ENU>Minimum cover due to bond requirement</ENU>
        </Texts>
        <TComboBox Name="TensionType" ID="7" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="TensionType" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1" Index="0">
          <Texts>
            <ENU>Post-tensioned|Pre-tensioned</ENU>
          </Texts>
        </TComboBox>
        <TComboBox Name="DuctShape" ID="113" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="DuctShape" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1" Index="1">
          <Texts>
            <ENU>Circular|Rectangular</ENU>
          </Texts>
        </TComboBox>
        <TDoubleInput Name="a_4_4_1_2_3" ID="115" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="a" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        <TDoubleInput Name="b_4_4_1_2_3" ID="116" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="b" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        <TDoubleInput Name="fi_duct_4_4_1_2_3" ID="114" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="ϕ↓duct←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        <TDoubleInput Name="fi_w_4_4_1_2_3" ID="117" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="ϕ↓w←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        <TDoubleInput Name="d_g" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="d↓g←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TComboBox Name="BundledType" ID="4" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="BundledType" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1" Index="0">
          <Texts>
            <ENU>Vertical bars in compression and for bars in a lapped joint|All other cases</ENU>
          </Texts>
        </TComboBox>
        <TDoubleInput Name="n_b0" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="4" MinValueWithDim="0" DescPos="1" />
        <TDoubleInput Name="n_b1" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="3" MinValueWithDim="0" DescPos="1" />
        <TComboBox Name="BondArrangement" ID="2" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="BondArrangement" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1" Index="0">
          <Texts>
            <ENU>Separated|Bundled</ENU>
          </Texts>
        </TComboBox>
        <TComboBox Name="ReinfType" ID="1" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="ReinfType" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1" Index="0">
          <Texts>
            <ENU>Standard|Prestress</ENU>
          </Texts>
        </TComboBox>
      </TGroupBox>
      <TCustomLibrary Name="" ID="122" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="CONCRETE.EC" DataFile="EC_Concrete.xml" Collapsed="True" UseCombo="False" Category="Bilinear" Item="C 30/37">
        <Data>
          <Header>
            <PropertySet Symbol="f↓ck←" ESA_ID="fck" Unit="MPa" Type="Numeric" />
            <PropertySet Symbol="f↓ck,cube←" ESA_ID="fckcube" Unit="MPa" Type="Numeric" />
            <PropertySet Symbol="f↓cm←" ESA_ID="fcm" Unit="MPa" Type="Numeric" />
            <PropertySet Symbol="f↓ctm←" ESA_ID="fctm" Unit="MPa" Type="Numeric" />
            <PropertySet Symbol="f↓ctk, 0.05←" ESA_ID="fctk_05" Unit="MPa" Type="Numeric" />
            <PropertySet Symbol="f↓ctk, 0.95←" ESA_ID="fctk_95" Unit="MPa" Type="Numeric" />
            <PropertySet Symbol="E↓cm←" ESA_ID="Ecm" Unit="GPa" Type="Numeric" />
            <PropertySet Symbol="ε↓c1←" ESA_ID="eps_c1" Unit="‰" Type="Numeric" />
            <PropertySet Symbol="ε↓cu1←" ESA_ID="eps_cu1" Unit="‰" Type="Numeric" />
            <PropertySet Symbol="ε↓c2←" ESA_ID="eps_c2" Unit="‰" Type="Numeric" />
            <PropertySet Symbol="ε↓cu2←" ESA_ID="eps_cu2" Unit="‰" Type="Numeric" />
            <PropertySet Symbol="ε↓c3←" ESA_ID="eps_c3" Unit="‰" Type="Numeric" />
            <PropertySet Symbol="ε↓cu3←" ESA_ID="eps_cu3" Unit="‰" Type="Numeric" />
            <PropertySet Symbol="n" ESA_ID="n" Unit="" Type="Numeric" />
            <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="eps" Type="Numeric" Unit="" />
                <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="eps" Type="Numeric" Unit="" />
                <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="eps" Type="Numeric" Unit="" />
                <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
              </StructMembers>
            </PropertySet>
            <PropertySet Symbol="Bilinear" ESA_ID="Bilinear" Unit="" Type="Bool" />
            <PropertySet Symbol="d↓g←" ESA_ID="dg" Unit="mm" Type="Numeric" />
            <PropertySet Symbol="μ" ESA_ID="μ" Unit="" Type="Numeric" />
            <PropertySet Symbol="ρ" ESA_ID="ρ" Unit="kg/m↑3←" Type="Numeric" />
            <PropertySet Symbol="G" ESA_ID="G" Unit="GPa" Type="Numeric" />
            <PropertySet Symbol="υ" ESA_ID="υ" Unit="" Type="Numeric" />
            <PropertySet Symbol="λ" ESA_ID="λ" Unit="W/m*K" Type="Numeric" />
            <PropertySet Symbol="c" ESA_ID="c" Unit="J/kg*K" Type="Numeric" />
            <PropertySet Symbol="α" ESA_ID="α" Unit="" Type="Numeric" />
          </Header>
          <Items>
            <Item>
              <P>Bilinear</P>
              <P>C 30/37</P>
              <P>30</P>
              <P>37</P>
              <P>38</P>
              <P>2.9</P>
              <P>2</P>
              <P>3.8</P>
              <P>33</P>
              <P>2.2</P>
              <P>3.5</P>
              <P>2</P>
              <P>3.5</P>
              <P>1.75</P>
              <P>3.5</P>
              <P>2</P>
              <P>0;0;</P>
              <P>-0.00175;-20000000;</P>
              <P>-0.0035;-20000000;</P>
              <P>true</P>
              <P>32</P>
              <P>0.2</P>
              <P>2500</P>
              <P>13.7</P>
              <P>0.2</P>
              <P>4500</P>
              <P>0.0006</P>
              <P>1.00E-05</P>
            </Item>
          </Items>
        </Data>
      </TCustomLibrary>
      <TCustomLibrary Name="" ID="118" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Czech CSN-EN">
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
            <PropertySet Symbol="EC 1993.1.5 - η" ESA_ID="EC_1993_1_5.η" Unit="" Type="Struct">
              <StructMembers>
                <StructMember Symbol="η1" Type="Numeric" Unit="" />
                <StructMember Symbol="η2" Type="Numeric" Unit="" />
              </StructMembers>
            </PropertySet>
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
              <P>Czech CSN-EN</P>
              <P>CSN</P>
              <P>4</P>
              <P>ČSN EN 1990</P>
              <P>ČSN EN 1991-1-1</P>
              <P>ČSN EN 1991-1-2</P>
              <P>ČSN EN 1991-1-3</P>
              <P>0</P>
              <P>NaN</P>
              <P>False;1;</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>False</P>
              <P>1.6</P>
              <P>2.0</P>
              <P>NaN</P>
              <P>0.8;NaN;5;15;</P>
              <P>False</P>
              <P>False</P>
              <P>True</P>
              <P>NaN</P>
              <P>ČSN EN 1991-1-4</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>1</P>
              <P>1</P>
              <P>0.2;0.5;</P>
              <P>False</P>
              <P>NaN</P>
              <P>False;1;</P>
              <P>True</P>
              <P>True</P>
              <P>1</P>
              <P>NaN</P>
              <P>1.25</P>
              <P>False</P>
              <P>True</P>
              <P>NaN</P>
              <P>ČSN EN 1991-1-5</P>
              <P>ČSN EN 1991-1-6</P>
              <P>ČSN EN 1991-1-7</P>
              <P>ČSN EN 1991-2</P>
              <P>ČSN EN 1991-3</P>
              <P>ČSN EN 1991-4</P>
              <P>ČSN EN 1992-1-1</P>
              <P>1</P>
              <P>1</P>
              <P>1.3</P>
              <P>1.2</P>
              <P>1.5;1.15;1.15;1.2;1.0;1.0;</P>
              <P>1;1;</P>
              <P>90</P>
              <P>0.85</P>
              <P>1</P>
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
              <P>40;75;5;</P>
              <P>0.005</P>
              <P>0.44;NaN;0.54;NaN;0.7;0.8;</P>
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
              <P>0.4;0.3;0.3;0.2;0.2;NaN;</P>
              <P>3.4;0.425;</P>
              <P>1.5;5;</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>32</P>
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
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>12</P>
              <P>NaN</P>
              <P>NaN</P>
              <P>10</P>
              <P>5;8;</P>
              <P>10000;NaN;</P>
              <P>0.8;0.8;</P>
              <P>1.5</P>
              <P>0.25</P>
              <P>0.5</P>
              <P>ČSN EN 1992-1-2</P>
              <P>ČSN EN 1992-2</P>
              <P>ČSN EN 1992-3</P>
              <P>ČSN EN 1993-1-1</P>
              <P>NaN;NaN;</P>
              <P>1;1;1.25;</P>
              <P>ČSN EN 1993-1-2</P>
              <P>ČSN EN 1993-1-3</P>
              <P>ČSN EN 1993-1-4</P>
              <P>ČSN EN 1993-1-5</P>
              <P>1.20;1.00;</P>
              <P>ČSN EN 1993-1-6</P>
              <P>ČSN EN 1993-1-7</P>
              <P>ČSN EN 1993-1-8</P>
              <P>1.25;1.25;1.1;1.0;1.0;1.0;1.1;</P>
              <P>ČSN EN 1993-1-9</P>
              <P>ČSN EN 1993-1-10</P>
              <P>ČSN EN 1993-1-11</P>
              <P>ČSN EN 1993-1-12</P>
              <P>ČSN EN 1993-2</P>
              <P>1.0;1.1;1.25;1.25;1.1;1.1;1.1;1.0;1.1;</P>
              <P>ČSN EN 1993-3-1</P>
              <P>ČSN EN 1993-3-2</P>
              <P>ČSN EN 1993-4-1</P>
              <P>ČSN EN 1993-4-2</P>
              <P>ČSN EN 1993-4-3</P>
              <P>ČSN EN 1993-5</P>
              <P>ČSN EN 1993-6</P>
              <P>ČSN EN 1994-1-1</P>
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
              <P>ČSN EN 1994-1-2</P>
              <P>ČSN EN 1994-2</P>
              <P>ČSN EN 1995-1-1</P>
              <P>NaN</P>
              <P>0.67;0.67;1.0;</P>
              <P>ČSN EN 1995-1-2</P>
              <P>ČSN EN 1995-2</P>
              <P>ČSN EN 1996-1-1</P>
              <P>NaN</P>
              <P>1</P>
              <P>NaN</P>
              <P>True</P>
              <P>1000</P>
              <P>NaN;NaN;NaN;</P>
              <P>NaN</P>
              <P>ČSN EN 1996-1-2</P>
              <P>ČSN EN 1996-2</P>
              <P>ČSN EN 1996-3</P>
              <P>ČSN EN 1997-1</P>
              <P>1.1;0.9;1.5;0;</P>
              <P>1.25;1.25;1.4;1.4;1.0;</P>
              <P>1.35;1;1.5;0;1;1;1.3;0;</P>
              <P>1;1;1;1;1;1.25;1.25;1.4;1.4;1;</P>
              <P>1;1;1.4;1.1;1;1;</P>
              <P>ČSN EN 1997-2</P>
              <P>ČSN EN 1998-1</P>
              <P>ČSN EN 1998-2</P>
              <P>ČSN EN 1998-3</P>
              <P>ČSN EN 1998-4</P>
              <P>ČSN EN 1998-5</P>
              <P>ČSN EN 1998-6</P>
              <P>ČSN EN 1999-1-1</P>
              <P>ČSN EN 1999-1-2</P>
              <P>ČSN EN 1999-1-3</P>
              <P>ČSN EN 1999-1-4</P>
              <P>ČSN EN 1999-1-5</P>
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
    <Item ID="TEXT_INI400_000003">
      <ENU>Description("c↓min,b←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006322">
      <ENU>Description("c↓min,dur←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006347">
      <ENU>Description("Δc↓dur,γ←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006349">
      <ENU>Description("Δc↓dur,st←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006351">
      <ENU>Description("Δc↓dur,add←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006367">
      <ENU>Description("c↓min←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006370">
      <ENU>Description("k↓3←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006371">
      <ENU>Description("k")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006376">
      <ENU>Description("Δc↓dev←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006386">
      <ENU>"Δc↓dev← is reduced because fabrication is subjected to a quality assurance system, in which&lt;BR&gt;the monitoring includes measurements of the concrete cover."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006394">
      <ENU>"Δc↓dev← is reduced because very accurate measurement device is used for monitoring and&lt;BR&gt;non conforming members are rejected."</ENU>
    </Item>
    <Item ID="TEXT_INI400_006396">
      <ENU>Description("c↓nom←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006398">
      <ENU>"The influence of special conditions"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006401">
      <ENU>Description("k↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006402">
      <ENU>Description("k↓2←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006439">
      <ENU>"The influence of special conditions"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006451">
      <ENU>Description("k↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006454">
      <ENU>Description("k↓2←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010903">
      <ENU>"Calculation of required concrete cover c↓nom←"</ENU>
    </Item>
  </Texts>
</Root>