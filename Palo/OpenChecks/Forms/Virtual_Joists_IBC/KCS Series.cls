<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="1a3fec8e-7115-47e2-a3d0-d2ae8bdcdcca">
  <CodeEditor>
    <SourceCode Collapsed="6|11" BreakPoints="">//KCS Series Joist Design
//Verify the Controling variable = Moment of Interia works
//Create MemberData Dialog
//Can a result be a string value?
//Use PhysConst or CUnit to set exact value of Inputs and Values from table?

→INI400_013168BLOCK { // Declare &amp; set variables
    object G_PASS →INI400_013123= new Graphics(); →INI400_013124G_PASS.DrawText("PASS", new Font("Tahoma", 10, FontStyle.Bold), 0, 0, ContentAlignment.MiddleLeft, Color.Green); 
    object G_FAIL →INI400_013125= new Graphics(); →INI400_013126G_FAIL.DrawText("FAIL", new Font("Tahoma", 10, FontStyle.Bold), 0, 0, ContentAlignment.MiddleLeft, Color.Red); 
} 

→INI400_010931BLOCK { // Check to see if form is run as standalone and or imported as external CLC
    bool SA →INI400_000614= IO.IsStandalone; 
    bool Ext →INI400_013223= IO.IsExternCLC; 
} 

→INI400_010739BLOCK { // Import table based on Design Method (LRFD or ASD)
    SWITCH(DesignMethod) { 
        CASE 0 :  { //LRFD
            object DT →INI400_010578= new CustomDataTable("US/KCS Joists Table (LRFD).xml"); 
            DT →INI400_013231= DT.Convert(); 
            →INI400_010737TEXT("KCS Series Joist Design: SJI Standard Specification, 43rd Edition - LRFD Design Method"); 
        } 
        CASE 1 :  { //ASD
            object DT →INI400_010735= new CustomDataTable("US/KCS Joists Table (ASD).xml"); 
            DT →INI400_013714= DT.Convert(); 
            →INI400_010738TEXT("KCS Series Joist Design: SJI Standard Specification, 43rd Edition - ASD Design Method"); 
        } 
        DEFAULT :  { →INI400_013713TEXT("Unsupported Case"); } 
    } 
} 

→INI400_013118BLOCK { // Internal Forces and Length of Joist
    
    IF(Ext) { // If module is imported into other module 
        // Internal Forces, Length, and Sort Method are defined in parent module
    } ELSE { //  Module is not imported
        →INI400_000186TEXT("Input Data"); 
        →INI400_013121TEXT("M↓y← = " &amp; M↓y,max←); 
        →INI400_011016TEXT(Description("M↓y,max←")); 
        →INI400_013122TEXT("V↓z← = " &amp; V↓z,max←); 
        →INI400_011018TEXT(Description("V↓z,max←")); 
        →INI400_013120TEXT("L = " &amp; L); 
        →INI400_012987TEXT(Description("L")); 
        →INI400_013117double Sort_KCS; 
    } 
} 

→INI400_013224BLOCK { // Controlling Variable for Design
    →INI400_010720TEXT("Controlling Variable for Design:"); 
    SWITCH(Sort_KCS) { 
        CASE 0 :  { 
            →INI400_010712TEXT("Depth"); 
        } 
        CASE 1 :  { 
            →INI400_010719TEXT("Weight"); 
        } 
        CASE 2 :  { 
            →INI400_010721TEXT("Moment"); 
        } 
        CASE 3 :  { 
            →INI400_010722TEXT("Shear"); 
        } 
        CASE 4 :  { 
            →INI400_010723TEXT("Moment of Intertia"); 
        } 
    } 
} 

→INI400_010604BLOCK { //CustomDataTable Design
    SWITCH(Sort_KCS) { 
        CASE 0 :  { //Depth (Column1)
            string Filter →INI400_010592= "Column1&gt;0 AND Column2&gt; " &amp; M↓y,max← &amp; " AND Column3&gt; " &amp; V↓z,max←; 
        } 
        CASE 1 :  { //Weight (Column4)
            string Filter →INI400_010598= "Column4&gt;0 AND Column2&gt; " &amp; M↓y,max← &amp; " AND Column3&gt; " &amp; V↓z,max←; 
        } 
        CASE 2 :  { //Moment (Column2)
            string Filter →INI400_010699= "Column2&gt; " &amp; M↓y,max← &amp; " AND Column3&gt; " &amp; V↓z,max←; 
        } 
        CASE 3 :  { //Shear (Column3)
            string Filter →INI400_010704= "Column3&gt; " &amp; V↓z,max← &amp; " AND Column2&gt; " &amp; M↓y,max←; 
        } 
        CASE 4 :  { //Moment of Intertia (Column5)
            string Filter →INI400_010724= "Column5&gt;0 AND Column2&gt; " &amp; M↓y,max← &amp; " AND Column3&gt; " &amp; V↓z,max←; 
        } 
    } 
    
    object selection →INI400_010593= DT.Select(Filter); 
    IF(selection.Length == 0) { 
        →INI400_013230TEXT("WARNING: No Joist meets the defined criteria, Revise Design."); 
        Exit(); 
    } 
    FOR(i, 0, selection.Length-1) { 
        →INI400_010596TEXT(selection[i].ItemArray[0]); 
    } 
    object Joist →INI400_010597= DT.GetStructure(selection[0]); 
    
    string CSS →INI400_010587= Joist.Category; 
    double M↓n← →INI400_010732= Joist.M↓n←; 
    double V↓n← →INI400_010591= Joist.V↓n←; 
    double KCS_depth →INI400_010605= Joist.d; 
    double W →INI400_010606= Joist.W; 
    double I↓y← →INI400_010607= Joist.I↓y←; 
    double Bridging →INI400_010733= Joist.B; 
    string Name →INI400_013715= Joist.Category; 
} 

→INI400_010612TEXT("Design Verification"); 
→INI400_010645BLOCK { 
    →INI400_010668TEXT("Joist Properties"); 
    →INI400_010625TEXT("CSS = " &amp; CSS); 
    →INI400_010628TEXT("KCS Joist Designation based on Standard Design Table"); 
    →INI400_010646TEXT("d = " &amp; KCS_depth); 
    →INI400_010649TEXT("Depth of Joist"); 
    →INI400_010650TEXT("W = " &amp; W); 
    →INI400_010653TEXT("Weight of Joist"); 
    →INI400_010654TEXT("I↓y← =" &amp; I↓y←); 
    →INI400_010657TEXT("Moment of Intertia"); 
    
    
    →INI400_010621BLOCK { //Moment Capacity Verification
        →INI400_010614TEXT("Moment"); 
        →INI400_010633TEXT("M↓y← =" &amp; M↓y,max←); 
        →INI400_010636TEXT("Applied Moment"); 
        →INI400_010629TEXT("M↓n← =" &amp; M↓n←); 
        →INI400_010632TEXT("Moment Capacity"); 
        UC↓b← →INI400_010619= M↓y,max←/M↓n←; 
        →INI400_010623TEXT("Unity Check"); 
        →INI400_003688TEXT("Moment Capacity Sufficient"); 
        →INI400_003689G_PASS.Draw(1); 
    } 
    →INI400_010622BLOCK { //Shear Capacity Verification
        →INI400_010615TEXT("Shear"); 
        →INI400_010661TEXT("V↓z← =" &amp; V↓z,max←); 
        →INI400_010664TEXT("Maximum Shear Reaction"); 
        →INI400_010637TEXT("V↓n← =" &amp; V↓n←); 
        →INI400_010640TEXT("Shear Capacity"); 
        UC↓v← →INI400_010620= V↓z,max←/V↓n←; 
        →INI400_010624TEXT("Unity Check"); 
        →INI400_010674TEXT("Shear Capacity Sufficient"); 
        →INI400_010675G_PASS.Draw(1); 
    } 
    →INI400_010659BLOCK { //Uniform Load Verification
        →INI400_010665TEXT("Uniform Load"); 
        
        IF(DesignMethod == 0) { 
            IF(Ext) { 
                →INI400_010670TEXT("The maximum uniformly distributed load capacity in LRFD shall not exceed 825 lb/ft."); 
                UC↓w← →INI400_010864= w↓eq←/PhysConst(825, "lb/ft"); 
            } ELSE { 
                →INI400_013225TEXT("The maximum uniformly distributed load capacity in LRFD shall not exceed 825 lb/ft."); 
                w↓b← →INI400_010859= [8*M↓y,max←]/L↑2←; 
                →INI400_010860TEXT("Unform Load due to Applied Moment"); 
                w↓v← →INI400_010861= [2*V↓z,max←]/L; 
                →INI400_010862TEXT("Unform Load due to Shear Reaction"); 
                w↓L← →INI400_010863= MAX(w↓b←, w↓v←); 
                UC↓w← →INI400_013226= w↓L←/PhysConst(825, "lb/ft"); 
            } 
            
            →INI400_010865TEXT("Unity Check"); 
            IF(UC↓w← &gt; 1) { 
                →INI400_010866TEXT("Max Uniform Load Exceeded"); 
                →INI400_010867G_FAIL.Draw(1); 
            } ELSE { 
                →INI400_010868TEXT("Max Uniform Load Sufficient"); 
                →INI400_010869G_PASS.Draw(1); 
            } 
        } ELSE { 
            
            IF(Ext) { 
                →INI400_013229TEXT("The maximum uniformly distributed load capacity in ASD shall not exceed 550 lb/ft."); 
                UC↓w← →INI400_013228= w↓eq←/PhysConst(550, "lb/ft"); 
            } ELSE { 
                →INI400_010857TEXT("The maximum uniformly distributed load capacity in ASD shall not exceed 550 lb/ft."); 
                w↓b← →INI400_010658= [8*M↓y,max←]/L↑2←; 
                →INI400_010666TEXT("Unform Load due to Applied Moment"); 
                w↓v← →INI400_010660= [2*V↓z,max←]/L; 
                →INI400_010667TEXT("Unform Load due to Shear Reaction"); 
                w↓L← →INI400_010669= MAX(w↓b←, w↓v←); 
                UC↓w← →INI400_010858= w↓L←/PhysConst(550, "lb/ft"); 
            } 
            →INI400_010672TEXT("Unity Check"); 
            IF(UC↓w← &gt; 1) { 
                →INI400_010673TEXT("Max Uniform Load Exceeded"); 
                →INI400_010678G_FAIL.Draw(1); 
            } ELSE { 
                →INI400_010676TEXT("Max Uniform Load Sufficient"); 
                →INI400_010677G_PASS.Draw(1); 
            } 
        } 
    } 
} 

→INI400_010017TEXT("Construction Notes"); 
→INI400_010680BLOCK { //Camber
    IF(L &lt;= PhysConst(20, "ft")) { 
        Camber →INI400_010682= PhysConst(0.25, "in"); 
    } ELSE { 
        IF(L &gt; PhysConst(20, "ft") &amp;&amp; (L &lt;= PhysConst(30, "ft"))) { 
            Camber →INI400_010681= PhysConst(0.375, "in"); 
        } ELSE { 
            IF(L &gt; PhysConst(30, "ft") &amp;&amp; (L &lt;= PhysConst(40, "ft"))) { 
                Camber →INI400_010683= PhysConst(0.625, "in"); 
            } ELSE { 
                IF(L &gt; PhysConst(40, "ft") &amp;&amp; (L &lt;= PhysConst(50, "ft"))) { 
                    Camber →INI400_010684= PhysConst(1.0, "in"); 
                } ELSE { // L &gt; PhysConst(50, "ft")
                    Camber →INI400_010685= PhysConst(1.5, "in"); 
                } 
            } 
        } 
    } 
} 

→INI400_010689BLOCK { //Top Chord Bridging
    //All 12 Bridging Cases
    SWITCH(Bridging) { 
        CASE 1 :  { 
            IF(L &lt;= PhysConst(17, "ft")) { 
                string r↓b← →INI400_010686= "1 row"; 
            } ELSE { 
                IF((L &gt; PhysConst(17, "ft")) &amp;&amp; (L &lt;= PhysConst(26, "ft"))) { 
                    string r↓b← →INI400_010687= "2 rows"; 
                } ELSE { 
                    IF((L &gt; PhysConst(26, "ft")) &amp;&amp; (L &lt;= PhysConst(28, "ft"))) { 
                        string r↓b← →INI400_010688= "3 rows"; 
                    } ELSE { 
                        IF(L &gt; PhysConst(28, "ft")) { 
                            string r↓b← →INI400_010765= "N/A"; 
                        } 
                    } 
                } 
            } 
        } 
        CASE 2 :  { 
            IF(L &lt;= PhysConst(21, "ft")) { 
                string r↓b← →INI400_010742= "1 row"; 
            } ELSE { 
                IF((L &gt; PhysConst(21, "ft")) &amp;&amp; (L &lt;= PhysConst(30, "ft"))) { 
                    string r↓b← →INI400_010743= "2 rows"; 
                } ELSE { 
                    IF((L &gt; PhysConst(30, "ft")) &amp;&amp; (L &lt;= PhysConst(32, "ft"))) { 
                        string r↓b← →INI400_010744= "3 rows"; 
                    } ELSE { 
                        IF(L &gt; PhysConst(32, "ft")) { 
                            string r↓b← →INI400_010764= "N/A"; 
                        } 
                    } 
                } 
            } 
        } 
        CASE 3 :  { 
            IF(L &lt;= PhysConst(18, "ft")) { 
                string r↓b← →INI400_010747= "1 row"; 
            } ELSE { 
                IF((L &gt; PhysConst(18, "ft")) &amp;&amp; (L &lt;= PhysConst(26, "ft"))) { 
                    string r↓b← →INI400_010748= "2 rows"; 
                } ELSE { 
                    IF((L &gt; PhysConst(26, "ft")) &amp;&amp; (L &lt;= PhysConst(40, "ft"))) { 
                        string r↓b← →INI400_010749= "3 rows"; 
                    } ELSE { 
                        IF(L &gt; PhysConst(40, "ft")) { 
                            string r↓b← →INI400_010763= "N/A"; 
                        } 
                    } 
                } 
            } 
        } 
        CASE 4 :  { 
            IF(L &lt;= PhysConst(20, "ft")) { 
                string r↓b← →INI400_010751= "1 row"; 
            } ELSE { 
                IF((L &gt; PhysConst(20, "ft")) &amp;&amp; (L &lt;= PhysConst(30, "ft"))) { 
                    string r↓b← →INI400_010752= "2 rows"; 
                } ELSE { 
                    IF((L &gt; PhysConst(30, "ft")) &amp;&amp; (L &lt;= PhysConst(41, "ft"))) { 
                        string r↓b← →INI400_010753= "3 rows"; 
                    } ELSE { 
                        IF((L &gt; PhysConst(41, "ft")) &amp;&amp; (L &lt;= PhysConst(48, "ft"))) { 
                            string r↓b← →INI400_010755= "4 rows"; 
                        } ELSE { 
                            IF(L &gt; PhysConst(48, "ft")) { 
                                string r↓b← →INI400_010762= "N/A"; 
                            } 
                        } 
                    } 
                } 
            } 
        } 
        CASE 5 :  { 
            IF(Name.Contains("12K") || Name.Contains("14K") || Name.Contains("16K") || Name.Contains("18K") || Name.Contains("20K") || Name.Contains("22K") || Name.Contains("24K")) { 
                IF(L &lt;= PhysConst(20, "ft")) { 
                    string r↓b← →INI400_010756= "1 row"; 
                } ELSE { 
                    IF((L &gt; PhysConst(20, "ft")) &amp;&amp; (L &lt;= PhysConst(30, "ft"))) { 
                        string r↓b← →INI400_010757= "2 rows"; 
                    } ELSE { 
                        IF((L &gt; PhysConst(30, "ft")) &amp;&amp; (L &lt;= PhysConst(41, "ft"))) { 
                            string r↓b← →INI400_010758= "3 rows"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(41, "ft")) &amp;&amp; (L &lt;= PhysConst(48, "ft"))) { 
                                string r↓b← →INI400_010759= "4 rows"; 
                            } ELSE { 
                                IF(L &gt; PhysConst(48, "ft")) { 
                                    string r↓b← →INI400_010761= "N/A"; 
                                } 
                            } 
                        } 
                    } 
                } 
            } ELSE { 
                IF(Name.Contains("26K")) { 
                    IF(L &lt;= PhysConst(28, "ft")) { 
                        string r↓b← →INI400_010771= "1 row"; 
                    } ELSE { 
                        IF((L &gt; PhysConst(28, "ft")) &amp;&amp; (L &lt;= PhysConst(41, "ft"))) { 
                            string r↓b← →INI400_010772= "2 rows"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(41, "ft")) &amp;&amp; (L &lt;= PhysConst(52, "ft"))) { 
                                string r↓b← →INI400_010773= "3 rows"; 
                            } ELSE { 
                                IF(L &gt; PhysConst(52, "ft")) { 
                                    string r↓b← →INI400_010775= "N/A"; 
                                } 
                            } 
                        } 
                    } 
                } ELSE { 
                    IF(Name.Contains("28K") || Name.Contains("30K")) { 
                        string r↓b← →INI400_010776= "N/A"; 
                    } 
                } 
            } 
        } 
        CASE 6 :  { 
            IF(Name.Contains("12K") || Name.Contains("30K")) { 
                string r↓b← →INI400_010781= "N/A"; 
            } ELSE { 
                IF(Name.Contains("14K") || Name.Contains("16K") || Name.Contains("18K") || Name.Contains("20K") || Name.Contains("22K") || Name.Contains("24K")) { 
                    IF(L &lt;= PhysConst(20, "ft")) { 
                        string r↓b← →INI400_010782= "1 row"; 
                    } ELSE { 
                        IF((L &gt; PhysConst(20, "ft")) &amp;&amp; (L &lt;= PhysConst(31, "ft"))) { 
                            string r↓b← →INI400_010783= "2 rows"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(31, "ft")) &amp;&amp; (L &lt;= PhysConst(42, "ft"))) { 
                                string r↓b← →INI400_010784= "3 rows"; 
                            } ELSE { 
                                IF((L &gt; PhysConst(42, "ft")) &amp;&amp; (L &lt;= PhysConst(48, "ft"))) { 
                                    string r↓b← →INI400_010786= "4 rows"; 
                                } ELSE { 
                                    IF(L &gt; PhysConst(48, "ft")) { 
                                        string r↓b← →INI400_010785= "N/A"; 
                                    } 
                                } 
                            } 
                        } 
                    } 
                } ELSE { 
                    IF(Name.Contains("26K") || Name.Contains("28K")) { 
                        IF(L &lt;= PhysConst(28, "ft")) { 
                            string r↓b← →INI400_010787= "1 row"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(28, "ft")) &amp;&amp; (L &lt;= PhysConst(41, "ft"))) { 
                                string r↓b← →INI400_010788= "2 rows"; 
                            } ELSE { 
                                IF((L &gt; PhysConst(41, "ft")) &amp;&amp; (L &lt;= PhysConst(54, "ft"))) { 
                                    string r↓b← →INI400_010789= "3 rows"; 
                                } ELSE { 
                                    IF((L &gt; PhysConst(54, "ft")) &amp;&amp; (L &lt;= PhysConst(56, "ft"))) { 
                                        string r↓b← →INI400_010790= "4 rows"; 
                                    } ELSE { 
                                        IF(L &gt; PhysConst(56, "ft")) { 
                                            string r↓b← →INI400_010791= "N/A"; 
                                        } 
                                    } 
                                } 
                            } 
                        } 
                    } 
                } 
            } 
        } 
        CASE 7 :  { 
            IF(Name.Contains("12K") || Name.Contains("14K")) { 
                string r↓b← →INI400_010794= "N/A"; 
            } ELSE { 
                IF(Name.Contains("16K") || Name.Contains("18K") || Name.Contains("20K") || Name.Contains("22K") || Name.Contains("24K")) { 
                    IF(L &lt;= PhysConst(23, "ft")) { 
                        string r↓b← →INI400_010795= "1 row"; 
                    } ELSE { 
                        IF((L &gt; PhysConst(23, "ft")) &amp;&amp; (L &lt;= PhysConst(34, "ft"))) { 
                            string r↓b← →INI400_010796= "2 rows"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(34, "ft")) &amp;&amp; (L &lt;= PhysConst(48, "ft"))) { 
                                string r↓b← →INI400_010797= "3 rows"; 
                            } ELSE { 
                                IF(L &gt; PhysConst(48, "ft")) { 
                                    string r↓b← →INI400_010799= "N/A"; 
                                } 
                            } 
                        } 
                    } 
                } ELSE { 
                    IF(Name.Contains("26K") || Name.Contains("28K") || Name.Contains("30K")) { 
                        string r↓b← →INI400_010800= "N/A"; 
                    } 
                } 
            } 
        } 
        CASE 8 :  { 
            IF(Name.Contains("12K") || Name.Contains("14K") || Name.Contains("16K") || Name.Contains("18K") || Name.Contains("20K") || Name.Contains("22K")) { 
                string r↓b← →INI400_010803= "N/A"; 
            } ELSE { 
                IF(Name.Contains("24K")) { 
                    IF(L &lt;= PhysConst(25, "ft")) { 
                        string r↓b← →INI400_010804= "1 row"; 
                    } ELSE { 
                        IF((L &gt; PhysConst(25, "ft")) &amp;&amp; (L &lt;= PhysConst(39, "ft"))) { 
                            string r↓b← →INI400_010805= "2 rows"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(39, "ft")) &amp;&amp; (L &lt;= PhysConst(48, "ft"))) { 
                                string r↓b← →INI400_010806= "3 rows"; 
                            } ELSE { 
                                IF(L &gt; PhysConst(48, "ft")) { 
                                    string r↓b← →INI400_010807= "N/A"; 
                                } 
                            } 
                        } 
                    } 
                } ELSE { 
                    IF(Name.Contains("26K") || Name.Contains("28K") || Name.Contains("30K")) { 
                        IF(L &lt;= PhysConst(29, "ft")) { 
                            string r↓b← →INI400_010809= "1 row"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(29, "ft")) &amp;&amp; (L &lt;= PhysConst(44, "ft"))) { 
                                string r↓b← →INI400_010810= "2 rows"; 
                            } ELSE { 
                                IF((L &gt; PhysConst(44, "ft")) &amp;&amp; (L &lt;= PhysConst(60, "ft"))) { 
                                    string r↓b← →INI400_010811= "3 rows"; 
                                } ELSE { 
                                    IF(L &gt; PhysConst(60, "ft")) { 
                                        string r↓b← →INI400_010812= "N/A"; 
                                    } 
                                } 
                            } 
                        } 
                    } 
                } 
            } 
        } 
        CASE 9 :  { 
            IF(Name.Contains("12K") || Name.Contains("14K")) { 
                string r↓b← →INI400_010815= "N/A"; 
            } ELSE { 
                IF(Name.Contains("16K") || Name.Contains("18K") || Name.Contains("20K") || Name.Contains("22K") || Name.Contains("24K")) { 
                    IF(L &lt;= PhysConst(22, "ft")) { 
                        string r↓b← →INI400_010816= "1 row"; 
                    } ELSE { 
                        IF((L &gt; PhysConst(22, "ft")) &amp;&amp; (L &lt;= PhysConst(34, "ft"))) { 
                            string r↓b← →INI400_010817= "2 rows"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(34, "ft")) &amp;&amp; (L &lt;= PhysConst(48, "ft"))) { 
                                string r↓b← →INI400_010818= "3 rows"; 
                            } ELSE { 
                                IF(L &gt; PhysConst(48, "ft")) { 
                                    string r↓b← →INI400_010819= "N/A"; 
                                } 
                            } 
                        } 
                    } 
                } ELSE { 
                    IF(Name.Contains("26K") || Name.Contains("28K") || Name.Contains("30K")) { 
                        IF(L &lt;= PhysConst(29, "ft")) { 
                            string r↓b← →INI400_010820= "1 row"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(29, "ft")) &amp;&amp; (L &lt;= PhysConst(44, "ft"))) { 
                                string r↓b← →INI400_010821= "2 rows"; 
                            } ELSE { 
                                IF((L &gt; PhysConst(44, "ft")) &amp;&amp; (L &lt;= PhysConst(60, "ft"))) { 
                                    string r↓b← →INI400_010822= "3 rows"; 
                                } ELSE { 
                                    IF(L &gt; PhysConst(60, "ft")) { 
                                        string r↓b← →INI400_010823= "N/A"; 
                                    } 
                                } 
                            } 
                        } 
                    } 
                } 
            } 
        } 
        CASE 10 :  { 
            IF(Name.Contains("12K") || Name.Contains("14K") || Name.Contains("16K")) { 
                string r↓b← →INI400_010826= "N/A"; 
            } ELSE { 
                IF(Name.Contains("18K") || Name.Contains("20K") || Name.Contains("22K") || Name.Contains("24K")) { 
                    IF(L &lt;= PhysConst(22, "ft")) { 
                        string r↓b← →INI400_010827= "1 row"; 
                    } ELSE { 
                        IF((L &gt; PhysConst(22, "ft")) &amp;&amp; (L &lt;= PhysConst(38, "ft"))) { 
                            string r↓b← →INI400_010828= "2 rows"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(38, "ft")) &amp;&amp; (L &lt;= PhysConst(48, "ft"))) { 
                                string r↓b← →INI400_010829= "3 rows"; 
                            } ELSE { 
                                IF(L &gt; PhysConst(48, "ft")) { 
                                    string r↓b← →INI400_010830= "N/A"; 
                                } 
                            } 
                        } 
                    } 
                } ELSE { 
                    IF(Name.Contains("26K") || Name.Contains("28K") || Name.Contains("30K")) { 
                        IF(L &lt;= PhysConst(29, "ft")) { 
                            string r↓b← →INI400_010831= "1 row"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(29, "ft")) &amp;&amp; (L &lt;= PhysConst(48, "ft"))) { 
                                string r↓b← →INI400_010832= "2 rows"; 
                            } ELSE { 
                                IF((L &gt; PhysConst(48, "ft")) &amp;&amp; (L &lt;= PhysConst(60, "ft"))) { 
                                    string r↓b← →INI400_010833= "3 rows"; 
                                } ELSE { 
                                    IF(L &gt; PhysConst(60, "ft")) { 
                                        string r↓b← →INI400_010834= "N/A"; 
                                    } 
                                } 
                            } 
                        } 
                    } 
                } 
            } 
        } 
        CASE 11 :  { 
            IF(Name.Contains("12K") || Name.Contains("14K") || Name.Contains("16K") || Name.Contains("18K") || Name.Contains("20K") || Name.Contains("24K") || Name.Contains("26K") || Name.Contains("28K")) { 
                string r↓b← →INI400_010837= "N/A"; 
            } ELSE { 
                IF(Name.Contains("22K")) { 
                    IF(L &lt;= PhysConst(24, "ft")) { 
                        string r↓b← →INI400_010838= "1 row"; 
                    } ELSE { 
                        IF((L &gt; PhysConst(24, "ft")) &amp;&amp; (L &lt;= PhysConst(39, "ft"))) { 
                            string r↓b← →INI400_010839= "2 rows"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(39, "ft")) &amp;&amp; (L &lt;= PhysConst(44, "ft"))) { 
                                string r↓b← →INI400_010840= "3 rows"; 
                            } ELSE { 
                                IF(L &gt; PhysConst(44, "ft")) { 
                                    string r↓b← →INI400_010841= "N/A"; 
                                } 
                            } 
                        } 
                    } 
                } ELSE { 
                    IF(Name.Contains("30K")) { 
                        IF(L &lt;= PhysConst(34, "ft")) { 
                            string r↓b← →INI400_010842= "1 row"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(34, "ft")) &amp;&amp; (L &lt;= PhysConst(49, "ft"))) { 
                                string r↓b← →INI400_010843= "2 rows"; 
                            } ELSE { 
                                IF((L &gt; PhysConst(49, "ft")) &amp;&amp; (L &lt;= PhysConst(60, "ft"))) { 
                                    string r↓b← →INI400_010844= "3 rows"; 
                                } ELSE { 
                                    IF(L &gt; PhysConst(60, "ft")) { 
                                        string r↓b← →INI400_010845= "N/A"; 
                                    } 
                                } 
                            } 
                        } 
                    } 
                } 
            } 
        } 
        CASE 12 :  { 
            IF(Name.Contains("12K") || Name.Contains("14K") || Name.Contains("16K") || Name.Contains("18K") || Name.Contains("20K") || Name.Contains("22K")) { 
                string r↓b← →INI400_010848= "N/A"; 
            } ELSE { 
                IF(Name.Contains("24K")) { 
                    IF(L &lt;= PhysConst(25, "ft")) { 
                        string r↓b← →INI400_010849= "1 row"; 
                    } ELSE { 
                        IF((L &gt; PhysConst(25, "ft")) &amp;&amp; (L &lt;= PhysConst(43, "ft"))) { 
                            string r↓b← →INI400_010850= "2 rows"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(43, "ft")) &amp;&amp; (L &lt;= PhysConst(48, "ft"))) { 
                                string r↓b← →INI400_010851= "3 rows"; 
                            } ELSE { 
                                IF(L &gt; PhysConst(48, "ft")) { 
                                    string r↓b← →INI400_010852= "N/A"; 
                                } 
                            } 
                        } 
                    } 
                } ELSE { 
                    IF(Name.Contains("26K") || Name.Contains("28K") || Name.Contains("30K")) { 
                        IF(L &lt;= PhysConst(29, "ft")) { 
                            string r↓b← →INI400_010853= "1 row"; 
                        } ELSE { 
                            IF((L &gt; PhysConst(29, "ft")) &amp;&amp; (L &lt;= PhysConst(47, "ft"))) { 
                                string r↓b← →INI400_010854= "2 rows"; 
                            } ELSE { 
                                IF((L &gt; PhysConst(7, "ft")) &amp;&amp; (L &lt;= PhysConst(60, "ft"))) { 
                                    string r↓b← →INI400_010855= "3 rows"; 
                                } ELSE { 
                                    IF(L &gt; PhysConst(60, "ft")) { 
                                        string r↓b← →INI400_010856= "N/A"; 
                                    } ELSE { 
                                    } 
                                } 
                            } 
                        } 
                    } 
                } 
            } 
        } 
    } 
} 

→INI400_010695BLOCK { 
    →INI400_010693TEXT("Camber"); 
    →INI400_010679TEXT("Appoximate KCS Joist Camber is " &amp; Camber &amp; " inches per SJI Specification Table 4.6-1"); 
    →INI400_010694TEXT("Top Chord Bridging"); 
    IF(string r↓b← == "N/A") { 
        →INI400_010766TEXT("Bridging Requirements cannot be satisfied for given Joist Length, Revise Design."); 
    } ELSE { 
        →INI400_010690TEXT(r↓b← &amp; " of top chord bridging required per SJI Specification Table 5.4-1"); 
    } 
    →INI400_010696TEXT("Joist Seat Properties"); 
    →INI400_010691TEXT("End Bearing Length on Masonry is a minimum of 4 in"); 
    →INI400_010692TEXT("End Bearing Length on Steel is a minimum of 2.5 in"); 
    →INI400_010697TEXT("Joist Seat Depth is 2.5 in"); 
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="" Autor2="" Version="1" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://designforms.net</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Calculation</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" />
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|15|0|2" Font2="Segoe UI|15|1|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Formula 1" X="25" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI Semibold|14|0|2" Font2="Segoe UI Semibold|14|0|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Formula 2" X="25" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|0|2" />
      <Style Key="Description" X="250" Y="0" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|2|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|1|2" />
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
      <Variable Modifier="Public" Name="Bridging" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description TranslateID="VARIABLE_Bridging">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Camber" ESA_ID="" Type="Double" Value="6.35e-3" Precision="2">
        <Description TranslateID="VARIABLE_Camber">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="CSS" ESA_ID="" Type="String" Value="12KCS2">
        <Description TranslateID="VARIABLE_CSS">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="DesignMethod" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_DesignMethod">
          <ENU>Design Method</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DT" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_DT">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Ext" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Ext">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Filter" ESA_ID="" Type="String" Value="Column4&gt;0 AND Column2&gt; 46394 AND Column3&gt; 18238">
        <Description TranslateID="VARIABLE_Filter">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="G_FAIL" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_G_FAIL">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="G_PASS" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_G_PASS">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Value="36" Precision="2">
        <Description TranslateID="VARIABLE_i">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="I↓y←" ESA_ID="" Type="Double" Value="22.89273e-6" Precision="2">
        <Description TranslateID="VARIABLE_I↓y←">
          <ENU>Second moment of area about the principal weak-axis</ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="416.2314e-9" Dim="in↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="Joist" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Joist">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="KCS_depth" ESA_ID="" Type="Double" Value="304.8e-3" Precision="2">
        <Description TranslateID="VARIABLE_KCS_depth">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Modifier="Public" Name="L" ESA_ID="" Type="Double" Value="1.524" Precision="2">
        <Description TranslateID="VARIABLE_L">
          <ENU>Length</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="304.8e-3" Dim="ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓n←" ESA_ID="" Type="Double" Value="46436.76" Precision="2">
        <Description TranslateID="VARIABLE_M↓n←">
          <ENU>Nominal Flexural Strength</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip•ft" />
      </Variable>
      <Variable Modifier="Public" Name="M↓y,max←" ESA_ID="" Type="Double" Value="46394.4" Precision="2">
        <Description TranslateID="VARIABLE_M↓y,max←">
          <ENU>Max Applied Moment</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip•ft" />
      </Variable>
      <Variable Modifier="Public" Name="Name" ESA_ID="" Type="String" Value="12KCS2">
        <Description TranslateID="VARIABLE_Name">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="r↓b←" ESA_ID="" Type="String" Value="1 row">
        <Description TranslateID="VARIABLE_r↓b←">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SA" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_SA">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="selection" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_selection">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Sort_KCS" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_Sort_KCS">
          <ENU>depth</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓b←" ESA_ID="" Type="Double" Value="999.0877e-3" Precision="2">
        <Description TranslateID="VARIABLE_UC↓b←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓v←" ESA_ID="" Type="Double" Value="911.1107e-3" Precision="2">
        <Description TranslateID="VARIABLE_UC↓v←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC↓w←" ESA_ID="" Type="Double" Value="13.27273" Precision="2">
        <Description TranslateID="VARIABLE_UC↓w←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="V↓n←" ESA_ID="" Type="Double" Value="20017" Precision="2">
        <Description TranslateID="VARIABLE_V↓n←">
          <ENU>Shear Capacity</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="V↓z,max←" ESA_ID="" Type="Double" Value="18237.7" Precision="2">
        <Description TranslateID="VARIABLE_V↓z,max←">
          <ENU>Max Shear</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Modifier="Public" Name="W" ESA_ID="" Type="Double" Value="116.7512" Precision="2">
        <Description TranslateID="VARIABLE_W">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="w↓b←" ESA_ID="" Type="Double" Value="159803.3" Precision="2">
        <Description TranslateID="VARIABLE_w↓b←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="w↓eq←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_w↓eq←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="0" A="0" K="0" cd="0" mol="0" Coef="14.5939" Dim="lb/ft" />
      </Variable>
      <Variable Modifier="Public" Name="w↓L←" ESA_ID="" Type="Double" Value="159803.3" Precision="2">
        <Description TranslateID="VARIABLE_w↓L←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="w↓v←" ESA_ID="" Type="Double" Value="23933.99" Precision="2">
        <Description TranslateID="VARIABLE_w↓v←">
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
          <ENU>Short</ENU>
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
      <VC ID="INI400_000186">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI Semibold|14|0|2" Font2="Segoe UI Semibold|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="INI400_009938" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="14" Y="299" Hor="1" Ver="4" SpX="-5" SpY="5" Font1="Arial|14|0|2" Font2="Arial|14|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="14" Y="299" Hor="1" Ver="4" SpX="-5" SpY="5" Font1="Arial|14|0|2" Font2="Arial|14|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000614">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_000686">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="7" Y="1056" Hor="1" Ver="4" SpX="0" SpY="-3" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="INI400_010017" Style="0" StyleName="" X="7" Y="1056" Hor="1" Ver="4" SpX="0" SpY="-3" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="7" Y="1056" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_003688">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|3|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_003689">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="0" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="INI400_000333" Style="0" StyleName="" X="275" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010017">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="INI400_000142" Style="0" StyleName="" X="437" Y="299" Hor="1" Ver="4" SpX="425" SpY="5" Font1="Arial|14|0|2" Font2="Arial|14|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="419" Y="304" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="419" Y="304" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010578">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010587">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010591">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010592">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010593">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010594">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010596">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010597">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010598">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010599">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010603">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010604">
        <Set Vis="0" Prev="INI400_010720" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010605">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010606">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010607">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010612">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010613">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="7" Y="1056" Hor="1" Ver="4" SpX="0" SpY="-3" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="INI400_010017" Style="0" StyleName="" X="7" Y="1056" Hor="1" Ver="4" SpX="0" SpY="-3" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="7" Y="1056" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010614">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010615">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010619">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010620">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010621">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010622">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010623">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010624">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010625">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010626">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="45" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010627">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="85" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010628">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010629">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010630">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="45" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010631">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="85" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010632">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010633">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010634">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="45" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010635">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="85" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010636">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010637">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010638">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="45" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010639">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="85" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010640">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010645">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010646">
        <Set Vis="1" Prev="INI400_010625" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010647">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="45" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010648">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="85" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010649">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010650">
        <Set Vis="1" Prev="INI400_010646" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010651">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="45" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010652">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="85" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010653">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010654">
        <Set Vis="1" Prev="INI400_010650" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010655">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="45" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010656">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="85" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010657">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010658">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010659">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010660">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010661">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010662">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="45" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010663">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="85" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010664">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010665">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|5|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010666">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="275" Y="0" Hor="0" Ver="2" SpX="100" SpY="0" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|2|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010667">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="275" Y="0" Hor="0" Ver="2" SpX="100" SpY="0" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|2|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010668">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010669">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010670">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010672">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="275" Y="0" Hor="0" Ver="2" SpX="100" SpY="0" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|2|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010673">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="15" SpY="7" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|3|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010674">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="0" Hor="0" Ver="4" SpX="15" SpY="15" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|3|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010675">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="INI400_000333" Style="0" StyleName="" X="275" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010676">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="15" SpY="7" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|3|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010677">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="275" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="INI400_000333" Style="0" StyleName="" X="275" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010678">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="275" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="INI400_000333" Style="0" StyleName="" X="275" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010679">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010680">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010681">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010682">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010683">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010684">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010685">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010686">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010687">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010688">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010689">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010690">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010691">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010692">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010693">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010694">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010695">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010696">
        <Set Vis="1" Prev="" Style="2" StyleName="Subchapter 2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010697">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010699">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010700">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010703">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010704">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010705">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010708">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010709">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010712">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010719">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010720">
        <Set Vis="1" Prev="INI400_010991" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010721">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010722">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010723">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010724">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010725">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010728">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010729">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010730">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010731">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010732">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010733">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010735">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010737">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="4" Y="18.9" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|16|5|2" Font2="Arial|16|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="4" Y="18.9" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|16|5|2" Font2="Arial|16|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010738">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="4" Y="18.9" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|16|5|2" Font2="Arial|16|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="4" Y="18.9" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|16|5|2" Font2="Arial|16|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010739">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010742">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010743">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010744">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010747">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010748">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010749">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010751">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010752">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010753">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010755">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010756">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010757">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010758">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010759">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010761">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010762">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010763">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010764">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010765">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010766">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010767">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010771">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010772">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010773">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010775">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010776">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010777">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010778">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010779">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010781">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010782">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010783">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010784">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010785">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010786">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010787">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010788">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010789">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010790">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010791">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010792">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010793">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010794">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010795">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010796">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010797">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010799">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010800">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010801">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010802">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010803">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010804">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010805">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010806">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010807">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010809">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010810">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010811">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010812">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010813">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010814">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010815">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010816">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010817">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010818">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010819">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010820">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010821">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010822">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010823">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010824">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010825">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010826">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010827">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010828">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010829">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010830">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010831">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010832">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010833">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010834">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010835">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010836">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010837">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010838">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010839">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010840">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010841">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010842">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010843">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010844">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010845">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010846">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010847">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010848">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010849">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010850">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010851">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010852">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010853">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010854">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010855">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010856">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010857">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010858">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010859">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010860">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="275" Y="0" Hor="0" Ver="2" SpX="100" SpY="0" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|2|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010861">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010862">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="275" Y="0" Hor="0" Ver="2" SpX="100" SpY="0" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|2|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010863">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010864">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010865">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="275" Y="0" Hor="0" Ver="2" SpX="100" SpY="0" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|2|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010866">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="15" SpY="7" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|3|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010867">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="275" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="INI400_000333" Style="0" StyleName="" X="275" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010868">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="15" SpY="7" Font1="Segoe UI|12|0|2" Font2="Segoe UI|12|3|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010869">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="275" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="INI400_000333" Style="0" StyleName="" X="275" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010870">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010871">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010872">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010873">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010874">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010875">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010876">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010877">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010878">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010879">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010880">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010881">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010931">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011016">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_011018">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012987">
        <Set Vis="1" Prev="" Style="2" StyleName="Description" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013117">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013118">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013120">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013121">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013122">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013123">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_013124">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="19" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_013125">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_013126">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="19" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_013168">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013223">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013224">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013225">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013226">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013228">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013229">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013230">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|1|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013231">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013713">
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013714">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013715">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
      <TEMDLoader Name="" ID="1" Translate="1" Left="21" Top="54" Width="350" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="0" Anchor="5" Padding="3|3|3|3" MinSize="350|4" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="2" Font="Microsoft Sans Serif|8.25|0|3" Active="1" PreDef="0" MemberDirectory="" MemberID="Beam.2" SectionID="-1" CombiID="-1" />
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="TEXT_INI400_000186">
      <ENU>"Input Data"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000686">
      <ENU>"=============================================================================================="</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003688">
      <ENU>"Moment Capacity Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010017">
      <ENU>"Construction Notes"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010596">
      <ENU>selection[i].ItemArray[0]</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010612">
      <ENU>"Design Verification"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010613">
      <ENU>"=============================================================================================="</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010614">
      <ENU>"Moment"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010615">
      <ENU>"Shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010623">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010624">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010625">
      <ENU>"CSS = " &amp; CSS</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010626">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010627">
      <ENU>CSS</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010628">
      <ENU>"KCS Joist Designation based on Standard Design Table"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010629">
      <ENU>"M↓n← =" &amp; M↓n←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010630">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010631">
      <ENU>M↓n←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010632">
      <ENU>"Moment Capacity"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010633">
      <ENU>"M↓y← =" &amp; M↓y,max←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010634">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010635">
      <ENU>M↓y,max←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010636">
      <ENU>"Applied Moment"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010637">
      <ENU>"V↓n← =" &amp; V↓n←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010638">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010639">
      <ENU>V↓n←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010640">
      <ENU>"Shear Capacity"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010646">
      <ENU>"d = " &amp; KCS_depth</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010647">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010648">
      <ENU>KCS_depth</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010649">
      <ENU>"Depth of Joist"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010650">
      <ENU>"W = " &amp; W</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010651">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010652">
      <ENU>W</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010653">
      <ENU>"Weight of Joist"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010654">
      <ENU>"I↓y← =" &amp; I↓y←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010655">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010656">
      <ENU>I↓y←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010657">
      <ENU>"Moment of Intertia"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010661">
      <ENU>"V↓z← =" &amp; V↓z,max←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010662">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010663">
      <ENU>V↓z,max←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010664">
      <ENU>"Maximum Shear Reaction"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010665">
      <ENU>"Uniform Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010666">
      <ENU>"Unform Load due to Applied Moment"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010667">
      <ENU>"Unform Load due to Shear Reaction"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010668">
      <ENU>"Joist Properties"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010670">
      <ENU>"The maximum uniformly distributed load capacity in LRFD shall not exceed 825 lb/ft."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010672">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010673">
      <ENU>"Max Uniform Load Exceeded"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010674">
      <ENU>"Shear Capacity Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010676">
      <ENU>"Max Uniform Load Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010679">
      <ENU>"Appoximate KCS Joist Camber is " &amp; Camber &amp; " inches per SJI Specification Table 4.6-1"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010690">
      <ENU>r↓b← &amp; " of top chord bridging required per SJI Specification Table 5.4-1"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010691">
      <ENU>"End Bearing Length on Masonry is a minimum of 4 in"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010692">
      <ENU>"End Bearing Length on Steel is a minimum of 2.5 in"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010693">
      <ENU>"Camber"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010694">
      <ENU>"Top Chord Bridging"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010696">
      <ENU>"Joist Seat Properties"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010697">
      <ENU>"Joist Seat Depth is 2.5 in"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010709">
      <ENU>selection[i].ItemArray[0]</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010712">
      <ENU>"Depth"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010719">
      <ENU>"Weight"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010720">
      <ENU>"Controlling Variable for Design:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010721">
      <ENU>"Moment"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010722">
      <ENU>"Shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010723">
      <ENU>"Moment of Intertia"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010729">
      <ENU>selection[i].ItemArray[0]</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010730">
      <ENU>selection[i].ItemArray[0]</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010731">
      <ENU>selection[i].ItemArray[0]</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010737">
      <ENU>"KCS Series Joist Design: SJI Standard Specification, 43rd Edition - LRFD Design Method"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010738">
      <ENU>"KCS Series Joist Design: SJI Standard Specification, 43rd Edition - ASD Design Method"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010766">
      <ENU>"Bridging Requirements cannot be satisfied for given Joist Length, Revise Design."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010857">
      <ENU>"The maximum uniformly distributed load capacity in ASD shall not exceed 550 lb/ft."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010860">
      <ENU>"Unform Load due to Applied Moment"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010862">
      <ENU>"Unform Load due to Shear Reaction"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010865">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010866">
      <ENU>"Max Uniform Load Exceeded"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010868">
      <ENU>"Max Uniform Load Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010878">
      <ENU>"WARNING: No Joist meets the defined criteria, Revise Design."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010879">
      <ENU>"WARNING: No Joist meets the defined criteria, Revise Design."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010880">
      <ENU>"WARNING: No Joist meets the defined criteria, Revise Design."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010881">
      <ENU>"WARNING: No Joist meets the defined criteria, Revise Design."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_011016">
      <ENU>Description("M↓y,max←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_011018">
      <ENU>Description("V↓z,max←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_012987">
      <ENU>Description("L")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013120">
      <ENU>"L = " &amp; L</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013121">
      <ENU>"M↓y← = " &amp; M↓y,max←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013122">
      <ENU>"V↓z← = " &amp; V↓z,max←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013225">
      <ENU>"The maximum uniformly distributed load capacity in LRFD shall not exceed 825 lb/ft."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013229">
      <ENU>"The maximum uniformly distributed load capacity in ASD shall not exceed 550 lb/ft."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013230">
      <ENU>"WARNING: No Joist meets the defined criteria, Revise Design."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_013713">
      <ENU>"Unsupported Case"</ENU>
    </Item>
  </Texts>
</Root>