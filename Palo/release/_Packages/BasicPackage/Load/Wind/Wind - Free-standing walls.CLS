<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="faeb7d37-77a1-4bd9-9e56-e67315cd9e08">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">//All dialog visibility will be here
void UpdateDialog() { 
    //Group boxes
    Dialog.GetComponentByName("WindPar").Visible →INI400_007594= IO.SetupNA.EC_NA.Code != "ELOT" &amp;&amp; IO.SetupNA.EC_NA.Code != "LU" &amp;&amp; IO.SetupNA.EC_NA.Code != "STD"; 
    Dialog.GetComponentByName("ConstructionPar").Visible →INI400_007595= (IO.SetupNA.EC_NA.Code != "CSN" &amp;&amp; IO.SetupNA.EC_NA.Code != "NEN" &amp;&amp; IO.SetupNA.EC_NA.Code != "DIN" &amp;&amp; IO.SetupNA.EC_NA.Code != "LU" &amp;&amp; IO.SetupNA.EC_NA.Code != "SR" &amp;&amp; IO.SetupNA.EC_NA.Code != "STN" &amp;&amp; IO.SetupNA.EC_NA.Code != "STD") || NeglectDynamic == FALSE; 
    
    //Clause 4.2(2P)N1
    Dialog.GetComponentByName("StateONORM").Visible →INI400_007596= IO.SetupNA.EC_NA.Code == "ONORM"; 
    Dialog.GetComponentByName("Muni0ONORM").Visible →INI400_007597= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 0; 
    Dialog.GetComponentByName("Muni1ONORM").Visible →INI400_007598= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 1; 
    Dialog.GetComponentByName("Muni2ONORM").Visible →INI400_007599= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 2; 
    Dialog.GetComponentByName("Muni3ONORM").Visible →INI400_007600= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 3; 
    Dialog.GetComponentByName("Muni4ONORM").Visible →INI400_007601= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 4; 
    Dialog.GetComponentByName("Muni5ONORM").Visible →INI400_007602= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 5; 
    Dialog.GetComponentByName("Muni6ONORM").Visible →INI400_007603= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 6; 
    Dialog.GetComponentByName("Muni7ONORM").Visible →INI400_007604= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 7; 
    Dialog.GetComponentByName("Muni8ONORM").Visible →INI400_007605= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 8; 
    Dialog.GetComponentByName("CatNBN").Visible →INI400_007606= IO.SetupNA.EC_NA.Code == "NBN"; 
    Dialog.GetComponentByName("A").Visible →INI400_007607= IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "PN" || IO.SetupNA.EC_NA.Code == "SIST" || IO.SetupNA.EC_NA.Code == "ONORM" || (IO.SetupNA.EC_NA.Code == "SFS" &amp;&amp; SpecialStructure); 
    Dialog.GetComponentByName("v_b_map").Visible →INI400_007608= IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "SR"; 
    Dialog.GetComponentByName("CatCSN").Visible →INI400_007609= IO.SetupNA.EC_NA.Code == "CSN"; 
    Dialog.GetComponentByName("CHMI").Visible →INI400_007610= IO.SetupNA.EC_NA.Code == "CSN" &amp;&amp; CatCSN == 4; 
    Dialog.GetComponentByName("vb0_CSN").Visible →INI400_007611= IO.SetupNA.EC_NA.Code == "CSN" &amp;&amp; CatCSN == 4 &amp;&amp; CHMI; 
    Dialog.GetComponentByName("CatNEN").Visible →INI400_007612= IO.SetupNA.EC_NA.Code == "NEN"; 
    Dialog.GetComponentByName("CatSFS").Visible →INI400_007613= IO.SetupNA.EC_NA.Code == "SFS"; 
    Dialog.GetComponentByName("CatNF").Visible →INI400_007614= IO.SetupNA.EC_NA.Code == "NF"; 
    Dialog.GetComponentByName("CatDIN").Visible →INI400_007615= IO.SetupNA.EC_NA.Code == "DIN"; 
    Dialog.GetComponentByName("Coast").Visible →INI400_007616= IO.SetupNA.EC_NA.Code == "ELOT"; 
    Dialog.GetComponentByName("CatPN").Visible →INI400_007617= IO.SetupNA.EC_NA.Code == "PN"; 
    Dialog.GetComponentByName("CatSTN").Visible →INI400_007618= IO.SetupNA.EC_NA.Code == "STN"; 
    Dialog.GetComponentByName("CatSIST").Visible →INI400_007619= IO.SetupNA.EC_NA.Code == "SIST"; 
    
    //Clause 4.2(2P)N2
    Dialog.GetComponentByName("Dir").Visible →INI400_007620= IO.SetupNA.EC_NA.Code == "NBN" || IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "NF" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "PN"; 
    Dialog.GetComponentByName("DirCatNF").Visible →INI400_007621= IO.SetupNA.EC_NA.Code == "NF"; 
    
    //Clause 4.2(2P)N3
    Dialog.GetComponentByName("Temporary").Visible →INI400_007622= IO.SetupNA.EC_NA.Code == "NBN" || IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "NF" || IO.SetupNA.EC_NA.Code == "IS"; 
    Dialog.GetComponentByName("Month").Visible →INI400_007623= IO.SetupNA.EC_NA.Code == "NBN" &amp;&amp; Temporary; 
    Dialog.GetComponentByName("Length").Visible →INI400_007624= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; Temporary; 
    Dialog.GetComponentByName("Month0").Visible →INI400_007625= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; Length == 0 &amp;&amp; Temporary; 
    Dialog.GetComponentByName("Month1").Visible →INI400_007626= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; Length == 1 &amp;&amp; Temporary; 
    Dialog.GetComponentByName("Month2").Visible →INI400_007627= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; Length == 2 &amp;&amp; Temporary; 
    Dialog.GetComponentByName("Month3").Visible →INI400_007628= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; Length == 3 &amp;&amp; Temporary; 
    Dialog.GetComponentByName("SeasonCatNF").Visible →INI400_007629= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; Temporary; 
    Dialog.GetComponentByName("MonthNF").Visible →INI400_007630= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; Temporary; 
    
    //Clause 4.3.1(1)N2
    Dialog.GetComponentByName("TerrainONORM").Visible →INI400_007631= IO.SetupNA.EC_NA.Code == "ONORM"; 
    Dialog.GetComponentByName("TerrainDIN").Visible →INI400_007632= IO.SetupNA.EC_NA.Code == "DIN"; 
    
    //Clause 4.3.2(1)
    Dialog.GetComponentByName("Terrain").Visible →INI400_007633= IO.SetupNA.EC_NA.Code != "BS" &amp;&amp; IO.SetupNA.EC_NA.Code != "IS" &amp;&amp; IO.SetupNA.EC_NA.Code != "ONORM" &amp;&amp; IO.SetupNA.EC_NA.Code != "NEN" &amp;&amp; IO.SetupNA.EC_NA.Code != "NF" &amp;&amp; IO.SetupNA.EC_NA.Code != "DIN"; 
    Dialog.GetComponentByName("TerrainBS").Visible →INI400_007634= IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS"; 
    Dialog.GetComponentByName("TerrainNEN").Visible →INI400_007635= IO.SetupNA.EC_NA.Code == "NEN"; 
    Dialog.GetComponentByName("TerrainNF").Visible →INI400_007636= IO.SetupNA.EC_NA.Code == "NF"; 
    Dialog.GetComponentByName("AccurateInformation").Visible →INI400_007637= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS == 2; 
    Dialog.GetComponentByName("h_ave").Visible →INI400_007638= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; AccurateInformation &amp;&amp; TerrainBS == 2; 
    Dialog.GetComponentByName("DisShore").Visible →INI400_007639= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS != 0; 
    Dialog.GetComponentByName("xDis").Visible →INI400_007640= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS == 2; 
    Dialog.GetComponentByName("DisTown").Visible →INI400_007641= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS == 2; 
    Dialog.GetComponentByName("cr_diag").Visible →INI400_007642= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS == 2; 
    Dialog.GetComponentByName("cr_T").Visible →INI400_007643= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS == 2; 
    
    //Clause 4.3.3(1)
    Dialog.GetComponentByName("UseOrtoFactor").Visible →INI400_007644= (!IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic || IO.SetupNA.EC_NA.Code == "NF") &amp;&amp; IO.SetupNA.EC_NA.Code != "DIN"; 
    Dialog.GetComponentByName("H").Visible →INI400_007645= !IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic &amp;&amp; UseOroFactor; 
    Dialog.GetComponentByName("Ld").Visible →INI400_007646= !IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic &amp;&amp; UseOroFactor &amp;&amp; OroTerrain == 1; 
    Dialog.GetComponentByName("OroTerrain").Visible →INI400_007647= !IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic &amp;&amp; UseOroFactor; 
    Dialog.GetComponentByName("Lu").Visible →INI400_007648= !IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic &amp;&amp; UseOroFactor; 
    Dialog.GetComponentByName("x").Visible →INI400_007649= !IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic &amp;&amp; UseOroFactor; 
    Dialog.GetComponentByName("ProcedureNF").Visible →INI400_007650= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor; 
    Dialog.GetComponentByName("A_N1").Visible →INI400_007651= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_N2").Visible →INI400_007652= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_E1").Visible →INI400_007653= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_E2").Visible →INI400_007654= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_S1").Visible →INI400_007655= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_S2").Visible →INI400_007656= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_O1").Visible →INI400_007657= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_O2").Visible →INI400_007658= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    
    //Clause 4.4(1)
    Dialog.GetComponentByName("Ivz_flat").Visible →INI400_007659= IO.SetupNA.EC_NA.Code == "BS"; 
    Dialog.GetComponentByName("k_IT").Visible →INI400_007660= IO.SetupNA.EC_NA.Code == "BS"; 
    
    //Clause 4.5(1)N1
    Dialog.GetComponentByName("c_e_diag").Visible →INI400_007661= IO.SetupNA.EC_NA.Code == "BS"; 
    Dialog.GetComponentByName("c_e_T").Visible →INI400_007662= IO.SetupNA.EC_NA.Code == "BS"; 
    
    //Clause 4.5(1)N2
    Dialog.GetComponentByName("SpecialStructure").Visible →INI400_007663= IO.SetupNA.EC_NA.Code == "SFS"; 
    Dialog.GetComponentByName("T").Visible →INI400_007664= IO.SetupNA.EC_NA.Code == "SFS" &amp;&amp; SpecialStructure; 
    
    Dialog.GetComponentByName("h").Visible →INI400_007665= Type == 0; 
    Dialog.GetComponentByName("l").Visible →INI400_007666= Type == 0; 
    Dialog.GetComponentByName("lret").Visible →INI400_007667= Type == 0 &amp;&amp; RetCorn; 
    Dialog.GetComponentByName("hp").Visible →INI400_007668= Type == 1; 
    Dialog.GetComponentByName("hc").Visible →INI400_007669= Type == 1; 
    Dialog.GetComponentByName("lp").Visible →INI400_007670= Type == 1; 
    
    //Dynamics wind
    Dialog.GetComponentByName("TerrainDINdyn").Visible →INI400_007671= IO.SetupNA.EC_NA.Code == "DIN" &amp;&amp; !NeglectDynamic; 
    Dialog.GetComponentByName("Separate_cscd").Visible →INI400_007672= Separate_cscd.c↓s←c↓d←_sep &amp;&amp; !NeglectDynamic; 
    Dialog.GetComponentByName("Damping").Visible →INI400_007673= !NeglectDynamic; 
    Dialog.GetComponentByName("Deflection").Visible →INI400_007674= !NeglectDynamic; 
    
    Dialog.GetComponentByName("Obstacles").Visible →INI400_007675= Type == 0; 
} 

→INI400_006607BLOCK { //Set of Result on 0
    w↓A← →INI400_006608= 0; w↓B← →INI400_006609= 0; w↓C← →INI400_006610= 0; w↓D← →INI400_006611= 0; 
    w↓A,red← →INI400_006613= 0; w↓B,red← →INI400_006614= 0; w↓C,red← →INI400_006615= 0; w↓D,red← →INI400_007864= 0; 
} 

→INI400_007676BLOCK { 
    IF(Headline) { 
        →INI400_007677TEXT("Wind load on the Free-standing walls and parapets according to"); 
        →INI400_007678TEXT(IO.SetupNA.EC_1991_1_4.Name); 
    } 
    IF(PrintCaption) { 
        →INI400_007679TEXT(Caption); 
    } 
} 

→INI400_007680BLOCK("Dimensions of construction:") { 
    SWITCH(Type) { 
        CASE 0 :  { 
            →INI400_007681TEXT(Description("h")); 
            →INI400_007682TEXT("h = " &amp; h &amp; " m"); 
            →INI400_007683TEXT(Description("z")); 
            z →INI400_007684= h; 
            →INI400_007685TEXT(Description("l")); 
            →INI400_007686TEXT("l = " &amp; l &amp; " m"); 
            →INI400_007687TEXT(Description("l↓ret←")); 
            →INI400_007688TEXT("l↓ret← = " &amp; l↓ret← &amp; " m"); 
        } 
        CASE 1 :  { 
            →INI400_007689TEXT(Description("h↓c←")); 
            →INI400_007690TEXT("h↓c← = " &amp; h↓c← &amp; " m"); 
            →INI400_007691TEXT(Description("h↓p←")); 
            →INI400_007692TEXT("h↓p← = " &amp; h↓p← &amp; " m"); 
            h →INI400_007693= h↓p←; 
            →INI400_007694TEXT(Description("z")); 
            z →INI400_007695= h↓c←+h↓p←; 
            →INI400_007696TEXT(Description("l↓p←")); 
            →INI400_007697TEXT("l↓p← = " &amp; l↓p← &amp; " m"); 
            l →INI400_007698= l↓p←; 
        } 
    } 
    
    →INI400_007699TEXT(Description("Openings")); 
    →INI400_007700TEXT(Openings &amp; " %"); 
    →INI400_007701TEXT(Description("ϕ")); 
    ϕ →INI400_007702= 1-Openings; 
} 
→INI400_007703BLOCK { // Load of calculation of the wind pressure
    object WindPressure →INI400_007704= LoadExternCLC("Wind load.CLC"); 
    WindPressure.StateONORM →INI400_007706= double StateONORM; 
    WindPressure.Municipality0ONORM →INI400_007708= double Municipality0ONORM; 
    WindPressure.Municipality1ONORM →INI400_007710= double Municipality1ONORM; 
    WindPressure.Municipality2ONORM →INI400_007712= double Municipality2ONORM; 
    WindPressure.Municipality3ONORM →INI400_007714= double Municipality3ONORM; 
    WindPressure.Municipality4ONORM →INI400_007716= double Municipality4ONORM; 
    WindPressure.Municipality5ONORM →INI400_007718= double Municipality5ONORM; 
    WindPressure.Municipality6ONORM →INI400_007720= double Municipality6ONORM; 
    WindPressure.Municipality7ONORM →INI400_007722= double Municipality7ONORM; 
    WindPressure.Municipality8ONORM →INI400_007724= double Municipality8ONORM; 
    WindPressure.CatNBN →INI400_007726= double CatNBN; 
    WindPressure.A →INI400_007728= double A; 
    WindPressure.v↓b,map← →INI400_007730= double v↓b,map←; 
    WindPressure.z →INI400_007732= z; 
    WindPressure.CatCSN →INI400_007734= double CatCSN; 
    WindPressure.CHMI →INI400_007736= bool CHMI; 
    WindPressure.v↓b,0,CHMI← →INI400_007738= double v↓b,0,CHMI←; 
    WindPressure.CatNEN →INI400_007740= double CatNEN; 
    WindPressure.CatSFS →INI400_007742= double CatSFS; 
    WindPressure.CatNF →INI400_007744= double CatNF; 
    WindPressure.CatDIN →INI400_007746= double CatDIN; 
    WindPressure.Coast →INI400_007748= bool Coast; 
    WindPressure.CatPN →INI400_007750= double CatPN; 
    WindPressure.CatSTN →INI400_007752= double CatSTN; 
    WindPressure.CatSIST →INI400_007754= double CatSIST; 
    WindPressure.Dir →INI400_007756= double Dir; 
    WindPressure.DirCatNF →INI400_007758= double DirCatNF; 
    WindPressure.Temporary →INI400_007760= bool Temporary; 
    WindPressure.Month →INI400_007762= double Month; 
    WindPressure.Length →INI400_007764= double Length; 
    WindPressure.Month0 →INI400_007766= double Month0; 
    WindPressure.Month1 →INI400_007768= double Month1; 
    WindPressure.Month2 →INI400_007770= double Month2; 
    WindPressure.Month3 →INI400_007772= double Month3; 
    WindPressure.SeasonCatNF →INI400_007774= double SeasonCatNF; 
    WindPressure.MonthNF →INI400_007776= double MonthNF; 
    WindPressure.TerrainONORM →INI400_007778= double TerrainONORM; 
    WindPressure.Terrain →INI400_007780= double Terrain; 
    WindPressure.DisShore →INI400_007781= double DisShore; 
    WindPressure.DisTown →INI400_007782= double DisTown; 
    WindPressure.TerrainBS →INI400_007783= double TerrainBS; 
    WindPressure.AccurateInformation →INI400_007784= bool AccurateInformation; 
    WindPressure.h↓ave← →INI400_007785= double h↓ave←; 
    WindPressure.xDis →INI400_007786= double xDis; 
    WindPressure.c↓r,diag← →INI400_007787= double c↓r,diag←; 
    WindPressure.c↓r,T← →INI400_007788= double c↓r,T←; 
    WindPressure.c↓e,diag← →INI400_007789= double c↓e,diag←; 
    WindPressure.c↓e,T← →INI400_007790= double c↓e,T←; 
    WindPressure.h →INI400_007792= double h; 
    WindPressure.TerrainNEN →INI400_007793= double TerrainNEN; 
    WindPressure.TerrainNF →INI400_007794= double TerrainNF; 
    WindPressure.TerrainNEN →INI400_007795= double TerrainNEN; 
    WindPressure.SpecialStructure →INI400_007796= bool SpecialStructure; 
    WindPressure.T →INI400_007797= double T; 
    WindPressure.UseOroFactor →INI400_007798= bool UseOroFactor; 
    WindPressure.L↓u← →INI400_007799= double L↓u←; 
    WindPressure.L↓d← →INI400_007800= double L↓d←; 
    WindPressure.H →INI400_007801= double H; 
    WindPressure.x →INI400_007802= double x; 
    WindPressure.OroTerrain →INI400_007803= double OroTerrain; 
    WindPressure.ProcedureNF →INI400_007804= double ProcedureNF; 
    WindPressure.A↓N1← →INI400_007805= double A↓N1←; 
    WindPressure.A↓N2← →INI400_007806= double A↓N2←; 
    WindPressure.A↓E1← →INI400_007807= double A↓E1←; 
    WindPressure.A↓E2← →INI400_007808= double A↓E2←; 
    WindPressure.A↓S1← →INI400_007809= double A↓S1←; 
    WindPressure.A↓S2← →INI400_007810= double A↓S2←; 
    WindPressure.A↓O1← →INI400_007811= double A↓O1←; 
    WindPressure.A↓O2← →INI400_007812= double A↓O2←; 
    WindPressure.I↓v(z)flat← →INI400_007813= double I↓v(z)flat←; 
    WindPressure.k↓I,T← →INI400_007814= double k↓I,T←; 
} 
→INI400_007815BLOCK("Parameters of the wind load:") { 
    IF(PrintPressureCalc) { 
        →INI400_007816WindPressure.Draw(false); 
    } ELSE { 
        →INI400_007817WindPressure.Calculate(false); 
    } 
    double v↓m← →INI400_007818= WindPressure.v↓m←; 
    double I↓v← →INI400_007820= WindPressure.I↓v←; 
    double z↓0← →INI400_007822= WindPressure.z↓0←; 
    double z↓min← →INI400_007824= WindPressure.z↓min←; 
    →INI400_007826TEXT("Wind peak velocity pressure on the roof"); 
    q↓p← →INI400_007827= WindPressure.q↓p←; 
    //Load extern CLC which check the Norm about possibility of seperation of c↓s←c↓d←
    object Separate_cscd →INI400_007829= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1991\EN_1991_1_4\Clause_6.1(1).CLC"); 
    →INI400_007830Separate_cscd.Calculate(false); 
    IF(NeglectDynamic) { 
        →INI400_007831TEXT("Dynamics effects of the wind are neglected, therefore Structural factor c↓s←c↓d← = 1.0"); 
        c↓s←c↓d← →INI400_007832= 1; 
    } ELSE { 
        →INI400_007833TEXT("Dynamics effects of the wind are considered"); 
        object DynamicWind →INI400_007834= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1991\EN_1991_1_4\B_Dynamics_Structural_factor.CLC"); 
        DynamicWind.b →INI400_007835= double b; 
        DynamicWind.z↓0← →INI400_007836= double z↓0←; 
        DynamicWind.z↓min← →INI400_007837= double z↓min←; 
        DynamicWind.z →INI400_007838= double h; 
        DynamicWind.h →INI400_007839= double h; 
        DynamicWind.x →INI400_007840= double Def; 
        DynamicWind.v↓m← →INI400_007841= double v↓m←; 
        DynamicWind.δ →INI400_007842= double δ; 
        DynamicWind.I↓v← →INI400_007843= double I↓v←; 
        DynamicWind.TerrainDINdyn →INI400_007844= double TerrainDINdyn; 
        DynamicWind.Separate_c↓s←c↓d← →INI400_007845= bool Separate_c↓s←c↓d←; 
        DynamicWind.Master →INI400_007846= False; 
        →INI400_007847DynamicWind.Draw(false); 
        c↓s←c↓d← →INI400_007848= DynamicWind.c↓s←c↓d←; 
    } 
} 
→INI400_007849BLOCK("Areas of wall regions") { 
    IF(l &lt;= 0.3*h) { 
        A↓A← →INI400_007850= l*h; 
    } ELSE { 
        IF(l &lt;= 2*h) { 
            A↓A← →INI400_007851= [0.3*h]*h; 
            A↓B← →INI400_007852= [l-0.3*h]*h; 
        } ELSE { 
            IF(l &lt;= 4*h) { 
                A↓A← →INI400_007853= [0.3*h]*h; 
                A↓B← →INI400_007854= [[2*h]-[0.3*h]]*h; 
                A↓C← →INI400_007855= [l-[2*h]]*h; 
            } ELSE { 
                A↓A← →INI400_007856= [0.3*h]*h; 
                A↓B← →INI400_007857= [[2*h]-[0.3*h]]*h; 
                A↓C← →INI400_007858= [[4*h]-[2*h]]*h; 
                A↓D← →INI400_007859= [l-[4*h]]*h; 
            } 
        } 
    } 
} 
//NA.2.32 Clause 7.4.1 Free-standing walls, parapets, fences and signboards, Paragraph (1), Table 7.9
object Clause7_4_1_1 →INI400_007860= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1991\EN_1991_1_4\Clause_7.4.1(1).CLC"); 
→INI400_007861Clause7_4_1_1.Calculate(False); 
object Table79 →INI400_007862= Clause7_4_1_1.Table79; 
→INI400_007863BLOCK { 
    object Table79selection →INI400_007864= Table79.Select(); 
    object STR1 →INI400_007865= Table79.GetStructure(Table79selection[0]); 
    object STR2 →INI400_007866= Table79.GetStructure(Table79selection[1]); 
    object STR3 →INI400_007867= Table79.GetStructure(Table79selection[2]); 
    object STR4 →INI400_007868= Table79.GetStructure(Table79selection[3]); 
    object STR5 →INI400_007869= Table79.GetStructure(Table79selection[4]); 
} 

→INI400_007870BLOCK("External pressure coefficients for walls") { 
    IF(l &lt;= 2*h) { 
        →INI400_007871IMG("lm2h"); 
    } ELSE { 
        IF(l &lt;= 4*h) { 
            →INI400_007872IMG("l2h4h"); 
        } ELSE { 
            →INI400_007873IMG("lv4h"); 
        } 
    } 
    IF(l/h &lt;= 3) { 
        c↓p,A,ϕ1,F← →INI400_007874= STR1.A; 
        c↓p,B,ϕ1,F← →INI400_007875= STR1.B; 
        c↓p,C,ϕ1,F← →INI400_007876= STR1.C; 
        c↓p,D,ϕ1,F← →INI400_007877= STR1.D; 
    } ELSE { 
        IF(l/h &lt;= 5) { 
            c↓p,A,ϕ1,F← →INI400_007878= LinInterp(l/h, new PointD(3, STR1.A), new PointD(5, STR2.A)); 
            c↓p,B,ϕ1,F← →INI400_007879= LinInterp(l/h, new PointD(3, STR1.B), new PointD(5, STR2.B)); 
            c↓p,C,ϕ1,F← →INI400_007880= LinInterp(l/h, new PointD(3, STR1.C), new PointD(5, STR2.C)); 
            c↓p,D,ϕ1,F← →INI400_007881= LinInterp(l/h, new PointD(3, STR1.D), new PointD(5, STR2.D)); 
        } ELSE { 
            IF(l/h &lt;= 10) { 
                c↓p,A,ϕ1,F← →INI400_007882= LinInterp(l/h, new PointD(5, STR2.A), new PointD(10, STR3.A)); 
                c↓p,B,ϕ1,F← →INI400_007883= LinInterp(l/h, new PointD(5, STR2.B), new PointD(10, STR3.B)); 
                c↓p,C,ϕ1,F← →INI400_007884= LinInterp(l/h, new PointD(5, STR2.C), new PointD(10, STR3.C)); 
                c↓p,D,ϕ1,F← →INI400_007885= LinInterp(l/h, new PointD(5, STR2.D), new PointD(10, STR3.D)); 
            } ELSE { 
                c↓p,A,ϕ1,F← →INI400_007886= STR3.A; 
                c↓p,B,ϕ1,F← →INI400_007887= STR3.B; 
                c↓p,C,ϕ1,F← →INI400_007888= STR3.C; 
                c↓p,D,ϕ1,F← →INI400_007889= STR3.D; 
            } 
        } 
    } 
    IF(RetCorn) { 
        IF(l↓ret←/h &lt;= 1) { 
            c↓p,A,ϕ1← →INI400_007890= LinInterp(l↓ret←/h, new PointD(0, c↓p,A,ϕ1,F←), new PointD(1, STR4.A)); 
            c↓p,B,ϕ1← →INI400_007891= LinInterp(l↓ret←/h, new PointD(0, c↓p,B,ϕ1,F←), new PointD(1, STR4.B)); 
            c↓p,C,ϕ1← →INI400_007892= LinInterp(l↓ret←/h, new PointD(0, c↓p,C,ϕ1,F←), new PointD(1, STR4.C)); 
            c↓p,D,ϕ1← →INI400_007893= LinInterp(l↓ret←/h, new PointD(0, c↓p,D,ϕ1,F←), new PointD(1, STR4.D)); 
        } ELSE { 
            c↓p,A,ϕ1← →INI400_007894= STR4.A; 
            c↓p,B,ϕ1← →INI400_007895= STR4.B; 
            c↓p,C,ϕ1← →INI400_007896= STR4.C; 
            c↓p,D,ϕ1← →INI400_007897= STR4.D; 
        } 
    } ELSE { 
        c↓p,A,ϕ1← →INI400_007898= c↓p,A,ϕ1,F←; 
        c↓p,B,ϕ1← →INI400_007899= c↓p,B,ϕ1,F←; 
        c↓p,C,ϕ1← →INI400_007900= c↓p,C,ϕ1,F←; 
        c↓p,D,ϕ1← →INI400_007901= c↓p,D,ϕ1,F←; 
    } 
    IF(ϕ &gt; 0.8) { 
        c↓p,A← →INI400_007902= LinInterp(ϕ, new PointD(0.8, STR5.A), new PointD(1, c↓p,A,ϕ1←)); 
        c↓p,B← →INI400_007903= LinInterp(ϕ, new PointD(0.8, STR5.B), new PointD(1, c↓p,B,ϕ1←)); 
        c↓p,C← →INI400_007904= LinInterp(ϕ, new PointD(0.8, STR5.C), new PointD(1, c↓p,C,ϕ1←)); 
        c↓p,D← →INI400_007905= LinInterp(ϕ, new PointD(0.8, STR5.D), new PointD(1, c↓p,D,ϕ1←)); 
    } ELSE { 
        c↓p,A← →INI400_007906= STR5.A; 
        c↓p,B← →INI400_007907= STR5.B; 
        c↓p,C← →INI400_007908= STR5.C; 
        c↓p,D← →INI400_007909= STR5.D; 
    } 
} 
→INI400_007910BLOCK("Forces acting in each region of wall") { 
    w↓A← →INI400_007911= c↓p,A←*q↓p←; 
    w↓B← →INI400_007912= c↓p,B←*q↓p←; 
    
    IF(l &gt; 2*h &amp;&amp; l &lt;= 4*h) { 
        w↓C← →INI400_007913= c↓p,C←*q↓p←; 
    } 
    IF(l &gt; 4*h) { 
        w↓C← →INI400_007914= c↓p,C←*q↓p←; 
        w↓D← →INI400_007915= c↓p,D←*q↓p←; 
    } 
    →INI400_007916PAGEBREAK(); 
} 

IF(Obstacles &amp;&amp; Type == 0) { 
    →INI400_007917BLOCK(Description("ψ↓ϕ←")) { 
        →INI400_007918TEXT("Shelter factor can be used, if there are other walls or fences upwind,"); 
        →INI400_007919TEXT("that are equal in height or taller than height h of considerated wall or fence"); 
        →INI400_007920TEXT("Distance from the obstacle"); 
        →INI400_007921TEXT("x↓obs← = " &amp; x↓obs← &amp; " m"); 
        →INI400_007922TEXT("Obstacle spacing x/h"); 
        x↓p← →INI400_007923= x↓obs←/h; 
        →INI400_007924TEXT("Shelter factors for ϕ = 1 and 0,8"); 
        IF(x↓p← &lt;= 5) { 
            ψ↓ϕ1← →INI400_007925= 0.3; 
            ψ↓ϕ0,8← →INI400_007926= 0.3; 
        } ELSE { 
            IF(x↓p← &lt;= 10) { 
                ψ↓ϕ1← →INI400_007927= LinInterp(x↓p←, new PointD(5, 0.3), new PointD(10, 0.65)); 
                ψ↓ϕ0,8← →INI400_007928= LinInterp(x↓p←, new PointD(5, 0.3), new PointD(10, 0.45)); 
            } ELSE { 
                IF(x↓p← &lt;= 15) { 
                    ψ↓ϕ1← →INI400_007929= LinInterp(x↓p←, new PointD(10, 0.65), new PointD(15, 0.85)); 
                    ψ↓ϕ0,8← →INI400_007930= LinInterp(x↓p←, new PointD(10, 0.45), new PointD(15, 0.65)); 
                } ELSE { 
                    IF(x↓p← &lt;= 20) { 
                        ψ↓ϕ1← →INI400_007931= LinInterp(x↓p←, new PointD(15, 0.85), new PointD(20, 1)); 
                        ψ↓ϕ0,8← →INI400_007932= LinInterp(x↓p←, new PointD(15, 0.65), new PointD(20, 1)); 
                    } ELSE { 
                        →INI400_007933TEXT("Obstacle distance is too high. Shelter factor can't be used."); 
                        Exit(); 
                    } 
                } 
            } 
        } 
        →INI400_007934TEXT(Description("ψ↓ϕ←")); 
        IF(ϕ &gt; 0.8) { 
            ψ↓ϕ← →INI400_007935= LinInterp(ϕ, new PointD(0.8, ψ↓ϕ0,8←), new PointD(1, ψ↓ϕ1←)); 
        } ELSE { 
            ψ↓ϕ← →INI400_007936= ψ↓ϕ0,8←; 
        } 
    } 
    →INI400_007937BLOCK("Reduced forces in each region of the wall") { 
        w↓A,red← →INI400_007938= w↓A←*ψ↓ϕ←; 
        w↓B,red← →INI400_007939= w↓B←*ψ↓ϕ←; 
        IF(l &gt; 2*h &amp;&amp; l &lt;= 4*h) { 
            w↓C,red← →INI400_007940= w↓C←*ψ↓ϕ←; 
        } 
        IF(l &gt; 4*h) { 
            w↓C,red← →INI400_007941= w↓C←*ψ↓ϕ←; 
            w↓D,red← →INI400_007942= w↓D←*ψ↓ϕ←; 
        } 
    } 
} 

//NA dependent variables:
//v↓m←, q↓p← - NA.2.3</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="300" EWNSource="" Icon="/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCABkAGQDASIAAhEBAxEB/8QAHQAAAgMAAwEBAAAAAAAAAAAAAAoICQsEBgcFA//EADQQAAICAgEEAgECAgkFAQAAAAMEAgUBBgcACBMUCRIVChEWJBchJjEzNlNjcSIlQkSDI//EAB0BAAICAwEBAQAAAAAAAAAAAAAIBgkFBwoDBAH/xAAvEQACAgIBAwMDAwQCAwAAAAABAgMEBQYRAAcSCBMhCRQiFRYxIzJRcRhCJEFS/9oADAMBAAIRAxEAPwB/jo6Ojo6Ojo68b575/wCJe2XjHYOXuadxrNL0nXgzyRx4w/euLPK7LKWua3W/eLd/s1tFQ8KqkroGdbyIxcDgsuycKd3ed+oB7j+Y2LnTO2tYPb9x5kxVB7VWMSt+U79UZEZQcHsTiSYNRCcyrJABo6pW5Gi967VvIkZRjDds3vXtOiU5Wyz3JUL18bUUTXZl5ID+BZI4IiwIE1iSJGKssZd1K9Mp6fvSh3i9SN+VNCwkNbXKNlauY3XYJpMdrGMm4R3rC0kNi1k8gkUkcjY7EVL1qJJYZbaVa8qz9OEcz9yfAfbvTM33N3Luh8apLV8bTwbNsCSt07XzeFWxZqNbGQ2w3cJPmGpiNPVvT82cw+n7wn9azt9+e/46dItW6qv3vfuQ5KGTF7+hcd2rVUyNtAb0mVHtmY1cZwpzJGvcjjEWIPxIMS5gDIzFDC5u7nY7R282G3s766sjZZsbi5fatLSwYliMZMO2DxTttGzGMY5KcxCZxGOMy/bGOubVantV8vNyj1nYLlQZpLEaqqaxsVxsQgMs15nTWMKJoiMEkhSlgkYFHPMcRnHOdD5Hv1sNqUphcJj6kfPKiybOSssq+XJJianGoYFCVET+BBHuMCCLYNP+kz2fwFBLPc/uht2w2yoWV8IuF0rDRTSCApGoyEOyXZzG62I1la/W+5SWNvtYHiId4lb9RB8fR2FwFDzumIxhCI4zxtVzXVGQkYTZYinuTTcggjnJSxVVZYzCMsAXMXMRylPxP8wXx28wTqk6LuO1zWbu2sIVa9DyNU7Hx+6N01gvXqCM/stSlrsoOzcUOBha7YWisYsmTLlQtBI5/dvwrzJr/r/nuJeTaT2/N6n5fQ9prfa9fxef1/dqg+bw+YPm8f28flF9/r5Ifv5yyswmwwm4uZVtUxVmlWREAwswAkhHXYAWMChMEsZDKIkYkGSMoTjiWM4x8kXfHdacqm/i8TLETwY5KV2o5/g/hILZCtx/9RuPy58T8cSG99LP0xbFSkTUd87gUryKXjuU9n1fYayf3oDZpnX0eSL3OORFdqMWj8BKvLc6tFPdU+w1y9xQW1ZeVLnm9S0p31bOua9c5VT+u6kU6x/AyAy5vEWXjOEoZ/Ug5xx9LrMz7Ze+Puf7RbQbnCPKuxa9SzsEbGz0Zt92x0K9NXslbXjbaxNoak4SOcuWppSSYdCUyjZzJsMLlb5+PX5weGu7GwQ4z5uU13gXmhyDMKgbF03nj3djKQYbPCmvbhUK+sWEkYD9Gjv7tti0bA4sg8ZqVeo7t3UO7uu7NJDRthsJlZSqR1rcqvVsyseBHVuhY0Z2JASKwkEjsfCJZWAJrs9RX07O8vY6nkNowDRd0dBoLNZt5rX6UtbO4ahEvm1vPaw01uzFXhRZXs3sTay9GrBEbV+ajGxSO9Po6OjrbHVfvR0dHR0dHR1HLuq7oOMe0HhnYuauVn5q0NRMdbVV4Pt7ux7M6s2xU67XywMsRtPxRaJkkoEyNZZiYAONYXSZkb0hz82vfXd9y/cVZ8TavYWaHEXDZia8lXgesBVO33fkhYG2xuqfRr2wOTiwFXImABHEaKAPWOWqDcWMH7gbfFpuAmvjxfIWGNXFwOpZZLbqW9yQAj+lXQGWTlh5cKg5ZwC0fpE9Ot71J93cZqDmerqWIiXP7zk4JFhlqa9WnijarVkZZPHIZaw8ePpFYpDE0slp1WGtK6Qc75O+Tlrvl5asOQOQLAyWtpGMto2jLGJGm1amiQuFQhVwUgpOyEScjnlMxMEMxKTDLLLzz0QdcrE7vYaGmsLlLXULe6q6x7YLKJZ11Em+8BVm5fgDEjTSrAlm61EMclkABMDxmecY6kl2jdnvL/eZyFa6FxPTON51zWbPbNpvY1b9hW0NUgAklhs5THmM7O5bh6VJU4MN+4PBkVUB5pf1CeKcn8Ybpw7ultoO/VP4jY6j1iGCNld1NtN1cbaFhXvqEKs4k4sWBITHPBQFwZJ0Ktiq2ouleRGbyA/c2VitW4MjdlRshOH9mzYiKtLAJFI8AqkIip4KqqyRfMTBOnHTZO2Gosex2gZDA6/lNN1qjYh1DFvX/UcJiL6yxUMo9OZXFmSWVDasS2PuJpZZobWQBW/BJYeN7Ofhi+PfQNA1jdMVY+6C2vlkNgrOUdysGo1JvrJ+SrOr6rQvqVVGMMW4COtZyubhOzrAEM6tYpeMFxGq6Ho2iLkT0jTNU01QwUljK6rrtPry5V62BRVy5AVCaYphQEcw0hSjkasDFgCI4knjKMHxR/LNs3Zhs0OM+Y7a82jttvprwnX4Fm0d42dHk/lv9bXAsS0ZGyEgF3qnB2FjrV6SayqmcCfr3qNS23Wd81mk3LTbuv2PV9jrwWlJd1Z8MJWCTGP3gUU8ftKE4SxMLC5oDZUZGZVoIWQlFBwe2ma1PNYaNtfxtDEW6qJHkMbDFEtqvJ+SrK8oBntQTEOYrUru7gskpEodeucX1t9tPUF2z7k24e8G6bV3DwOfs2reobrkbt+bB5imDBNLRr49mXGYPJ4wGrHkcFRr16tZkgnoJJQkqzN+1/rGt7WmKu2nXqPZK8LMHQo39ShcJicGIwBtiVsV2QDZGBlgMDxhgsRHMOM8QLPEoa8//HT2pdw1Y8DbOLdZRuT+sVO5r6lWQkT1ybK9aEVMTGK9KsGwx7lgvrsdesbKUnRyuAYt7abk5ujqf3MfRyETw3ada1FIPF0nhSQEcEf9lJB4JAIII5PB6UfXtu2nUr1fJaxsOZwN6pJ7lezisjapPG/krkgQSorBnRGZXVkcopZT4jhI/vp+Cnk/gutt+QuDnIbpo9bOZWKxh0hX4K5hhSsWT+683g3liwmVppW1zjXht3dXR1e1O2eV0nF/P+401j/7tVbVTv8Avo2NbYon/wDkym6myL/bOucf/gSH9WrU6knZJt11ios/XvrHSeRdAJpN1NoUwNKNqngQDKzICTCcBoTEYU5jJCUJZxlVn5mPi2cfUrObOFFUjnSM7W5oyZFG9txnWlYrakZ45cM2x6lass2dKsD5OwZMljr18zh4FJZ3C6dxu0VepXmzmqxSRiEe7axUY8wR5rzJT/JWj8FJb2VDliAIwGPzcz6MPqJ5bPZjGdrO/mQqW/1NxRwe/XWFd0b2JvClsh9qWO4bUwihGSmev7IkeS5JJGpKd8+FD5Y7XlRnWOz3uIvDWvIGQ2CnE/INqZBc2xJVyjtqHTLckYIgK7XVas0NdzGBbNqCqiGM2eWMfiGc+spKkubTXLmo2GjdNW3VDZoXNPYrZxFivtKtoT1e6vKUZRwZVsATizKMsYIOOcxzj+rrRj+MfvTB3y9q+qcoW5qkPJ9AyzpfLtNVDAkujuVTEZI2ilVCxsWUKnZ6k6F3X4YkGHmYfTWHgaEsRkPZvfps5XfWsvO02Tx8AloWpW8pLlCPwjeKVmPlJZqEqfcYs80D+TflA7vp76kvpIxnazMVe9fbrGQ4/R9uyjUNrwVGARU9a2u4Z7Ve9QghUQ1MJn0SdBUjjirYzKV/ZhPs5SpWrWFdHR0db26ql6hF8inOQO3ztG5a32c2Rskom6NCQK4FmIp3kHm2691Y5wSitdVFdZUcGFyDOs5ZKGi1WDgS3r82mysHLexftbA3sP2brVg8x4xC87jpyMsm8QICCLymLOfjCMYofb6jhCGMRw6z+or2pxLtX1bVa+88QLfZlWdj18TYp+wmK81w+v2D9dmU5i+r9ZaDqbLIhFz4LpJRjIS2gCJmccap/HfIeh6P5vW/jLc9X1T2PJ4fB/EV4jUeby+s54vF7n38nqNfT6/b1j/t4pKX3yv2L214/DpyYqdGExL5cK9i/K3kSOfHkCONPI/kPyX4AHPQl9K3UsTq3YDcu49kIt3Y9qya35vZBmr4fU8fC0KLIVEhWV7lywYUPtMFgkBZ2IR8z4R+1Wu7buyXTNndRZByF3BDT5X3Q1hXWNU+tXPrTFo2vTTsS+TC1RrhI2AmIKpwbcvrBgcTrEWYJ+vyWfGhofdhpVvstBQBDvqAbe0XlWpELaKXbycxH2zWlE2q8tjZFLBZva9Km2Kt3+KKrwoB3RBFq1tqpaeu16nqaCnX9Opo6xCnq1PMdj1a6sVEkiv52inZP4FgCF5mDGOT6/cxSElKefpdMdFqmI/bNXV7FWGbH16MNQoUHBeNB52F8uSJZJvOdn/uMjlieST1S7d7/wDcM97s931xGdyGM3DMbRkNhWzHYYNHWtWH+2w8ntlUfH08aIMVFWC+ylKCOBUEahest/mvg3kHgHcS6ZyDXBA3IOG6u4rSMNa/sCGc4jl+ksGFUyshGXOQsBYVVdUNjxtqAlIf3tW+KP5Ztm7MNmhxnzHbXm0dtt9NeE6/As2jvGzo8n8t/ra4FiWjI2QkAu9U4OwsdavSTWVUzgT9ezD8jvxxaN3S6NfXFPQ/2l/mbh5GnWH+YxceOWZ7hp8MR/zL/fLYNfjj1d2V8pBi/iX7R2BE7nTgvee3/eXNK3VP/Uaob5UZPw+zU/kzANpVmnj/AIG6kTPtVzX2XYj/AIZCq3sWu7D2qz8OZw08poiQmtZIZ4mjc8NTvxqVWWGQELwxH5ePysyxSvfD2c7y9nvX52kyXbXuZi6CbSaajMYVWhr5CG3XXzh2XUrc0c0lDJVGUykwK/8AS97mOfGzX6NfT41LbdZ3zWaTctNu6/Y9X2OvBaUl3VnwwlYJMY/eBRTx+0oThLEwsLmgNlRkZlWghZCUUOxdIOfFH8rmzdjGzQ4z5Lnebf20bfeLmt6gLGXXeLHXcnhZblptbMBDsjZORNnY9cWcWWsFlnHkUzbAaE2Hu9J3bUeSdR13fdC2Kp23TNtqU73W9konBP1NxUviwZV1NoOcwmOcM/WcJfUoCxIA4xHEQcWT0fecZuuNFisVrZKuqjJYxn8pazkkCSMkKZqspHMUyr8c+3KElVl6pQ9UvpY3j0xbo2HzSTZnTMvNNJpe8Q1vZo52rGqSSU7cSSTrjM9QVxHkMZNL5N4i7SaxQminPaOutbjqdPvWrX2oX4fPU7DWM1rf1GqQ6/nh/wDg+l7qziwbOsZiGxq2irH9KxVVbgPJAQ67L0dTVlV1ZHAZXUqykchlYEEEf+wQSCP8dLFDNLWmisQSNFPBLHNDKh8XilicPHIjD5DI6hlI/ggHrN6+STt1J26dz27Ui34/8Ls1rd3Sg6wkpoo3al29U7fXKQKJQ8a+OwqNWlRjKCa4aa2rkAjwZBoYbKf05PP9to/dNvvb+XHsazzpoxLuECHLj8dt3FYLS4rm1QxSaj/Pa7cbMq/jLVYI/grSHO2dCvUl7T+pG4/TQ23ije1QMnPYlFGxdO2LxIOX1O9UQr0kx+Ccln6/i1FyZTieKu4o3+zqwHgpypS+NTZltQ7+e0u+duK+gRX5t0xN+1tGUk69avuX8Ur0WWrHMVF4NKWBlImJOExzPCS5BsYFOKb2Iv2Z3driofbgTO1CoDBB9nlSkNtD5AoiGOzYUKOVRPFQyleV6TcLf/5LfTszDbGpt5Wx2rzyyySRNZk/cOhJPk9ftKIZUsWLKWsJiJpJW9uW1YEsjwzRzeM2lB0dHR05XXNb0tD+oqp7EHE9DflX+tTZi02nSb8wJeexo9q2B20X8ES5ZH6q2w05fMYIwH9z6LlMRdqAFNuA7BOo514WtbA3roVnLPHNg8x4yl8CaW4UzLJvECBTF8QRTn4wjIWf1+o4TnnEcu9/OlxTYckdoVg6mlCylrQ7w6iS2ITu83Ifwu5InqRGUOKcMVuh3aVjABg2jS78aysEwawJkCGKzLCbC7ibBlW1TCZVaWKQDCzACRKBhc4pQKEwSxiQRRyiQZIxnCWJYxnCf954no71XulCYnqUp4yf+7QTPJKgPAHwzqP55AYc/wCT0Z/TQv1dq9KuZ1lbEceQg2LZsXcWM/NaDJ4unRx87qWdwZIa0jklfF3jcoOOUTV66Oox9mnP9Z3PdsfDXNKL3u2G36NQm2yBFk69pLdVa5dba1WqtFlsFX97kbLyCuC/UlO5Wugj6ra8pSc6bmrZhu1q9yu4eC1BFYhcccNFMiyRt8Ej5Vgfgn/fXPDncLkdbzeX17L12qZXB5O9iMlWcMGgvY6zLUtREOqt+E8LqCVUkAHgc9HVS3yO/HFo3dLo19cU9D/aX+ZuHkadYf5jFx45ZnuGnwxH/Mv98tg1+OPV3ZXykGL+JftHYLaejr5criqOZoz4/IQJPWnRkdHUNx5AjyXkHgjn/RHweQes5oe+bP222fF7dqOUs4rM4mzFZr2K8rxeZikWQRye2ylkYqD/ACGVgHQhgD1lv838JbrwLvlro25omxJU0pU1+JJwFJtNXIYDgtaNtoIxOBwJkIXxrkPmrsos1bc8Nqljizf4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbRoD5Hfji0bul0a+uKeh/tL/M3DyNOsP8xi48csz3DT4Yj/AJl/vlsGvxx6u7K+UgxfxL9o7AidzpwXvPb/ALy5pW6p/wCo1Q3yoyfh9mp/JmAbSrNPH/A3UiZ9qua+y7Ef8MhVD2TWtg7W5+HM4aeUUxMzVLaqzRiJ2/KjdQkiWCReI2Dn8zxyVlEUjdE/ZTvb2h9efaPJds+5WLpPskmPijz+AmkihuPdrQf0tp1eysaNQylOb3LcRqoTXUyFUnx736kGnlpO7ajyTqOu77oWxVO26ZttSne63slE4J+puKl8WDKuptBzmExzhn6zhL6lAWJAHGI4iDj2jpBb4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbR8HSd21HknUdd33Qtiqdt0zbalO91vZKJwT9TcVL4sGVdTaDnMJjnDP1nCX1KAsSAOMRxEHFldG3nG7tjRYrla2SrKi5LGs/MleQ/AliJ4MtSUgmKUDkHmKULIpBpM9VHpX3X0w7q2Iy6zZnSszNYl0rdYq5jqZinGfNqF9U8o8fsOPjZFyGPZ/F18btJpqUyOqvv6ky4XVqOKKbJA+9bs6myIBUhsEkhVf0uZdYWaKuWKBgtvVYpFXOq6ddphUciolsRZXH7KNIY5I7wO2HSFXw1Zdi544sTlYsBIzBJeG5VDTjMVhyHJowlFzyWVyZYbLGBAK2oIk2RWt/qDee/6Q+66v4prLb8lR8WUohHh+I9H07hkcVG6j3WALNv/ibdfZGPPAU1S/m/2FZWSoUAVMcPhI4XuOXfkM4bsVE2SUfEkrnlbZbGNJ+Yrq4Gu1jK9HCwJNlUFWSx2awqEqyxlI51bGYGFkzzBKQlx20psHd2OnWVrEZzeLx7hSOGWCaH7sqyuQEjHvEuCpARm4BHJuj9PQsdovp3W9kzUsOJsjtjvW3V3njZjFNk8dkF15J4JKys1m4642OOBknEjWIY/NlbwTQW6Ojo6cbrm368v5q44X5c4r3bjpmQcR2ammsvFvI8IFsE2AWdWva4IjZYnTM2SSi9yKCLBzVRHBLxieYyQzS+5zhO47e+bd64uuE2UfwdswSsA6D1HIVDJiySE2gSws3UGU/oVA6lozi0GVScnQhLPMMagnS4fze/Hj/S5q+eeuOae2a22iHZuM19HWU+FZWLuKgR6976HrjzW3A60nlnmYmnX7hGwlJ153d1amWnu8Wny7FhI8lRiMuSw/nIqKOXmpv8zxKP55BAkUKCWdVB8U8mFjv04PUbS7N90bembTfWlpXcj7anPZmYJWxuw1+UxWRmY8KI2V3pTPJIiRV55pFEs4hhkgr8BvyKV/E2zOdnHMew19Pxzu1hY7DxDfPpzgOg5CeyqS51i1u4HivXa7siKh7NFixVwohsC7EC2Kw7nEYuTdZRn/caax/92qtqp3/fRsa2xRP/APJlN1NkX+2dc4//AAJD+pvn4tfnK1/cavTO3rvQ2INLvoTKatqPPFwwaNXumD5WU15Lkc8U5qU2wQlgyNlvlk+nV2spVTd5ANgW8vjQ7tF3JrQVodT2G0tZoCIsNesMViMZbgY2xK7cRPEx4ps/jEYv/GLI0cKysj9RL0T5zKZvI+oHs9hJczDlY2v9ydWw8AmvxXI4vOXdMPRrRed+tehT3djgg966l3nNJHZgt5GSgz10dcZJ1OyTUsa5tZ+vfWA6i8kcTSbqbQoHVbUaBMgGVmQEgYBwzmIwpwIOcoSxnPJ6ZIEEcg8g/II/gj/PVKTKysVYFWUlWVgQysDwQQfkEH4IPyD8Ho6qW+R344tG7pdGvrinof7S/wAzcPI06w/zGLjxyzPcNPhiP+Zf75bBr8ceruyvlIMX8S/aOwW09HWOyuKo5mjPj8hAk9adGR0dQ3HkCPJeQeCOf9EfB5B6mGh75s/bbZ8Xt2o5SziszibMVmvYryvF5mKRZBHJ7bKWRioP8hlYB0IYA9ZcvOnBe89v+8uaVuqf+o1Q3yoyfh9mp/JmAbSrNPH/AAN1ImfarmvsuxH/AAyFnl8fHyvc39idPtfHaXk3jiLaFnmq7VrI0Ttce7c1+0pbXo+XczSXk9+0429A8MtE89Ja7MmVtV1W4Yr+a3hvtDW4iud35W3PUNH22znl2o1TLeI7nsO1P+ytX7XodLVpWt2OwM8CYtyLmpnq9tWjdtbhlK3UaLeI+dJntGKv9stqVsJlljlKSS1mgmVrMNaU+LV7sPLH2pAeIxMOZAhYcvEsrdK/YnfdS9cnYOev3R7fyW6SWamPzaZTGz18NkszRX3osxrWR8IVW/TkXyttjJPCobKROVq5CTHx9z5E3i45K3nat8vp+S22q6ct2/8ApVj4/YJnwL/ySiC0/VWiFbyjTX8/i80xRISfTj/6eTtHPxVwbuHctttJ6m2c5/jqzT2242IHlONagxXY4WAYUKxms2eznX3I7VFhubOUQVrA0GKg8GlyfjU+Pveu/jm4GtKrO03D+l+vcctb/ILQ0KmuJLOK/W6xoYJBd2zYzRlivpsNJHlVKXFnl1MVfk+NEvXNeptS16i1TXK8NTr2s01Xr1DVLZJlespqVEFbV16+SzIXIU0VgLCyQhCZGOP3nKX7yzP+yepWbuRsbplI3MUTTx4x5l/K3dseaXLq+QHKwqzwrIOVeaaUKQ8DcKP9T71BYPWtMw/pk0W1WS3dixVzeKuNmAi1/WsOKs+s6vMImYRzZKaCtkpqblJq+Nx2PeVWr5WPy+z0dHR0z3VF/R1xnUk7JNuusVFn699Y6TyLoBNJuptCmBpRtU8CAZWZASYTgNCYjCnMZIShLOM8no6CAQQRyD8EH+CP8Hr9VmVgykqykMrKSGVgeQQR8gg/II+QfkdKq/Kv8Mrmy3rvN3bagBc7/uO7PTni+RQYk02HmJ3TCSlgyvlZZUn47b3A5TOsPFZur6jyyOyXipOz6psul3LmvbZR2evXSBmF2q61UMmxAirTCJ5QiWOInDFtVkEWQSKuUgCYEWeI5z1qwdVzd1nxd9qnddVkhsuj1mq7IMOA12ya3XjUnXY+yMI+qmiesOgEIVTFHX0FnR1dhaNkstlR2HMcrE0RvfZuvmp58rrskNHITFpJ6UvKU7Mp45ZGUN7EjnlmIXwJJJBJ56tb9KX1J8z2wxmK0HvJTyO16fj44aWM2Sj42djwlKMyBYbEU0kX6tUroY44Y2lFmONEiikWNApSI7Xfkr7ye0FOdJw7y7Zw06f7ZxoO5Kr7ppS0vLXSISrpb3DGKExl60KJTUDFWXKZTwjOBZwMO7Hjj9TXtC8GQ8u9qtBbFyGMk7DjjkWx12EWIsG+4mafZ6DaJECVQgMRYFeDIBhQ0srMisYRq/Fuev07fcFrjthZ8K7RrO1U8U3reVVYvHyOsHF9ksKdOwgrDaLpxWohjAllNKdYeYGmJZt1uzYWqa49m+JP5DNbhM8O2PkTYlBhCUrGs1ZLEkCGYyvhaFYfCd0yYecjMaSdYwuJcuDSYxELXr6wrt3h0zipVjzv2sQ4jhWqMzSEalgPYSSG2IY/yJIjWEj4LAEDh6sxF9OD1MFtizlrtYM7kCXuZCfOSdtNmNyX2WYZWxUyOvNkrv8ATREkuS5JX5kSvJIJZPO9Fn9TlosF2JJ9oW2nbiEslQM8w06q5mMQlkAmGhcfOFWCQuIwKwNNogYZkSCx5RwKUDebf1EfeLyRRP0XGur8e8Ge+s0jK910DW17IBV5MQDmVf2iB007ZU8CmqbNGsU9ATR4GWddEhYpV1UXxm9/my/jp0vaZzO2tbLQdrrImqHSp20zK5dA2K6eItU5WaW+pVDydiJvyBgtMpDhhOY/DHwG9/3KX4t3a9Y0zhSjsPd8znI+1qkuEPU/KiH7OsaoPYbeHtN16wg+aC/2VtUbAflVwzkHu2y96c/xThjzyCRSpNTCpjAQ5QFmurTrmLjyX8/uIwqsW5CknrFQ9k/pk9pS2xZK92mtSU5VmSPP9zLO7uJK6TSCKHV32PLpkC3syn7c4a480qLEEd/bj6qI5D5I33lnbLPe+S9tvN33C6nAlrsexPmsbR4kMft92GTZzKc5yzMxZf1SMyU7RszYOYpLCOwH4ruf++baat0NZbcY8ICZwTY+YNh12zzXHQECDB1NGWZGgltt4X2EACXFaLJrQfjYHYIuk2LDJPa5+ny7U+IC0ex86Wtt3D7Ygsuw1UWgja1x1i4MnML4568g+V69qU2JCLTBtXxfYo2GLdZ8LStfVX4JJJ1qaldXKLIV6CwEkUUgCVTSTVFACqiioIDAsssAcAgAGEBBFCAxwjCOMYk2qdkb1m0Mnutn8TKszYyCw1izbdiXk/ULytxGGbgOK0k0svLH34SAW0f3/wDqh6vhcG+j+mHBkSRUpcZBu+Uw8OIwmArxIteodQ1aaLyttDCGNeTNUsdRpGOFRichG7CHxft07dOJe1XiXWeF+F9ZDrWma0HMs5lkbFzsVywMUbXatqtYiCW62a6KEZbGxKMY4DGtXVyyFPX1tan7j0dHTKQQQVYIq1aKOCvBGkMEEKLHFFFGoVI40UBURFAVVUAAAADqk7LZbJ57J5DNZrIXMtl8tcsZDJ5PI2Jbd7IXrcrT2rly1OzzWLFiZ3lmmldnd2LMST0dHR0devWP6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6//Z">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Wind/Wind_load.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Wind - Free-standing walls</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Headline, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Standard, dY 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 250, OTL 0" X="250" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 30" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, AL 0, F 0" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Headline, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Remark, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Standard, N 10, F 20" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 10" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Remark, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Standard, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 0" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Underline, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Check, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Standard, AL 0, F 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 20" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula B, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 300, F 5" X="300" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 250, F 5" X="250" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 200, F 5" X="200" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 100, F 5" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 150, F 5" X="150" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Standard, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Caption, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Caption, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Caption, N 0, F 20" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Headline, N 0, F 20" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Remark, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Remark, AL 0, F 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Standard, N 0, F 30" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 40" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="40" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 50" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Underline, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Underline, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Underline, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Underline, AL 0, F 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Standard, N 10, F 40" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="40" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 50" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Remark B, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" />
      <Style Key="Formula, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 100, F 5" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 150, F 5" X="150" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 250, F 5" X="250" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 200, F 5" X="200" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 300, F 5" X="300" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 350, F 5" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 400, F 5" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 450, F 5" X="450" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 500, F 5" X="500" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula B, N 350, F 5" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 400, F 5" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 450, F 5" X="450" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 500, F 5" X="500" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula BU, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 100, F 5" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 150, F 5" X="150" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 200, F 5" X="200" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 250, F 5" X="250" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 300, F 5" X="300" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 350, F 5" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 400, F 5" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 450, F 5" X="450" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 500, F 5" X="500" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Other, F 5, AT 0" X="500" Y="0" Hor="4" Ver="1" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 0, OTL 0" X="0" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 50, OTL 0" X="50" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 100, OTL 0" X="100" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 150, OTL 0" X="150" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 200, OTL 0" X="200" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 300, OTL 0" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 350, OTL 0" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 400, OTL 0" X="400" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 450, OTL 0" X="450" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 500, OTL 0" X="500" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula B, N 0, OTL 0" X="0" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 50, OTL 0" X="50" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 100, OTL 0" X="100" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 150, OTL 0" X="150" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 200, OTL 0" X="200" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 250, OTL 0" X="250" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 300, OTL 0" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 350, OTL 0" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 400, OTL 0" X="400" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 450, OTL 0" X="450" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 500, OTL 0" X="500" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula BU, N 0, OTL 0" X="0" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 50, OTL 0" X="50" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 100, OTL 0" X="100" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 150, OTL 0" X="150" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 200, OTL 0" X="200" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 250, OTL 0" X="250" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 300, OTL 0" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 350, OTL 0" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 400, OTL 0" X="400" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 450, OTL 0" X="450" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 500, OTL 0" X="500" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Remark, N 50, OTL 0" X="50" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Formula B, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula BU, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="A" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A">
          <ENU>Construction site altitude above sea level</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓A←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓B←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓C←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓D←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓E1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓E1←">
          <ENU>Altitude above sea level in east direction in 500 m from the site</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓E2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓E2←">
          <ENU>Altitude above sea level in east direction in 1000 m from the site</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓N1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓N1←">
          <ENU>Altitude above sea level in north direction in 500 m from the site</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓N2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓N2←">
          <ENU>Altitude above sea level in north direction in 1000 m from the site</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓O1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓O1←">
          <ENU>Altitude above sea level in west direction in 500 m from the site</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓O2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓O2←">
          <ENU>Altitude above sea level in west direction in 1000 m from the site</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓S1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓S1←">
          <ENU>Altitude above sea level in south direction in 500 m from the site</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓S2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓S2←">
          <ENU>Altitude above sea level in south direction in 1000 m from the site</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="AccurateInformation" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_AccurateInformation">
          <ENU>Use accurate informations about the obstructions height</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>Width perpendicular to wind direction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="c↓e,diag←" ESA_ID="" Type="Double" Value="1.4" Precision="2">
        <Description TranslateID="VARIABLE_c↓e,diag←">
          <ENU>Exposure factor from the diagram</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓e,T←" ESA_ID="" Type="Double" Value="620e-3" Precision="2">
        <Description TranslateID="VARIABLE_c↓e,T←">
          <ENU>Exposure correction factor from the diagram</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,A,ϕ1,F←" ESA_ID="" Type="Double" Value="3.4" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,A,ϕ1←" ESA_ID="" Type="Double" Value="3.4" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,A←" ESA_ID="" Type="Double" Value="3.4" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,B,ϕ1,F←" ESA_ID="" Type="Double" Value="2.1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,B,ϕ1←" ESA_ID="" Type="Double" Value="2.1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,B←" ESA_ID="" Type="Double" Value="2.1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,C,ϕ1,F←" ESA_ID="" Type="Double" Value="1.7" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,C,ϕ1←" ESA_ID="" Type="Double" Value="1.7" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,C←" ESA_ID="" Type="Double" Value="1.7" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,D,ϕ1,F←" ESA_ID="" Type="Double" Value="1.2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,D,ϕ1←" ESA_ID="" Type="Double" Value="1.2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,D←" ESA_ID="" Type="Double" Value="1.2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓r,diag←" ESA_ID="" Type="Double" Value="700e-3" Precision="2">
        <Description TranslateID="VARIABLE_c↓r,diag←">
          <ENU>Exposure factor from the diagram</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓r,T←" ESA_ID="" Type="Double" Value="500e-3" Precision="2">
        <Description TranslateID="VARIABLE_c↓r,T←">
          <ENU>Exposure correction factor from the diagram</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓s←c↓d←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CatCSN" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_CatCSN">
          <ENU>Wind region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CatDIN" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_CatDIN">
          <ENU>Wind region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CatNBN" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_CatNBN">
          <ENU>Wind region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CatNEN" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_CatNEN">
          <ENU>Wind region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CatNF" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_CatNF">
          <ENU>Wind region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CatPN" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_CatPN">
          <ENU>Wind region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CatSFS" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_CatSFS">
          <ENU>Wind region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CatSIST" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_CatSIST">
          <ENU>Wind region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CatSTN" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_CatSTN">
          <ENU>Wind region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CHMI" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_CHMI">
          <ENU>Fundamental value of the basic wind velocity defined by CHMI</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause7_4_1_1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Coast" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Coast">
          <ENU>Construction is on the coast or up to 10 km fro the coast</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Def" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Def">
          <ENU>Maximum displacement due to self weight applied in the vibration direction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="Dir" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Dir">
          <ENU>Wind azimuth</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="DirCatNF" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_DirCatNF">
          <ENU>Direction zone</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DisShore" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_DisShore">
          <ENU>Distance upwind to shoreline</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="km" />
      </Variable>
      <Variable Modifier="Public" Name="DisTown" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_DisTown">
          <ENU>Distance inside town terrain</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="km" />
      </Variable>
      <Variable Modifier="Public" Name="DynamicWind" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Height of the wall</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="H" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_H">
          <ENU>Effective height of the hill</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓ave←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_h↓ave←">
          <ENU>Average height of buildings in the city</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓c←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_h↓c←">
          <ENU>Height of the building</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓p←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_h↓p←">
          <ENU>Height of the parapet</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="Headline" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Headline">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="I↓v(z)flat←" ESA_ID="" Type="Double" Value="70e-3" Precision="2">
        <Description TranslateID="VARIABLE_I↓v(z)flat←">
          <ENU>Turbulence intensity from the diagram</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="I↓v←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓I,T←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_k↓I,T←">
          <ENU>Turbulence intensity factor from the diagram</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="l" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_l">
          <ENU>Lenght of the wall</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓d←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_L↓d←">
          <ENU>Actual length of the downwind slope in the wind direction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="l↓p←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_l↓p←">
          <ENU>Length of the parapet</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="l↓ret←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_l↓ret←">
          <ENU>Length of the return corner</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓u←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_L↓u←">
          <ENU>Actual length of the upwind slope in the wind direction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="Length" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_Length">
          <ENU>Lenght of temporary structure or execution phase</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Month" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Month">
          <ENU>Month</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Month0" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description TranslateID="VARIABLE_Month0">
          <ENU>One month</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Month1" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_Month1">
          <ENU>Two months</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Month2" ESA_ID="" Type="Double" Value="7" Precision="2">
        <Description TranslateID="VARIABLE_Month2">
          <ENU>Four months</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Month3" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_Month3">
          <ENU>Half a year</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="MonthNF" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_MonthNF">
          <ENU>Season</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Municipality0ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Municipality0ONORM">
          <ENU>Municipality in Wien</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Municipality1ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Municipality1ONORM">
          <ENU>Municipality in Burgenland</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Municipality2ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Municipality2ONORM">
          <ENU>Municipality in Kärten</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Municipality3ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Municipality3ONORM">
          <ENU>Municipality in Niederösterreich</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Municipality4ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Municipality4ONORM">
          <ENU>Municipality in Oberösterreich</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Municipality5ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Municipality5ONORM">
          <ENU>Municipality in Salzburg</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Municipality6ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Municipality6ONORM">
          <ENU>Municipality in Steiermark</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Municipality7ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Municipality7ONORM">
          <ENU>Municipality in Tirol</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Municipality8ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Municipality8ONORM">
          <ENU>Municipality in Vorarlberg</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NeglectDynamic" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_NeglectDynamic">
          <ENU>Neglect dynamic effects of the wind</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Obstacles" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Obstacles">
          <ENU>There are other walls or fences upwind that are equal in height or taller than h</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Openings" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Openings">
          <ENU>The percentage of the openings</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="OroTerrain" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_OroTerrain">
          <ENU>Orographic terrain</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintPressureCalc" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintPressureCalc">
          <ENU>Print calculation of the wind peak velocity pressure</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ProcedureNF" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ProcedureNF">
          <ENU>Procedure for orography factor</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="q↓p←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1" Dim="Pa" />
      </Variable>
      <Variable Modifier="Public" Name="RetCorn" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_RetCorn">
          <ENU>With return corner</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SeasonCatNF" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_SeasonCatNF">
          <ENU>Season zone</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Separate_c↓s←c↓d←" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Separate_c↓s←c↓d←">
          <ENU>Separate cscd to cs and cd</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Separate_cscd" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SpecialStructure" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_SpecialStructure">
          <ENU>Special structure (e.g. transmission lines)</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="StateONORM" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_StateONORM">
          <ENU>State in Austria</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="STR1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="STR2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="STR3" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="STR4" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="STR5" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_T">
          <ENU>The absolute air temperature at the load condition</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="1" cd="0" mol="0" Coef="1" Dim="K" />
      </Variable>
      <Variable Modifier="Public" Name="Table79" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Table79selection" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Temporary" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Temporary">
          <ENU>Temporary structure or execution phase</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Terrain" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_Terrain">
          <ENU>Terrain category</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TerrainBS" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_TerrainBS">
          <ENU>Terrain category</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TerrainDINdyn" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description TranslateID="VARIABLE_TerrainDINdyn">
          <ENU>Terrain category for dynamic wind</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TerrainNEN" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_TerrainNEN">
          <ENU>Terrain category</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TerrainNF" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_TerrainNF">
          <ENU>Terrain category</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TerrainONORM" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_TerrainONORM">
          <ENU>Terrain category</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Type" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_Type">
          <ENU>Type of the construction</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UseOroFactor" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_UseOroFactor">
          <ENU>Calculate orographic factor</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="v↓b,0,CHMI←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_v↓b,0,CHMI←">
          <ENU>Fundamental value of the basic wind velocity according CHMI</ENU>
        </Description>
        <Unit m="1" kg="0" s="-1" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m/s" />
      </Variable>
      <Variable Modifier="Public" Name="v↓b,map←" ESA_ID="" Type="Double" Value="23" Precision="2">
        <Description TranslateID="VARIABLE_v↓b,map←">
          <ENU>Fundamental value of the basic wind velocity from the map</ENU>
        </Description>
        <Unit m="1" kg="0" s="-1" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m/s" />
      </Variable>
      <Variable Modifier="Public" Name="v↓m←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="-1" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m/s" />
      </Variable>
      <Variable Modifier="Public" Name="w↓A,red←" ESA_ID="Result.05" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓A←" ESA_ID="Result.01" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓B,red←" ESA_ID="Result.06" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓B←" ESA_ID="Result.02" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓C,red←" ESA_ID="Result.07" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓C←" ESA_ID="Result.03" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓D,red←" ESA_ID="Result.08" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓D←" ESA_ID="Result.04" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="WindPressure" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="x" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_x">
          <ENU>Horizontal distance of the site from the top of the crest</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="x↓obs←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_x↓obs←">
          <ENU>Distance from the obstacle</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="x↓p←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="xDis" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_xDis">
          <ENU>Site distance from the other building</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="z" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_z">
          <ENU>Reference height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="z↓0←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="z↓min←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="δ" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_δ">
          <ENU>Damping</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_ϕ">
          <ENU>Solidity</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="ψ↓ϕ←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ψ↓ϕ←">
          <ENU>Shelter factor</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ψ↓ϕ0,8←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ψ↓ϕ1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
    </Variables>
    <DrawingGroups />
    <ResultTables />
    <ResultGroups />
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Full</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Standard</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_2">
          <ENU>Brief</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_3">
          <ENU>Layout 4</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_4">
          <ENU>Layout 5</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_5">
          <ENU>Layout 6</ENU>
        </Names>
      </Layout>
    </Layouts>
    <VisualComponents>
      <VC ID="INI400_006607">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006608">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006609">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006610">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006611">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006613">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006614">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006615">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007594">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007595">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007596">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007597">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007598">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007599">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007600">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007601">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007602">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007603">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007604">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007605">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007606">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007607">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007608">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007609">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007610">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007611">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007612">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007613">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007614">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007615">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007616">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007617">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007618">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007619">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007620">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007621">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007622">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007623">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007624">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007625">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007626">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007627">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007628">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007629">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007630">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007631">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007632">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007633">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007634">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007635">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007636">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007637">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007638">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007639">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007640">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007641">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007642">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007643">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007644">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007645">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007646">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007647">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007648">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007649">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007650">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007651">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007652">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007653">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007654">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007655">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007656">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007657">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007658">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007659">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007660">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007661">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007662">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007663">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007664">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007665">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007666">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007667">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007668">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007669">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007670">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007671">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007672">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007673">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007674">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007675">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007676">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007677">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007678">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, F 5, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, F 5, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, F 5, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007679">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="14" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14.3|1|2" Font2="Tahoma|14.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="14" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14.3|1|2" Font2="Tahoma|14.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="14" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14.3|1|2" Font2="Tahoma|14.3|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007680">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007681">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007682">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007683">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007684">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007685">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007686">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="102" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="102" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="102" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007687">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007688">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 450, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="102" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="102" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="102" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007689">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007690">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007691">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007692">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="81" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007693">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007694">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="81" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007695">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007696">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007697">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 450, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="102" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="102" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="102" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007698">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007699">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="123" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="123" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="123" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007700">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="123" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="123" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="123" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007701">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="149" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="149" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="149" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007702">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="149" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="149" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="149" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007703">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007704">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007706">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007708">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="62.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="62.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="62.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007710">
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007712">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007714">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="121" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="121" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="121" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007716">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="141" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="141" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="141" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007718">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="160" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="160" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="160" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007720">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="180" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="180" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="180" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007722">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="199" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="199" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="199" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007724">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="219" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="219" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="219" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007726">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007728">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007730">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007732">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007734">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="258" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="258" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="258" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007736">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007738">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="297" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="297" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="297" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007740">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="317" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="317" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="317" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007742">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="337" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="337" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="337" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007744">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="356" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="356" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="356" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007746">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="376" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="376" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="376" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007748">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007750">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007752">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007754">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007756">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007758">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007760">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007762">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007764">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007766">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007768">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007770">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007772">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007774">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007776">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007778">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007780">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007781">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007782">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007783">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007784">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007785">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007786">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007787">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007788">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007789">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007790">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007792">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1334" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1334" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1334" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007793">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007794">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007795">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007796">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007797">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007798">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="966" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="966" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="966" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007799">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007800">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007801">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1027" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1027" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1027" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007802">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1046" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1046" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1046" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007803">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1085" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1085" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1085" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007804">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007805">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007806">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007807">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007808">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007809">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007810">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007811">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007812">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007813">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007814">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007815">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007816">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007817">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007818">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007820">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007822">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007824">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007826">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007827">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007829">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007830">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007831">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007832">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007833">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007834">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007835">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007836">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007837">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007838">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007839">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007840">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007841">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007842">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007843">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007844">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007845">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007846">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007847">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007848">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007849">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007850">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007851">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="176" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="176" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="176" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007852">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007853">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="176" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="176" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="176" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007854">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007855">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007856">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="176" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="176" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="176" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007857">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007858">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007859">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="242" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="242" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="242" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007860">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007861">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007862">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007863">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007864">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007865">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007866">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007867">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007868">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007869">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007870">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007871">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="428" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="428" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="428" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="424" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="424" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="424" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007872">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="392" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="392" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="392" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="482" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="482" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="482" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007873">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="442" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="442" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="442" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="545" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="545" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="545" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007874">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007875">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007876">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007877">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007878">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007879">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007880">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007881">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007882">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007883">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007884">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007885">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007886">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007887">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007888">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007889">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007890">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007891">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007892">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007893">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007894">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007895">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007896">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007897">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007898">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007899">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007900">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007901">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007902">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007903">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007904">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007905">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007906">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007907">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007908">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007909">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007910">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007911">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="578" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="578" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="578" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007912">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="600" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="600" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="600" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007913">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="622" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="622" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="622" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007914">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="688" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="688" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="688" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007915">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="710" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="710" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="710" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007916">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007917">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007918">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="577" Hor="0" Ver="4" SpX="25" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="577" Hor="0" Ver="4" SpX="25" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="665" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="665" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="665" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007919">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="591" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="591" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="677" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007920">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="696" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="696" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="696" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007921">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="696" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="696" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="696" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007922">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="635" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="635" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="722" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="722" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="722" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007923">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="722" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="722" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="722" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007924">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="667" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="667" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="756" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="756" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="756" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007925">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007926">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007927">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007928">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007929">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007930">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007931">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="678" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007932">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="707" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007933">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark B, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark B, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark B, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="834" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="834" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="834" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007934">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="719" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="719" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="816" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="816" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="816" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007935">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, OTL 0" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="816" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="816" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="816" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007936">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, OTL 0" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="816" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="816" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="816" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007937">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007938">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="872" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="872" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="872" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007939">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="894" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="894" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="894" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007940">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="916" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="916" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="916" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007941">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1004" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1004" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1004" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007942">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1026" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1026" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1026" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="lm2h" Content="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" />
      <Image Name="l2h4h" Content="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" />
      <Image Name="lv4h" Content="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" />
      <Image Name="BG" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="630">
      <TPanel Name="" ID="135" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts TranslateID="DIALOG_000135">
          <ENU>Design settings</ENU>
        </Texts>
        <TGroupBox Name="TerrainPar" ID="118" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="30" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000118">
            <ENU>Terrain parameters</ENU>
          </Texts>
          <TComboBox Name="TerrainONORM" ID="102" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="TerrainONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2" Index="1">
            <Texts>
              <ENU>II|III|IV</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="H" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="H" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1000" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="Ld" ID="37" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="L↓d←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10000" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="Lu" ID="38" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="L↓u←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10000" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="x" ID="39" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="x" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1000" MinValueWithDim="-1000" DescPos="1" />
          <TComboBox Name="OroTerrain" ID="101" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="OroTerrain" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="190" Values="0|1" Index="1">
            <Texts TranslateID="DIALOG_000101">
              <ENU>Cliffs and escarpments|Hills and ridges</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="DisShore" ID="92" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="DisShore" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1e-3" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="DisTown" ID="93" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="DisTown" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1e-3" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="cr_diag" ID="94" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c↓r,diag←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="2" MinValueWithDim="700e-3" DescPos="1" />
          <TDoubleInput Name="cr_T" ID="95" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c↓r,T←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1" MinValueWithDim="500e-3" DescPos="1" />
          <TDoubleInput Name="c_e_diag" ID="112" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c↓e,diag←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="4.3" MinValueWithDim="1.4" DescPos="1" />
          <TDoubleInput Name="c_e_T" ID="113" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c↓e,T←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1" MinValueWithDim="620e-3" DescPos="1" />
          <TComboBox Name="Terrain" ID="42" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Terrain" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="2">
            <Texts>
              <ENU>0|I|II|III|IV</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="TerrainNEN" ID="105" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="TerrainNEN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="1">
            <Texts>
              <ENU>0|II|III</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="TerrainNF" ID="108" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="TerrainNF" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="1">
            <Texts>
              <ENU>0|II|IIIa|IIIb|IV</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="TerrainDIN" ID="109" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3" Index="2">
            <Texts>
              <ENU>I|II|III|IV</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="A_N1" ID="71" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓N1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="A_N2" ID="72" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓N2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="A_E1" ID="69" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓E1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="A_E2" ID="70" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓E2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="A_S1" ID="75" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓S1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="A_S2" ID="76" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓S2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="A_O1" ID="73" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓O1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="A_O2" ID="74" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓O2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TComboBox Name="ProcedureNF" ID="67" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ProcedureNF" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1" Index="0">
            <Texts TranslateID="DIALOG_000067">
              <ENU>Procedure 1|Procedure 2</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="TerrainDINdyn" ID="116" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="TerrainDINdyn" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2|3|4|5" Index="4">
            <Texts TranslateID="DIALOG_000116">
              <ENU>I|II|III|IV|Mixed coast profile|Mixed inland profile</ENU>
            </Texts>
          </TComboBox>
          <TCheckBox Name="UseOrtoFactor" ID="34" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="UseOroFactor" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000034">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TComboBox Name="TerrainBS" ID="87" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="TerrainBS" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2" Index="2">
            <Texts TranslateID="DIALOG_000087">
              <ENU>Sea|Country terrain|Town terrain</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
        <TGroupBox Name="WindPar" ID="34" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000034">
            <ENU>Wind parameters</ENU>
          </Texts>
          <TDoubleInput Name="Dir" ID="52" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Dir" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="360" MinValueWithDim="0" DescPos="1" />
          <TComboBox Name="Muni3ONORM" ID="26" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Municipality3ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45" Index="0">
            <Texts>
              <ENU>Amstetten|Bad Vöslau|Baden bei Wien|Deutsch-Wagram|Fischamend|Gänserndorf|Gmünd in Niederösterreich|Gross-Enzersdorf|Gumpoldskirchen|Hainburg|Hollabrunn|Horn|Klosterneuburg|Korneuburg|Krems an der Donau|Langenlois|Lilienfeld|Marchegg|Melk an der Donau|Mistelbach|Mödling|Mönichkirchen|Neunkirchen|Perchtoldsdorf|Pottenstein|Poysdorf|Puchberg am Schneeberg|Purkersdorf|Reichenau an der Rax|Retz|Scheibbs|Schwechat|Semmering|Sollenau|St.Pölten|Stockerau|Ternitz|Traiskirchen|Tulln|Waidhofen an der Thaya|Waidhofen an der Ybbs|Wilhelmsburg|Wolkersdorf|Wr. Neustadt|Zistersdorf|Zwettl</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="v_b_map" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="v↓b,map←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="35" MinValueWithDim="23" DescPos="1" />
          <TDoubleInput Name="Ivz_flat" ID="110" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="I↓v(z)flat←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="220e-3" MinValueWithDim="70e-3" DescPos="1" />
          <TDoubleInput Name="k_IT" ID="111" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="k↓I,T←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="2" MinValueWithDim="1" DescPos="1" />
          <TComboBox Name="CatNEN" ID="18" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatNEN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="1">
            <Texts>
              <ENU>I|II|III</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="CatNF" ID="20" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatNF" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3" Index="2">
            <Texts>
              <ENU>1|2|3|4</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="DirCatNF" ID="53" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="DirCatNF" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="0">
            <Texts>
              <ENU>1|2|3</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="SeasonCatNF" ID="63" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="SeasonCatNF" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1" Index="0">
            <Texts>
              <ENU>1|2</ENU>
            </Texts>
          </TComboBox>
          <TCheckBox Name="Separate_cscd" ID="117" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Separate_c↓s←c↓d←" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000117">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TComboBox Name="Muni0ONORM" ID="23" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Municipality0ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1" Index="0">
            <Texts TranslateID="DIALOG_000023">
              <ENU>Districts 10, 11, 21, 22|All other districts</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Muni1ONORM" ID="24" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Municipality1ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11" Index="0">
            <Texts>
              <ENU>Andau|Bad Tatzmannsdorf|Eisenstadt|Güssing|Jennersdorf|Mattersburg|Neusiedl am See|Oberpullendorf|Oberwart|Pinkafeld|Rust am Neusiedler See|St. Michael im Burgenland</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Muni2ONORM" ID="25" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Municipality2ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28" Index="0">
            <Texts>
              <ENU>Arnoldstein|Bad Kleinkirchheim|Bleiburg|Eisenkappel|Feldkirchen in Kärnten|Ferlach|Friesach|Gmünd an der Lieser|Gurk|Heiligenblut|Hermagor|Klagenfurt|Kötschach|Lavamünd|Mallnitz|Millstatt|Naßfeld|Oberdrauburg|Obervellach|Radenthein|Rennweg|St. Andrä im Lavanttal|St. Lorenzen im Lesachtal|St. Veit an der Glan|Spittal an der Drau|Velden|Villach|Völkermarkt|Wolfsberg</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Muni4ONORM" ID="27" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Municipality4ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33" Index="0">
            <Texts>
              <ENU>Aigen im Mühlkreis|Bad Goisern|Bad Ischl|Bad Leonfelden|Braunau am Inn|Ebensee|Eferding|Enns|Freistadt|Gmunden|Gosau|Grein|Grieskirchen|Grünau im Almtal|Hallstatt|Hinterstoder|Kremsmünster|Linz|Mattighofen|Mondsee|Obertraun|Reichersberg am Inn|Ried im Innkreis|Rohrbach im Mühlviertel|St.Wolfgang am Wolfgangsee|Schärding|Schwanenstadt|Spital am Pyhrn|Steyr|Traun|Vöcklabruck|Wels|Weyer|Windischgarsten</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Muni5ONORM" ID="28" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Municipality5ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28" Index="0">
            <Texts>
              <ENU>Abtenau|Bad Gastein|Bad Hofgastein|Bischofshofen|Fuschl am See|Golling|Hallein|Kaprun|Krimml|Lofer|Mattsee|Mauterndorf|Mittersill|Mühlbach am Hochkönig|Oberndorf bei Salzburg|Obertauern|Radstadt|Rauris|Saalbach|Saalfelden|Salzburg|St. Johann im Pongau|St. Michael im Lungau|Strobl|Tamsweg|Unken|Wagrain|Werfen|Zell am See</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Muni6ONORM" ID="29" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Municipality6ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40" Index="0">
            <Texts>
              <ENU>Admont|Bad Aussee|Bad Gleichenberg|Bad Mitterndorf|Bad Radkersburg|Birkfeld|Bruck an der Mur|Deutschlandsberg|Eibiswald|Eisenerz|Feldbach|Fohnsdorf|Friedberg|Frohnleiten|Fürstenfeld|Gleisdorf|Graz|Gröbming|Hartberg|Hieflau|Judenburg|Kapfenberg|Knittelfeld|Köflach|Leibnitz|Leoben|Liezen|Mariazell|Murau|Mureck|Mürzzuschlag|Schladming|Seckau|St. Nikolai im Sölktal|Stainz|Trieben|Voitsberg|Wald am Schoberpass|Weiz|Wildon|Zeltweg</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Muni7ONORM" ID="30" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Municipality7ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33" Index="0">
            <Texts>
              <ENU>Ehrwald|Fulpmes|Hall in Tirol|Hintertux|Holzgau|Imst|Innsbruck|Ischgl|Jenbach|Kitzbühel|Kufstein|Landeck|Lienz|Matrei in Osttirol|Mayrhofen|Obergurgl|Pertisau|Reutte in Tirol|St. Anton am Arlberg|St. Christoph am Arlberg|St. Jakob in Defereggen|St. Johann in Tirol|St. Leonhard im Pitztal|Schwaz in Tirol|Seefeld in Tirol|Serfaus|Sillian|Sölden|Steinach am Brenner|Tannheim|Telfs|Virgen|Wörgl|Zell am Ziller</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Muni8ONORM" ID="31" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="19" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Municipality8ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16" Index="0">
            <Texts>
              <ENU>Bezau|Bludenz|Bregenz|Dornbirn|Egg bei Andelsbuch|Feldkirch|Gargellen|Götzis|Hohenems|Langen am Arlberg|Lech|Lustenau|Mittelberg|Partenen|Schruns|Warth|Zürs</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="CatNBN" ID="16" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatNBN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3" Index="2">
            <Texts>
              <ENU>1|2|3|4</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Month" ID="56" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Month" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7|8|9|10|11" Index="0">
            <Texts TranslateID="DIALOG_000056">
              <ENU>January|February|March|April|May|June|July|August|September|October|November|December</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="vb0_CSN" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="v↓b,0,CHMI←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="60" MinValueWithDim="0" DescPos="1" />
          <TCheckBox Name="CHMI" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CHMI" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000015">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TComboBox Name="CatCSN" ID="17" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatCSN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="2">
            <Texts>
              <ENU>I|II|III|IV|V</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="CatSFS" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatSFS" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="420" Values="0|1|2|3" Index="2">
            <Texts TranslateID="DIALOG_000019">
              <ENU>Mainland in the entire country|Sea areas: open sea, scattered islands out in the open sea|In Lappland: at the top of mountains|In Lappland: at the bottom of mountains</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="CatDIN" ID="21" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatDIN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3" Index="2">
            <Texts>
              <ENU>WZ1|WZ2|WZ3|WZ4</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="StateONORM" ID="22" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="StateONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8" Index="3">
            <Texts TranslateID="DIALOG_000022">
              <ENU>Wien|Burgenland|Kärnten|Niederösterreich|Oberösterreich|Salzburg|Steiermark|Tirol|Vorarlberg</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="CatPN" ID="57" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatPN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="2">
            <Texts>
              <ENU>1|2|3</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="CatSTN" ID="49" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatSTN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="420" Values="0|1|2|3" Index="1">
            <Texts TranslateID="DIALOG_000049">
              <ENU>I|II|Altitude above sea level from 700 to 1300 m|Mountain areas with altitude above sea level over 1300 m</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="CatSIST" ID="50" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatSIST" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="0">
            <Texts>
              <ENU>1|2|3</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
        <TGroupBox Name="" ID="32" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000032">
            <ENU>Parameters of the wall</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="x↓obs←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="100" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Openings" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="20" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="l" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="l" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1000" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="lret" ID="130" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="37" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="l↓ret←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="100" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="hp" ID="127" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="34" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h↓p←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="hc" ID="126" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="33" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h↓c←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="100" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="lp" ID="128" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="35" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="l↓p←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="100" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="h" ID="129" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="36" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="100" MinValueWithDim="0" DescPos="1" />
          <TCheckBox Name="Obstacles" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Obstacles" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000004">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TComboBox Name="" ID="124" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="31" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Type" VarNameVisible="True" InputColor="-4128832" DescPos="1" InputWidth="175" Values="0|1" Index="1">
            <Texts TranslateID="DIALOG_000124">
              <ENU>Free-standing wall|Parapet</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
        <TGroupBox Name="ConstructionPar" ID="119" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000119">
            <ENU>Construction parameters</ENU>
          </Texts>
          <TDoubleInput Name="A" ID="44" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="3000" MinValueWithDim="0" DescPos="1" />
          <TComboBox Name="Month1" ID="60" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Month1" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="320" Values="0|1|2|3|4|5|6|7|8|9|10|11" Index="3">
            <Texts TranslateID="DIALOG_000060">
              <ENU>January, February|February, March|March, April|April, May|May, June|June, July|July, August|August, September|September, October|October, November|November, December|December, January</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Month0" ID="59" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Month0" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="320" Values="0|1|2|3|4|5|6|7|8|9|10|11" Index="5">
            <Texts TranslateID="DIALOG_000059">
              <ENU>January|February|March|April|May|June|July|August|September|October|November|December</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Month2" ID="61" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Month2" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="320" Values="0|1|2|3|4|5|6|7|8|9|10|11" Index="7">
            <Texts TranslateID="DIALOG_000061">
              <ENU>January, February, March, April|February, March, April, May|March, April, May, June|April, May, June, July|May, June, July, August|June, July, August, September|July, August, September, October|August, September, October, November|September, October, November, December|October, November, December, January|November, December, January, February|December, January, February, March</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Month3" ID="62" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Month3" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="320" Values="0|1" Index="1">
            <Texts TranslateID="DIALOG_000062">
              <ENU>Winter - October to March|Summer - April to September</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Length" ID="58" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Length" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="320" Values="0|1|2|3" Index="1">
            <Texts TranslateID="DIALOG_000058">
              <ENU>One month|Two months|Four months|Half year</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="h_ave" ID="104" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h↓ave←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="100" MinValueWithDim="0" DescPos="1" />
          <TCheckBox Name="AccurateInformation" ID="103" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="AccurateInformation" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000103">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TDoubleInput Name="T" ID="107" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="T" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="373" MinValueWithDim="0" DescPos="1" />
          <TComboBox Name="MonthNF" ID="64" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="MonthNF" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="175" Values="0|1" Index="0">
            <Texts TranslateID="DIALOG_000064">
              <ENU>April to September|October to March</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="Deflection" ID="122" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="28" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Def" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="Damping" ID="120" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="δ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1" MinValueWithDim="0" DescPos="1" />
          <TCheckBox Name="Temporary" ID="99" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Temporary" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000099">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TDoubleInput Name="xDis" ID="90" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="xDis" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1000" MinValueWithDim="0" DescPos="1" />
          <TCheckBox Name="SpecialStructure" ID="106" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="SpecialStructure" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000106">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="Coast" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Coast" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000047">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="137" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000137">
            <ENU>Calculation settings</ENU>
          </Texts>
          <TCheckBox Name="" ID="123" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="NeglectDynamic" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000123">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="RetCorn" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000003">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
      </TPanel>
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
        <Texts>
          <ENU>General settings</ENU>
        </Texts>
        <TGroupBox Name="" ID="134" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000134">
            <ENU>Layout blocks</ENU>
          </Texts>
          <TCheckBox Name="" ID="115" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintPressureCalc" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000115">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="132" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000132">
            <ENU>Headline settings</ENU>
          </Texts>
          <TStringInput Name="TStringInput" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000002">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Headline" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000013">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="33" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000033">
            <ENU>National Annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="British BS-EN">
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
                  <P>BS EN 1992-1-1</P>
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
                  <P>1.00;1.00;</P>
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
        </TGroupBox>
      </TPanel>
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_INI400_007680">
      <ENU>"Dimensions of construction:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007815">
      <ENU>"Parameters of the wind load:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007849">
      <ENU>"Areas of wall regions"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007870">
      <ENU>"External pressure coefficients for walls"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007910">
      <ENU>"Forces acting in each region of wall"</ENU>
    </Item>
    <Item ID="BLOCK_INI400_007917">
      <ENU>Description("ψ↓ϕ←")</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007937">
      <ENU>"Reduced forces in each region of the wall"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007677">
      <ENU>"Wind load on the Free-standing walls and parapets according to"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007678">
      <ENU>IO.SetupNA.EC_1991_1_4.Name</ENU>
    </Item>
    <Item ID="TEXT_INI400_007679">
      <ENU>Caption</ENU>
    </Item>
    <Item ID="TEXT_INI400_007681">
      <ENU>Description("h")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007682">
      <ENU>"h = " &amp; h &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007683">
      <ENU>Description("z")</ENU>
    </Item>
    <Item ID="TEXT_INI400_007685">
      <ENU>Description("l")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007686">
      <ENU>"l = " &amp; l &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007687">
      <ENU>Description("l↓ret←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007688">
      <ENU>"l↓ret← = " &amp; l↓ret← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007689">
      <ENU>Description("h↓c←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007690">
      <ENU>"h↓c← = " &amp; h↓c← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007691">
      <ENU>Description("h↓p←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007692">
      <ENU>"h↓p← = " &amp; h↓p← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007694">
      <ENU>Description("z")</ENU>
    </Item>
    <Item ID="TEXT_INI400_007696">
      <ENU>Description("l↓p←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007697">
      <ENU>"l↓p← = " &amp; l↓p← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007699">
      <ENU>Description("Openings")</ENU>
    </Item>
    <Item ID="TEXT_INI400_007700">
      <ENU>Openings &amp; " %"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007701">
      <ENU>Description("ϕ")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007826">
      <ENU>"Wind peak velocity pressure on the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007831">
      <ENU>"Dynamics effects of the wind are neglected, therefore Structural factor c↓s←c↓d← = 1.0"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007833">
      <ENU>"Dynamics effects of the wind are considered"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007918">
      <ENU>"Shelter factor can be used, if there are other walls or fences upwind,"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007919">
      <ENU>"that are equal in height or taller than height h of considerated wall or fence"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007920">
      <ENU>"Distance from the obstacle"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007921">
      <ENU>"x↓obs← = " &amp; x↓obs← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007922">
      <ENU>"Obstacle spacing x/h"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007924">
      <ENU>"Shelter factors for ϕ = 1 and 0,8"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007933">
      <ENU>"Obstacle distance is too high. Shelter factor can't be used."</ENU>
    </Item>
    <Item ID="TEXT_INI400_007934">
      <ENU>Description("ψ↓ϕ←")</ENU>
    </Item>
  </Texts>
</Root>