<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="c8de0ac4-2993-441e-9614-b88e3dd59c8c">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">void UpdateDialog() { 
    Dialog.GetComponentByName("par").Visible →INI400_006774= IO.SetupNA.EC_NA.Code != "STD"; 
    Dialog.GetComponentByName("StateONORM").Visible →INI400_006775= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town0ONORM").Visible →INI400_006776= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 0 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town1ONORM").Visible →INI400_006777= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 1 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town2ONORM").Visible →INI400_006778= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 2 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town3ONORM").Visible →INI400_006779= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 3 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town4ONORM").Visible →INI400_006780= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 4 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town5ONORM").Visible →INI400_006781= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 5 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town6ONORM").Visible →INI400_006782= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 6 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town7ONORM").Visible →INI400_006783= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 7 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town8ONORM").Visible →INI400_006784= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 8 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("UseTableA1").Visible →INI400_006785= IO.SetupNA.EC_NA.Code == "ONORM"; 
    Dialog.GetComponentByName("ZONORM").Visible →INI400_006786= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; !UseTableA1; 
    Dialog.GetComponentByName("ZoneBS").Visible →INI400_006787= IO.SetupNA.EC_NA.Code == "BS"; 
    Dialog.GetComponentByName("ZoneCSN").Visible →INI400_006788= IO.SetupNA.EC_NA.Code == "CSN"; 
    Dialog.GetComponentByName("s_k_0").Visible →INI400_006789= ((IO.SetupNA.EC_NA.Code == "CSN" &amp;&amp; ZoneCSN == 7) || IO.SetupNA.EC_NA.Code == "SFS"); 
    Dialog.GetComponentByName("ZoneNF").Visible →INI400_006790= IO.SetupNA.EC_NA.Code == "NF"; 
    Dialog.GetComponentByName("A_4_1_1").Visible →INI400_006791= ((IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; !UseTableA1) || IO.SetupNA.EC_NA.Code == "STN" || IO.SetupNA.EC_NA.Code == "NBN" || IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "NF" || IO.SetupNA.EC_NA.Code == "DIN" || IO.SetupNA.EC_NA.Code == "ELOT" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "LU" || IO.SetupNA.EC_NA.Code == "PN" || IO.SetupNA.EC_NA.Code == "SR" || IO.SetupNA.EC_NA.Code == "SIST"); 
    Dialog.GetComponentByName("ZoneDIN").Visible →INI400_006792= IO.SetupNA.EC_NA.Code == "DIN"; 
    Dialog.GetComponentByName("ZoneELOT").Visible →INI400_006793= IO.SetupNA.EC_NA.Code == "ELOT"; 
    Dialog.GetComponentByName("ZoneIS").Visible →INI400_006794= IO.SetupNA.EC_NA.Code == "IS"; 
    Dialog.GetComponentByName("ZonePN").Visible →INI400_006795= IO.SetupNA.EC_NA.Code == "PN"; 
    Dialog.GetComponentByName("ZoneSR").Visible →INI400_006796= IO.SetupNA.EC_NA.Code == "SR"; 
    Dialog.GetComponentByName("ZoneSTN").Visible →INI400_006797= IO.SetupNA.EC_NA.Code == "STN"; 
    Dialog.GetComponentByName("ZoneSIST").Visible →INI400_006798= IO.SetupNA.EC_NA.Code == "SIST"; 
    Dialog.GetComponentByName("ZoneNEN").Visible →INI400_006799= IO.SetupNA.EC_NA.Code == "NEN"; 
    Dialog.GetComponentByName("Topography").Visible →INI400_006800= (IO.SetupNA.EC_NA.Code == "CSN" || IO.SetupNA.EC_NA.Code == "ELOT" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "PN" || IO.SetupNA.EC_NA.Code == "SR" || IO.SetupNA.EC_NA.Code == "STN" || IO.SetupNA.EC_NA.Code == "SIST"); 
    Dialog.GetComponentByName("TopographyNF").Visible →INI400_006801= IO.SetupNA.EC_NA.Code == "NF"; 
    Dialog.GetComponentByName("C_t0").Visible →INI400_006802= (IO.SetupNA.EC_NA.Code == "CSN" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "SFS" || (IO.SetupNA.EC_NA.Code == "STN" &amp;&amp; ObjectSTN == 0)); 
    Dialog.GetComponentByName("FormCt").Visible →INI400_006803= IO.SetupNA.EC_NA.Code == "PN"; 
    Dialog.GetComponentByName("t_i").Visible →INI400_006804= IO.SetupNA.EC_NA.Code == "PN" &amp;&amp; FormCt; 
    Dialog.GetComponentByName("U").Visible →INI400_006805= IO.SetupNA.EC_NA.Code == "PN" &amp;&amp; FormCt; 
    Dialog.GetComponentByName("ObjectSTN").Visible →INI400_006806= IO.SetupNA.EC_NA.Code == "STN"; 
    Dialog.GetComponentByName("Exposure_group").Visible →INI400_006807= (IO.SetupNA.EC_NA.Code == "CSN" || IO.SetupNA.EC_NA.Code == "ELOT" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "PN" || IO.SetupNA.EC_NA.Code == "SR" || IO.SetupNA.EC_NA.Code == "STN" || IO.SetupNA.EC_NA.Code == "SIST" || IO.SetupNA.EC_NA.Code == "NF"); 
    Dialog.GetComponentByName("Thermal_group").Visible →INI400_006808= (IO.SetupNA.EC_NA.Code == "CSN" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "SFS" || IO.SetupNA.EC_NA.Code == "STN" || IO.SetupNA.EC_NA.Code == "PN"); 
    Dialog.GetComponentByName("AnnexB4").Visible →INI400_006809= UseAnnexB; 
    Dialog.GetComponentByName("b_standard").Visible →INI400_006810= !AnnexB4; 
    Dialog.GetComponentByName("h_standard").Visible →INI400_006811= !AnnexB4; 
    Dialog.GetComponentByName("ObstructionType").Visible →INI400_006812= AnnexB4; 
    Dialog.GetComponentByName("b1_0").Visible →INI400_006813= AnnexB4 &amp;&amp; (ObstructionType == 0 || ObstructionType == 1 || ObstructionType == 2 || ObstructionType == 3 || ObstructionType == 4 || ObstructionType == 5); 
    Dialog.GetComponentByName("b2_0").Visible →INI400_006814= AnnexB4 &amp;&amp; (ObstructionType == 0 || ObstructionType == 1 || ObstructionType == 2 || ObstructionType == 5); 
    Dialog.GetComponentByName("h1_0").Visible →INI400_006815= AnnexB4 &amp;&amp; (ObstructionType == 0 || ObstructionType == 2); 
    Dialog.GetComponentByName("h2_0").Visible →INI400_006816= AnnexB4 &amp;&amp; (ObstructionType == 0 || ObstructionType == 2); 
    Dialog.GetComponentByName("h_1").Visible →INI400_006817= AnnexB4 &amp;&amp; (ObstructionType == 1 || ObstructionType == 3 || ObstructionType == 4 || ObstructionType == 5); 
} 

IF(Headline) { 
    →INI400_006818TEXT("Snow drifting at projections and obstructions according to"); 
    →INI400_006819TEXT(IO.SetupNA.EC_1991_1_3.Name); 
} 
IF(PrintCaption) { 
    →INI400_006820TEXT(Caption); 
} 

object SnowCoeff →INI400_006821= LoadExternCLC("Coefficients for the snow load.CLC"); 
SnowCoeff.A →INI400_006822= double A; 
SnowCoeff.C↓t,0← →INI400_006823= double C↓t,0←; 
SnowCoeff.FormCt →INI400_006824= bool FormCt; 
SnowCoeff.ObjectSTN →INI400_006825= double ObjectSTN; 
SnowCoeff.s↓k,0← →INI400_006826= double s↓k,0←; 
SnowCoeff.StateONORM →INI400_006827= double StateONORM; 
SnowCoeff.t↓i← →INI400_006828= double t↓i←; 
SnowCoeff.Topography →INI400_006829= double Topography; 
SnowCoeff.TopographyNF →INI400_006830= double TopographyNF; 
SnowCoeff.Town0ONORM →INI400_006831= double Town0ONORM; 
SnowCoeff.Town1ONORM →INI400_006832= double Town1ONORM; 
SnowCoeff.Town2ONORM →INI400_006833= double Town2ONORM; 
SnowCoeff.Town3ONORM →INI400_006834= double Town3ONORM; 
SnowCoeff.Town4ONORM →INI400_006835= double Town4ONORM; 
SnowCoeff.Town5ONORM →INI400_006836= double Town5ONORM; 
SnowCoeff.Town6ONORM →INI400_006837= double Town6ONORM; 
SnowCoeff.Town7ONORM →INI400_006838= double Town7ONORM; 
SnowCoeff.Town8ONORM →INI400_006839= double Town8ONORM; 
SnowCoeff.U →INI400_006840= double U; 
SnowCoeff.UseTableA1 →INI400_006841= bool UseTableA1; 
SnowCoeff.Z →INI400_006842= double Z; 
SnowCoeff.ZoneBS →INI400_006843= double ZoneBS; 
SnowCoeff.ZoneCSN →INI400_006844= double ZoneCSN; 
SnowCoeff.ZoneDIN →INI400_006845= double ZoneDIN; 
SnowCoeff.ZoneELOT →INI400_006846= double ZoneELOT; 
SnowCoeff.ZoneIS →INI400_006847= double ZoneIS; 
SnowCoeff.ZoneNF →INI400_006848= double ZoneNF; 
SnowCoeff.ZonePN →INI400_006849= double ZonePN; 
SnowCoeff.ZoneSIST →INI400_006850= double ZoneSIST; 
SnowCoeff.ZoneSR →INI400_006851= double ZoneSR; 
SnowCoeff.ZoneSTN →INI400_006852= double ZoneSTN; 
SnowCoeff.Headline →INI400_006854= false; 
SnowCoeff.B1 →INI400_006856= false; 
→INI400_006857SnowCoeff.Draw(false); 
double C↓e← →INI400_006858= SnowCoeff.C↓e←; 
double C↓esl← →INI400_006860= SnowCoeff.C↓esl←; 
double C↓t← →INI400_006862= SnowCoeff.C↓t←; 
double s↓k← →INI400_006864= SnowCoeff.s↓k←; 

→INI400_006866PAGEBREAK(); 
//NA.2.22 Clause 6.2 Drifting at projections and obstructions - Using B annex, Paragraph (2)
object Clause6_2_2 →INI400_006867= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1991\EN_1991_1_3\Clause_6.2(2).CLC"); 
→INI400_006868Clause6_2_2.Calculate(false); 
bool UseAnnexB →INI400_006869= Clause6_2_2.UseAnnexB; 
IF(!UseAnnexB) { 
    AnnexB4 →INI400_006870= False; 
} 

IF(AnnexB4) { 
    →INI400_006871TEXT("Annex B is used"); 
    SWITCH(ObstructionType) { 
        CASE 0 :  { 
            →INI400_006872BLOCK("Obstruction on flat roof") { 
                →INI400_006873IMG("Obstruction1"); 
                →INI400_006874PAGEBREAK(); 
                IF(Dim) { 
                    →INI400_006875BLOCK("Dimensions of the construction") { 
                        →INI400_006876TEXT("The distance from the obstruction to the left"); 
                        →INI400_006877TEXT("b↓1← = " &amp; b↓1← &amp; " m"); 
                        →INI400_006878TEXT("The distance from the obstruction to the right"); 
                        →INI400_006879TEXT("b↓2← = " &amp; b↓2← &amp; " m"); 
                        →INI400_006880TEXT("Height the obstruction from the left"); 
                        →INI400_006881TEXT("h↓1← = " &amp; h↓1← &amp; " m"); 
                        →INI400_006882TEXT("Height the obstruction from the right"); 
                        →INI400_006883TEXT("h↓2← = " &amp; h↓2← &amp; " m"); 
                        →INI400_006884TEXT("Drift length from the left"); 
                        l↓s1← →INI400_006885= MIN(5*h↓1←, b↓1←); 
                        →INI400_006886TEXT("Drift length from the right"); 
                        l↓s2← →INI400_006887= MIN(5*h↓2←, b↓2←); 
                    } 
                } 
                →INI400_006888PAGEBREAK(); 
                →INI400_006889BLOCK("Calculation of the snow load") { 
                    →INI400_006890TEXT("Shape coefficients"); 
                    μ↓1← →INI400_006891= MIN(2*h↓1←/CUnit(s↓k←, "kN/m↑2←"), 5); 
                    μ↓2← →INI400_006892= MIN(2*h↓2←/CUnit(s↓k←, "kN/m↑2←"), 5); 
                    →INI400_006893TEXT("Weight of the snow on the left"); 
                    s↓1← →INI400_006894= μ↓1←*C↓e←*C↓t←*s↓k←; 
                    →INI400_006895TEXT("Weight of the snow on the right"); 
                    s↓2← →INI400_006896= μ↓2←*C↓e←*C↓t←*s↓k←; 
                    IF(UnitLoad) { 
                        →INI400_006897TEXT("Weight of the snow at unit lenght of the roof"); 
                        S →INI400_006898= s↓1←*l↓s1←/2+s↓2←*l↓s2←/2; 
                    } 
                } 
            } 
        } 
        CASE 1 :  { 
            →INI400_006899BLOCK("Canopy over door or loading bay") { 
                →INI400_006900IMG("Obstruction2"); 
                →INI400_006901PAGEBREAK(); 
                IF(Dim) { 
                    →INI400_006902BLOCK("Dimensions of the construction") { 
                        →INI400_006903TEXT("Length of the canopy or loading bay"); 
                        IF(b↓1← &lt;= 5) { 
                            →INI400_006904TEXT("b↓1← = " &amp; b↓1← &amp; " m"); 
                        } ELSE { 
                            →INI400_006905TEXT("b↓1← have to be lesser or equal to 5 m!"); 
                            Exit(); 
                        } 
                        →INI400_006906TEXT("Length of the building"); 
                        →INI400_006907TEXT("b↓2← = " &amp; b↓2← &amp; " m"); 
                        →INI400_006908TEXT("Height from canopy to eaves"); 
                        →INI400_006909TEXT("h = " &amp; h &amp; " m"); 
                        →INI400_006910TEXT("Drift length from the left"); 
                        l↓s← →INI400_006911= MIN(5*h, b↓1←); 
                    } 
                } 
                →INI400_006912PAGEBREAK(); 
                →INI400_006913BLOCK("Calculation of the snow load") { 
                    →INI400_006914TEXT("Shape coefficients"); 
                    μ↓1← →INI400_006915= MIN(2*h/CUnit(s↓k←, "kN/m↑2←"), 5); 
                    μ↓2← →INI400_007038= 0; 
                    →INI400_006916TEXT("Weight of the snow on the canopy"); 
                    s↓1← →INI400_006917= μ↓1←*C↓e←*C↓t←*s↓k←; 
                    s↓2← →INI400_007034= 0; 
                    IF(UnitLoad) { 
                        →INI400_006918TEXT("Weight of the snow at unit lenght of the roof"); 
                        S →INI400_006919= s↓1←*l↓s←/2; 
                    } 
                } 
            } 
        } 
        CASE 2 :  { 
            →INI400_006920BLOCK("Obstruction on pitched or curved roof") { 
                →INI400_006921IMG("Obstruction3"); 
                →INI400_006922PAGEBREAK(); 
                IF(Dim) { 
                    →INI400_006923BLOCK("Dimensions of the construction") { 
                        →INI400_006924TEXT("The distance from the obstruction to the left"); 
                        →INI400_006925TEXT("b↓1← = " &amp; b↓1← &amp; " m"); 
                        →INI400_006926TEXT("The distance from the obstruction to the right"); 
                        →INI400_006927TEXT("b↓2← = " &amp; b↓2← &amp; " m"); 
                        →INI400_006928TEXT("Height the obstruction from the left"); 
                        →INI400_006929TEXT("h↓1← = " &amp; h↓1← &amp; " m"); 
                        →INI400_006930TEXT("Height the obstruction from the right"); 
                        →INI400_006931TEXT("h↓2← = " &amp; h↓2← &amp; " m"); 
                        →INI400_006932TEXT("Drift length from the left"); 
                        l↓s1← →INI400_006933= MIN(5*h↓1←, b↓1←); 
                        →INI400_006934TEXT("Drift length from the right"); 
                        l↓s2← →INI400_006935= MIN(5*h↓2←, b↓2←); 
                    } 
                } 
                →INI400_006936PAGEBREAK(); 
                →INI400_006937BLOCK("Calculation of the snow load") { 
                    →INI400_006938TEXT("Shape coefficients"); 
                    μ↓1← →INI400_006939= MIN(2*h↓1←/CUnit(s↓k←, "kN/m↑2←"), 5); 
                    μ↓2← →INI400_006940= MIN(2*h↓2←/CUnit(s↓k←, "kN/m↑2←"), 5); 
                    →INI400_006941TEXT("Weight of the snow on the left"); 
                    s↓1← →INI400_006942= μ↓1←*C↓e←*C↓t←*s↓k←; 
                    →INI400_006943TEXT("Weight of the snow on the right"); 
                    s↓2← →INI400_006944= μ↓2←*C↓e←*C↓t←*s↓k←; 
                    IF(UnitLoad) { 
                        →INI400_006945TEXT("Weight of the snow at unit lenght of the roof"); 
                        S →INI400_006946= s↓1←*l↓s1←/2+s↓2←*l↓s2←/2; 
                    } 
                } 
            } 
        } 
        CASE 3 :  { 
            →INI400_006947BLOCK("Snow behind parapet, flat roof") { 
                →INI400_006948IMG("Obstruction4"); 
                →INI400_006949PAGEBREAK(); 
                IF(Dim) { 
                    →INI400_006950BLOCK("Dimensions of the construction") { 
                        →INI400_006951TEXT("Width of the roof"); 
                        →INI400_006952TEXT("b↓1← = " &amp; b↓1← &amp; " m"); 
                        →INI400_006953TEXT("Height of the parapet"); 
                        →INI400_006954TEXT("h = " &amp; h &amp; " m"); 
                        →INI400_006955TEXT("Drift length"); 
                        l↓s← →INI400_006956= MIN(5*h, b↓1←, 15); 
                    } 
                } 
                →INI400_006957PAGEBREAK(); 
                →INI400_006958BLOCK("Calculation of the snow load") { 
                    →INI400_006959TEXT("Shape coefficient"); 
                    μ↓1← →INI400_006960= MIN(2*h/CUnit(s↓k←, "kN/m↑2←"), 2*b↓1←/l↓s←, 8); 
                    μ↓2← →INI400_007039= 0; 
                    →INI400_006961TEXT("Weight of the snow"); 
                    s↓1← →INI400_006962= μ↓1←*C↓e←*C↓t←*s↓k←; 
                    s↓2← →INI400_007035= 0; 
                    IF(UnitLoad) { 
                        →INI400_006963TEXT("Weight of the snow at unit lenght of the roof"); 
                        S →INI400_006964= s↓1←*l↓s←/2; 
                    } 
                } 
            } 
        } 
        CASE 4 :  { 
            →INI400_006965BLOCK("Snow in valley behind parapet at gable end") { 
                →INI400_006966IMG("Obstruction5"); 
                →INI400_006967PAGEBREAK(); 
                IF(Dim) { 
                    →INI400_006968BLOCK("Dimensions of the construction") { 
                        →INI400_006969TEXT("Width of the roof"); 
                        →INI400_006970TEXT("b↓1← = " &amp; b↓1← &amp; " m"); 
                        →INI400_006971TEXT("Height of the parapet"); 
                        →INI400_006972TEXT("h = " &amp; h &amp; " m"); 
                        →INI400_006973TEXT("Drift length"); 
                        l↓s← →INI400_006974= MIN(5*h, b↓1←, 15); 
                    } 
                } 
                →INI400_006975PAGEBREAK(); 
                →INI400_006976BLOCK("Calculation of the snow load") { 
                    →INI400_006977TEXT("Shape coefficient"); 
                    μ↓1← →INI400_006978= MIN(2*h/CUnit(s↓k←, "kN/m↑2←"), 2*b↓1←/l↓s←, 8); 
                    μ↓2← →INI400_007040= 0; 
                    →INI400_006979TEXT("Weight of the snow"); 
                    s↓1← →INI400_006980= μ↓1←*C↓e←*C↓t←*s↓k←; 
                    s↓2← →INI400_007036= 0; 
                    IF(UnitLoad) { 
                        →INI400_006981TEXT("Weight of the snow at unit lenght of the roof"); 
                        S →INI400_006982= s↓1←*l↓s←/2; 
                    } 
                } 
            } 
        } 
        CASE 5 :  { 
            →INI400_006983BLOCK("Snow behind parapet at eaves, pitched or curved roof") { 
                →INI400_006984IMG("Obstruction6"); 
                →INI400_006985PAGEBREAK(); 
                IF(Dim) { 
                    →INI400_006986BLOCK("Dimensions of the construction") { 
                        →INI400_006987TEXT("Width of the roof to the ridge"); 
                        →INI400_006988TEXT("b↓1← = " &amp; b↓1← &amp; " m"); 
                        →INI400_006989TEXT("Width of the whole roof"); 
                        →INI400_006990TEXT("b↓2← = " &amp; b↓2← &amp; " m"); 
                        →INI400_006991TEXT("Height of the parapet"); 
                        →INI400_006992TEXT("h = " &amp; h &amp; " m"); 
                        →INI400_006993TEXT("Drift length"); 
                        l↓s← →INI400_006994= MIN(5*h, b↓1←, 15); 
                    } 
                } 
                →INI400_006995PAGEBREAK(); 
                →INI400_006996BLOCK("Calculation of the snow load") { 
                    →INI400_006997TEXT("Shape coefficient"); 
                    μ↓1← →INI400_006998= MIN(2*h/CUnit(s↓k←, "kN/m↑2←"), 2*b↓2←/l↓s←, 8); 
                    μ↓2← →INI400_007041= 0; 
                    →INI400_006999TEXT("Weight of the snow"); 
                    s↓1← →INI400_007000= μ↓1←*C↓e←*C↓t←*s↓k←; 
                    s↓2← →INI400_007037= 0; 
                    IF(UnitLoad) { 
                        →INI400_007001TEXT("Weight of the snow at unit lenght of the roof"); 
                        S →INI400_007002= s↓1←*l↓s←/2; 
                    } 
                } 
            } 
        } 
    } 
} ELSE { 
    IF(Dim) { 
        →INI400_007003BLOCK("Dimensions of the construction") { 
            →INI400_007004TEXT("Width of the roof from the obstruction"); 
            →INI400_007005TEXT("b = " &amp; b &amp; " m"); 
            →INI400_007006TEXT("Height of the obstruction"); 
            →INI400_007007TEXT("h = " &amp; h &amp; " m"); 
            →INI400_007008TEXT("Width of the roof loaded by drifting"); 
            IF(2*h &lt; 5) { 
                l↓s← →INI400_007009= 5.0; 
                →INI400_007010TEXT("Minimal value of l↓s← is 5.0 m. l↓s← is set at minimal value."); 
            } ELSE { 
                IF(2*h &lt;= 15) { 
                    l↓s← →INI400_007011= 2*h; 
                } ELSE { 
                    l↓s← →INI400_007012= 15.0; 
                    →INI400_007013TEXT("Maximal value of l↓s← is 15.0 m. l↓s← is set at maximal value."); 
                } 
            } 
        } 
    } 
    →INI400_007014PAGEBREAK(); 
    →INI400_007015IMG("Obstruction"); 
    →INI400_007016PAGEBREAK(); 
    →INI400_007017BLOCK("Calculation of the snow load") { 
        →INI400_007018TEXT("Shape coefficients"); 
        μ↓1← →INI400_007019= 0.8; 
        IF((γ*h)/s↓k← &lt;= 0.8) { 
            μ↓2← →INI400_007020= 0.8; 
        } ELSE { 
            IF((γ*h)/s↓k← &lt;= 2) { 
                μ↓2← →INI400_007021= (γ*h)/s↓k←; 
            } ELSE { 
                μ↓2← →INI400_007022= 2; 
            } 
        } 
        →INI400_007023TEXT("Weight of the snow load by the obstruction"); 
        s↓1← →INI400_007024= μ↓2←*C↓e←*C↓t←*s↓k←; 
        →INI400_007025TEXT("Weight of the snow in the distance l↓s←"); 
        s↓2← →INI400_007026= μ↓1←*C↓e←*C↓t←*s↓k←; 
        →INI400_007027BLOCK { 
            IF(l↓s← &gt; b) { 
                →INI400_007028TEXT("Weight of the snow in the distance b"); 
                s↓2← →INI400_007029= (s↓1←-[((s↓1←-s↓2←)/l↓s←)*b]); 
            } 
        } 
        IF(UnitLoad) { 
            →INI400_007030TEXT("Weight of the snow at unit lenght of the roof"); 
            IF(l↓s← &lt;= b) { 
                S →INI400_007031= ((s↓1←+s↓2←)/2)*l↓s←+s↓2←*[b-l↓s←]; 
            } 
            IF(l↓s← &gt; b) { 
                S →INI400_007032= ((2*s↓1←-((s↓1←-s2)/l↓s←)*b)/2)*b; 
                →INI400_007033TEXT("Width of the roof is lesser, than weight of the drifting"); 
                
            } 
        } 
    } 
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="77" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Snow/Snow - drifting at projections and obstructions.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Snow - Drifting at projections and obstructions</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Caption" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Subcaption" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Headline 1" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 2" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 3" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 4" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 6" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Standard, dY 0" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 5, Understrike" X="10" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Standard, dY 10" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dX 10" X="0" Y="0" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, follow, dX 5" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Check, follow dX 5, bold" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Remark, dX 50" X="50" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Remark, dX 50, bold" X="0" Y="0" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" />
      <Style Key="Formula, dX 50" X="0" Y="0" Hor="1" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dY 10" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 100" X="0" Y="0" Hor="1" Ver="2" SpX="100" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 150" X="0" Y="0" Hor="1" Ver="2" SpX="150" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 200" X="0" Y="0" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 300" X="0" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 250" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 20" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 30" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 60" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="60" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 400" X="0" Y="0" Hor="1" Ver="2" SpX="400" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 40" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="40" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
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
      <Variable Modifier="Public" Name="A" ESA_ID="" Type="Double" Value="250" Precision="2">
        <Description TranslateID="VARIABLE_A">
          <ENU>Altitude above the sea level</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="AnnexB4" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_AnnexB4">
          <ENU>Use calculation according Annex B4</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="6" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>Width the roof from the obstruction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓1←" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_b↓1←">
          <ENU>The distance from the obstruction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓2←" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description TranslateID="VARIABLE_b↓2←">
          <ENU>The distance from the obstruction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="C↓e←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_C↓e←">
          <ENU>Exposure coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓esl←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_C↓esl←">
          <ENU>Exceptional load coeff.</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓t,0←" ESA_ID="" Type="Double" Value="900e-3" Precision="2">
        <Description TranslateID="VARIABLE_C↓t,0←">
          <ENU>Thermal coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓t←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_C↓t←">
          <ENU>Thermal coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause6_2_2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Dim" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Dim">
          <ENU>Print the dimensions of the construction</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FormCt" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_FormCt">
          <ENU>Use formula for calculation Ct</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="350e-3" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Height of the obstruction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓1←" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_h↓1←">
          <ENU>Obstruction height from the left</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓2←" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_h↓2←">
          <ENU>Obstruction height from the right</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="Headline" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Headline">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="l↓s←" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description TranslateID="VARIABLE_l↓s←">
          <ENU>Width of the roof loaded by drifting</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="l↓s1←" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_l↓s1←">
          <ENU>Drift length from the left</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="l↓s2←" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description TranslateID="VARIABLE_l↓s2←">
          <ENU>Drift length from the right</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="ObjectSTN" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ObjectSTN">
          <ENU>Type of the object and roof</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ObstructionType" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ObstructionType">
          <ENU>Type of the obstruction</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="S" ESA_ID="Result.0" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m" />
      </Variable>
      <Variable Modifier="Public" Name="s↓1←" ESA_ID="Result.1" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>Weight of the snow on the left</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓2←" ESA_ID="Result.2" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>Weight of the snow on the right</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓k,0←" ESA_ID="" Type="Double" Value="5500" Precision="2">
        <Description TranslateID="VARIABLE_s↓k,0←">
          <ENU>Characteristic value of snow load on the ground</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓k←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_s↓k←">
          <ENU>Characteristic value of snow load on the ground</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s2" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="SnowCoeff" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="StateONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_StateONORM">
          <ENU>State</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="t↓i←" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description TranslateID="VARIABLE_t↓i←">
          <ENU>Temperature in interier</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="1" cd="0" mol="0" Coef="1" Dim="°C" />
      </Variable>
      <Variable Modifier="Public" Name="Topography" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_Topography">
          <ENU>Topography</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TopographyNF" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_TopographyNF">
          <ENU>Topography</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Town0ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Town0ONORM">
          <ENU>Town in Wien</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Town1ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Town1ONORM">
          <ENU>Town in Niederösterreich</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Town2ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Town2ONORM">
          <ENU>Town in Burgenland</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Town3ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Town3ONORM">
          <ENU>Town in Steiermark</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Town4ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Town4ONORM">
          <ENU>Town in Oberösterreich</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Town5ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Town5ONORM">
          <ENU>Town in Salzburg</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Town6ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Town6ONORM">
          <ENU>Town in Kärnten</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Town7ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Town7ONORM">
          <ENU>Town in Tirol</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Town8ONORM" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Town8ONORM">
          <ENU>Town in Vorarlberg</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="U" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_U">
          <ENU>Thermal transmittance [W/(m2K)]</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UnitLoad" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_UnitLoad">
          <ENU>Print the calculation of the load at unit lenght of the roof</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="UseAnnexB" ESA_ID="" Type="Boolean" Value="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="UseTableA1" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_UseTableA1">
          <ENU>Use table A1</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Z" ESA_ID="" Type="Double" Value="1.6" Precision="2">
        <Description TranslateID="VARIABLE_Z">
          <ENU>Coefficient according table B1</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZoneBS" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description TranslateID="VARIABLE_ZoneBS">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZoneCSN" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_ZoneCSN">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZoneDIN" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description TranslateID="VARIABLE_ZoneDIN">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZoneELOT" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ZoneELOT">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZoneIS" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_ZoneIS">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZoneNF" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_ZoneNF">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZonePN" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_ZonePN">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZoneSIST" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_ZoneSIST">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZoneSR" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_ZoneSR">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZoneSTN" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ZoneSTN">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ" ESA_ID="" Type="Double" Value="2000" Precision="2">
        <Description TranslateID="VARIABLE_γ">
          <ENU>Weight of snow</ENU>
        </Description>
        <Unit m="-2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓1←" ESA_ID="Result.3" Type="Double" Value="800e-3" Precision="2">
        <Description TranslateID="VARIABLE_μ↓1←">
          <ENU>Shape coefficient of the load</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓2←" ESA_ID="Result.4" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_μ↓2←">
          <ENU>Shape coefficient of the load</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
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
      <VC ID="INI400_006774">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006775">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006776">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006777">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006778">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006779">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006780">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006781">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006782">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006783">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006784">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006785">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006786">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006787">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006788">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006789">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006790">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006791">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006792">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006793">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006794">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006795">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006796">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006797">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006798">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006799">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006800">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006801">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006802">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006803">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006804">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006805">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006806">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006807">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006808">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006809">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006810">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006811">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006812">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006813">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006814">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006815">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006816">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006817">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006818">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006819">
        <Set Vis="1" Prev="" Style="0" StyleName="Check, follow dX 5, bold" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Check, follow dX 5, bold" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Check, follow dX 5, bold" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006820">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006821">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006822">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006823">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006824">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006825">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006826">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006827">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006828">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006829">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006830">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006831">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006832">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006833">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006834">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006835">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006836">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006837">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006838">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006839">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006840">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006841">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006842">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006843">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006844">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006845">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006846">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006847">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006848">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006849">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006850">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006851">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006852">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006854">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006856">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006857">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="1" Y="0" Hor="0" Ver="4" SpX="1" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="1" Y="0" Hor="0" Ver="4" SpX="1" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="1" Y="0" Hor="0" Ver="4" SpX="1" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006858">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006860">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006862">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006864">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006866">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006867">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="778" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="778" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="778" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006868">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006869">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="574" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="574" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="574" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006870">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006871">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006872">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006873">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006874">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006875">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006876">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006877">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006878">
        <Set Vis="1" Prev="INI400_006600" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006600" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006600" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006879">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006880">
        <Set Vis="1" Prev="INI400_006602" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006602" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006602" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006881">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006882">
        <Set Vis="1" Prev="INI400_006603" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006603" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006603" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006883">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006884">
        <Set Vis="1" Prev="INI400_006605" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006605" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006605" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006885">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006886">
        <Set Vis="1" Prev="INI400_006607" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006607" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006607" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006887">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006888">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006889">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006890">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006891">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006892">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006893">
        <Set Vis="1" Prev="INI400_006613" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006613" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006613" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006894">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006895">
        <Set Vis="1" Prev="INI400_006616" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006616" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006616" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006896">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006897">
        <Set Vis="1" Prev="INI400_006618" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006614" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006898">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006899">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006900">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006901">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006902">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006903">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006904">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006905">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006906">
        <Set Vis="1" Prev="INI400_006628" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006628" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006628" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006907">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006908">
        <Set Vis="1" Prev="INI400_006630" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006630" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006630" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006909">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006910">
        <Set Vis="1" Prev="INI400_006632" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006632" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006632" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006911">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006912">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006913">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006914">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006915">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006916">
        <Set Vis="1" Prev="INI400_006643" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006643" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006643" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006917">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006918">
        <Set Vis="1" Prev="INI400_006645" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006644" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006919">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006920">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006921">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006922">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006923">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006924">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006925">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006926">
        <Set Vis="1" Prev="INI400_006653" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006653" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006653" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006927">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006928">
        <Set Vis="1" Prev="INI400_006655" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006655" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006655" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006929">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006930">
        <Set Vis="1" Prev="INI400_006657" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006657" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006657" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006931">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006932">
        <Set Vis="1" Prev="INI400_006659" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006659" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006659" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006933">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006934">
        <Set Vis="1" Prev="INI400_006661" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006661" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006661" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006935">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006936">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006937">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006938">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006939">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006940">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006941">
        <Set Vis="1" Prev="INI400_006667" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006667" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006667" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006942">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006943">
        <Set Vis="1" Prev="INI400_006670" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006670" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006670" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006944">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006945">
        <Set Vis="1" Prev="INI400_006672" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006668" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006946">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006947">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006948">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006949">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006950">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006951">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006952">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006953">
        <Set Vis="1" Prev="INI400_006679" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006679" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006679" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006954">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006955">
        <Set Vis="1" Prev="INI400_006681" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006681" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006681" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006956">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006957">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006958">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006959">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006960">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006961">
        <Set Vis="1" Prev="INI400_006686" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006686" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006686" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006962">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006963">
        <Set Vis="1" Prev="INI400_006690" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006687" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006964">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="250" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006965">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006966">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006967">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006968">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006969">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006970">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006971">
        <Set Vis="1" Prev="INI400_006698" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006698" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006698" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006972">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006973">
        <Set Vis="1" Prev="INI400_006700" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006700" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006700" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006974">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006975">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006976">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006977">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006978">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006979">
        <Set Vis="1" Prev="INI400_006706" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006706" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006706" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006980">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006981">
        <Set Vis="1" Prev="INI400_006708" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006707" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006982">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="250" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006983">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006984">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006985">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006986">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006987">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006988">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006989">
        <Set Vis="1" Prev="INI400_006716" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006716" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006716" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006990">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006991">
        <Set Vis="1" Prev="INI400_006722" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006722" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006722" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006992">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006993">
        <Set Vis="1" Prev="INI400_006718" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006718" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006718" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006994">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006995">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006996">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006997">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006998">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006999">
        <Set Vis="1" Prev="INI400_006726" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006726" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006726" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007000">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007001">
        <Set Vis="1" Prev="INI400_006728" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006727" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007002">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="250" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007003">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007004">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007005">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="50" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007006">
        <Set Vis="1" Prev="INI400_000015" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000015" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000015" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007007">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="71" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007008">
        <Set Vis="1" Prev="INI400_000013" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000013" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000013" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="92" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="92" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="92" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007009">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="108" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="108" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="108" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007010">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="125" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|10.4|0|2" Font2="Arial|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="125" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|10.4|0|2" Font2="Arial|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="125" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|10.4|0|2" Font2="Arial|10.4|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007011">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007012">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="108" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="108" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="108" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007013">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="125" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|10.4|0|2" Font2="Arial|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="125" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|10.4|0|2" Font2="Arial|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="125" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|10.4|0|2" Font2="Arial|10.4|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007014">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007015">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="482" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="482" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="482" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="493" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="493" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="493" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007016">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="597" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="597" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="597" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007017">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007018">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007019">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="627" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="627" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="627" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007020">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="639" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="639" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="639" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007021">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="654" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="654" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="654" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007022">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="624" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="624" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="624" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007023">
        <Set Vis="1" Prev="INI400_000035" Style="0" StyleName="Standard, dY 40" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000035" Style="0" StyleName="Standard, dY 40" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000035" Style="0" StyleName="Standard, dY 40" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="686" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="686" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="686" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007024">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="705" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="705" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="705" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007025">
        <Set Vis="1" Prev="INI400_000043" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000043" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000043" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007026">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="751" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007027">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007028">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="651" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13|4|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="651" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13|4|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="651" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13|4|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="727" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="727" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="727" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007029">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="651" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="756" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="756" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="756" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007030">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000034" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="775" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007031">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="802" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="802" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="802" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007032">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="733" Hor="0" Ver="4" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007033">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="695" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13.4|2|2" Font2="Arial|13.4|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="695" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13.4|2|2" Font2="Arial|13.4|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="804" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|10.4|0|2" Font2="Arial|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="804" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|10.4|0|2" Font2="Arial|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="804" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|10.4|0|2" Font2="Arial|10.4|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007034">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
      </VC>
      <VC ID="INI400_007035">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
      </VC>
      <VC ID="INI400_007036">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
      </VC>
      <VC ID="INI400_007037">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="23" />
      </VC>
      <VC ID="INI400_007038">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
      </VC>
      <VC ID="INI400_007039">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
      </VC>
      <VC ID="INI400_007040">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
      </VC>
      <VC ID="INI400_007041">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="20" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="Obstruction" Content="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" />
      <Image Name="Obstruction1" Content="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" />
      <Image Name="Obstruction2" Content="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" />
      <Image Name="Obstruction3" Content="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" />
      <Image Name="Obstruction4" Content="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" />
      <Image Name="Obstruction5" Content="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" />
      <Image Name="Obstruction6" Content="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" />
      <Image Name="BG" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="622">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="5" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts>
          <ENU>Design settings</ENU>
        </Texts>
        <TGroupBox Name="par" ID="60" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000060">
            <ENU>Parameters of the snow load</ENU>
          </Texts>
          <TComboBox Name="Town0ONORM" ID="12" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town0ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3" Index="0">
            <Texts>
              <ENU>Neuwaldegg|Sievering|Simmering|Stephansplatz</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="A_4_1_1" ID="28" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="s_k_0" ID="26" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="s↓k,0←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TLabel Name="ZoneNEN" ID="37" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="28" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
            <Texts TranslateID="DIALOG_000037">
              <ENU>One snow load in the whole country</ENU>
            </Texts>
          </TLabel>
          <TComboBox Name="ZoneNF" ID="27" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="19" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneNF" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7" Index="3">
            <Texts>
              <ENU>A1|A2|B1|B2|C1|C2|D|E</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town7ONORM" ID="19" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town7ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33" Index="0">
            <Texts>
              <ENU>Ehrwald|Fulpmes|Hall in Tirol|Hintertux|Holzgau|Ischgl|Imst|Innsbruck|Jenbach|Kitzbühel|Kufstein|Landeck|Lienz|Matrei/Osttirol|Mayrhofen|Obergurgl|Pertisau|Reutte|St. Anton/Arlberg|St. Christoph/Arlberg|St. Jakob/Defereggental|St. Leonhard/Pitztal|St. Johann|Schwaz|Seefeld|Serfaus|Sillian|Sölden|Steinach/Brenner|Tannheim|Telfs|Wörgl|Virgen|Zell/Ziller</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town6ONORM" ID="18" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town6ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28" Index="0">
            <Texts>
              <ENU>Arnoldstein|Bad Kleinkirchheim|Bleiburg|Eisenkappel|Feldkirchen|Ferlach|Friesach|Gmünd|Gurk|Heiligenblut|Hermagor|Klagenfurt|Kötschach|Lavamünd|Mallnitz|Millstatt|Nassfeld|Oberdrauburg|Obervellach|Radenthein|Rennweg|St. Andrä/Lavantal|St. Lorenzen/Lesachtal|St. Veit/Glan|Spittal/Drau|Velden|Villach|Völkermarkt|Wolfsberg</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town1ONORM" ID="13" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town1ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45" Index="0">
            <Texts>
              <ENU>Amstetten|Baden|Bad Vöslau|Deutsch-Wagram|Fischamend|Gänserndorf|Gmünd|Großenzersdorf|Gumpoldskirchen|Hainburg|Hollabrunn|Horn|Klosterneuburg|Korneuburg|Krems|Langenlois|Lilienfeld|Marchegg|Melk/Donau|Mistelbach|Mödling|Mönichkirchen|Neunkirchen|Perchtoldsdorf|Pottenstein|Poysdorf|Puchberg/Schneeberg|Purkersdorf|Reichenau/Rax|Retz|St. Pölten|Scheibbs|Schwechat|Semmering|Sollenau|Stockerau|Ternitz|Traiskirchen|Tulln|Waidhofen/Thaya|Waidhofen/Ybbs|Wiener Neustadt|Wilhelmsburg|Wolkersdorf|Zistersdorf|Zwettl</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town2ONORM" ID="14" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town2ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11" Index="0">
            <Texts>
              <ENU>Andau|Bad Tatzmannsdorf|Eisenstadt|Güssing|Jennersdorf|Mattersburg|Neusiedl/See|Oberpullendorf|Oberwart|Pinkafeld|Rust|St. Michael</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town3ONORM" ID="15" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town3ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41" Index="0">
            <Texts>
              <ENU>Admont|Bad Aussee|Bad Gleichenberg|Bad Mitterndorf|Birkfeld|Bruck/Mur|Deutschlandsberg|Eibiswald|Eisenerz|Feldbach|Fohnsdorf|Friedberg|Frohnleiten|Fürstenfeld|Gleisdorf|Graz – Zentrum|Graz – Liebenau|Gröbming|Hartberg|Hieflau|Judenburg|Kapfenberg|Knittelfeld|Köflach|Leibnitz|Leoben|Liezen|Mariazell|Murau|Mureck|Mürzzuschlag|Bad Radkersburg|Schladming|Seckau|Stainz|St. Nikolai/Sölktal|Trieben|Voitsberg|Wald/Schoberpaß|Weiz|Wildon|Zeltweg</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town4ONORM" ID="16" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town4ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33" Index="0">
            <Texts>
              <ENU>Aigen|Bad Goisern|Bad Leonfelden|Bad Ischl|Braunau|Ebensee|Eferding|Enns|Freistadt|Gmunden|Gosau|Grein|Grieskirchen|Grünau|Hallstatt|Hinterstoder|Kremsmünster|Linz|Mattighofen|Mondsee|Obertraun|Reichersberg/Inn|Ried/Innkreis|Rohrbach/Mühlviertel|St. Wolfgang|Schärding|Schwanenstadt|Spital/Phyrn|Steyr|Traun|Vöcklabruck|Wels|Weyer|Windischgarsten</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town5ONORM" ID="17" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town5ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30" Index="0">
            <Texts>
              <ENU>Abtenau|Bad Hofgastein|Badgastein|Bischofshofen|Fuschl/See|Golling|Hallein|Kaprun|Krimml|Lofer|Mattsee|Mauterndorf|Mittersill|Mühlbach/Hochkönig|Oberndorf|Obertauern|Radstadt|Rauris|Saalbach|Saalfelden|Salzburg – Zentrum|Salzburg – Anif|Salzburg – Parsch|St. Michael i. Lungau|St. Johann i. Pongau|Strobl|Tamsweg|Unken|Wagrain|Werfen|Zell/See</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town8ONORM" ID="20" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town8ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16" Index="0">
            <Texts>
              <ENU>Bezau|Bludenz|Bregenz|Dornbirn|Egg|Feldkirch|Gargellen|Götzis|Hohenems|Langen|Lech|Lustenau|Mittelberg|Partenen|Schruns|Warth|Zürs</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ObstructionType" ID="64" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ObstructionType" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="390" Values="0|1|2|3|4|5" Index="0">
            <Texts TranslateID="DIALOG_000064">
              <ENU>Obstruction on flat roof|Canopy over door or loading bay|Obstruction on pitched or curved roof|Snow behind parapet; flat roof|Snow in valley behind parapet at gable end|Snow behind parapet at eaves; pitched or curved roof</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneBS" ID="25" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneBS" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="1|2|3|4|5|6.5" Index="3">
            <Texts TranslateID="DIALOG_000025">
              <ENU>Zone 1|Zone 2|Zone 3|Zone 4|Zone 5|Zone 6,5</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneDIN" ID="29" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneDIN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="4">
            <Texts>
              <ENU>1|1a|2|2a|3</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneELOT" ID="30" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneELOT" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="0">
            <Texts>
              <ENU>A|B|C</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="StateONORM" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="StateONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8" Index="0">
            <Texts TranslateID="DIALOG_000011">
              <ENU>Wien|Niederösterreich|Burgenland|Steiermark|Oberösterreich|Salzburg|Kärnten|Tirol|Vorarlberg</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneCSN" ID="8" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneCSN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7" Index="3">
            <Texts>
              <ENU>I|II|III|IV|V|VI|VII|VIII</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneIS" ID="31" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneIS" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="1|2|3" Index="1">
            <Texts>
              <ENU>1|2|3</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZonePN" ID="32" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZonePN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="2">
            <Texts>
              <ENU>1|2|3|4|5</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneSR" ID="33" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneSR" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="2">
            <Texts>
              <ENU>1|2|3</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneSTN" ID="34" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneSTN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="0">
            <Texts>
              <ENU>1|2|3|4|5</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneSIST" ID="35" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneSIST" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="2">
            <Texts>
              <ENU>A1|A2|A3|A4|M1</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="ZONORM" ID="22" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Z" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="4.5" MinValueWithDim="1.6" DescPos="1" />
          <TCheckBox Name="UseTableA1" ID="21" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="UseTableA1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000021">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="Exposure_group" ID="61" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000061">
            <ENU>Exposure coefficient</ENU>
          </Texts>
          <TComboBox Name="Topography" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Topography" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="1">
            <Texts TranslateID="DIALOG_000004">
              <ENU>Windswept|Normal|Sheltered</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="TopographyNF" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="TopographyNF" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="275" Values="0|1" Index="0">
            <Texts TranslateID="DIALOG_000036">
              <ENU>Snow moving by wind is suppresed|Other cases</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
        <TGroupBox Name="Thermal_group" ID="62" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000062">
            <ENU>Thermal coefficient</ENU>
          </Texts>
          <TDoubleInput Name="U" ID="41" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="U" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="4.5" MinValueWithDim="1" DescPos="1" />
          <TDoubleInput Name="C_t0" ID="38" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓t,0←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="t_i" ID="40" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="t↓i←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="18" MinValueWithDim="5" DescPos="1" />
          <TComboBox Name="ObjectSTN" ID="42" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ObjectSTN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="0">
            <Texts>
              <ENU>1|2|3</ENU>
            </Texts>
          </TComboBox>
          <TCheckBox Name="FormCt" ID="39" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="FormCt" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000039">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="24" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000024">
            <ENU>Roof geometry</ENU>
          </Texts>
          <TDoubleInput Name="b2_0" ID="66" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="b↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="b1_0" ID="65" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="b↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="h_1" ID="69" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="h_standard" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="h2_0" ID="68" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="h1_0" ID="67" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="b_standard" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="b" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="Annex_calc_group" ID="76" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000076">
            <ENU>Annex calculation</ENU>
          </Texts>
          <TCheckBox Name="AnnexB4" ID="63" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="AnnexB4" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000063">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
      </TPanel>
      <TPanel Name="" ID="71" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts TranslateID="DIALOG_000071">
          <ENU>General settings</ENU>
        </Texts>
        <TGroupBox Name="" ID="72" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000072">
            <ENU>Layout blocks</ENU>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Dim" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000005">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="UnitLoad" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000006">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="75" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000075">
            <ENU>Headline settings</ENU>
          </Texts>
          <TStringInput Name="TStringInput" ID="7" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000004">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="20" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Headline" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000020">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000046">
            <ENU>National Annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Czech CSN-EN">
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
        </TGroupBox>
      </TPanel>
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_INI400_006872">
      <ENU>"Obstruction on flat roof"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006875">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006889">
      <ENU>"Calculation of the snow load"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006899">
      <ENU>"Canopy over door or loading bay"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006902">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006913">
      <ENU>"Calculation of the snow load"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006920">
      <ENU>"Obstruction on pitched or curved roof"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006923">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006937">
      <ENU>"Calculation of the snow load"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006947">
      <ENU>"Snow behind parapet, flat roof"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006950">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006958">
      <ENU>"Calculation of the snow load"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006965">
      <ENU>"Snow in valley behind parapet at gable end"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006968">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006976">
      <ENU>"Calculation of the snow load"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006983">
      <ENU>"Snow behind parapet at eaves, pitched or curved roof"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006986">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006996">
      <ENU>"Calculation of the snow load"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007003">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007017">
      <ENU>"Calculation of the snow load"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006818">
      <ENU>"Snow drifting at projections and obstructions according to"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006819">
      <ENU>IO.SetupNA.EC_1991_1_3.Name</ENU>
    </Item>
    <Item ID="TEXT_INI400_006820">
      <ENU>Caption</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006871">
      <ENU>"Annex B is used"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006876">
      <ENU>"The distance from the obstruction to the left"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006877">
      <ENU>"b↓1← = " &amp; b↓1← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006878">
      <ENU>"The distance from the obstruction to the right"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006879">
      <ENU>"b↓2← = " &amp; b↓2← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006880">
      <ENU>"Height the obstruction from the left"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006881">
      <ENU>"h↓1← = " &amp; h↓1← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006882">
      <ENU>"Height the obstruction from the right"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006883">
      <ENU>"h↓2← = " &amp; h↓2← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006884">
      <ENU>"Drift length from the left"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006886">
      <ENU>"Drift length from the right"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006890">
      <ENU>"Shape coefficients"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006893">
      <ENU>"Weight of the snow on the left"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006895">
      <ENU>"Weight of the snow on the right"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006897">
      <ENU>"Weight of the snow at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006903">
      <ENU>"Length of the canopy or loading bay"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006904">
      <ENU>"b↓1← = " &amp; b↓1← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006905">
      <ENU>"b↓1← have to be lesser or equal to 5 m!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006906">
      <ENU>"Length of the building"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006907">
      <ENU>"b↓2← = " &amp; b↓2← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006908">
      <ENU>"Height from canopy to eaves"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006909">
      <ENU>"h = " &amp; h &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006910">
      <ENU>"Drift length from the left"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006914">
      <ENU>"Shape coefficients"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006916">
      <ENU>"Weight of the snow on the canopy"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006918">
      <ENU>"Weight of the snow at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006924">
      <ENU>"The distance from the obstruction to the left"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006925">
      <ENU>"b↓1← = " &amp; b↓1← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006926">
      <ENU>"The distance from the obstruction to the right"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006927">
      <ENU>"b↓2← = " &amp; b↓2← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006928">
      <ENU>"Height the obstruction from the left"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006929">
      <ENU>"h↓1← = " &amp; h↓1← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006930">
      <ENU>"Height the obstruction from the right"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006931">
      <ENU>"h↓2← = " &amp; h↓2← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006932">
      <ENU>"Drift length from the left"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006934">
      <ENU>"Drift length from the right"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006938">
      <ENU>"Shape coefficients"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006941">
      <ENU>"Weight of the snow on the left"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006943">
      <ENU>"Weight of the snow on the right"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006945">
      <ENU>"Weight of the snow at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006951">
      <ENU>"Width of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006952">
      <ENU>"b↓1← = " &amp; b↓1← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006953">
      <ENU>"Height of the parapet"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006954">
      <ENU>"h = " &amp; h &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006955">
      <ENU>"Drift length"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006959">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006961">
      <ENU>"Weight of the snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006963">
      <ENU>"Weight of the snow at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006969">
      <ENU>"Width of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006970">
      <ENU>"b↓1← = " &amp; b↓1← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006971">
      <ENU>"Height of the parapet"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006972">
      <ENU>"h = " &amp; h &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006973">
      <ENU>"Drift length"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006977">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006979">
      <ENU>"Weight of the snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006981">
      <ENU>"Weight of the snow at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006987">
      <ENU>"Width of the roof to the ridge"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006988">
      <ENU>"b↓1← = " &amp; b↓1← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006989">
      <ENU>"Width of the whole roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006990">
      <ENU>"b↓2← = " &amp; b↓2← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006991">
      <ENU>"Height of the parapet"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006992">
      <ENU>"h = " &amp; h &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006993">
      <ENU>"Drift length"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006997">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006999">
      <ENU>"Weight of the snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007001">
      <ENU>"Weight of the snow at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007004">
      <ENU>"Width of the roof from the obstruction"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007005">
      <ENU>"b = " &amp; b &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007006">
      <ENU>"Height of the obstruction"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007007">
      <ENU>"h = " &amp; h &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007008">
      <ENU>"Width of the roof loaded by drifting"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007010">
      <ENU>"Minimal value of l↓s← is 5.0 m. l↓s← is set at minimal value."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007013">
      <ENU>"Maximal value of l↓s← is 15.0 m. l↓s← is set at maximal value."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007018">
      <ENU>"Shape coefficients"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007023">
      <ENU>"Weight of the snow load by the obstruction"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007025">
      <ENU>"Weight of the snow in the distance l↓s←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007028">
      <ENU>"Weight of the snow in the distance b"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007030">
      <ENU>"Weight of the snow at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007033">
      <ENU>"Width of the roof is lesser, than weight of the drifting"</ENU>
    </Item>
  </Texts>
</Root>