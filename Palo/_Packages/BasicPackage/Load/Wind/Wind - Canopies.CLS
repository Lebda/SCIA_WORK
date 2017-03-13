<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="a31bcccf-760c-4a06-9872-79cfde48ba3a">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">//All dialog visibility are here
void UpdateDialog() { 
    //Group boxes
    Dialog.GetComponentByName("WindPar").Visible →INI400_007870= IO.SetupNA.EC_NA.Code != "ELOT" &amp;&amp; IO.SetupNA.EC_NA.Code != "LU" &amp;&amp; IO.SetupNA.EC_NA.Code != "STD"; 
    Dialog.GetComponentByName("ConstructionPar").Visible →INI400_007871= (IO.SetupNA.EC_NA.Code != "CSN" &amp;&amp; IO.SetupNA.EC_NA.Code != "NEN" &amp;&amp; IO.SetupNA.EC_NA.Code != "DIN" &amp;&amp; IO.SetupNA.EC_NA.Code != "LU" &amp;&amp; IO.SetupNA.EC_NA.Code != "SR" &amp;&amp; IO.SetupNA.EC_NA.Code != "STN" &amp;&amp; IO.SetupNA.EC_NA.Code != "STD") || NeglectDynamic == FALSE; 
    
    //Clause 4.2(2P)N1
    Dialog.GetComponentByName("StateONORM").Visible →INI400_007872= IO.SetupNA.EC_NA.Code == "ONORM"; 
    Dialog.GetComponentByName("Muni0ONORM").Visible →INI400_007873= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 0; 
    Dialog.GetComponentByName("Muni1ONORM").Visible →INI400_007874= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 1; 
    Dialog.GetComponentByName("Muni2ONORM").Visible →INI400_007875= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 2; 
    Dialog.GetComponentByName("Muni3ONORM").Visible →INI400_007876= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 3; 
    Dialog.GetComponentByName("Muni4ONORM").Visible →INI400_007877= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 4; 
    Dialog.GetComponentByName("Muni5ONORM").Visible →INI400_007878= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 5; 
    Dialog.GetComponentByName("Muni6ONORM").Visible →INI400_007879= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 6; 
    Dialog.GetComponentByName("Muni7ONORM").Visible →INI400_007880= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 7; 
    Dialog.GetComponentByName("Muni8ONORM").Visible →INI400_007881= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 8; 
    Dialog.GetComponentByName("CatNBN").Visible →INI400_007882= IO.SetupNA.EC_NA.Code == "NBN"; 
    Dialog.GetComponentByName("A").Visible →INI400_007883= IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "PN" || IO.SetupNA.EC_NA.Code == "SIST" || IO.SetupNA.EC_NA.Code == "ONORM" || (IO.SetupNA.EC_NA.Code == "SFS" &amp;&amp; SpecialStructure); 
    Dialog.GetComponentByName("v_b_map").Visible →INI400_007884= IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "SR"; 
    Dialog.GetComponentByName("CatCSN").Visible →INI400_007885= IO.SetupNA.EC_NA.Code == "CSN"; 
    Dialog.GetComponentByName("CHMI").Visible →INI400_007886= IO.SetupNA.EC_NA.Code == "CSN" &amp;&amp; CatCSN == 4; 
    Dialog.GetComponentByName("vb0_CSN").Visible →INI400_007887= IO.SetupNA.EC_NA.Code == "CSN" &amp;&amp; CatCSN == 4 &amp;&amp; CHMI == True; 
    Dialog.GetComponentByName("CatNEN").Visible →INI400_007888= IO.SetupNA.EC_NA.Code == "NEN"; 
    Dialog.GetComponentByName("CatSFS").Visible →INI400_007889= IO.SetupNA.EC_NA.Code == "SFS"; 
    Dialog.GetComponentByName("CatNF").Visible →INI400_007890= IO.SetupNA.EC_NA.Code == "NF"; 
    Dialog.GetComponentByName("CatDIN").Visible →INI400_007891= IO.SetupNA.EC_NA.Code == "DIN"; 
    Dialog.GetComponentByName("Coast").Visible →INI400_007892= IO.SetupNA.EC_NA.Code == "ELOT"; 
    Dialog.GetComponentByName("CatPN").Visible →INI400_007893= IO.SetupNA.EC_NA.Code == "PN"; 
    Dialog.GetComponentByName("CatSTN").Visible →INI400_007894= IO.SetupNA.EC_NA.Code == "STN"; 
    Dialog.GetComponentByName("CatSIST").Visible →INI400_007895= IO.SetupNA.EC_NA.Code == "SIST"; 
    
    //Clause 4.2(2P)N2
    Dialog.GetComponentByName("Dir").Visible →INI400_007896= IO.SetupNA.EC_NA.Code == "NBN" || IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "NF" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "PN"; 
    Dialog.GetComponentByName("DirCatNF").Visible →INI400_007897= IO.SetupNA.EC_NA.Code == "NF"; 
    
    //Clause 4.2(2P)N3
    Dialog.GetComponentByName("Temporary").Visible →INI400_007898= IO.SetupNA.EC_NA.Code == "NBN" || IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "NF" || IO.SetupNA.EC_NA.Code == "IS"; 
    Dialog.GetComponentByName("Month").Visible →INI400_007899= IO.SetupNA.EC_NA.Code == "NBN" &amp;&amp; Temporary; 
    Dialog.GetComponentByName("Length").Visible →INI400_007900= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; Temporary; 
    Dialog.GetComponentByName("Month0").Visible →INI400_007901= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; Length == 0 &amp;&amp; Temporary; 
    Dialog.GetComponentByName("Month1").Visible →INI400_007902= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; Length == 1 &amp;&amp; Temporary; 
    Dialog.GetComponentByName("Month2").Visible →INI400_007903= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; Length == 2 &amp;&amp; Temporary; 
    Dialog.GetComponentByName("Month3").Visible →INI400_007904= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; Length == 3 &amp;&amp; Temporary; 
    Dialog.GetComponentByName("SeasonCatNF").Visible →INI400_007905= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; Temporary; 
    Dialog.GetComponentByName("MonthNF").Visible →INI400_007906= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; Temporary; 
    
    //Clause 4.3.1(1)N2
    Dialog.GetComponentByName("TerrainONORM").Visible →INI400_007907= IO.SetupNA.EC_NA.Code == "ONORM"; 
    Dialog.GetComponentByName("TerrainDIN").Visible →INI400_007908= IO.SetupNA.EC_NA.Code == "DIN"; 
    
    //Clause 4.3.2(1)
    Dialog.GetComponentByName("Terrain").Visible →INI400_007909= IO.SetupNA.EC_NA.Code != "BS" &amp;&amp; IO.SetupNA.EC_NA.Code != "IS" &amp;&amp; IO.SetupNA.EC_NA.Code != "ONORM" &amp;&amp; IO.SetupNA.EC_NA.Code != "NEN" &amp;&amp; IO.SetupNA.EC_NA.Code != "NF" &amp;&amp; IO.SetupNA.EC_NA.Code != "DIN"; 
    Dialog.GetComponentByName("TerrainBS").Visible →INI400_007910= IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS"; 
    Dialog.GetComponentByName("TerrainNEN").Visible →INI400_007911= IO.SetupNA.EC_NA.Code == "NEN"; 
    Dialog.GetComponentByName("TerrainNF").Visible →INI400_007912= IO.SetupNA.EC_NA.Code == "NF"; 
    Dialog.GetComponentByName("AccurateInformation").Visible →INI400_007913= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS == 2; 
    Dialog.GetComponentByName("h_ave").Visible →INI400_007914= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; AccurateInformation &amp;&amp; TerrainBS == 2; 
    Dialog.GetComponentByName("DisShore").Visible →INI400_007915= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS != 0; 
    Dialog.GetComponentByName("h").Visible →INI400_007916= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS == 2; 
    Dialog.GetComponentByName("xDis").Visible →INI400_007917= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS == 2; 
    Dialog.GetComponentByName("DisTown").Visible →INI400_007918= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS == 2; 
    Dialog.GetComponentByName("cr_diag").Visible →INI400_007919= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS == 2; 
    Dialog.GetComponentByName("cr_T").Visible →INI400_007920= (IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "IS") &amp;&amp; TerrainBS == 2; 
    
    //Clause 4.3.3(1)
    Dialog.GetComponentByName("UseOrtoFactor").Visible →INI400_007921= (!IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic || IO.SetupNA.EC_NA.Code == "NF") &amp;&amp; IO.SetupNA.EC_NA.Code != "DIN"; 
    Dialog.GetComponentByName("H").Visible →INI400_007922= !IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic &amp;&amp; UseOroFactor; 
    Dialog.GetComponentByName("Ld").Visible →INI400_007923= !IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic &amp;&amp; UseOroFactor &amp;&amp; OroTerrain == 1; 
    Dialog.GetComponentByName("OroTerrain").Visible →INI400_007924= !IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic &amp;&amp; UseOroFactor; 
    Dialog.GetComponentByName("Lu").Visible →INI400_007925= !IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic &amp;&amp; UseOroFactor; 
    Dialog.GetComponentByName("x").Visible →INI400_007926= !IO.SetupNA.EC_1991_1_4.c_O.OrtInBasic &amp;&amp; UseOroFactor; 
    Dialog.GetComponentByName("ProcedureNF").Visible →INI400_007927= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor; 
    Dialog.GetComponentByName("A_N1").Visible →INI400_007928= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_N2").Visible →INI400_007929= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_E1").Visible →INI400_007930= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_E2").Visible →INI400_007931= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_S1").Visible →INI400_007932= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_S2").Visible →INI400_007933= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_O1").Visible →INI400_007934= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    Dialog.GetComponentByName("A_O2").Visible →INI400_007935= IO.SetupNA.EC_NA.Code == "NF" &amp;&amp; UseOroFactor &amp;&amp; ProcedureNF == 0; 
    
    //Clause 4.4(1)
    Dialog.GetComponentByName("Ivz_flat").Visible →INI400_007936= IO.SetupNA.EC_NA.Code == "BS"; 
    Dialog.GetComponentByName("k_IT").Visible →INI400_007937= IO.SetupNA.EC_NA.Code == "BS"; 
    
    //Clause 4.5(1)N1
    Dialog.GetComponentByName("c_e_diag").Visible →INI400_007938= IO.SetupNA.EC_NA.Code == "BS"; 
    Dialog.GetComponentByName("c_e_T").Visible →INI400_007939= IO.SetupNA.EC_NA.Code == "BS"; 
    
    //Clause 4.5(1)N2
    Dialog.GetComponentByName("SpecialStructure").Visible →INI400_007940= IO.SetupNA.EC_NA.Code == "SFS"; 
    Dialog.GetComponentByName("T").Visible →INI400_007941= IO.SetupNA.EC_NA.Code == "SFS" &amp;&amp; SpecialStructure; 
    
    //Dynamics wind
    Dialog.GetComponentByName("TerrainDINdyn").Visible →INI400_007942= IO.SetupNA.EC_NA.Code == "DIN" &amp;&amp; !NeglectDynamic; 
    Dialog.GetComponentByName("Separate_cscd").Visible →INI400_007943= Separate_cscd.c↓s←c↓d←_sep &amp;&amp; !NeglectDynamic; 
    Dialog.GetComponentByName("Damping").Visible →INI400_007944= !NeglectDynamic; 
    Dialog.GetComponentByName("Deflection").Visible →INI400_007945= !NeglectDynamic; 
    
    Dialog.GetComponentByName("FrictionSurface").Visible →INI400_007946= Horizontal; 
} 

→INI400_006607BLOCK { //Set of Result on 0
    w↓A,max← →INI400_006608= 0; w↓A,min← →INI400_006609= 0; w↓B,max← →INI400_006610= 0; w↓B,min← →INI400_006611= 0; w↓C,max← →INI400_006612= 0; 
    w↓C,min← →INI400_006613= 0; w↓D,max← →INI400_006614= 0; w↓D,min← →INI400_006615= 0; F↓f,max,1← →INI400_007947= 0; F↓f,max,2← →INI400_007948= 0; 
    F↓f,max← →INI400_007949= 0; F↓f,min,1← →INI400_007950= 0; F↓f,min,2← →INI400_007951= 0; F↓f,min← →INI400_007952= 0; H↓fr← →INI400_007870= 0; 
} 

→INI400_007953BLOCK { 
    IF(Headline) { 
        →INI400_007954TEXT("Wind load on the canopies according to Eurocode 1"); 
        →INI400_007955TEXT(IO.SetupNA.EC_1991_1_4.Name); 
    } 
    IF(PrintCaption) { 
        →INI400_007956TEXT(Caption); 
    } 
} 

object TableHeaderFont →INI400_007957= new Font("Tahoma", 10, FontStyle.Bold); 
object TableCellFont →INI400_007958= new Font("Tahoma", 10, FontStyle.Regular); 

→INI400_007959TEXT("A canopy roof is defined as the roof of a structure that does not have permanent walls,&lt;BR&gt;such as petrol stations, dutch barns, etc."); 

→INI400_007960BLOCK("Dimensions of construction:") { 
    →INI400_007961TEXT(Description("d")); 
    →INI400_007962TEXT("d = " &amp; d &amp; "m"); 
    →INI400_007963TEXT(Description("b")); 
    →INI400_007964TEXT("b = " &amp; b &amp; "m"); 
    →INI400_007965TEXT(Description("ϕ")); 
    →INI400_007966TEXT("ϕ = " &amp; ϕ &amp; " "); 
    →INI400_007967TEXT(Description("α")); 
    →INI400_007968TEXT("α = " &amp; α &amp; "°"); 
    →INI400_007969TEXT(Description("Type")); 
    SWITCH(Type) { 
        CASE 0 :  { 
            →INI400_007970TEXT("Monopitch"); 
        } 
        CASE 1 :  { 
            →INI400_007971TEXT("Duopitch"); 
        } 
        CASE 2 :  { 
            →INI400_007972TEXT("Multibay duopitch"); 
        } 
    } 
} 
→INI400_007973BLOCK { // Load of calculation of the wind pressure
    object WindPressure →INI400_007974= LoadExternCLC("Wind load.CLC"); 
    WindPressure.StateONORM →INI400_007976= double StateONORM; 
    WindPressure.Municipality0ONORM →INI400_007978= double Municipality0ONORM; 
    WindPressure.Municipality1ONORM →INI400_007980= double Municipality1ONORM; 
    WindPressure.Municipality2ONORM →INI400_007982= double Municipality2ONORM; 
    WindPressure.Municipality3ONORM →INI400_007984= double Municipality3ONORM; 
    WindPressure.Municipality4ONORM →INI400_007986= double Municipality4ONORM; 
    WindPressure.Municipality5ONORM →INI400_007988= double Municipality5ONORM; 
    WindPressure.Municipality6ONORM →INI400_007990= double Municipality6ONORM; 
    WindPressure.Municipality7ONORM →INI400_007992= double Municipality7ONORM; 
    WindPressure.Municipality8ONORM →INI400_007994= double Municipality8ONORM; 
    WindPressure.CatNBN →INI400_007996= double CatNBN; 
    WindPressure.A →INI400_007998= double A; 
    WindPressure.v↓b,map← →INI400_008000= double v↓b,map←; 
    WindPressure.z →INI400_008002= double h; 
    WindPressure.CatCSN →INI400_008004= double CatCSN; 
    WindPressure.CHMI →INI400_008006= bool CHMI; 
    WindPressure.v↓b,0,CHMI← →INI400_008008= double v↓b,0,CHMI←; 
    WindPressure.CatNEN →INI400_008010= double CatNEN; 
    WindPressure.CatSFS →INI400_008012= double CatSFS; 
    WindPressure.CatNF →INI400_008014= double CatNF; 
    WindPressure.CatDIN →INI400_008016= double CatDIN; 
    WindPressure.Coast →INI400_008018= bool Coast; 
    WindPressure.CatPN →INI400_008020= double CatPN; 
    WindPressure.CatSTN →INI400_008022= double CatSTN; 
    WindPressure.CatSIST →INI400_008024= double CatSIST; 
    WindPressure.Dir →INI400_008026= double Dir; 
    WindPressure.DirCatNF →INI400_008028= double DirCatNF; 
    WindPressure.Temporary →INI400_008030= bool Temporary; 
    WindPressure.Month →INI400_008032= double Month; 
    WindPressure.Length →INI400_008034= double Length; 
    WindPressure.Month0 →INI400_008036= double Month0; 
    WindPressure.Month1 →INI400_008038= double Month1; 
    WindPressure.Month2 →INI400_008040= double Month2; 
    WindPressure.Month3 →INI400_008042= double Month3; 
    WindPressure.SeasonCatNF →INI400_008044= double SeasonCatNF; 
    WindPressure.MonthNF →INI400_008046= double MonthNF; 
    WindPressure.TerrainONORM →INI400_008048= double TerrainONORM; 
    WindPressure.Terrain →INI400_008050= double Terrain; 
    WindPressure.DisShore →INI400_008051= double DisShore; 
    WindPressure.DisTown →INI400_008052= double DisTown; 
    WindPressure.TerrainBS →INI400_008053= double TerrainBS; 
    WindPressure.AccurateInformation →INI400_008054= bool AccurateInformation; 
    WindPressure.h↓ave← →INI400_008055= double h↓ave←; 
    WindPressure.xDis →INI400_008056= double xDis; 
    WindPressure.c↓r,diag← →INI400_008057= double c↓r,diag←; 
    WindPressure.c↓r,T← →INI400_008058= double c↓r,T←; 
    WindPressure.c↓e,diag← →INI400_008059= double c↓e,diag←; 
    WindPressure.c↓e,T← →INI400_008060= double c↓e,T←; 
    WindPressure.h →INI400_008062= double h; 
    WindPressure.TerrainNEN →INI400_008063= double TerrainNEN; 
    WindPressure.TerrainNF →INI400_008064= double TerrainNF; 
    WindPressure.TerrainNEN →INI400_008065= double TerrainNEN; 
    WindPressure.SpecialStructure →INI400_008066= bool SpecialStructure; 
    WindPressure.T →INI400_008067= double T; 
    WindPressure.UseOroFactor →INI400_008068= bool UseOroFactor; 
    WindPressure.L↓u← →INI400_008069= double L↓u←; 
    WindPressure.L↓d← →INI400_008070= double L↓d←; 
    WindPressure.H →INI400_008071= double H; 
    WindPressure.x →INI400_008072= double x; 
    WindPressure.OroTerrain →INI400_008073= double OroTerrain; 
    WindPressure.ProcedureNF →INI400_008074= double ProcedureNF; 
    WindPressure.A↓N1← →INI400_008075= double A↓N1←; 
    WindPressure.A↓N2← →INI400_008076= double A↓N2←; 
    WindPressure.A↓E1← →INI400_008077= double A↓E1←; 
    WindPressure.A↓E2← →INI400_008078= double A↓E2←; 
    WindPressure.A↓S1← →INI400_008079= double A↓S1←; 
    WindPressure.A↓S2← →INI400_008080= double A↓S2←; 
    WindPressure.A↓O1← →INI400_008081= double A↓O1←; 
    WindPressure.A↓O2← →INI400_008082= double A↓O2←; 
    WindPressure.I↓v(z)flat← →INI400_008083= double I↓v(z)flat←; 
    WindPressure.k↓I,T← →INI400_008084= double k↓I,T←; 
    
} 
→INI400_008085PAGEBREAK(); 
→INI400_008086BLOCK("Parameters of the wind load:") { 
    IF(PrintPressureCalc) { 
        →INI400_008087WindPressure.Draw(false); 
    } ELSE { 
        →INI400_008088WindPressure.Calculate(false); 
    } 
    double v↓m← →INI400_008089= WindPressure.v↓m←; 
    double I↓v← →INI400_008091= WindPressure.I↓v←; 
    double z↓0← →INI400_008093= WindPressure.z↓0←; 
    double z↓min← →INI400_008095= WindPressure.z↓min←; 
    →INI400_008097TEXT("Wind peak velocity pressure on the roof"); 
    q↓p← →INI400_008098= WindPressure.q↓p←; 
    //Load extern CLC which check the Norm about possibility of seperation of c↓s←c↓d←
    object Separate_cscd →INI400_008100= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1991\EN_1991_1_4\Clause_6.1(1).CLC"); 
    →INI400_008101Separate_cscd.Calculate(false); 
    IF(NeglectDynamic) { 
        →INI400_008102TEXT("Dynamics effects of the wind are neglected, therefore Structural factor c↓s←c↓d← = 1.0"); 
        c↓s←c↓d← →INI400_008103= 1; 
    } ELSE { 
        →INI400_008104TEXT("Dynamics effects of the wind are considered"); 
        object DynamicWind →INI400_008105= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1991\EN_1991_1_4\B_Dynamics_Structural_factor.CLC"); 
        DynamicWind.b →INI400_008106= double b; 
        DynamicWind.z↓0← →INI400_008107= double z↓0←; 
        DynamicWind.z↓min← →INI400_008108= double z↓min←; 
        DynamicWind.z →INI400_008109= double h; 
        DynamicWind.h →INI400_008110= double h; 
        DynamicWind.x →INI400_008111= double Def; 
        DynamicWind.v↓m← →INI400_008112= double v↓m←; 
        DynamicWind.δ →INI400_008113= double δ; 
        DynamicWind.I↓v← →INI400_008114= double I↓v←; 
        DynamicWind.TerrainDINdyn →INI400_008115= double TerrainDINdyn; 
        DynamicWind.Separate_c↓s←c↓d← →INI400_008116= bool Separate_c↓s←c↓d←; 
        DynamicWind.Master →INI400_008117= False; 
        →INI400_008118DynamicWind.Draw(false); 
        c↓s←c↓d← →INI400_008119= DynamicWind.c↓s←c↓d←; 
    } 
} 


//table 7.6 with externam pressure coefficients
SWITCH(IO.SetupNA.EC_NA.Code) { 
    DEFAULT :  { 
        object Table76 →INI400_008120= new CustomDataTable("CDT\EN_1991_1_4_Table_7.6_STD.xml"); 
        object Table77 →INI400_008121= new CustomDataTable("CDT\EN_1991_1_4_Table_7.7_STD.xml"); 
    } 
} 
→INI400_008122BLOCK { 
    IF(α &lt; -15) { 
        string Sel0 →INI400_008123= "".Format("Category = '{0}'", -20); 
        string Sel1 →INI400_008124= "".Format("Category = '{0}'", -15); 
    } ELSE { 
        IF(α &lt; -10) { 
            string Sel0 →INI400_008125= "".Format("Category = '{0}'", -15); 
            string Sel1 →INI400_008126= "".Format("Category = '{0}'", -10); 
        } ELSE { 
            IF(α &lt; -5) { 
                string Sel0 →INI400_008127= "".Format("Category = '{0}'", -10); 
                string Sel1 →INI400_008128= "".Format("Category = '{0}'", -5); 
            } ELSE { 
                IF(α &lt; 5) { 
                    string Sel0 →INI400_008129= "".Format("Category = '{0}'", 0); 
                    string Sel1 →INI400_008130= "".Format("Category = '{0}'", 5); 
                } ELSE { 
                    IF(α &lt; 10) { 
                        string Sel0 →INI400_008131= "".Format("Category = '{0}'", 5); 
                        string Sel1 →INI400_008132= "".Format("Category = '{0}'", 10); 
                    } ELSE { 
                        IF(α &lt; 15) { 
                            string Sel0 →INI400_008133= "".Format("Category = '{0}'", 10); 
                            string Sel1 →INI400_008134= "".Format("Category = '{0}'", 15); 
                        } ELSE { 
                            IF(α &lt; 20) { 
                                string Sel0 →INI400_008135= "".Format("Category = '{0}'", 15); 
                                string Sel1 →INI400_008136= "".Format("Category = '{0}'", 20); 
                            } ELSE { 
                                IF(α &lt; 25) { 
                                    string Sel0 →INI400_008137= "".Format("Category = '{0}'", 20); 
                                    string Sel1 →INI400_008138= "".Format("Category = '{0}'", 25); 
                                } ELSE { 
                                    string Sel0 →INI400_008139= "".Format("Category = '{0}'", 25); 
                                    string Sel1 →INI400_008140= "".Format("Category = '{0}'", 30); 
                                } 
                            } 
                        } 
                    } 
                } 
            } 
        } 
    } 
    SWITCH(Type) { 
        CASE 0 :  { 
            object Table76selection0 →INI400_008141= Table76.Select(Sel0); 
            object STR0 →INI400_008142= Table76.GetStructure(Table76selection0[0]); 
            object STR1 →INI400_008144= Table76.GetStructure(Table76selection0[1]); 
            object STR2 →INI400_008145= Table76.GetStructure(Table76selection0[2]); 
            object Table76selection1 →INI400_008146= Table76.Select(Sel1); 
            object STR3 →INI400_008147= Table76.GetStructure(Table76selection1[0]); 
            object STR4 →INI400_008148= Table76.GetStructure(Table76selection1[1]); 
            object STR5 →INI400_008149= Table76.GetStructure(Table76selection1[2]); 
        } 
        CASE 1 :  { 
            object Table77selection0 →INI400_008150= Table77.Select(Sel0); 
            object STR0 →INI400_008151= Table77.GetStructure(Table77selection0[0]); 
            object STR1 →INI400_008153= Table77.GetStructure(Table77selection0[1]); 
            object STR2 →INI400_008154= Table77.GetStructure(Table77selection0[2]); 
            object Table77selection1 →INI400_008155= Table77.Select(Sel1); 
            object STR3 →INI400_008156= Table77.GetStructure(Table77selection1[0]); 
            object STR4 →INI400_008157= Table77.GetStructure(Table77selection1[1]); 
            object STR5 →INI400_008158= Table77.GetStructure(Table77selection1[2]); 
        } 
        CASE 2 :  { 
            object Table77selection0 →INI400_008159= Table77.Select(Sel0); 
            object STR0 →INI400_008160= Table77.GetStructure(Table77selection0[0]); 
            object STR1 →INI400_008162= Table77.GetStructure(Table77selection0[1]); 
            object STR2 →INI400_008163= Table77.GetStructure(Table77selection0[2]); 
            object Table77selection1 →INI400_008164= Table77.Select(Sel1); 
            object STR3 →INI400_008165= Table77.GetStructure(Table77selection1[0]); 
            object STR4 →INI400_008166= Table77.GetStructure(Table77selection1[1]); 
            object STR5 →INI400_008167= Table77.GetStructure(Table77selection1[2]); 
        } 
    } 
} 

IF(α &lt; 0 &amp;&amp; Type == 0) { 
    →INI400_008168TEXT("Incorrect canopy slope. Monopitch canopy slope have to be between 0 ° and 30 °"); 
    Exit(); 
} 
IF(α &gt; -5 &amp;&amp; α &lt; 5 &amp;&amp; Type == 1) { 
    →INI400_008169TEXT("Incorrect canopy slope. Duopitch canopy slope can't be between -5 ° and 5 °"); 
    Exit(); 
} 

→INI400_008170PAGEBREAK(); 
IF(Type == 2) { 
    →INI400_008171BLOCK("Multibay reduction factors") { 
        ψ↓mc,max,1← →INI400_008172= 1; 
        ψ↓mc,min,1← →INI400_008173= 0.8; 
        ψ↓mc,max,2← →INI400_008174= 0.9; 
        ψ↓mc,min,2← →INI400_008175= 0.7; 
        ψ↓mc,max,3← →INI400_008176= 0.7; 
        ψ↓mc,min,3← →INI400_008177= 0.7; 
        →INI400_008178BLOCK { 
            object T1 →INI400_008179= new Table(4); 
            T1[0][0].Value →INI400_008180= TR("Bay"); 
            T1[0][1].Value →INI400_008181= TR("Location"); 
            T1[0][2].Value →INI400_008182= "ψ↓mc,max←"; 
            T1[0][3].Value →INI400_008183= "ψ↓mc,min←"; 
            T1[1][0].Value →INI400_008184= 1; 
            T1[1][1].Value →INI400_008185= TR("End bay"); 
            T1[1][2].Value →INI400_008186= 1; 
            T1[1][3].Value →INI400_008187= 0.8; 
            T1[2][0].Value →INI400_008188= 2; 
            T1[2][1].Value →INI400_008189= TR("Second bay"); 
            T1[2][2].Value →INI400_008190= 0.9; 
            T1[2][3].Value →INI400_008191= 0.7; 
            T1[3][0].Value →INI400_008192= 3; 
            T1[3][1].Value →INI400_008193= TR("Third and subsequent bays"); 
            T1[3][2].Value →INI400_008194= 0.7; 
            T1[3][3].Value →INI400_008195= 0.7; 
            T1[0].Font →INI400_008196= TableHeaderFont; 
            T1[1].Font →INI400_008197= TableCellFont; 
            T1[2].Font →INI400_008198= TableCellFont; 
            T1[3].Font →INI400_008199= TableCellFont; 
            T1[1][0].Font →INI400_008200= TableHeaderFont; 
            T1[2][0].Font →INI400_008201= TableHeaderFont; 
            T1[3][0].Font →INI400_008202= TableHeaderFont; 
            T1.Padding.All →INI400_008203= 5; 
        } 
        →INI400_008204T1.Draw(); 
        →INI400_008205PAGEBREAK(); 
    } 
} 
IF(LocalEffects) { 
    →INI400_008206BLOCK("Local effects") { 
        →INI400_008207TEXT("Net Pressure coefficients"); 
        c↓p,net,max,A← →INI400_008208= LinInterp(α, new PointD(STR0.Category, STR0.A), new PointD(STR3.Category, STR3.A)); 
        c↓p,net,0,A← →INI400_008209= LinInterp(α, new PointD(STR1.Category, STR1.A), new PointD(STR4.Category, STR4.A)); 
        c↓p,net,1,A← →INI400_008210= LinInterp(α, new PointD(STR2.Category, STR2.A), new PointD(STR5.Category, STR5.A)); 
        c↓p,net,min,A← →INI400_008211= LinInterp(ϕ, new PointD(0, c↓p,net,0,A←), new PointD(1, c↓p,net,1,A←)); 
        c↓p,net,max,B← →INI400_008212= LinInterp(α, new PointD(STR0.Category, STR0.B), new PointD(STR3.Category, STR3.B)); 
        c↓p,net,0,B← →INI400_008213= LinInterp(α, new PointD(STR1.Category, STR1.B), new PointD(STR4.Category, STR4.B)); 
        c↓p,net,1,B← →INI400_008214= LinInterp(α, new PointD(STR2.Category, STR2.B), new PointD(STR5.Category, STR5.B)); 
        c↓p,net,min,B← →INI400_008215= LinInterp(ϕ, new PointD(0, c↓p,net,0,B←), new PointD(1, c↓p,net,1,B←)); 
        c↓p,net,max,C← →INI400_008216= LinInterp(α, new PointD(STR0.Category, STR0.C), new PointD(STR3.Category, STR3.C)); 
        c↓p,net,0,C← →INI400_008217= LinInterp(α, new PointD(STR1.Category, STR1.C), new PointD(STR4.Category, STR4.C)); 
        c↓p,net,1,C← →INI400_008218= LinInterp(α, new PointD(STR2.Category, STR2.C), new PointD(STR5.Category, STR5.C)); 
        c↓p,net,min,C← →INI400_008219= LinInterp(ϕ, new PointD(0, c↓p,net,0,C←), new PointD(1, c↓p,net,1,C←)); 
        IF(Type != 0) { 
            c↓p,net,max,D← →INI400_008220= LinInterp(α, new PointD(STR0.Category, STR0.D), new PointD(STR3.Category, STR3.D)); 
            c↓p,net,0,D← →INI400_008221= LinInterp(α, new PointD(STR1.Category, STR1.D), new PointD(STR4.Category, STR4.D)); 
            c↓p,net,1,D← →INI400_008222= LinInterp(α, new PointD(STR2.Category, STR2.D), new PointD(STR5.Category, STR5.D)); 
            c↓p,net,min,D← →INI400_008223= LinInterp(ϕ, new PointD(0, c↓p,net,0,D←), new PointD(1, c↓p,net,1,D←)); 
        } 
        →INI400_008224TEXT("Net pressure coefficients are calculated by two linear interpolations in table 7.6 or 7.7&lt;BR&gt;from the Code. First interpolation is for roof angle, second is for blockage."); 
        →INI400_008225TEXT("Calculated local wind pressure should be used in the design of roofing elements and fixings."); 
        →INI400_008226BLOCK { 
            object T2 →INI400_008227= new Table(3); 
            T2[0][0].Value →INI400_008228= TR("Region"); 
            T2[0][1].Value →INI400_008229= "c↓p,net,max←"; 
            T2[0][2].Value →INI400_008230= "c↓p,net,min←"; 
            T2[1][0].Value →INI400_008231= "A"; 
            T2[1][1].Value →INI400_008232= c↓p,net,max,A←; 
            T2[1][2].Value →INI400_008233= c↓p,net,min,A←; 
            T2[2][0].Value →INI400_008234= "B"; 
            T2[2][1].Value →INI400_008235= c↓p,net,max,B←; 
            T2[2][2].Value →INI400_008236= c↓p,net,min,B←; 
            T2[3][0].Value →INI400_008237= "C"; 
            T2[3][1].Value →INI400_008238= c↓p,net,max,C←; 
            T2[3][2].Value →INI400_008239= c↓p,net,min,C←; 
            IF(Type != 0) { 
                T2[4][0].Value →INI400_008240= "D"; 
                T2[4][1].Value →INI400_008241= c↓p,net,max,D←; 
                T2[4][2].Value →INI400_008242= c↓p,net,min,D←; 
            } 
            T2[0].Font →INI400_008243= TableHeaderFont; 
            T2[1].Font →INI400_008244= TableCellFont; 
            T2[2].Font →INI400_008245= TableCellFont; 
            T2[3].Font →INI400_008246= TableCellFont; 
            T2[4].Font →INI400_008247= TableCellFont; 
            T2[1][0].Font →INI400_008248= TableHeaderFont; 
            T2[2][0].Font →INI400_008249= TableHeaderFont; 
            T2[3][0].Font →INI400_008250= TableHeaderFont; 
            T2[4][0].Font →INI400_008251= TableHeaderFont; 
            T2.Padding.All →INI400_008252= 5; 
        } 
        →INI400_008253T2.Draw(); 
        →INI400_008254PAGEBREAK(); 
        →INI400_008255TEXT("Local wind pressure"); 
        w↓A,max← →INI400_008256= c↓p,net,max,A←*q↓p←; 
        w↓A,min← →INI400_008257= c↓p,net,min,A←*q↓p←; 
        w↓B,max← →INI400_008258= c↓p,net,max,B←*q↓p←; 
        w↓B,min← →INI400_008259= c↓p,net,min,B←*q↓p←; 
        w↓C,max← →INI400_008260= c↓p,net,max,C←*q↓p←; 
        w↓C,min← →INI400_008261= c↓p,net,min,C←*q↓p←; 
        IF(Type != 0) { 
            w↓D,max← →INI400_008262= c↓p,net,max,D←*q↓p←; 
            w↓D,min← →INI400_008263= c↓p,net,min,D←*q↓p←; 
        } 
        →INI400_008264BLOCK { 
            object T3 →INI400_008265= new Table(3); 
            T3[0][0].Value →INI400_008266= TR("Region"); 
            T3[0][1].Value →INI400_008267= "w↓max←&lt;BR&gt;[kN/m↑2←]"; 
            T3[0][2].Value →INI400_008268= "w↓min←&lt;BR&gt;[kN/m↑2←]"; 
            T3[1][0].Value →INI400_008269= "A"; 
            T3[1][1].Value →INI400_008270= Val(w↓A,max←*10↑-3←, 0).ToString("0.00"); 
            T3[1][2].Value →INI400_008271= Val(w↓A,min←*10↑-3←, 0).ToString("0.00"); 
            T3[2][0].Value →INI400_008272= "B"; 
            T3[2][1].Value →INI400_008273= Val(w↓B,max←*10↑-3←, 0).ToString("0.00"); 
            T3[2][2].Value →INI400_008274= Val(w↓B,min←*10↑-3←, 0).ToString("0.00"); 
            T3[3][0].Value →INI400_008275= "C"; 
            T3[3][1].Value →INI400_008276= Val(w↓C,max←*10↑-3←, 0).ToString("0.00"); 
            T3[3][2].Value →INI400_008277= Val(w↓C,min←*10↑-3←, 0).ToString("0.00"); 
            IF(Type != 0) { 
                T3[4][0].Value →INI400_008278= "D"; 
                T3[4][1].Value →INI400_008279= Val(w↓D,max←*10↑-3←, 0).ToString("0.00"); 
                T3[4][2].Value →INI400_008280= Val(w↓D,min←*10↑-3←, 0).ToString("0.00"); 
            } 
            T3[0].Font →INI400_008281= TableHeaderFont; 
            T3[1].Font →INI400_008282= TableCellFont; 
            T3[2].Font →INI400_008283= TableCellFont; 
            T3[3].Font →INI400_008284= TableCellFont; 
            T3[4].Font →INI400_008285= TableCellFont; 
            T3[1][0].Font →INI400_008286= TableHeaderFont; 
            T3[2][0].Font →INI400_008287= TableHeaderFont; 
            T3[3][0].Font →INI400_008288= TableHeaderFont; 
            T3[4][0].Font →INI400_008289= TableHeaderFont; 
            T3.Padding.All →INI400_008290= 5; 
        } 
        →INI400_008291T3.Draw(); 
        →INI400_008292PAGEBREAK(); 
        IF(Type == 2) { 
            →INI400_008293TEXT("Local wind pressure in bays of multibay canopy"); 
            w↓A,max,1← →INI400_008294= w↓A,max←*ψ↓mc,max,1←; 
            →INI400_008295BLOCK { 
                object T4 →INI400_008296= new Table(9); 
                T4[0][0].Value →INI400_008297= TR("Bay"); 
                T4[0][1].Value →INI400_008298= "w↓A,max←&lt;BR&gt;[kN/m↑2←]"; 
                T4[0][2].Value →INI400_008299= "w↓A,min←&lt;BR&gt;[kN/m↑2←]"; 
                T4[0][3].Value →INI400_008300= "w↓B,max←&lt;BR&gt;[kN/m↑2←]"; 
                T4[0][4].Value →INI400_008301= "w↓B,min←&lt;BR&gt;[kN/m↑2←]"; 
                T4[0][5].Value →INI400_008302= "w↓C,max←&lt;BR&gt;[kN/m↑2←]"; 
                T4[0][6].Value →INI400_008303= "w↓C,min←&lt;BR&gt;[kN/m↑2←]"; 
                T4[0][7].Value →INI400_008304= "w↓D,max←&lt;BR&gt;[kN/m↑2←]"; 
                T4[0][8].Value →INI400_008305= "w↓D,min←&lt;BR&gt;[kN/m↑2←]"; 
                T4[1][0].Value →INI400_008306= "1"; 
                T4[1][1].Value →INI400_008307= Val(w↓A,max←*ψ↓mc,max,1←*10↑-3←, 2).ToString("0.00"); 
                T4[1][2].Value →INI400_008308= Val(w↓A,min←*ψ↓mc,min,1←*10↑-3←, 2).ToString("0.00"); 
                T4[1][3].Value →INI400_008309= Val(w↓B,max←*ψ↓mc,max,1←*10↑-3←, 2).ToString("0.00"); 
                T4[1][4].Value →INI400_008310= Val(w↓B,min←*ψ↓mc,min,1←*10↑-3←, 2).ToString("0.00"); 
                T4[1][5].Value →INI400_008311= Val(w↓C,max←*ψ↓mc,max,1←*10↑-3←, 2).ToString("0.00"); 
                T4[1][6].Value →INI400_008312= Val(w↓C,min←*ψ↓mc,min,1←*10↑-3←, 2).ToString("0.00"); 
                T4[1][7].Value →INI400_008313= Val(w↓D,max←*ψ↓mc,max,1←*10↑-3←, 2).ToString("0.00"); 
                T4[1][8].Value →INI400_008314= Val(w↓D,min←*ψ↓mc,min,1←*10↑-3←, 2).ToString("0.00"); 
                T4[2][0].Value →INI400_008315= "2"; 
                T4[2][1].Value →INI400_008316= Val(w↓A,max←*ψ↓mc,max,2←*10↑-3←, 2).ToString("0.00"); 
                T4[2][2].Value →INI400_008317= Val(w↓A,min←*ψ↓mc,min,2←*10↑-3←, 2).ToString("0.00"); 
                T4[2][3].Value →INI400_008318= Val(w↓B,max←*ψ↓mc,max,2←*10↑-3←, 2).ToString("0.00"); 
                T4[2][4].Value →INI400_008319= Val(w↓B,min←*ψ↓mc,min,2←*10↑-3←, 2).ToString("0.00"); 
                T4[2][5].Value →INI400_008320= Val(w↓C,max←*ψ↓mc,max,2←*10↑-3←, 2).ToString("0.00"); 
                T4[2][6].Value →INI400_008321= Val(w↓C,min←*ψ↓mc,min,2←*10↑-3←, 2).ToString("0.00"); 
                T4[2][7].Value →INI400_008322= Val(w↓D,max←*ψ↓mc,max,2←*10↑-3←, 2).ToString("0.00"); 
                T4[2][8].Value →INI400_008323= Val(w↓D,min←*ψ↓mc,min,2←*10↑-3←, 2).ToString("0.00"); 
                T4[3][0].Value →INI400_008324= "3"; 
                T4[3][1].Value →INI400_008325= Val(w↓A,max←*ψ↓mc,max,2←*10↑-3←, 2).ToString("0.00"); 
                T4[3][2].Value →INI400_008326= Val(w↓A,min←*ψ↓mc,min,3←*10↑-3←, 2).ToString("0.00"); 
                T4[3][3].Value →INI400_008327= Val(w↓B,max←*ψ↓mc,max,3←*10↑-3←, 2).ToString("0.00"); 
                T4[3][4].Value →INI400_008328= Val(w↓B,min←*ψ↓mc,min,3←*10↑-3←, 2).ToString("0.00"); 
                T4[3][5].Value →INI400_008329= Val(w↓C,max←*ψ↓mc,max,3←*10↑-3←, 2).ToString("0.00"); 
                T4[3][6].Value →INI400_008330= Val(w↓C,min←*ψ↓mc,min,3←*10↑-3←, 2).ToString("0.00"); 
                T4[3][7].Value →INI400_008331= Val(w↓D,max←*ψ↓mc,max,3←*10↑-3←, 2).ToString("0.00"); 
                T4[3][8].Value →INI400_008332= Val(w↓D,min←*ψ↓mc,min,3←*10↑-3←, 2).ToString("0.00"); 
                T4[0].Font →INI400_008333= TableHeaderFont; 
                T4[1].Font →INI400_008334= TableCellFont; 
                T4[2].Font →INI400_008335= TableCellFont; 
                T4[3].Font →INI400_008336= TableCellFont; 
                T4[1][0].Font →INI400_008337= TableHeaderFont; 
                T4[2][0].Font →INI400_008338= TableHeaderFont; 
                T4[3][0].Font →INI400_008339= TableHeaderFont; 
                T4.Padding.All →INI400_008340= 5; 
            } 
            →INI400_008341T4.Draw(); 
            
        } 
        →INI400_008342PAGEBREAK(); 
        SWITCH(Type) { 
            CASE 0 :  { 
                →INI400_008343IMG("Monopitch_local"); 
            } 
            CASE 1 :  { 
                →INI400_008344IMG("Duopitch_local", 0.8); 
            } 
            CASE 2 :  { 
                →INI400_008345IMG("Multibay"); 
            } 
        } 
    } 
    →INI400_008346PAGEBREAK(); 
} 
IF(OverallEffect) { 
    →INI400_008347BLOCK("Overall effect") { 
        SWITCH(Type) { 
            CASE 0 :  { 
                →INI400_008348TEXT(Description("A↓net←")); 
                A↓net← →INI400_008349= b*d; 
                →INI400_008350TEXT("Overall force coefficient"); 
                c↓f,max← →INI400_008351= LinInterp(α, new PointD(STR0.Category, STR0.cf), new PointD(STR3.Category, STR3.cf)); 
                c↓f,0← →INI400_008352= LinInterp(α, new PointD(STR1.Category, STR1.cf), new PointD(STR4.Category, STR4.cf)); 
                c↓f,1← →INI400_008353= LinInterp(α, new PointD(STR2.Category, STR2.cf), new PointD(STR5.Category, STR5.cf)); 
                c↓f,min← →INI400_008354= LinInterp(ϕ, new PointD(0, c↓f,0←), new PointD(1, c↓f,1←)); 
                →INI400_008355PAGEBREAK(); 
                →INI400_008356TEXT("Design force"); 
                F↓f,max← →INI400_008357= c↓s←c↓d←*c↓f,max←*q↓p←*A↓net←; 
                F↓f,min← →INI400_008358= c↓s←c↓d←*c↓f,min←*q↓p←*A↓net←; 
                →INI400_008359TEXT(Description("d↓act←")); 
                d↓act← →INI400_008360= (d/COS(α))/4; 
                →INI400_008361TEXT("d in upper formula is horizontal width of the roof&lt;BR&gt;d↓act← is distance d/4 from the picture below"); 
                →INI400_008362PAGEBREAK(); 
                →INI400_008363TEXT("Roof must be able to support design force in defined load cases"); 
                →INI400_008364IMG("Canopy_monopitch_cases"); 
            } 
            CASE 1 :  { 
                →INI400_008365TEXT("Area of each span"); 
                A↓net,1← →INI400_008366= b*d/2; 
                A↓net,2← →INI400_008367= b*d/2; 
                →INI400_008368TEXT("Overall force coefficient"); 
                c↓f,max← →INI400_008369= LinInterp(α, new PointD(STR0.Category, STR0.cf), new PointD(STR3.Category, STR3.cf)); 
                c↓f,0← →INI400_008370= LinInterp(α, new PointD(STR1.Category, STR1.cf), new PointD(STR4.Category, STR4.cf)); 
                c↓f,1← →INI400_008371= LinInterp(α, new PointD(STR2.Category, STR2.cf), new PointD(STR5.Category, STR5.cf)); 
                c↓f,min← →INI400_008372= LinInterp(ϕ, new PointD(0, c↓f,0←), new PointD(1, c↓f,1←)); 
                →INI400_008373PAGEBREAK(); 
                →INI400_008374TEXT("Design force"); 
                F↓f,max,1← →INI400_008375= c↓s←c↓d←*c↓f,max←*q↓p←*A↓net,1←; 
                F↓f,min,1← →INI400_008376= c↓s←c↓d←*c↓f,min←*q↓p←*A↓net,1←; 
                F↓f,max,2← →INI400_008377= c↓s←c↓d←*c↓f,max←*q↓p←*A↓net,2←; 
                F↓f,min,2← →INI400_008378= c↓s←c↓d←*c↓f,min←*q↓p←*A↓net,2←; 
                →INI400_008379TEXT("Acting distance"); 
                //NA.2.31a Clause 7.3 Canopy roofs, Paragraph (6)
                object Clause7_3_6 →INI400_008380= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1991\EN_1991_1_4\Clause_7.3(6).CLC"); 
                Clause7_3_6.d →INI400_008381= double d; 
                →INI400_008382Clause7_3_6.Draw(False); 
                double d↓act← →INI400_008383= Clause7_3_6.d↓act←; 
                →INI400_008384PAGEBREAK(); 
                →INI400_008385TEXT("Roof must be able to support design force in defined load cases"); 
                →INI400_008386IMG("Canopy_duo_1"); 
                →INI400_008387PAGEBREAK(); 
                →INI400_008388IMG("Canopy_duo_2"); 
            } 
            CASE 2 :  { 
                →INI400_008389TEXT("Area of each span"); 
                A↓net,1← →INI400_008390= b*d/2; 
                A↓net,2← →INI400_008391= b*d/2; 
                →INI400_008392TEXT("Overall force coefficient"); 
                c↓f,max← →INI400_008393= LinInterp(α, new PointD(STR0.Category, STR0.cf), new PointD(STR3.Category, STR3.cf)); 
                c↓f,0← →INI400_008394= LinInterp(α, new PointD(STR1.Category, STR1.cf), new PointD(STR4.Category, STR4.cf)); 
                c↓f,1← →INI400_008395= LinInterp(α, new PointD(STR2.Category, STR2.cf), new PointD(STR5.Category, STR5.cf)); 
                c↓f,min← →INI400_008396= LinInterp(ϕ, new PointD(0, c↓f,0←), new PointD(1, c↓f,1←)); 
                →INI400_008397PAGEBREAK(); 
                →INI400_008398TEXT("Design force"); 
                F↓f,max,1← →INI400_008399= c↓s←c↓d←*c↓f,max←*q↓p←*A↓net,1←; 
                F↓f,min,1← →INI400_008400= c↓s←c↓d←*c↓f,min←*q↓p←*A↓net,1←; 
                F↓f,max,2← →INI400_008401= c↓s←c↓d←*c↓f,max←*q↓p←*A↓net,2←; 
                F↓f,min,2← →INI400_008402= c↓s←c↓d←*c↓f,min←*q↓p←*A↓net,2←; 
                →INI400_008403TEXT("Design forces in bays of multibay canopy"); 
                F↓f,max,1,1← →INI400_008404= F↓f,max,1←*ψ↓mc,max,1←; 
                →INI400_008405BLOCK { 
                    object T5 →INI400_008406= new Table(5); 
                    T5[0][0].Value →INI400_008407= TR("Bay"); 
                    T5[0][1].Value →INI400_008408= "F↓f,max,1←&lt;BR&gt;[kN]"; 
                    T5[0][2].Value →INI400_008409= "F↓f,min,1←&lt;BR&gt;[kN]"; 
                    T5[0][3].Value →INI400_008410= "F↓f,max,2←&lt;BR&gt;[kN]"; 
                    T5[0][4].Value →INI400_008411= "F↓f,min,2←&lt;BR&gt;[kN]"; 
                    T5[1][0].Value →INI400_008412= "1"; 
                    T5[1][1].Value →INI400_008413= Val(F↓f,max,1←*ψ↓mc,max,1←*10↑-3←, 2).ToString("0.0"); 
                    T5[1][2].Value →INI400_008414= Val(F↓f,min,1←*ψ↓mc,min,1←*10↑-3←, 2).ToString("0.0"); 
                    T5[1][3].Value →INI400_008415= Val(F↓f,max,2←*ψ↓mc,max,1←*10↑-3←, 2).ToString("0.0"); 
                    T5[1][4].Value →INI400_008416= Val(F↓f,min,2←*ψ↓mc,min,1←*10↑-3←, 2).ToString("0.0"); 
                    T5[2][0].Value →INI400_008417= "2"; 
                    T5[2][1].Value →INI400_008418= Val(F↓f,max,1←*ψ↓mc,max,2←*10↑-3←, 2).ToString("0.0"); 
                    T5[2][2].Value →INI400_008419= Val(F↓f,min,1←*ψ↓mc,min,2←*10↑-3←, 2).ToString("0.0"); 
                    T5[2][3].Value →INI400_008420= Val(F↓f,max,2←*ψ↓mc,max,2←*10↑-3←, 2).ToString("0.0"); 
                    T5[2][4].Value →INI400_008421= Val(F↓f,min,2←*ψ↓mc,min,2←*10↑-3←, 2).ToString("0.0"); 
                    T5[3][0].Value →INI400_008422= "3"; 
                    T5[3][1].Value →INI400_008423= Val(F↓f,max,1←*ψ↓mc,max,2←*10↑-3←, 2).ToString("0.0"); 
                    T5[3][2].Value →INI400_008424= Val(F↓f,min,1←*ψ↓mc,min,3←*10↑-3←, 2).ToString("0.0"); 
                    T5[3][3].Value →INI400_008425= Val(F↓f,max,2←*ψ↓mc,max,3←*10↑-3←, 2).ToString("0.0"); 
                    T5[3][4].Value →INI400_008426= Val(F↓f,min,2←*ψ↓mc,min,3←*10↑-3←, 2).ToString("0.0"); 
                    T5[0].Font →INI400_008427= TableHeaderFont; 
                    T5[1].Font →INI400_008428= TableCellFont; 
                    T5[2].Font →INI400_008429= TableCellFont; 
                    T5[3].Font →INI400_008430= TableCellFont; 
                    T5[1][0].Font →INI400_008431= TableHeaderFont; 
                    T5[2][0].Font →INI400_008432= TableHeaderFont; 
                    T5[3][0].Font →INI400_008433= TableHeaderFont; 
                    T5.Padding.All →INI400_008434= 5; 
                } 
                →INI400_008435T5.Draw(); 
            } 
        } 
    } 
} 
IF(Horizontal) { 
    →INI400_008436BLOCK("Horizontal force - friction effect") { 
        →INI400_008437TEXT(Description("A↓fr←")); 
        A↓fr← →INI400_008438= 2*b*d; 
        →INI400_008439TEXT(Description("c↓fr←")); 
        SWITCH(FrictionSurface) { 
            CASE 0 :  { 
                c↓fr← →INI400_008440= 0.01; 
                →INI400_008441TEXT("Smooth surface (i.e. steel, smooth concrete)"); 
            } 
            CASE 1 :  { 
                c↓fr← →INI400_008442= 0.02; 
                →INI400_008443TEXT("Rough surface (i.e. rough concrete, tar-boards)"); 
            } 
            CASE 2 :  { 
                c↓fr← →INI400_008444= 0.04; 
                →INI400_008445TEXT("Very rough surface (i.e. ripples, ribs, folds)"); 
            } 
        } 
        →INI400_008446TEXT(Description("H↓fr←")); 
        H↓fr← →INI400_008447= c↓fr←*q↓p←*A↓fr←; 
    } 
} 

//NA dependent variables:
//v↓m←, q↓p← - NA.2.3
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="264" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Wind/Wind_load.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Wind - Canopies</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Headline, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Remark, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Standard, N 10, F 30" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, AL 0, F 0" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Headline, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Standard, N 10, F 20" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 10" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Remark, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Standard, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 0" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Underline, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Check, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Standard, AL 0, F 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 20" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula B, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 300, F 5" X="300" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 250, F 5" X="250" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 200, F 5" X="200" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 100, F 5" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 150, F 5" X="150" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Standard, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
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
      <Style Key="Formula, N 250, OTL 0" X="250" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
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
      <Style Key="Formula, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula B, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula BU, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Standard, dY 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
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
      <Variable Modifier="Public" Name="A↓fr←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓fr←">
          <ENU>Reference area</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
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
      <Variable Modifier="Public" Name="A↓net,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓net,2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓net←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>Overall area</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
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
          <ENU>Width of the canopy perpendicular to wind direction</ENU>
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
      <Variable Modifier="Public" Name="c↓f,0←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓f,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓f,max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓f,min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓fr←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_c↓fr←">
          <ENU>Frictional coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,0,A←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,0,B←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,0,C←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,0,D←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,1,A←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,1,B←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,1,C←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,1,D←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,max,A←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,max,B←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,max,C←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,max,D←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,min,A←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,min,B←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,min,C←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p,net,min,D←" ESA_ID="" Type="Double" Value="0" Precision="2">
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
      <Variable Modifier="Public" Name="CatCSN" ESA_ID="" Type="Double" Value="3" Precision="2">
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
      <Variable Modifier="Public" Name="Clause7_3_6" ESA_ID="" Type="Object">
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
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>Width of the canopy parallel to the wind direction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="d↓act←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>Acting distance</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
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
      <Variable Modifier="Public" Name="F↓f,max,1,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓f,max,1←" ESA_ID="Result.09" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓f,max,2←" ESA_ID="Result.10" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓f,max←" ESA_ID="Result.11" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓f,min,1←" ESA_ID="Result.12" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓f,min,2←" ESA_ID="Result.13" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓f,min←" ESA_ID="Result.14" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="FrictionSurface" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_FrictionSurface">
          <ENU>Frictional coefficient - surface</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Height the roof from the terrain</ENU>
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
      <Variable Modifier="Public" Name="H↓fr←" ESA_ID="Result.15" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_H↓fr←">
          <ENU>Horizontal force</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="Headline" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Headline">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Horizontal" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Horizontal">
          <ENU>Calculate horizontal force</ENU>
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
      <Variable Modifier="Public" Name="L↓d←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_L↓d←">
          <ENU>Actual length of the downwind slope in the wind direction</ENU>
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
      <Variable Modifier="Public" Name="LocalEffects" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_LocalEffects">
          <ENU>Calculate local effects</ENU>
        </Description>
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
      <Variable Modifier="Public" Name="OroTerrain" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_OroTerrain">
          <ENU>Orographic terrain</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="OverallEffect" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_OverallEffect">
          <ENU>Calculate overall effect</ENU>
        </Description>
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
      <Variable Modifier="Public" Name="SeasonCatNF" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_SeasonCatNF">
          <ENU>Season zone</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Sel0" ESA_ID="" Type="String" Value="Category = '0'">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Sel1" ESA_ID="" Type="String" Value="Category = '5'">
        <Description>
          <ENU>
          </ENU>
        </Description>
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
      <Variable Modifier="Public" Name="STR0" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
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
      <Variable Modifier="Public" Name="T1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T3" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T4" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T5" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Table76" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Table76selection0" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Table76selection1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Table77" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Table77selection0" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Table77selection1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableCellFont" ESA_ID="" Type="Object">
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
      <Variable Modifier="Public" Name="Type" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Type">
          <ENU>Canopy type</ENU>
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
      <Variable Modifier="Public" Name="w↓A,max,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓A,max←" ESA_ID="Result.01" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓A,min←" ESA_ID="Result.02" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓B,max←" ESA_ID="Result.03" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓B,min←" ESA_ID="Result.04" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓C,max←" ESA_ID="Result.05" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓C,min←" ESA_ID="Result.06" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓D,max←" ESA_ID="Result.07" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓D,min←" ESA_ID="Result.08" Type="Double" Value="0" Precision="2">
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
      <Variable Modifier="Public" Name="xDis" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_xDis">
          <ENU>Site distance from the other building</ENU>
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
      <Variable Modifier="Public" Name="α" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_α">
          <ENU>Canopy roof angle</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="δ" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_δ">
          <ENU>Damping</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ϕ">
          <ENU>Blockage</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ψ↓mc,max,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ψ↓mc,max,2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ψ↓mc,max,3←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ψ↓mc,min,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ψ↓mc,min,2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ψ↓mc,min,3←" ESA_ID="" Type="Double" Value="0" Precision="2">
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
      <VC ID="INI400_006612">
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
      <VC ID="INI400_007870">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007871">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007872">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007873">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007874">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007875">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007876">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007877">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007878">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007879">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007880">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007881">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007882">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007883">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007884">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007885">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007886">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007887">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007888">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007889">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007890">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007891">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007892">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007893">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007894">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007895">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007896">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007897">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007898">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007899">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007900">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007901">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007902">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007903">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007904">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007905">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007906">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007907">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007908">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007909">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007910">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007911">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007912">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007913">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007914">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007915">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
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
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007918">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007919">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007920">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007921">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007922">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007923">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007924">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007925">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007926">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007927">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007928">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007929">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007930">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007931">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007932">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007933">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007934">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007935">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007936">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007937">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007938">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007939">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007940">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007941">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007942">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007943">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007944">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007945">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007946">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007947">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007948">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007949">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007950">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007951">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007952">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007953">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007954">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007955">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, F 5, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, F 5, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, F 5, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007956">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="14" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14.3|1|2" Font2="Tahoma|14.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="14" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14.3|1|2" Font2="Tahoma|14.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="14" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14.3|1|2" Font2="Tahoma|14.3|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007957">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007958">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007959">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007960">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007961">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="54" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="54" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="54" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007962">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007963">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007964">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007965">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="90" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="90" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="90" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007966">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007967">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007968">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 450, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007969">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007970">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007971">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007972">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007973">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007974">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007976">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007978">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="62.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="62.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="62.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007980">
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007982">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007984">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="121" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="121" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="121" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007986">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="141" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="141" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="141" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007988">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="160" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="160" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="160" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007990">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="180" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="180" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="180" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007992">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="199" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="199" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="199" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007994">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="219" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="219" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="219" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007996">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007998">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008000">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008002">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008004">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="258" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="258" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="258" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008006">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008008">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="297" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="297" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="297" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008010">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="317" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="317" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="317" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008012">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="337" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="337" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="337" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008014">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="356" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="356" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="356" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008016">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="376" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="376" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="376" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008018">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008020">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008022">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008024">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008026">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008028">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008030">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008032">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008034">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008036">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008038">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008040">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008042">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008044">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008046">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008048">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008050">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1315" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008051">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008052">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008053">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008054">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008055">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008056">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008057">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008058">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008059">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008060">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008062">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1334" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1334" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1334" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008063">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008064">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008065">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008066">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008067">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008068">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="966" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="966" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="966" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008069">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008070">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008071">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1027" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1027" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1027" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008072">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1046" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1046" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1046" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008073">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1085" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1085" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1085" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008074">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008075">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008076">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008077">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008078">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008079">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008080">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008081">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008082">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008083">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008084">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008085">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008086">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008087">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008088">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008089">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008091">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008093">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008095">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008097">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008098">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008100">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008101">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008102">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008103">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008104">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008105">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008106">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008107">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008108">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008109">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008110">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008111">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008112">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008113">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008114">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008115">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008116">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008117">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008118">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008119">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008120">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008121">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008122">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008123">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008124">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008125">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008126">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008127">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008128">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008129">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008130">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008131">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008132">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008133">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008134">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008135">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008136">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008137">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008138">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008139">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008140">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008141">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008142">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008144">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008145">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008146">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008147">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008148">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008149">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008150">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008151">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008153">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008154">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008155">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008156">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008157">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008158">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008159">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008160">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008162">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008163">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008164">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008165">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008166">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008167">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008168">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark B, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark B, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark B, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008169">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark B, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark B, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark B, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008170">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008171">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008172">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008173">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 400, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008174">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008175">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 400, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008176">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008177">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 400, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008178">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008179">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008180">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008181">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008182">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008183">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008184">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008185">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008186">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008187">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008188">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008189">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008190">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008191">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008192">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008193">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008194">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008195">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008196">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008197">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008198">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008199">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008200">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008201">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008202">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008203">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008204">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008205">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008206">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008207">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008208">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008209">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008210">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008211">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 400, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008212">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008213">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008214">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008215">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 400, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008216">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008217">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008218">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008219">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 400, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008220">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008221">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008222">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008223">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 400, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008224">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008225">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008226">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008227">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008228">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008229">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008230">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008231">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008232">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008233">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008234">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008235">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008236">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008237">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008238">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008239">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008240">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008241">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008242">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008243">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008244">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008245">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008246">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008247">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008248">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008249">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008250">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008251">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008252">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008253">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008254">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008255">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008256">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008257">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008258">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008259">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008260">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008261">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008262">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008263">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008264">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008265">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008266">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008267">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008268">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008269">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008270">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008271">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008272">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008273">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008274">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008275">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008276">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008277">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008278">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008279">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008280">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008281">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008282">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008283">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008284">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008285">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008286">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008287">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008288">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008289">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008290">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008291">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008292">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008293">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008294">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008295">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008296">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008297">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008298">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008299">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008300">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008301">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008302">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008303">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008304">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008305">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008306">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008307">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008308">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008309">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008310">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008311">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008312">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008313">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008314">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008315">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008316">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008317">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008318">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008319">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008320">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008321">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008322">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008323">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008324">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008325">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008326">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008327">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008328">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008329">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008330">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008331">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008332">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008333">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008334">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008335">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008336">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008337">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008338">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008339">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008340">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008341">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008342">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="270" Y="147" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="270" Y="147" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="270" Y="147" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008343">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="172" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="172" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="172" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008344">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008345">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008346">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="441" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="441" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="441" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008347">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008348">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008349">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008350">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008351">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008352">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008353">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008354">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 400, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008355">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008356">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008357">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008358">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008359">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 30" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 30" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 30" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008360">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008361">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008362">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008363">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008364">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="172" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="172" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="172" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008365">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008366">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008367">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008368">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008369">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008370">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008371">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008372">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 400, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008373">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008374">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008375">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008376">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008377">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008378">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008379">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008380">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008381">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008382">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="0" Hor="0" Ver="1" SpX="0" SpY="-10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008383">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008384">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008385">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008386">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="300" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="300" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="300" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008387">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008388">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="300" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="300" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="300" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008389">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008390">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008391">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008392">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008393">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008394">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008395">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008396">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 400, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008397">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008398">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008399">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008400">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008401">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008402">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 450, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008403">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008404">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008405">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008406">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008407">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008408">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008409">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008410">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008411">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008412">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008413">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008414">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008415">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008416">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008417">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008418">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008419">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008420">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008421">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008422">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008423">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008424">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008425">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008426">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008427">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008428">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008429">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008430">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008431">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008432">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008433">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008434">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008435">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008436">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008437">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008438">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008439">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008440">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008441">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008442">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008443">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008444">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008445">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008446">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|0|2" Font2="Tahoma|15.6|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008447">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="Duopitch_local" Content="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" />
      <Image Name="Monopitch_local" Content="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" />
      <Image Name="Multibay" Content="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" />
      <Image Name="Canopy_monopitch_cases" Content="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VO2+++7psfU5dt1112SN9tp4W5U1xEGNSy+9tDryyCNDHARBwyAK1l133TSrC4JW3n///eqll15Ky2MTAossskgSCAsvvHA177zzpgW0nn/++eq3v/1tsjDY9+WXX0733Xr84osvTtisa5E3boq8eexz8iZ7Jr/mvlTb/Jpqnp7zee77jeOJEAc1Lr/88uqoo44KcRAEDUOsAR9yxBwEw/HXv/41DfhiDNZaa620mub8888fMQeTQIiDGvxDhx9+eIiDIGgYos1XX3315OcNgna8++67abYuW4EF4bLLLht3Pv+xJsRBDRUSxRx0a834IAjKEODFchDiIChFXQNLb3MFvPrqq1HnYISEOKihzkGIgyBoHqLAV1lllQhIDCaJEAYjJ8RBjbPPPjsVQQpxEATNgluB5SDEQRB0hxAHNc4444yU2hLiIAiaRYiDIOguIQ5qnHPOOdURRxzRiGVhgyD4F1kcRPXSIOgOIQ5qXHHFFdVxxx0X4iAIGkaIgyDoLiEOauiATjnllOqZZ54ZeCYIgiZw7733VmussUakGQdBlwhxUOPOO+9MNbhDHARBs9A211lnnWibQdAlQhzUuOuuu6rTTjstOqAgaBgqI6qRH26FIOgOIQ5qqMstnVFlrSAImsMPf/jDFHMQmURB0B1CHNS44447UjpjiIMgaBYPP/xwWmEvLAdB0B1CHHzAn/70p+oPf/hDdc0111QnnXRS9dBDD6XVu6IWdxCMLZbitd19993JcqBtvvbaa9Xbb79d/eMf/xjYKwiC0SbEwQcom2ytb+vFr7feetW3vvWttO53LA8bBGOL9fO33XbbaquttkrL8CqhvNxyy1UXXHBBEvVBEHSGEAcfcNFFF1UrrbRSNeecc6YlPmebbbbqm9/8ZizyEgRjjAWXFl988dQmp5pqqmquueaqvv71r6cYBMvzBkHQGUIcfMDvf//7at99902dztxzz10ttdRS1VVXXZVMl0EQjC177713Nc888ySBMNNMM6VKpmE1CILOEuJgAKu+KbIyxxxzVPvtt1/1wgsvDLwSBMFY8rOf/SxZD6aZZprk9vvNb34z8EoQBJ0ixMEAr7/+enXwwQenQitMme+9997AK0EQjDWnn356sh5cd911ESgcBF0gxEEN5ZPVOXj++efTYwLh/fffT/f5N60Jnm/rz9Xvtz737rvvTnhcyiuvvFI9++yz1XPPPTfs5ncOt7F+DLf9+te/nuj24osvDruZvQ23vfTSS8NuL7/88rCbbJGJbY7PcNurr7467Pa73/1u2I2babhNtPzENlkvw21E6HBbjs6f2Pbmm28Ou7311lvJ5D7Sa67baBd+78T+k/9R36x3cuCBB6Y4oNZz0Hp868crP/YZ+faPf/zjhFub42X785//POg+t6KNGHnnnXfSfbce1zf/xaa/sGn39e1vf/vbhE1/YnN+8ibrYqSZF/VsDb+p9X79Vnt99NFHq5/85CcT3R555JGizeeUbD/96U+LNlahku2xxx5ruymUVbIJNC/ZXGslm5VCbTfeeGOyQNu4pQXNXnjhhemxuDa35557bkrLzeNKk+lpceCikpp40EEHTdiOOuqo6vjjj08LLH3ve9+rjjnmmOroo49Oz++xxx7V5ptvXu2www7V7rvvXu26667pds8990zb/vvvX+21117pvudlNHi8zz77pFu+Ube+RwzDbrvtlj4z7+s50dcHHHBAcl34PB2e7/c7Dj300GS9EJ29xRZbVJttttmE20033bTacsstq2222abaaaed0m+039Zbb52e93i77bartt9++2rHHXdMGRdes8/OO+88aPN7fIb79nXrsfe777Nkb+T/5D+49dvd2vwfWz5G7vtPjkXex//Nn5Hf63XP+++Og//vfTaPvea+5x0LzzmeltI+7LDD0nNe8/i73/1uet19x86tVTWdS8fT/s6x2yOPPDJtHrv1nH3zubfl97o+TjzxxOrkk09O109+zn2b522+Q0XNs846K21nnnlmKr/tVr0Mr3nsNbcee00HkTdi1Ov5sfuyZ/J977HPeeedlzqb888/P93X2Xh88cUXT7j1mn2l5Bpgm4wO0jF1HmzOn/Pi3Nryczb3tddlllmmWn755VPGgk3FRJkLNvdtnmf9k/bo8ZJLLpnqI3hu6aWXrtZaa61qzTXXnPB+W9533XXXTfFGXBjeYx+ByjIluBx91mKLLZZe87z9Fl100bT5XZ73uvu2FVZYIb3m++zv/sILL5x+r99h32WXXTY9to/93beP/+o5GRoLLbRQ2uybP1ts1Cc+8YlqiimmqD73uc9V//M//1N9/OMfr7761a9Wn/zkJ9PtDDPMUH3qU5+qvvCFL1Rf/OIX0/728dyHPvShdH/66aevppxy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IAiCQYQ4CIIgCIJgECEOgiAIgiAYRIiDIAiCIAgGEeIg+Ddee+216oc//GH1pz/9aeCZIAiCoJ8IcRAMgiA49dRTqzXWWKN67rnnBp4NgiAI+okQB8EE3n777erCCy+sllpqqWq66aZL1oO//e1vA68GQRAE/UKIgyDxyiuvVOeee2619NJLV3PMMUc177zzVmeffXb1xz/+cWCPIAiCoF8IcRAk68D5559fLb/88tU888xTzT777NX8889fbbfddkk0BCPHcXv88cerJ554ovr9739f/f3vfx94JQiCXuYf//hH9bvf/a763ve+V2255ZbVnnvuWV177bUDr44fQhwE1V//+tfquuuuS7EGG264YbXSSitVK664YrX44otH3MEk8NJLL1VHH310Elc2ncSzzz5bvf/++wN7BEHQq7z33nvV7rvvXm288cbV97///er444+vvva1r1WXXXbZwB7jgxAHwQTyRX3AAQdUl1xySfXd7343KeBgMI7Tz372s3TbCgFw2GGHVeutt1518sknJ8FFZO2///7hogmCHkAbv+aaa6odd9xx4Jl/wUIoVmv66aev7rjjjuqtt96qfvvb31Z77LFHtfLKKw/sNT4IcVDDDPqNN94YkyC8d955pxGmZxaDK6+8Mv0eF3avzHb9n8cee6y6++67q3vvvbf69a9/PeL/9uc//7n66U9/mo7PN77xjeQuaMVziyyySHXWWWel78QVV1xRzTnnnMkKw+QYTBp/+MMfxuT4uU7+8pe/pP4hzt/4RN9qsF533XWr+eabr1prrbWq2267beDV9jjv+gwWwSWWWKJabbXVqqOOOmrg1X/hGjnuuOOqaaaZJl0zMJ5cddVV1dRTT129+eab6bnxQIiDGg899FB1+umnj4mfnRJ1sTFDuYgNJAaXbnZGTz31VBrYHIdeEQWQnimmYpdddkk+wHXWWSdZSF588cW2gox14NVXX03HhBVgs802SwLKTGCohv7II49UM888c7Is5M9+9913U8dwww03pM4jGDmsLuuvv/6YCATndOedd04Bur/61a+SSNTxayNNEPTB8DhHt99+e7XKKqtUhx9+eDLvb7311tViiy1WvfzyywN7DY33mhBsv/32af9NN920Ouecc9Jz6sG0oq3vtNNO1cILLzzwzD+FBVfjpz/96RSHNF4IcVBj3333rVZfffXqRz/6Udc7cYJgn332qb75zW+mgccgduihhybFaaBx0XUavjHmcINmL3HXXXel7ItjjjkmdRJm9Z/5zGeqiy66aIK6nxisDGIGCIrllluuOvLII6v7779/SJcCvPaVr3wldQZ1ZpppptQxGViCkaMtOIZnnHFG19um9nDggQem+JEvfelLKWiXSGQRevjhhydYFUIoNBPnZquttkqTA5Zhk67f/OY3qa994YUXBvYaGueWpWDJJZdME4Tnn38+TTYmdq7t7zrZZpttBp75J6ywn/vc55LQHC+EOBiAX2jNNddMJie+9qFMxp2GimX2vummm1JntNtuuyW/louYqeqUU05Jg484gE7M7F3Qu+66a8/FGbASCLSsn1OdO3GQTf8TQ6cy44wzJjeCWWO7AYDIYyVonZH4jBAHk4b6G9ol1wy/LevBWKGfYAEyAMw222xJLBCOe+21V+r4DQ6EvOskXBBjj3OgP5t22mnTJCHjeRbidkLTudQvLrvsssl6cM899wxbOdb+rgUTvDrEwZRTTpmss+OFEAcDmJEo/sOsLlrfjHFis8NuoJOhUg02hMF3vvOdaoMNNkgDHbPVsccem1wQP/7xj9NANLliwcBJHat10EsDGHM0E5+BuR4QmNW/c/yLX/wimQmHikPgY1x11VXTrIPL6b777ktWgYmJBO4hM1yDSB0dA6uDgS4YGVxCs846a7XoootWU001VXXCCSd03XowMQiCM888s1pggQWSxci19vWvfz0FpT399NPp+uJzDrEwNjju+tBPfvKT1euvvz7w7L/Q3ok9FWGJPOeyjnOmf/3JT36SJggEKmFoYtHaxkEc7LfffumzMn6DeKevfvWr6ZoYL4Q4+ICf//znyR9ldrLQQgulhn7QQQc1ZgatczEgUa3cDIccckhygVCn3/72t5PJ1SB2wQUXpH2YykYar3Drrbem/66z64RVYqyg1A3WOog8oIghyNYXomCHHXZIDd7xa7UkEBRqFRCPm2yySbJAHHzwwdWNN96YXms9xlxSX/7yl9N7soAgCAxqfJVEX1COY7fMMsukQVdxLgMvM6/z17TB1rV29dVXJ3+264QZ2e824xSv8Mwzz6Rr0HUXYqE7ONba6ic+8YkJ7dFz6g5wMRrMDfr6PllGJltD4T3iwH7wgx+k+BOBjSZTreirZXp9/vOfH3jmn24N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0SAIJh1lzE8++eRU32DeeeetZp999mraaaetvvjFLyahEARB5whx8AHPPfdcqr4255xzpvrtzJf8m5aJDYJg7GAhWHrppavpp58+BQsvsMACabv//vsH9giCoBOEOBjgO9/5TpqVSJdSbOXyyy8Pq0EQjDEyh7j5Zp555hQPtMwyy1TbbLPNwKtBEHSKEAcD/OIXv0izE7MSVoO33npr4JUgCMYKMT/PP/98teKKK1Zf+cpXkovh7rvvHng1CIJOEeJggL/97W/VHnvsUc0xxxzVxRdfHIGIQdAQ/vjHP1ZHHXVUWvfk4IMPHng2CIJOEuKgxrPPPpsCEX/yk59UL7zwwoTt17/+ddH24osvFm2irdttL730UtH28ssvF21q05dsUsZKNnnn7Tb+4pJNbEfJ9tprrxVtf/jDH4q2119/ve32xhtvFG2i6ks2Fql2m8Hwz3/+c7ptt/3pT38atOXvabpL7P333x/0f+v/Z6j/JVthlVVWSW0znzu39XOQz5f/79Zn5+ORPz9/X+vn2xzz1k1QpM1ibDal1fNt3rg+6ptU6L/+9a8TbvNmApI3/z9vzlV9MzHJWxCMFT0tDnQCu+++e7XrrrtWW221Vbo94IADqgMPPLA66KCDqn333TdZC8xGbPvtt18yX37rW9+qtt5665S94PWdd9652nLLLattt922+uY3v5lut9tuu2qXXXZJn7vFFluk9+y2227V3nvvnW533HHHap999knf770+x3Pea/OZNt9p22uvvdJ7xT649V6fYzvyyCOrb3/72+m3uz300EPTb7cddthh6b/4DPePP/749F8OP/zw9N1HH310tf3221dHHHFEev93v/vd9Hl5816zMu895phj0u1xxx2Xvv+QQw5J7/OZbm0nnHBCev3YY4+tTjzxxLR5v8d+u+/93ve+l6LMTzvttPT93u999W3//fef8Blet6/PPemkkya8136nn356dcopp6Tn/H7fdeqpp07Y7Gfz+llnnZX2P/fcc9Nj7/cdZ5xxRtrOPPPMtJ1//vlpn+9///vpPTaP/Rafec4551QXXnhh2uxz3nnnpYyWiy66KFmVLrvssnTfZ9pHfErrZv8rrrgibVdeeWV11VVXpc/xPe7/4Ac/SNu1116btuuvv37CfT72m2++ecJ7vN++N9xww4T32d8++faWW25J9/0Xv8kg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" />
      <Image Name="Canopy_duo_1" Content="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" />
      <Image Name="Canopy_duo_2" Content="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" />
      <Image Name="BG" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="630">
      <TPanel Name="" ID="130" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts TranslateID="DIALOG_000130">
          <ENU>Design settings</ENU>
        </Texts>
        <TGroupBox Name="TerrainPar" ID="118" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="30" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000118">
            <ENU>Terrain parameters</ENU>
          </Texts>
          <TComboBox Name="TerrainNEN" ID="105" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="TerrainNEN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="1">
            <Texts>
              <ENU>0|II|III</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="TerrainONORM" ID="102" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="TerrainONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="1">
            <Texts>
              <ENU>II|III|IV</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="H" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="H" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1000" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="Ld" ID="37" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="L↓d←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10000" MinValueWithDim="0" DescPos="1" />
          <TComboBox Name="OroTerrain" ID="101" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="OroTerrain" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="190" Values="0|1" Index="1">
            <Texts TranslateID="DIALOG_000101">
              <ENU>Cliffs and escarpments|Hills and ridges</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="Lu" ID="38" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="L↓u←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10000" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="x" ID="39" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="x" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1000" MinValueWithDim="-1000" DescPos="1" />
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
          <TComboBox Name="TerrainDINdyn" ID="116" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="TerrainDINdyn" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2|3|4|5" Index="4">
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
          <TComboBox Name="Terrain" ID="42" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Terrain" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="2">
            <Texts>
              <ENU>0|I|II|III|IV</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
        <TGroupBox Name="WindPar" ID="33" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000033">
            <ENU>Wind parameters</ENU>
          </Texts>
          <TDoubleInput Name="v_b_map" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="v↓b,map←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="35" MinValueWithDim="23" DescPos="1" />
          <TDoubleInput Name="Dir" ID="52" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Dir" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="360" MinValueWithDim="0" DescPos="1" />
          <TCheckBox Name="AccurateInformation" ID="103" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="AccurateInformation" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000103">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TComboBox Name="TerrainBS" ID="87" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="TerrainBS" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2" Index="2">
            <Texts TranslateID="DIALOG_000087">
              <ENU>Sea|Country terrain|Town terrain</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="DisShore" ID="92" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="DisShore" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="xDis" ID="90" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="xDis" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1000" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="DisTown" ID="93" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="DisTown" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="cr_diag" ID="94" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c↓r,diag←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="2" MinValueWithDim="700e-3" DescPos="1" />
          <TDoubleInput Name="cr_T" ID="95" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c↓r,T←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1" MinValueWithDim="500e-3" DescPos="1" />
          <TDoubleInput Name="Ivz_flat" ID="110" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="I↓v(z)flat←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="220e-3" MinValueWithDim="70e-3" DescPos="1" />
          <TDoubleInput Name="k_IT" ID="111" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="k↓I,T←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="2" MinValueWithDim="1" DescPos="1" />
          <TDoubleInput Name="c_e_diag" ID="112" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c↓e,diag←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="4.3" MinValueWithDim="1.4" DescPos="1" />
          <TDoubleInput Name="c_e_T" ID="113" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c↓e,T←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1" MinValueWithDim="620e-3" DescPos="1" />
          <TComboBox Name="CatNEN" ID="15" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatNEN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="1">
            <Texts>
              <ENU>I|II|III</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="CatSFS" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatSFS" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="420" Values="0|1|2|3" Index="2">
            <Texts TranslateID="DIALOG_000019">
              <ENU>Mainland in the entire country|Sea areas: open sea, scattered islands out in the open sea|In Lappland: at the top of mountains|In Lappland: at the bottom of mountains</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Muni3ONORM" ID="26" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Municipality3ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45" Index="0">
            <Texts>
              <ENU>Amstetten|Bad Vöslau|Baden bei Wien|Deutsch-Wagram|Fischamend|Gänserndorf|Gmünd in Niederösterreich|Gross-Enzersdorf|Gumpoldskirchen|Hainburg|Hollabrunn|Horn|Klosterneuburg|Korneuburg|Krems an der Donau|Langenlois|Lilienfeld|Marchegg|Melk an der Donau|Mistelbach|Mödling|Mönichkirchen|Neunkirchen|Perchtoldsdorf|Pottenstein|Poysdorf|Puchberg am Schneeberg|Purkersdorf|Reichenau an der Rax|Retz|Scheibbs|Schwechat|Semmering|Sollenau|St.Pölten|Stockerau|Ternitz|Traiskirchen|Tulln|Waidhofen an der Thaya|Waidhofen an der Ybbs|Wilhelmsburg|Wolkersdorf|Wr. Neustadt|Zistersdorf|Zwettl</ENU>
            </Texts>
          </TComboBox>
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
          <TCheckBox Name="Separate_cscd" ID="117" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Separate_c↓s←c↓d←" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000117">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TComboBox Name="StateONORM" ID="22" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="StateONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8" Index="3">
            <Texts TranslateID="DIALOG_000022">
              <ENU>Wien|Burgenland|Kärnten|Niederösterreich|Oberösterreich|Salzburg|Steiermark|Tirol|Vorarlberg</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="CatDIN" ID="21" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatDIN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3" Index="2">
            <Texts>
              <ENU>WZ1|WZ2|WZ3|WZ4</ENU>
            </Texts>
          </TComboBox>
          <TCheckBox Name="CHMI" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CHMI" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000015">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TComboBox Name="CatCSN" ID="17" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="CatCSN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="3">
            <Texts>
              <ENU>I|II|III|IV|V</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
        <TGroupBox Name="" ID="18" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000018">
            <ENU>Parameters of the roof</ENU>
          </Texts>
          <TComboBox Name="FrictionSurface" ID="125" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="FrictionSurface" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="1">
            <Texts TranslateID="DIALOG_000125">
              <ENU>Smooth|Rough|Very rough</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="TDoubleInput" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="α" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="30" MinValueWithDim="-20" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ϕ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="" ID="124" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="100" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="d" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="7" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="b" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="ConstructionPar" ID="119" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000119">
            <ENU>Construction parameters</ENU>
          </Texts>
          <TComboBox Name="Length" ID="58" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Length" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="320" Values="0|1|2|3" Index="1">
            <Texts TranslateID="DIALOG_000058">
              <ENU>One month|Two months|Four months|Half year</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Month1" ID="60" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Month1" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="320" Values="0|1|2|3|4|5|6|7|8|9|10|11" Index="3">
            <Texts TranslateID="DIALOG_000060">
              <ENU>January, February|February, March|March, April|April, May|May, June|June, July|July, August|August, September|September, October|October, November|November, December|December, January</ENU>
            </Texts>
          </TComboBox>
          <TCheckBox Name="SpecialStructure" ID="106" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="SpecialStructure" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000106">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TDoubleInput Name="T" ID="107" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="T" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="373" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="h_ave" ID="104" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h↓ave←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="100" MinValueWithDim="0" DescPos="1" />
          <TComboBox Name="MonthNF" ID="64" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="MonthNF" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="175" Values="0|1" Index="0">
            <Texts TranslateID="DIALOG_000064">
              <ENU>April to September|October to March</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="Deflection" ID="122" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="28" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Def" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="Damping" ID="120" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="δ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1" MinValueWithDim="0" DescPos="1" />
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
          <TDoubleInput Name="A" ID="44" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="3000" MinValueWithDim="0" DescPos="1" />
          <TCheckBox Name="Coast" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Coast" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000047">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="Temporary" ID="99" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Temporary" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000099">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="134" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="31" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000134">
            <ENU>Calculation settings</ENU>
          </Texts>
          <TCheckBox Name="" ID="128" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Horizontal" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000128">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="" ID="127" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="OverallEffect" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000127">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="" ID="126" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="LocalEffects" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000126">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="" ID="123" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="NeglectDynamic" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000123">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TComboBox Name="TComboBox" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Type" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="0">
            <Texts TranslateID="DIALOG_000002">
              <ENU>Monopitch|Duopitch|Multibay</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
      </TPanel>
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts>
          <ENU>General settings</ENU>
        </Texts>
        <TGroupBox Name="" ID="132" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="31" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000132">
            <ENU>Layout blocks</ENU>
          </Texts>
          <TCheckBox Name="" ID="115" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintPressureCalc" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000115">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="129" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="31" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000129">
            <ENU>Headline settings</ENU>
          </Texts>
          <TStringInput Name="TStringInput" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000001">
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
        <TGroupBox Name="" ID="32" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000032">
            <ENU>National Annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Standard EN">
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
                  <P>Standard EN</P>
                  <P>STD</P>
                  <P>0</P>
                  <P>EC EN 1990</P>
                  <P>EC EN 1991-1-1</P>
                  <P>EC EN 1991-1-2</P>
                  <P>EC EN 1991-1-3</P>
                  <P>0</P>
                  <P>NaN</P>
                  <P>True;2;</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1.0</P>
                  <P>NaN</P>
                  <P>True</P>
                  <P>1.6</P>
                  <P>2.0</P>
                  <P>NaN</P>
                  <P>0.8;4;5;15;</P>
                  <P>True</P>
                  <P>True</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>EC EN 1991-1-4</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1</P>
                  <P>1</P>
                  <P>0.2;0.5;</P>
                  <P>False</P>
                  <P>NaN</P>
                  <P>True;1;</P>
                  <P>True</P>
                  <P>True</P>
                  <P>1</P>
                  <P>NaN</P>
                  <P>1.25</P>
                  <P>False</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>EC EN 1991-1-5</P>
                  <P>EC EN 1991-1-6</P>
                  <P>EC EN 1991-1-7</P>
                  <P>EC EN 1991-2</P>
                  <P>EC EN 1991-3</P>
                  <P>EC EN 1991-4</P>
                  <P>EC EN 1992-1-1</P>
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
                  <P>1;5;</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>32</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>0.15</P>
                  <P>0.25</P>
                  <P>0.5</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>8</P>
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
                  <P>EC EN 1992-1-2</P>
                  <P>EC EN 1992-2</P>
                  <P>EC EN 1992-3</P>
                  <P>EC EN 1993-1-1</P>
                  <P>NaN;NaN;</P>
                  <P>1;1;1.25;</P>
                  <P>EC EN 1993-1-2</P>
                  <P>EC EN 1993-1-3</P>
                  <P>EC EN 1993-1-4</P>
                  <P>EC EN 1993-1-5</P>
                  <P>1.20;1.00;</P>
                  <P>EC EN 1993-1-6</P>
                  <P>EC EN 1993-1-7</P>
                  <P>EC EN 1993-1-8</P>
                  <P>1.25;1.25;1.1;1.0;1.0;1.0;1.1;</P>
                  <P>EC EN 1993-1-9</P>
                  <P>EC EN 1993-1-10</P>
                  <P>EC EN 1993-1-11</P>
                  <P>EC EN 1993-1-12</P>
                  <P>EC EN 1993-2</P>
                  <P>1.0;1.1;1.25;1.25;1.1;1.1;1.1;1.0;1.1;</P>
                  <P>EC EN 1993-3-1</P>
                  <P>EC EN 1993-3-2</P>
                  <P>EC EN 1993-4-1</P>
                  <P>EC EN 1993-4-2</P>
                  <P>EC EN 1993-4-3</P>
                  <P>EC EN 1993-5</P>
                  <P>EC EN 1993-6</P>
                  <P>EC EN 1994-1-1</P>
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
                  <P>EC EN 1994-1-2</P>
                  <P>EC EN 1994-2</P>
                  <P>EC EN 1995-1-1</P>
                  <P>NaN</P>
                  <P>0.67;0.67;1.0;</P>
                  <P>EC EN 1995-1-2</P>
                  <P>EC EN 1995-2</P>
                  <P>EC EN 1996-1-1</P>
                  <P>NaN</P>
                  <P>1</P>
                  <P>NaN</P>
                  <P>True</P>
                  <P>1000</P>
                  <P>NaN;NaN;NaN;</P>
                  <P>NaN</P>
                  <P>EC EN 1996-1-2</P>
                  <P>EC EN 1996-2</P>
                  <P>EC EN 1996-3</P>
                  <P>EC EN 1997-1</P>
                  <P>1.1;0.9;1.5;0;</P>
                  <P>1.25;1.25;1.4;1.4;1.0;</P>
                  <P>1.35;1;1.5;0;1;1;1.3;0;</P>
                  <P>1;1;1;1;1;1.25;1.25;1.4;1.4;1;</P>
                  <P>1;1;1.4;1.1;1;1;</P>
                  <P>EC EN 1997-2</P>
                  <P>EC EN 1998-1</P>
                  <P>EC EN 1998-2</P>
                  <P>EC EN 1998-3</P>
                  <P>EC EN 1998-4</P>
                  <P>EC EN 1998-5</P>
                  <P>EC EN 1998-6</P>
                  <P>EC EN 1999-1-1</P>
                  <P>EC EN 1999-1-2</P>
                  <P>EC EN 1999-1-3</P>
                  <P>EC EN 1999-1-4</P>
                  <P>EC EN 1999-1-5</P>
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
    <Item TranslateID="BLOCK_INI400_007960">
      <ENU>"Dimensions of construction:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_008086">
      <ENU>"Parameters of the wind load:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_008171">
      <ENU>"Multibay reduction factors"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_008206">
      <ENU>"Local effects"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_008347">
      <ENU>"Overall effect"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_008436">
      <ENU>"Horizontal force - friction effect"</ENU>
    </Item>
    <Item TranslateID="STRING_3B639F5A">
      <ENU>"Third and subsequent bays"</ENU>
    </Item>
    <Item TranslateID="STRING_48FB38CA">
      <ENU>"Second bay"</ENU>
    </Item>
    <Item TranslateID="STRING_5EDA7A1B">
      <ENU>"Location"</ENU>
    </Item>
    <Item TranslateID="STRING_775F043A">
      <ENU>"End bay"</ENU>
    </Item>
    <Item TranslateID="STRING_7816D75C">
      <ENU>"Bay"</ENU>
    </Item>
    <Item TranslateID="STRING_8ED8CB1E">
      <ENU>"Third and subsequent bays"</ENU>
    </Item>
    <Item TranslateID="STRING_9D7F0776">
      <ENU>"Bay"</ENU>
    </Item>
    <Item TranslateID="STRING_A5243160">
      <ENU>"Region"</ENU>
    </Item>
    <Item TranslateID="STRING_AF36707D">
      <ENU>"Location"</ENU>
    </Item>
    <Item TranslateID="STRING_BC94C982">
      <ENU>"Region"</ENU>
    </Item>
    <Item TranslateID="STRING_C83E74F4">
      <ENU>"End bay"</ENU>
    </Item>
    <Item TranslateID="STRING_E8119DE8">
      <ENU>"Second bay"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007954">
      <ENU>"Wind load on the canopies according to Eurocode 1"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007955">
      <ENU>IO.SetupNA.EC_1991_1_4.Name</ENU>
    </Item>
    <Item ID="TEXT_INI400_007956">
      <ENU>Caption</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007959">
      <ENU>"A canopy roof is defined as the roof of a structure that does not have permanent walls,&lt;BR&gt;such as petrol stations, dutch barns, etc."</ENU>
    </Item>
    <Item ID="TEXT_INI400_007961">
      <ENU>Description("d")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007962">
      <ENU>"d = " &amp; d &amp; "m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007963">
      <ENU>Description("b")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007964">
      <ENU>"b = " &amp; b &amp; "m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007965">
      <ENU>Description("ϕ")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007966">
      <ENU>"ϕ = " &amp; ϕ &amp; " "</ENU>
    </Item>
    <Item ID="TEXT_INI400_007967">
      <ENU>Description("α")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007968">
      <ENU>"α = " &amp; α &amp; "°"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007969">
      <ENU>Description("Type")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007970">
      <ENU>"Monopitch"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007971">
      <ENU>"Duopitch"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007972">
      <ENU>"Multibay duopitch"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008097">
      <ENU>"Wind peak velocity pressure on the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008102">
      <ENU>"Dynamics effects of the wind are neglected, therefore Structural factor c↓s←c↓d← = 1.0"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008104">
      <ENU>"Dynamics effects of the wind are considered"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008168">
      <ENU>"Incorrect canopy slope. Monopitch canopy slope have to be between 0 ° and 30 °"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008169">
      <ENU>"Incorrect canopy slope. Duopitch canopy slope can't be between -5 ° and 5 °"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008207">
      <ENU>"Net Pressure coefficients"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008224">
      <ENU>"Net pressure coefficients are calculated by two linear interpolations in table 7.6 or 7.7&lt;BR&gt;from the Code. First interpolation is for roof angle, second is for blockage."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008225">
      <ENU>"Calculated local wind pressure should be used in the design of roofing elements and fixings."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008255">
      <ENU>"Local wind pressure"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008293">
      <ENU>"Local wind pressure in bays of multibay canopy"</ENU>
    </Item>
    <Item ID="TEXT_INI400_008348">
      <ENU>Description("A↓net←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008350">
      <ENU>"Overall force coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008356">
      <ENU>"Design force"</ENU>
    </Item>
    <Item ID="TEXT_INI400_008359">
      <ENU>Description("d↓act←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008361">
      <ENU>"d in upper formula is horizontal width of the roof&lt;BR&gt;d↓act← is distance d/4 from the picture below"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008363">
      <ENU>"Roof must be able to support design force in defined load cases"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008365">
      <ENU>"Area of each span"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008368">
      <ENU>"Overall force coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008374">
      <ENU>"Design force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008379">
      <ENU>"Acting distance"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008385">
      <ENU>"Roof must be able to support design force in defined load cases"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008389">
      <ENU>"Area of each span"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008392">
      <ENU>"Overall force coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008398">
      <ENU>"Design force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008403">
      <ENU>"Design forces in bays of multibay canopy"</ENU>
    </Item>
    <Item ID="TEXT_INI400_008437">
      <ENU>Description("A↓fr←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_008439">
      <ENU>Description("c↓fr←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008441">
      <ENU>"Smooth surface (i.e. steel, smooth concrete)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008443">
      <ENU>"Rough surface (i.e. rough concrete, tar-boards)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008445">
      <ENU>"Very rough surface (i.e. ripples, ribs, folds)"</ENU>
    </Item>
    <Item ID="TEXT_INI400_008446">
      <ENU>Description("H↓fr←")</ENU>
    </Item>
  </Texts>
</Root>