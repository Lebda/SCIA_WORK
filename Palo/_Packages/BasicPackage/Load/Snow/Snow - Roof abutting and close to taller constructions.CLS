<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="0c268412-a1c6-49e9-831b-06085d5f4566">
  <CodeEditor>
    <SourceCode Collapsed="0" BreakPoints="">void UpdateDialog() { 
    Dialog.GetComponentByName("par").Visible →INI400_006458= IO.SetupNA.EC_NA.Code != "STD"; 
    Dialog.GetComponentByName("StateONORM").Visible →INI400_006388= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town0ONORM").Visible →INI400_006389= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 0 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town1ONORM").Visible →INI400_006390= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 1 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town2ONORM").Visible →INI400_006391= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 2 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town3ONORM").Visible →INI400_006392= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 3 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town4ONORM").Visible →INI400_006393= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 4 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town5ONORM").Visible →INI400_006394= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 5 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town6ONORM").Visible →INI400_006395= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 6 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town7ONORM").Visible →INI400_006396= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 7 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("Town8ONORM").Visible →INI400_006397= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; StateONORM == 8 &amp;&amp; UseTableA1; 
    Dialog.GetComponentByName("UseTableA1").Visible →INI400_006403= IO.SetupNA.EC_NA.Code == "ONORM"; 
    Dialog.GetComponentByName("ZONORM").Visible →INI400_006402= IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; !UseTableA1; 
    Dialog.GetComponentByName("ZoneBS").Visible →INI400_006404= IO.SetupNA.EC_NA.Code == "BS"; 
    Dialog.GetComponentByName("ZoneCSN").Visible →INI400_006380= IO.SetupNA.EC_NA.Code == "CSN"; 
    Dialog.GetComponentByName("s_k_0").Visible →INI400_006407= ((IO.SetupNA.EC_NA.Code == "CSN" &amp;&amp; ZoneCSN == 7) || IO.SetupNA.EC_NA.Code == "SFS"); 
    Dialog.GetComponentByName("ZoneNF").Visible →INI400_006408= IO.SetupNA.EC_NA.Code == "NF"; 
    Dialog.GetComponentByName("A_4_1_1").Visible →INI400_006381= ((IO.SetupNA.EC_NA.Code == "ONORM" &amp;&amp; !UseTableA1) || IO.SetupNA.EC_NA.Code == "STN" || IO.SetupNA.EC_NA.Code == "NBN" || IO.SetupNA.EC_NA.Code == "BS" || IO.SetupNA.EC_NA.Code == "NF" || IO.SetupNA.EC_NA.Code == "DIN" || IO.SetupNA.EC_NA.Code == "ELOT" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "LU" || IO.SetupNA.EC_NA.Code == "PN" || IO.SetupNA.EC_NA.Code == "SR" || IO.SetupNA.EC_NA.Code == "SIST"); 
    Dialog.GetComponentByName("ZoneDIN").Visible →INI400_006409= IO.SetupNA.EC_NA.Code == "DIN"; 
    Dialog.GetComponentByName("ZoneELOT").Visible →INI400_006410= IO.SetupNA.EC_NA.Code == "ELOT"; 
    Dialog.GetComponentByName("ZoneIS").Visible →INI400_006411= IO.SetupNA.EC_NA.Code == "IS"; 
    Dialog.GetComponentByName("ZonePN").Visible →INI400_006412= IO.SetupNA.EC_NA.Code == "PN"; 
    Dialog.GetComponentByName("ZoneSR").Visible →INI400_006413= IO.SetupNA.EC_NA.Code == "SR"; 
    Dialog.GetComponentByName("ZoneSTN").Visible →INI400_006414= IO.SetupNA.EC_NA.Code == "STN"; 
    Dialog.GetComponentByName("ZoneSIST").Visible →INI400_006415= IO.SetupNA.EC_NA.Code == "SIST"; 
    Dialog.GetComponentByName("ZoneNEN").Visible →INI400_006416= IO.SetupNA.EC_NA.Code == "NEN"; 
    Dialog.GetComponentByName("Topography").Visible →INI400_006417= (IO.SetupNA.EC_NA.Code == "CSN" || IO.SetupNA.EC_NA.Code == "ELOT" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "PN" || IO.SetupNA.EC_NA.Code == "SR" || IO.SetupNA.EC_NA.Code == "STN" || IO.SetupNA.EC_NA.Code == "SIST"); 
    Dialog.GetComponentByName("TopographyNF").Visible →INI400_006419= IO.SetupNA.EC_NA.Code == "NF"; 
    Dialog.GetComponentByName("C_t0").Visible →INI400_006433= (IO.SetupNA.EC_NA.Code == "CSN" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "SFS" || (IO.SetupNA.EC_NA.Code == "STN" &amp;&amp; ObjectSTN == 0)); 
    Dialog.GetComponentByName("FormCt").Visible →INI400_006435= IO.SetupNA.EC_NA.Code == "PN"; 
    Dialog.GetComponentByName("t_i").Visible →INI400_006436= IO.SetupNA.EC_NA.Code == "PN" &amp;&amp; FormCt; 
    Dialog.GetComponentByName("U").Visible →INI400_006437= IO.SetupNA.EC_NA.Code == "PN" &amp;&amp; FormCt; 
    Dialog.GetComponentByName("ObjectSTN").Visible →INI400_006438= IO.SetupNA.EC_NA.Code == "STN"; 
    Dialog.GetComponentByName("Exposure_group").Visible →INI400_006517= (IO.SetupNA.EC_NA.Code == "CSN" || IO.SetupNA.EC_NA.Code == "ELOT" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "PN" || IO.SetupNA.EC_NA.Code == "SR" || IO.SetupNA.EC_NA.Code == "STN" || IO.SetupNA.EC_NA.Code == "SIST" || IO.SetupNA.EC_NA.Code == "NF"); 
    Dialog.GetComponentByName("Thermal_group").Visible →INI400_006518= (IO.SetupNA.EC_NA.Code == "CSN" || IO.SetupNA.EC_NA.Code == "IS" || IO.SetupNA.EC_NA.Code == "SFS" || IO.SetupNA.EC_NA.Code == "STN" || IO.SetupNA.EC_NA.Code == "PN"); 
    Dialog.GetComponentByName("Alpine").Visible →INI400_006501= IO.SetupNA.EC_NA.Code == "DIN"; 
    Dialog.GetComponentByName("gamma").Visible →INI400_006477= IO.SetupNA.EC_NA.Code == "DIN"; 
    Dialog.GetComponentByName("Drifting_group").Visible →INI400_006606= IO.SetupNA.EC_NA.Code == "DIN"; 
    Dialog.GetComponentByName("AnnexB3").Visible →INI400_006506= UseAnnexB; 
} 

→INI400_006607BLOCK { //Set of Result on 0
    s →INI400_006608= 0; S →INI400_006609= 0; μ↓2← →INI400_006610= 0; μ↓3← →INI400_006611= 0; μ↓s← →INI400_006612= 0; 
    s↓1← →INI400_006613= 0; s↓k← →INI400_006614= 0; s↓s← →INI400_006615= 0; s↓w← →INI400_006616= 0; s↓2← →INI400_006617= 0; 
} 

IF(Headline) { 
    →INI400_000140TEXT("Snow load on the roof abutting and close to taller construction works acc to"); 
    →INI400_006441TEXT(IO.SetupNA.EC_1991_1_3.Name); 
} 
IF(PrintCaption) { 
    →INI400_000002TEXT(Caption); 
} 

//-----------calculation------------
object SnowCoeff →INI400_006334= LoadExternCLC("Coefficients for the snow load.CLC"); 
SnowCoeff.A →INI400_006342= double A; 
SnowCoeff.C↓t,0← →INI400_006344= double C↓t,0←; 
SnowCoeff.FormCt →INI400_006345= bool FormCt; 
SnowCoeff.ObjectSTN →INI400_006346= double ObjectSTN; 
SnowCoeff.s↓k,0← →INI400_006347= double s↓k,0←; 
SnowCoeff.StateONORM →INI400_006348= double StateONORM; 
SnowCoeff.t↓i← →INI400_006349= double t↓i←; 
SnowCoeff.Topography →INI400_006350= double Topography; 
SnowCoeff.TopographyNF →INI400_006351= double TopographyNF; 
SnowCoeff.Town0ONORM →INI400_006352= double Town0ONORM; 
SnowCoeff.Town1ONORM →INI400_006353= double Town1ONORM; 
SnowCoeff.Town2ONORM →INI400_006354= double Town2ONORM; 
SnowCoeff.Town3ONORM →INI400_006355= double Town3ONORM; 
SnowCoeff.Town4ONORM →INI400_006356= double Town4ONORM; 
SnowCoeff.Town5ONORM →INI400_006357= double Town5ONORM; 
SnowCoeff.Town6ONORM →INI400_006358= double Town6ONORM; 
SnowCoeff.Town7ONORM →INI400_006359= double Town7ONORM; 
SnowCoeff.Town8ONORM →INI400_006360= double Town8ONORM; 
SnowCoeff.U →INI400_006361= double U; 
SnowCoeff.UseTableA1 →INI400_006465= bool UseTableA1; 
SnowCoeff.Z →INI400_006362= double Z; 
SnowCoeff.ZoneBS →INI400_006363= double ZoneBS; 
SnowCoeff.ZoneCSN →INI400_006364= double ZoneCSN; 
SnowCoeff.ZoneDIN →INI400_006365= double ZoneDIN; 
SnowCoeff.ZoneELOT →INI400_006366= double ZoneELOT; 
SnowCoeff.ZoneIS →INI400_006367= double ZoneIS; 
SnowCoeff.ZoneNF →INI400_006368= double ZoneNF; 
SnowCoeff.ZonePN →INI400_006369= double ZonePN; 
SnowCoeff.ZoneSIST →INI400_006370= double ZoneSIST; 
SnowCoeff.ZoneSR →INI400_006371= double ZoneSR; 
SnowCoeff.ZoneSTN →INI400_006372= double ZoneSTN; 
SnowCoeff.Headline →INI400_006467= false; 
SnowCoeff.B1 →INI400_006469= false; 
→INI400_006335SnowCoeff.Draw(false); 
double C↓e← →INI400_006374= SnowCoeff.C↓e←; 
double C↓esl← →INI400_006375= SnowCoeff.C↓esl←; 
double C↓t← →INI400_006376= SnowCoeff.C↓t←; 
double s↓k← →INI400_006377= SnowCoeff.s↓k←; 

→INI400_006496PAGEBREAK(); 
//NA.2.20 Clause 5.3.6 Cylindrical roofs, Paragraph (1)
object Clause5_3_6_1 →INI400_006311= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1991\EN_1991_1_3\Clause_5.3.6(1).CLC"); 
Clause5_3_6_1.ZoneCSN →INI400_006320= double ZoneCSN; 
Clause5_3_6_1.A →INI400_006497= b↓2←*c; 
Clause5_3_6_1.Alpine →INI400_006499= bool Alpine; 
Clause5_3_6_1.s↓k← →INI400_006473= double s↓k←; 
Clause5_3_6_1.γ →INI400_006474= double γ; 
Clause5_3_6_1.μ↓s← →INI400_006475= double μ↓s←; 
→INI400_006314Clause5_3_6_1.Draw(false); 
double μ↓W,min← →INI400_006317= Clause5_3_6_1.μ↓W,min←; 
double μ↓W,max← →INI400_006318= Clause5_3_6_1.μ↓W,max←; 
double l↓s,min← →INI400_006462= Clause5_3_6_1.l↓s,min←; 
double l↓s,max← →INI400_006463= Clause5_3_6_1.l↓s,max←; 

//NA.2.21 Clause 5.3.6 Roof abutting and close to taller construction works - Using B annex, Paragraph (3)
object Clause5_3_6_3 →INI400_006556= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1991\EN_1991_1_3\Clause_5.3.6(3).CLC"); 
Clause5_3_6_3.A →INI400_006590= double A; 
→INI400_006557Clause5_3_6_3.Calculate(false); 
bool UseAnnexB →INI400_006297= Clause5_3_6_3.UseAnnexB; 
IF(!UseAnnexB) { 
    AnnexB3 →INI400_006558= False; 
} 

IF(AnnexB3) { 
    →INI400_006594BLOCK("Calculation of the snow load") { 
        IF(Undrifted) { 
            →INI400_006595BLOCK("Case 1 - Undrifted snow") { 
                →INI400_006526IMG("TallerConstr_Case_I_AnnexB"); 
                →INI400_006588BLOCK { 
                    IF(Dim) { 
                        →INI400_006596BLOCK("Dimensions of the construction") { 
                            →INI400_006528TEXT(Description("α")); 
                            →INI400_006529TEXT("α = " &amp; α &amp; " °"); 
                            →INI400_006530TEXT(Description("b↓2←")); 
                            →INI400_006531TEXT("b↓2← = " &amp; b↓2← &amp; " m"); 
                            →INI400_006534TEXT(Description("b↓1←")); 
                            →INI400_006535TEXT("b↓1← = " &amp; b↓1← &amp; " m"); 
                            →INI400_006536TEXT(Description("h")); 
                            →INI400_006537TEXT("h = " &amp; h &amp; " m"); 
                        } 
                    } 
                } 
                →INI400_006538TEXT(Description("μ↓1←")); 
                μ↓1← →INI400_006539= 0.8; 
                →INI400_006540TEXT("Surface weight at the lower roof"); 
                s →INI400_006541= μ↓1←*C↓e←*C↓t←*s↓k←; 
                IF(UnitLoad) { 
                    →INI400_006542TEXT("Total weight at unit lenght of the roof"); 
                    S →INI400_006543= s*b↓2←; 
                } 
                →INI400_006523PAGEBREAK(); 
            } 
        } 
        IF(Drifted) { 
            →INI400_006597BLOCK("Case 2 - Drifted snow") { 
                →INI400_006559IMG("TallerConstr_AnnexB"); 
                →INI400_006560PAGEBREAK(); 
                IF(Dim) { 
                    →INI400_006598BLOCK("Dimensions of the construction") { 
                        →INI400_006562TEXT(Description("α↓1←")); 
                        →INI400_006563TEXT("α↓1← = " &amp; α↓1← &amp; " °"); 
                        →INI400_006564TEXT(Description("c")); 
                        →INI400_006565TEXT("c = " &amp; c &amp; " m"); 
                        →INI400_006566TEXT(Description("b↓2←")); 
                        →INI400_006567TEXT("b↓2← = " &amp; b↓2← &amp; " m"); 
                        →INI400_006568TEXT(Description("b↓1←")); 
                        →INI400_006569TEXT("b↓1← = " &amp; b↓1← &amp; " m"); 
                        →INI400_006570TEXT(Description("h↓1←")); 
                        →INI400_006571TEXT("h↓1← = " &amp; h↓1← &amp; " m"); 
                        →INI400_006572TEXT(Description("l↓s←")); 
                        l↓s← →INI400_006573= MIN(5*h↓1←, b↓1←, l↓s,max←); 
                        →INI400_006574PAGEBREAK(); 
                    } 
                } 
                →INI400_006599BLOCK("Shape coefficients") { 
                    μ↓3← →INI400_006576= MIN(2*h↓1←/CUnit(s↓k←, "kN/m↑2←"), 2*MAX(b↓1←, b↓2←)/l↓s←, 8); 
                    
                    IF(α↓1← &lt;= 15) { 
                        μ↓1← →INI400_006577= μ↓3←; 
                        μ↓2← →INI400_006578= μ↓3←; 
                    } ELSE { 
                        IF(α↓1← &lt;= 30) { 
                            μ↓1← →INI400_006579= μ↓3←*((30-α↓1←)/15); 
                            μ↓2← →INI400_006580= μ↓3←; 
                        } ELSE { 
                            IF(α↓1← &lt;= 60) { 
                                μ↓1← →INI400_006581= 0; 
                                μ↓2← →INI400_006582= μ↓3←*((60-α↓1←)/30); 
                            } ELSE { 
                                μ↓1← →INI400_006583= 0; 
                                μ↓2← →INI400_006584= 0; 
                            } 
                        } 
                    } 
                    
                    →INI400_006585TEXT("Snow load near the higher wall"); 
                    s↓1← →INI400_000082= μ↓1←*C↓e←*C↓t←*s↓k←; 
                    s↓2← →INI400_006586= μ↓2←*C↓e←*C↓t←*s↓k←; 
                    →INI400_000084TEXT(Description("S")); 
                    S →INI400_006587= (s↓1←+s↓2←)/4*l↓s←*c; 
                } 
            } 
        } 
    } 
} ELSE { 
    IF(Dim) { 
        →INI400_006600BLOCK("Dimensions of the construction") { 
            →INI400_000031TEXT(Description("α")); 
            →INI400_000030TEXT("α = " &amp; α &amp; " °"); 
            →INI400_000005TEXT(Description("b↓1←")); 
            →INI400_000004TEXT("b↓1← = " &amp; b↓1← &amp; " m"); 
            →INI400_000037TEXT(Description("b↓1,s←")); 
            →INI400_000036TEXT("b↓1,s← = " &amp; b↓1,s← &amp; " m"); 
            →INI400_000007TEXT(Description("b↓2←")); 
            →INI400_000006TEXT("b↓2← = " &amp; b↓2← &amp; " m"); 
            →INI400_000009TEXT(Description("h")); 
            →INI400_000008TEXT("h = " &amp; h &amp; " m"); 
            →INI400_000024TEXT(Description("l↓s←")); 
            IF(2*h &lt;= l↓s,min←) { 
                l↓s← →INI400_006591= l↓s,min←; 
            } ELSE { 
                IF(2*h &lt;= l↓s,max←) { 
                    l↓s← →INI400_006592= 2*h; 
                } ELSE { 
                    l↓s← →INI400_006593= l↓s,max←; 
                } 
            } 
        } 
    } 
    →INI400_000153PAGEBREAK(); 
    →INI400_006601BLOCK("Calculation of the snow load") { 
        IF(l↓s← &lt;= b↓2←) { 
            →INI400_000148TEXT("Shape condition:"); 
            →INI400_000141TEXT("l↓s← ≤ b↓2← =&gt; " &amp; l↓s← &amp; " m ≤ " &amp; b↓2← &amp; " m"); 
            IF(Undrifted) { 
                →INI400_006602BLOCK("Case 1 - Undrifted snow") { 
                    →INI400_000081IMG("prilehla1"); 
                    →INI400_000156PAGEBREAK(); 
                    →INI400_000026TEXT(Description("μ↓1←")); 
                    μ↓1← →INI400_000012= 0.8; 
                    →INI400_000074TEXT("Surface weight at the lower roof"); 
                    s →INI400_000013= μ↓1←*C↓e←*C↓t←*s↓k←; 
                    IF(UnitLoad) { 
                        →INI400_000085TEXT("Total weight at unit lenght of the roof"); 
                        S →INI400_000083= s*b↓2←; 
                    } 
                } 
            } 
            →INI400_000157PAGEBREAK(); 
            IF(Drifted) { 
                →INI400_006603BLOCK("Case 2 - Drifted snow") { 
                    →INI400_000147IMG("slide"); 
                    →INI400_000159PAGEBREAK(); 
                    →INI400_000029TEXT(Description("μ↓1←")); 
                    μ↓1← →INI400_000028= 0.8; 
                    →INI400_000076TEXT("Coefficient of the sliding snow from the higher roof"); 
                    IF(α &lt;= 15) { 
                        μ↓s← →INI400_000032= 0.0; 
                    } ELSE { 
                        μ↓s← →INI400_000038= 0.8*(b↓1,s←/l↓s←); 
                    } 
                    →INI400_000075TEXT(Description("μ↓w←")); 
                    μ↓w← →INI400_006545= MIN(MAX(μ↓W,min←, (b↓1←+b↓2←)/(2*h)), μ↓W,max←, CUnit(γ, "kN/m↑2←")*(h/CUnit(s↓k←, "kN/m↑2←"))); 
                    →INI400_000080TEXT(Description("s↓s←")); 
                    s↓s← →INI400_000070= 0.5*μ↓s←*s↓k←; 
                    →INI400_000079TEXT(Description("s↓w←")); 
                    s↓w← →INI400_000072= μ↓w←*C↓e←*C↓t←*s↓k←; 
                    →INI400_000078TEXT("Weight of the snow by the higher constr."); 
                    s →INI400_000071= s↓s←+s↓w←; 
                    →INI400_000077TEXT("Weight of the snow at the distance l↓s← from the higher construction"); 
                    s↓1← →INI400_000073= μ↓1←*C↓e←*C↓t←*s↓k←; 
                    →INI400_000160PAGEBREAK(); 
                    IF(UnitLoad) { 
                        →INI400_000087TEXT("Total weight at unit lenght of the roof"); 
                        S →INI400_000086= ((s+s↓1←)/2)*l↓s←+[(b↓2←-l↓s←)]*s↓1←; 
                    } 
                } 
            } 
        } ELSE { 
            →INI400_000150TEXT("Shape condition:"); 
            →INI400_000142TEXT("l↓s← ≥  b↓2← =&gt; " &amp; l↓s← &amp; " m ≥ " &amp; b↓2← &amp; " m"); 
            IF(Undrifted) { 
                →INI400_006604BLOCK("Case 1 - Undrifted snow") { 
                    →INI400_000162PAGEBREAK(); 
                    →INI400_000089IMG("prilehla3"); 
                    →INI400_000163PAGEBREAK(); 
                    →INI400_000095TEXT(Description("μ↓1←")); 
                    μ↓1← →INI400_000092= 0.8; 
                    →INI400_000094TEXT("Surface weight at the lower roof"); 
                    s →INI400_000091= μ↓1←*C↓e←*C↓t←*s↓k←; 
                    IF(UnitLoad) { 
                        →INI400_000093TEXT("Total weight at unit lenght of the roof"); 
                        S →INI400_000090= s*b↓2←; 
                    } 
                } 
            } 
            →INI400_000164PAGEBREAK(); 
            IF(Drifted) { 
                →INI400_006605BLOCK("Case 2 - Drifted snow") { 
                    →INI400_000097IMG("prilehla4"); 
                    →INI400_000166PAGEBREAK(); 
                    →INI400_000117TEXT(Description("μ↓1←")); 
                    μ↓1← →INI400_000110= 0.8; 
                    →INI400_000116TEXT("Coefficient of the sliding snow from the higher roof"); 
                    IF(α &lt;= 15) { 
                        μ↓s← →INI400_000109= 0.0; 
                    } 
                    IF(15 &lt; α) { 
                        μ↓s← →INI400_000108= 0.8*b↓1,s←/l↓s←; 
                    } 
                    →INI400_006546TEXT(Description("μ↓w←")); 
                    μ↓w← →INI400_006547= MIN(MAX(μ↓W,min←, (b↓1←+b↓2←)/(2*h)), μ↓W,max←, CUnit(γ, "kN/m↑2←")*(h/CUnit(s↓k←, "kN/m↑2←"))); 
                    →INI400_006548TEXT(Description("s↓s←")); 
                    s↓s← →INI400_006549= 0.5*μ↓s←*s↓k←; 
                    →INI400_006550TEXT(Description("s↓w←")); 
                    s↓w← →INI400_006551= μ↓w←*C↓e←*C↓t←*s↓k←; 
                    →INI400_000112TEXT("Weight of the snow by the higher constr."); 
                    s →INI400_000099= s↓s←+s↓w←; 
                    →INI400_000111TEXT("Weight of the snow at the distance l↓s← from the higher construction"); 
                    s↓1← →INI400_000098= μ↓1←*C↓e←*C↓t←*s↓k←; 
                    →INI400_000119TEXT("Weight of the snow at the distance b↓2←"); 
                    s↓b2← →INI400_000118= (s-[((s-s↓1←)/l↓s←)*b↓2←]); 
                    IF(UnitLoad) { 
                        →INI400_000121TEXT("Total weight at unit lenght of the roof"); 
                        S →INI400_000120= ((s+s↓b2←)/2)*b↓2←; 
                    } 
                } 
            } 
        } 
    } 
} 
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="587" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Snow/Snow - roof abuting and close to taller constructions.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Snow - Roof abutting and close to taller construction works</ENU>
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
      <Style Key="Standard, dY 5, Understrike" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Standard, dY 10" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dX 10" X="0" Y="0" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, follow, dX 5" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Check, follow dX 5, bold" X="250" Y="0" Hor="0" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Remark, dX 50" X="50" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Remark, dX 50, bold" X="0" Y="0" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" />
      <Style Key="Formula, dX 50" X="0" Y="0" Hor="1" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dY 10" X="250" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 100" X="0" Y="0" Hor="1" Ver="2" SpX="100" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 150" X="0" Y="0" Hor="1" Ver="2" SpX="150" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 200" X="0" Y="0" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 300" X="0" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 250" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 20" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 30" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 60" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="60" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 400" X="0" Y="0" Hor="1" Ver="2" SpX="400" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
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
      <Variable Modifier="Public" Name="A" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A">
          <ENU>Altitude above the sea level</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="Alpine" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Alpine">
          <ENU>Alpine region</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="AnnexB3" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_AnnexB3">
          <ENU>Use calculation according Annex B3</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="b↓1,s←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_b↓1,s←">
          <ENU>Width from the ridge of a roof to the edge of the higher building</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_b↓1←">
          <ENU>Width of the higher building</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b↓2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_b↓2←">
          <ENU>Length of the lower building</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="c" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_c">
          <ENU>Width of the lower building</ENU>
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
      <Variable Modifier="Public" Name="C↓t,0←" ESA_ID="" Type="Double" Value="0" Precision="2">
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
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause5_3_6_1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause5_3_6_3" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Dim" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Dim">
          <ENU>Print the dimensions of the construction</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Drifted" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Drifted">
          <ENU>Print the drifted snow</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FormCt" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_FormCt">
          <ENU>Use formula for calculation Ct</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Height of the higher eaves from the lower ridge</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_h↓1←">
          <ENU>Height of the higher eaves from the lower eaves</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="Headline" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Headline">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="l↓s,max←" ESA_ID="" Type="Double" Value="15" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="l↓s,min←" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="l↓s←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_l↓s←">
          <ENU>Width of the lower roof loaded by snow</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="ObjectSTN" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ObjectSTN">
          <ENU>Type of the object and roof</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="s" ESA_ID="Result.0" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_s">
          <ENU>Weight of the snow by higher construction</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="S" ESA_ID="Result.1" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_S">
          <ENU>Total weight of the snow at the roof</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m" />
      </Variable>
      <Variable Modifier="Public" Name="s↓1←" ESA_ID="Result.5" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_s↓1←">
          <ENU>Weight of the snow in distance ls from the higher construction</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓2←" ESA_ID="Result.9" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓b2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_s↓b2←">
          <ENU>Weight of the snow at the distance b2</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓k,0←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_s↓k,0←">
          <ENU>Characteristic value of snow load on the ground</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓k←" ESA_ID="Result.6" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_s↓k←">
          <ENU>Characteristic value of snow load on the ground</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓s←" ESA_ID="Result.7" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_s↓s←">
          <ENU>Weight of the sliding snow</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓w←" ESA_ID="Result.8" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_s↓w←">
          <ENU>Weight of the drifted snow</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
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
      <Variable Modifier="Public" Name="Undrifted" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Undrifted">
          <ENU>Print the undrifted snow</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="UnitLoad" ESA_ID="" Type="Boolean" Value="0">
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
      <Variable Modifier="Public" Name="UseTableA1" ESA_ID="" Type="Boolean" Value="0">
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
      <Variable Modifier="Public" Name="α" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_α">
          <ENU>Slope of the higher roof</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="α↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_α↓1←">
          <ENU>Slope of the lower roof</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="γ" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_γ">
          <ENU>Weight density of snow</ENU>
        </Description>
        <Unit m="-2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_μ↓1←">
          <ENU>Shape coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓2←" ESA_ID="Result.2" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓3←" ESA_ID="Result.3" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓s←" ESA_ID="Result.4" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_μ↓s←">
          <ENU>Coefficient of the sliding snow</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓W,max←" ESA_ID="" Type="Double" Value="1.785714" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓W,min←" ESA_ID="" Type="Double" Value="1.2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓w←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_μ↓w←">
          <ENU>Coefficient of drifted snow</ENU>
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
      <VC ID="INI400_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|5|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000005">
        <Set Vis="1" Prev="INI400_000031" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000031" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000031" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="124" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="124" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="124" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000007">
        <Set Vis="1" Prev="INI400_000037" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000037" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000037" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000008">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="148" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="148" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="148" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000009">
        <Set Vis="1" Prev="INI400_000007" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000007" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000007" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000012">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="728" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="728" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="728" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000013">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="771" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="771" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="771" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000024">
        <Set Vis="1" Prev="INI400_000009" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000009" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000009" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="169" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="169" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="169" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000026">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="712" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="712" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="712" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000028">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1207" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1207" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1207" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000029">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1191" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1191" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1191" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000030">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="55" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="55" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="55" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000031">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="55" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="55" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="55" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000032">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="836" Hor="0" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="836" Hor="0" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="836" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="836" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="836" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000036">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="100" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="100" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="100" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000037">
        <Set Vis="1" Prev="INI400_000005" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000005" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000005" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="100" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="100" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="100" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000038">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1258" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1258" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1258" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000070">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000028" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1461" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1461" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1461" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000071">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1547" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1547" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1547" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000072">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1504" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1504" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1504" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000073">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="300" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="300" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1593" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1593" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1593" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000074">
        <Set Vis="1" Prev="INI400_000026" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000026" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000026" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="752" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="752" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="752" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000075">
        <Set Vis="1" Prev="INI400_000076" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000076" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000076" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1290" Hor="1" Ver="4" SpX="-25" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1290" Hor="1" Ver="4" SpX="-25" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1290" Hor="1" Ver="4" SpX="-25" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000076">
        <Set Vis="1" Prev="INI400_000029" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000029" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000029" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1231" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1231" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1231" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000077">
        <Set Vis="1" Prev="INI400_000078" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000078" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000078" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1571" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1571" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1571" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000078">
        <Set Vis="1" Prev="INI400_000079" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000079" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000079" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1528" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1528" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1528" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000079">
        <Set Vis="1" Prev="INI400_000080" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000080" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000080" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1485" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1485" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1485" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000080">
        <Set Vis="1" Prev="INI400_000075" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000075" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000075" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1442" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1442" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1442" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000081">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="615" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="615" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="615" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="563" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="563" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="563" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000082">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000083">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="811" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="811" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="811" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000084">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000082" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000085">
        <Set Vis="1" Prev="INI400_000074" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000074" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000074" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="795" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="795" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="795" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000086">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1644" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1644" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1644" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000087">
        <Set Vis="1" Prev="INI400_000077" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="34" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000077" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="33" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000077" Style="0" StyleName="Standard, dY 30" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1617" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1617" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1617" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000089">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="577" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="577" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="577" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="559" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="559" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="559" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000090">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="803" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="803" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="803" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000091">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="763" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="763" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="763" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000092">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="720" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="720" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="720" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000093">
        <Set Vis="1" Prev="INI400_000094" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000094" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000094" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="787" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="787" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="787" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000094">
        <Set Vis="1" Prev="INI400_000095" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000095" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000095" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="744" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="744" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="744" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000095">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000097">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="981" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="981" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="981" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1002" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1002" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1002" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000098">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1579" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1579" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1579" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000099">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1533" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1533" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1533" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000108">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1244" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1244" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1244" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000109">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="825" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="825" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="825" Hor="1" Ver="4" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000110">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="1193" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="1193" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="1193" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000111">
        <Set Vis="1" Prev="INI400_000112" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000112" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000112" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1557" Hor="0" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1557" Hor="0" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1557" Hor="0" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000112">
        <Set Vis="1" Prev="INI400_006550" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006550" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006550" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1514" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1514" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1514" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000116">
        <Set Vis="1" Prev="INI400_000117" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000117" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000117" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1217" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1217" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1217" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000117">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1177" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1177" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1177" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000118">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1635" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1635" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1635" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000119">
        <Set Vis="1" Prev="INI400_000111" Style="0" StyleName="Standard, dY 30" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000111" Style="0" StyleName="Standard, dY 30" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000111" Style="0" StyleName="Standard, dY 30" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1603" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1603" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1603" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000120">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1696" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1696" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1696" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000121">
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000119" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1669" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1669" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1669" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000140">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000141">
        <Set Vis="1" Prev="" Style="0" StyleName="Check, follow dX 5, bold" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Check, follow dX 5, bold" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|9|0|2" Font2="Arial|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|9|0|2" Font2="Arial|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|9|0|2" Font2="Arial|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000142">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="0" Hor="0" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="0" Hor="0" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|9|0|2" Font2="Arial|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|9|0|2" Font2="Arial|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|9|0|2" Font2="Arial|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000147">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1318" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1318" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1318" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000148">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000150">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000153">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000156">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="756" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="756" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="756" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000157">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="841" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="841" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="841" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000159">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1435" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1435" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1435" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000160">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000162">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000163">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000164">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000166">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006297">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="574" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="574" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="574" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006311">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="692" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="692" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="692" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006314">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="1" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006317">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="731" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="731" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="731" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006318">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="752" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="752" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="752" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006320">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="712" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="712" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="712" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006334">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006335">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="1" Y="0" Hor="0" Ver="4" SpX="1" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="1" Y="0" Hor="0" Ver="4" SpX="1" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="1" Y="0" Hor="0" Ver="4" SpX="1" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006342">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006344">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006345">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006346">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006347">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006348">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006349">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006350">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006351">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006352">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006353">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006354">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006355">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006356">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006357">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006358">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006359">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006360">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006361">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006362">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006363">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006364">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006365">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006366">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006367">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006368">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006369">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006370">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006371">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006372">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006374">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006375">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006376">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006377">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006380">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006381">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006388">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006389">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006390">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006391">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006392">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006393">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006394">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006395">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006396">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006397">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006402">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006403">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006404">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006407">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006408">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006409">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006410">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006411">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006412">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006413">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006414">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006415">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006416">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006417">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006419">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006433">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006435">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006436">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006437">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006438">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006441">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="3" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006458">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006462">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006463">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006465">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006467">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006469">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006473">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006474">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006475">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006477">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006496">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006497">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006499">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006501">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006506">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006517">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006518">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006523">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006526">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006528">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="55" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="55" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="55" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006529">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="55" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="55" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="55" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006530">
        <Set Vis="1" Prev="INI400_006528" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006528" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006528" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006531">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006534">
        <Set Vis="1" Prev="INI400_006530" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006530" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006530" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006535">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="124" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="124" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="124" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006536">
        <Set Vis="1" Prev="INI400_006534" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006534" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006534" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006537">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="148" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="148" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="148" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006538">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006536" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006536" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="712" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="712" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="712" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006539">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="728" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="728" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="728" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_006540">
        <Set Vis="1" Prev="INI400_006538" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006538" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006538" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="752" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="752" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="752" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006541">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="771" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="771" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="771" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006542">
        <Set Vis="1" Prev="INI400_006540" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006540" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006540" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="795" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="795" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="795" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006543">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="811" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="811" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="811" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006545">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1417" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1417" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1417" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006546">
        <Set Vis="1" Prev="INI400_000116" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000116" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000116" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1290" Hor="1" Ver="4" SpX="-25" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1290" Hor="1" Ver="4" SpX="-25" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="25" Y="1290" Hor="1" Ver="4" SpX="-25" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006547">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1417" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1417" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1417" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006548">
        <Set Vis="1" Prev="INI400_006546" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006546" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006546" Style="0" StyleName="Standard, dY 60" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1442" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1442" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1442" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006549">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000110" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1461" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1461" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1461" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006550">
        <Set Vis="1" Prev="INI400_006548" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006548" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006548" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1485" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1485" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1485" Hor="1" Ver="4" SpX="-50" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006551">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1504" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1504" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1504" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006556">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="778" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="778" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="778" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006557">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006558">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006559">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006560">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006562">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="55" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="55" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="55" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006563">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="55" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="55" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="55" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006564">
        <Set Vis="1" Prev="INI400_006562" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006562" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000031" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006565">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006566">
        <Set Vis="1" Prev="INI400_006564" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006564" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000085" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="76" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006567">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="76" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006568">
        <Set Vis="1" Prev="INI400_006566" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006566" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000005" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006569">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="124" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="124" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="124" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006570">
        <Set Vis="1" Prev="INI400_006568" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006568" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000007" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006571">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="148" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="148" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="148" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006572">
        <Set Vis="1" Prev="INI400_006570" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006570" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000009" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="169" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="169" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="169" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006573">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006574">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006576">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006577">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006578">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006579">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006580">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006581">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006582">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006583">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006584">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006585">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006576" Style="0" StyleName="Standard, dY 5, Understrike" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006586">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006587">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006588">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006590">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006591">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006592">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 400" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006593">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="169" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006594">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006595">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006596">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006597">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006598">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006599">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006600">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006601">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006602">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006603">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006604">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006605">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006606">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
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
      <VC ID="INI400_006616">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006617">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="prilehla1" Content="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" />
      <Image Name="prilehla2" Content="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" />
      <Image Name="prilehla3" Content="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" />
      <Image Name="prilehla4" Content="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" />
      <Image Name="slide" Content="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" />
      <Image Name="TallerConstr_Case_I_AnnexB" Content="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" />
      <Image Name="TallerConstr_AnnexB" Content="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" />
      <Image Name="BG" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="630">
      <TPanel Name="" ID="68" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts TranslateID="DIALOG_000068">
          <ENU>Design settings</ENU>
        </Texts>
        <TGroupBox Name="Drifting_group" ID="59" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000059">
            <ENU>Drifting coefficient</ENU>
          </Texts>
          <TDoubleInput Name="gamma" ID="53" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="γ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10000" MinValueWithDim="0" DescPos="1" />
          <TCheckBox Name="Alpine" ID="51" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Alpine" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000051">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="par" ID="60" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000060">
            <ENU>Parameters of the snow load</ENU>
          </Texts>
          <TDoubleInput Name="A_4_1_1" ID="28" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="ZONORM" ID="22" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Z" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="4.5" MinValueWithDim="1.6" DescPos="1" />
          <TComboBox Name="Town0ONORM" ID="12" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town0ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3" Index="0">
            <Texts>
              <ENU>Neuwaldegg|Sievering|Simmering|Stephansplatz</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town1ONORM" ID="13" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town1ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45" Index="0">
            <Texts>
              <ENU>Amstetten|Baden|Bad Vöslau|Deutsch-Wagram|Fischamend|Gänserndorf|Gmünd|Großenzersdorf|Gumpoldskirchen|Hainburg|Hollabrunn|Horn|Klosterneuburg|Korneuburg|Krems|Langenlois|Lilienfeld|Marchegg|Melk/Donau|Mistelbach|Mödling|Mönichkirchen|Neunkirchen|Perchtoldsdorf|Pottenstein|Poysdorf|Puchberg/Schneeberg|Purkersdorf|Reichenau/Rax|Retz|St. Pölten|Scheibbs|Schwechat|Semmering|Sollenau|Stockerau|Ternitz|Traiskirchen|Tulln|Waidhofen/Thaya|Waidhofen/Ybbs|Wiener Neustadt|Wilhelmsburg|Wolkersdorf|Zistersdorf|Zwettl</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town2ONORM" ID="14" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town2ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7|8|9|10|11" Index="0">
            <Texts>
              <ENU>Andau|Bad Tatzmannsdorf|Eisenstadt|Güssing|Jennersdorf|Mattersburg|Neusiedl/See|Oberpullendorf|Oberwart|Pinkafeld|Rust|St. Michael</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town3ONORM" ID="15" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town3ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41" Index="0">
            <Texts>
              <ENU>Admont|Bad Aussee|Bad Gleichenberg|Bad Mitterndorf|Birkfeld|Bruck/Mur|Deutschlandsberg|Eibiswald|Eisenerz|Feldbach|Fohnsdorf|Friedberg|Frohnleiten|Fürstenfeld|Gleisdorf|Graz – Zentrum|Graz – Liebenau|Gröbming|Hartberg|Hieflau|Judenburg|Kapfenberg|Knittelfeld|Köflach|Leibnitz|Leoben|Liezen|Mariazell|Murau|Mureck|Mürzzuschlag|Bad Radkersburg|Schladming|Seckau|Stainz|St. Nikolai/Sölktal|Trieben|Voitsberg|Wald/Schoberpaß|Weiz|Wildon|Zeltweg</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town4ONORM" ID="16" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town4ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33" Index="0">
            <Texts>
              <ENU>Aigen|Bad Goisern|Bad Leonfelden|Bad Ischl|Braunau|Ebensee|Eferding|Enns|Freistadt|Gmunden|Gosau|Grein|Grieskirchen|Grünau|Hallstatt|Hinterstoder|Kremsmünster|Linz|Mattighofen|Mondsee|Obertraun|Reichersberg/Inn|Ried/Innkreis|Rohrbach/Mühlviertel|St. Wolfgang|Schärding|Schwanenstadt|Spital/Phyrn|Steyr|Traun|Vöcklabruck|Wels|Weyer|Windischgarsten</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town5ONORM" ID="17" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town5ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30" Index="0">
            <Texts>
              <ENU>Abtenau|Bad Hofgastein|Badgastein|Bischofshofen|Fuschl/See|Golling|Hallein|Kaprun|Krimml|Lofer|Mattsee|Mauterndorf|Mittersill|Mühlbach/Hochkönig|Oberndorf|Obertauern|Radstadt|Rauris|Saalbach|Saalfelden|Salzburg – Zentrum|Salzburg – Anif|Salzburg – Parsch|St. Michael i. Lungau|St. Johann i. Pongau|Strobl|Tamsweg|Unken|Wagrain|Werfen|Zell/See</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town6ONORM" ID="18" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town6ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28" Index="0">
            <Texts>
              <ENU>Arnoldstein|Bad Kleinkirchheim|Bleiburg|Eisenkappel|Feldkirchen|Ferlach|Friesach|Gmünd|Gurk|Heiligenblut|Hermagor|Klagenfurt|Kötschach|Lavamünd|Mallnitz|Millstatt|Nassfeld|Oberdrauburg|Obervellach|Radenthein|Rennweg|St. Andrä/Lavantal|St. Lorenzen/Lesachtal|St. Veit/Glan|Spittal/Drau|Velden|Villach|Völkermarkt|Wolfsberg</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="s_k_0" ID="26" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="s↓k,0←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TComboBox Name="Town7ONORM" ID="19" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town7ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33" Index="0">
            <Texts>
              <ENU>Ehrwald|Fulpmes|Hall in Tirol|Hintertux|Holzgau|Ischgl|Imst|Innsbruck|Jenbach|Kitzbühel|Kufstein|Landeck|Lienz|Matrei/Osttirol|Mayrhofen|Obergurgl|Pertisau|Reutte|St. Anton/Arlberg|St. Christoph/Arlberg|St. Jakob/Defereggental|St. Leonhard/Pitztal|St. Johann|Schwaz|Seefeld|Serfaus|Sillian|Sölden|Steinach/Brenner|Tannheim|Telfs|Wörgl|Virgen|Zell/Ziller</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town8ONORM" ID="20" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town8ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16" Index="0">
            <Texts>
              <ENU>Bezau|Bludenz|Bregenz|Dornbirn|Egg|Feldkirch|Gargellen|Götzis|Hohenems|Langen|Lech|Lustenau|Mittelberg|Partenen|Schruns|Warth|Zürs</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneBS" ID="24" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneBS" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="1|2|3|4|5|6.5" Index="3">
            <Texts TranslateID="DIALOG_000024">
              <ENU>Zone 1|Zone 2|Zone 3|Zone 4|Zone 5|Zone 6,5</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneCSN" ID="8" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneCSN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7" Index="3">
            <Texts>
              <ENU>I|II|III|IV|V|VI|VII|VIII</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneELOT" ID="30" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneELOT" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="0">
            <Texts>
              <ENU>A|B|C</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneSIST" ID="35" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneSIST" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="2">
            <Texts>
              <ENU>A1|A2|A3|A4|M1</ENU>
            </Texts>
          </TComboBox>
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
          <TComboBox Name="ZoneDIN" ID="26" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneDIN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="4">
            <Texts>
              <ENU>1|1a|2|2a|3</ENU>
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
          <TComboBox Name="StateONORM" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="StateONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7|8" Index="0">
            <Texts TranslateID="DIALOG_000011">
              <ENU>Wien|Niederösterreich|Burgenland|Steiermark|Oberösterreich|Salzburg|Kärnten|Tirol|Vorarlberg</ENU>
            </Texts>
          </TComboBox>
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
        <TGroupBox Name="" ID="29" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000029">
            <ENU>Geometry of the roof</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="200" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="b↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="200" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="b↓1,s←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="200" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="b↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="200" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="α" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="90" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="Annex_calc_group" ID="69" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000069">
            <ENU>Annex calculation</ENU>
          </Texts>
          <TCheckBox Name="AnnexB3" ID="63" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="AnnexB3" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000063">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
      </TPanel>
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts>
          <ENU>General settings</ENU>
        </Texts>
        <TGroupBox Name="" ID="67" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000067">
            <ENU>Layout blocks</ENU>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Drifted" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000008">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="7" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Undrifted" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000007">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Dim" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000005">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="UnitLoad" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000006">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="65" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000065">
            <ENU>Headline settings</ENU>
          </Texts>
          <TStringInput Name="TStringInput" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000004">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="23" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Headline" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000023">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000046">
            <ENU>National Annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Austrian ÖNORM-EN">
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
                  <P>Austrian ÖNORM-EN</P>
                  <P>ONORM</P>
                  <P>1</P>
                  <P>ÖNORM EN 1990</P>
                  <P>ÖNORM EN 1991-1-1</P>
                  <P>ÖNORM EN 1991-1-2</P>
                  <P>ÖNORM EN 1991-1-3</P>
                  <P>0</P>
                  <P>NaN</P>
                  <P>False;1;</P>
                  <P>NaN</P>
                  <P>1.0</P>
                  <P>1.0</P>
                  <P>NaN</P>
                  <P>False</P>
                  <P>1.6</P>
                  <P>1.8</P>
                  <P>NaN</P>
                  <P>0.8;2;5;15;</P>
                  <P>False</P>
                  <P>False</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>ÖNORM EN 1991-1-4</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1</P>
                  <P>1</P>
                  <P>0.2;0.5;</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>True;1;</P>
                  <P>True</P>
                  <P>False</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1.25</P>
                  <P>False</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>ÖNORM EN 1991-1-5</P>
                  <P>ÖNORM EN 1991-1-6</P>
                  <P>ÖNORM EN 1991-1-7</P>
                  <P>ÖNORM EN 1991-2</P>
                  <P>ÖNORM EN 1991-3</P>
                  <P>ÖNORM EN 1991-4</P>
                  <P>ÖNORM EN 1992-1-1</P>
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
                  <P>10;10;10;</P>
                  <P>40;75;5;</P>
                  <P>0.005</P>
                  <P>0.44;NaN;0.54;NaN;0.7;0.8;</P>
                  <P>NaN</P>
                  <P>1.2</P>
                  <P>0.8;0.9;</P>
                  <P>0.92</P>
                  <P>50;30;</P>
                  <P>0.7</P>
                  <P>0.7;0.8;</P>
                  <P>1;1;1.05;0.95;1;1;</P>
                  <P>NaN;NaN;0.15;</P>
                  <P>NaN</P>
                  <P>NaN;0.785398;</P>
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
                  <P>NaN;NaN;</P>
                  <P>1.4;NaN;</P>
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
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>12</P>
                  <P>NaN</P>
                  <P>12</P>
                  <P>10</P>
                  <P>5;8;</P>
                  <P>600;NaN;</P>
                  <P>0.8;0.8;</P>
                  <P>1.5</P>
                  <P>0.25</P>
                  <P>0.5</P>
                  <P>ÖNORM EN 1992-1-2</P>
                  <P>ÖNORM EN 1992-2</P>
                  <P>ÖNORM EN 1992-3</P>
                  <P>ÖNORM EN 1993-1-1</P>
                  <P>NaN;NaN;</P>
                  <P>1;1;1.25;</P>
                  <P>ÖNORM EN 1993-1-2</P>
                  <P>ÖNORM EN 1993-1-3</P>
                  <P>ÖNORM EN 1993-1-4</P>
                  <P>ÖNORM EN 1993-1-5</P>
                  <P>1.20;1.00;</P>
                  <P>ÖNORM EN 1993-1-6</P>
                  <P>ÖNORM EN 1993-1-7</P>
                  <P>ÖNORM EN 1993-1-8</P>
                  <P>1.25;1.25;1.1;1.0;1.0;1.0;1.1;</P>
                  <P>ÖNORM EN 1993-1-9</P>
                  <P>ÖNORM EN 1993-1-10</P>
                  <P>ÖNORM EN 1993-1-11</P>
                  <P>ÖNORM EN 1993-1-12</P>
                  <P>ÖNORM EN 1993-2</P>
                  <P>1.0;1.1;1.25;1.25;1.1;1.1;1.1;1.0;1.1;</P>
                  <P>ÖNORM EN 1993-3-1</P>
                  <P>ÖNORM EN 1993-3-2</P>
                  <P>ÖNORM EN 1993-4-1</P>
                  <P>ÖNORM EN 1993-4-2</P>
                  <P>ÖNORM EN 1993-4-3</P>
                  <P>ÖNORM EN 1993-5</P>
                  <P>ÖNORM EN 1993-6</P>
                  <P>ÖNORM EN 1994-1-1</P>
                  <P>1;1;</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>0.000325;0.000500;0.000200;0.000300;</P>
                  <P>0.70</P>
                  <P>NaN</P>
                  <P>1.25;1.5;</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1.0</P>
                  <P>1.0</P>
                  <P>0.6</P>
                  <P>180</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>NaN</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>ÖNORM EN 1994-1-2</P>
                  <P>ÖNORM EN 1994-2</P>
                  <P>ÖNORM EN 1995-1-1</P>
                  <P>NaN</P>
                  <P>NaN;NaN;NaN;</P>
                  <P>ÖNORM EN 1995-1-2</P>
                  <P>ÖNORM EN 1995-2</P>
                  <P>ÖNORM EN 1996-1-1</P>
                  <P>NaN</P>
                  <P>1</P>
                  <P>NaN</P>
                  <P>True</P>
                  <P>1000</P>
                  <P>NaN;NaN;NaN;</P>
                  <P>NaN</P>
                  <P>ÖNORM EN 1996-1-2</P>
                  <P>ÖNORM EN 1996-2</P>
                  <P>ÖNORM EN 1996-3</P>
                  <P>ÖNORM EN 1997-1</P>
                  <P>1.1;0.9;1.5;0;</P>
                  <P>1.25;1.25;1.4;1.4;1.0;</P>
                  <P>1.35;1;1.5;0;1;1;1.3;0;</P>
                  <P>1;1;1;1;1;1.25;1.25;1.4;1.4;1;</P>
                  <P>1;1;1.4;1.1;1;1;</P>
                  <P>ÖNORM EN 1997-2</P>
                  <P>ÖNORM EN 1998-1</P>
                  <P>ÖNORM EN 1998-2</P>
                  <P>ÖNORM EN 1998-3</P>
                  <P>ÖNORM EN 1998-4</P>
                  <P>ÖNORM EN 1998-5</P>
                  <P>ÖNORM EN 1998-6</P>
                  <P>ÖNORM EN 1999-1-1</P>
                  <P>ÖNORM EN 1999-1-2</P>
                  <P>ÖNORM EN 1999-1-3</P>
                  <P>ÖNORM EN 1999-1-4</P>
                  <P>ÖNORM EN 1999-1-5</P>
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
    <Item TranslateID="BLOCK_INI400_006594">
      <ENU>"Calculation of the snow load"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006595">
      <ENU>"Case 1 - Undrifted snow"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006596">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006597">
      <ENU>"Case 2 - Drifted snow"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006598">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006599">
      <ENU>"Shape coefficients"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006600">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006601">
      <ENU>"Calculation of the snow load"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006602">
      <ENU>"Case 1 - Undrifted snow"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006603">
      <ENU>"Case 2 - Drifted snow"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006604">
      <ENU>"Case 1 - Undrifted snow"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006605">
      <ENU>"Case 2 - Drifted snow"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000002">
      <ENU>Caption</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000003">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000004">
      <ENU>"b↓1← = " &amp; b↓1← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000005">
      <ENU>Description("b↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000006">
      <ENU>"b↓2← = " &amp; b↓2← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000007">
      <ENU>Description("b↓2←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000008">
      <ENU>"h = " &amp; h &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000009">
      <ENU>Description("h")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000011">
      <ENU>"Case 1 - Undrifted snow"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000024">
      <ENU>Description("l↓s←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000026">
      <ENU>Description("μ↓1←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000027">
      <ENU>"Case 2 - Drifted snow"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000029">
      <ENU>Description("μ↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000030">
      <ENU>"α = " &amp; α &amp; " °"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000031">
      <ENU>Description("α")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000036">
      <ENU>"b↓1,s← = " &amp; b↓1,s← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000037">
      <ENU>Description("b↓1,s←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000074">
      <ENU>"Surface weight at the lower roof"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000075">
      <ENU>Description("μ↓w←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000076">
      <ENU>"Coefficient of the sliding snow from the higher roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000077">
      <ENU>"Weight of the snow at the distance l↓s← from the higher construction"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000078">
      <ENU>"Weight of the snow by the higher constr."</ENU>
    </Item>
    <Item ID="TEXT_INI400_000079">
      <ENU>Description("s↓w←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000080">
      <ENU>Description("s↓s←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000084">
      <ENU>Description("S")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000085">
      <ENU>"Total weight at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000087">
      <ENU>"Total weight at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000088">
      <ENU>"Case 1 - Undrifted snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000093">
      <ENU>"Total weight at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000094">
      <ENU>"Surface weight at the lower roof"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000095">
      <ENU>Description("μ↓1←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000096">
      <ENU>"Case 2 - Drifted snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000111">
      <ENU>"Weight of the snow at the distance l↓s← from the higher construction"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000112">
      <ENU>"Weight of the snow by the higher constr."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000116">
      <ENU>"Coefficient of the sliding snow from the higher roof"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000117">
      <ENU>Description("μ↓1←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000119">
      <ENU>"Weight of the snow at the distance b↓2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000121">
      <ENU>"Total weight at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000140">
      <ENU>"Snow load on the roof abutting and close to taller construction works acc to"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000141">
      <ENU>"l↓s← ≤ b↓2← =&gt; " &amp; l↓s← &amp; " m ≤ " &amp; b↓2← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000142">
      <ENU>"l↓s← ≥  b↓2← =&gt; " &amp; l↓s← &amp; " m ≥ " &amp; b↓2← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000148">
      <ENU>"Shape condition:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000149">
      <ENU>"Calculation of the snow load"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000150">
      <ENU>"Shape condition:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006441">
      <ENU>IO.SetupNA.EC_1991_1_3.Name</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006522">
      <ENU>"Case 1 - Undrifted snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006525">
      <ENU>"Case 2 - Drifted snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006527">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006528">
      <ENU>Description("α")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006529">
      <ENU>"α = " &amp; α &amp; " °"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006530">
      <ENU>Description("b↓2←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006531">
      <ENU>"b↓2← = " &amp; b↓2← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006534">
      <ENU>Description("b↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006535">
      <ENU>"b↓1← = " &amp; b↓1← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006536">
      <ENU>Description("h")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006537">
      <ENU>"h = " &amp; h &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006538">
      <ENU>Description("μ↓1←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006540">
      <ENU>"Surface weight at the lower roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006542">
      <ENU>"Total weight at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006544">
      <ENU>"Calculation of the snow load"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006546">
      <ENU>Description("μ↓w←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006548">
      <ENU>Description("s↓s←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006550">
      <ENU>Description("s↓w←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006561">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006562">
      <ENU>Description("α↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006563">
      <ENU>"α↓1← = " &amp; α↓1← &amp; " °"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006564">
      <ENU>Description("c")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006565">
      <ENU>"c = " &amp; c &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006566">
      <ENU>Description("b↓2←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006567">
      <ENU>"b↓2← = " &amp; b↓2← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006568">
      <ENU>Description("b↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006569">
      <ENU>"b↓1← = " &amp; b↓1← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006570">
      <ENU>Description("h↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006571">
      <ENU>"h↓1← = " &amp; h↓1← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006572">
      <ENU>Description("l↓s←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006575">
      <ENU>"Shape coefficients"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006585">
      <ENU>"Snow load near the higher wall"</ENU>
    </Item>
  </Texts>
</Root>