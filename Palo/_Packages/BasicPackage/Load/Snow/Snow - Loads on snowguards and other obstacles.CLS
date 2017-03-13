<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="933a0843-df50-4377-93b2-4e6bad483689">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">void UpdateDialog() { 
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
} 

→INI400_006442BLOCK { 
    IF(Headline) { 
        →INI400_000227TEXT("Snow load on snowguards and other obstacles according to"); 
        →INI400_006441TEXT(IO.SetupNA.EC_1991_1_3.Name); 
    } 
    IF(PrintCaption) { 
        →INI400_000089TEXT(Caption); 
    } 
} 

IF(Rozmery) { 
    →INI400_006498BLOCK("Dimensions of the construction") { 
        →INI400_000198TEXT("Horizontal distance of the adjacent snow fences or the distance"); 
        →INI400_000219TEXT("of snow fence from the ridge of the roof"); 
        →INI400_000197TEXT("b = " &amp; b &amp; " m"); 
        →INI400_000196TEXT("Roof slope"); 
        →INI400_000195TEXT("α = " &amp; α &amp; " °"); 
        →INI400_006496TEXT("Shape coefficient of the adjacent roof"); 
        →INI400_006497TEXT("μ↓i← = " &amp; μ↓i←); 
    } 
} 
→INI400_000229PAGEBREAK(); 

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

→INI400_000230PAGEBREAK(); 
→INI400_006499BLOCK("Snow load at the snow fences") { 
    →INI400_000225BLOCK { 
        IF(α &gt;= 60) { 
            →INI400_000222IMG("prekazka_60"); 
        } ELSE { 
            →INI400_000221IMG("prekazka"); 
        } 
    } 
    →INI400_000233PAGEBREAK(); 
    →INI400_000158TEXT("Snow load at the unit area"); 
    s →INI400_000194= μ↓i←*C↓e←*C↓t←*s↓k←; 
    →INI400_000166TEXT("The load is caused by snow drifting at the unit lenght"); 
    F↓s← →INI400_000167= s*b*SIN(α); 
} 

</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="340" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Snow/Snow - load on snowguards and other obstacles.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Snow - Loads on snowguards and other obstacles</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Check, follow dX 5, bold" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
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
      <Style Key="Remark, dX 50" X="50" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Remark, dX 50, bold" X="0" Y="0" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" />
      <Style Key="Formula, dX 50" X="0" Y="0" Hor="1" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dY 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
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
      <Variable Modifier="Public" Name="A" ESA_ID="" Type="Double" Value="345" Precision="2">
        <Description TranslateID="VARIABLE_A">
          <ENU>Altitude above the sea level</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>Horizontal distance of the snow fences</ENU>
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
      <Variable Modifier="Public" Name="C↓t,0←" ESA_ID="" Type="Double" Value="950e-3" Precision="2">
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
      <Variable Modifier="Public" Name="F↓s←" ESA_ID="Result.0" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m" />
      </Variable>
      <Variable Modifier="Public" Name="FormCt" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_FormCt">
          <ENU>Use formula for calculation Ct</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Headline" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Headline">
          <ENU>Print headline</ENU>
        </Description>
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
      <Variable Modifier="Public" Name="Rozmery" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Rozmery">
          <ENU>Print dimensions of the construction</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="s" ESA_ID="Result.1" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓k,0←" ESA_ID="" Type="Double" Value="0" Precision="2">
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
      <Variable Modifier="Public" Name="ZoneCSN" ESA_ID="" Type="Double" Value="2" Precision="2">
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
      <Variable Modifier="Public" Name="ZonePN" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_ZonePN">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ZoneSIST" ESA_ID="" Type="Double" Value="3" Precision="2">
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
      <Variable Modifier="Public" Name="ZoneSTN" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_ZoneSTN">
          <ENU>Snow region</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α" ESA_ID="" Type="Double" Value="38" Precision="2">
        <Description TranslateID="VARIABLE_α">
          <ENU>Roof slope</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓i←" ESA_ID="" Type="Double" Value="500e-3" Precision="2">
        <Description TranslateID="VARIABLE_μ↓i←">
          <ENU>Shape coefficient</ENU>
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
      <VC ID="INI400_000089">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|5|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|5|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|5|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000158">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="672" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="672" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="672" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000166">
        <Set Vis="1" Prev="INI400_000158" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000158" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000158" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="722" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="722" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="722" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000167">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="300" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="744" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="744" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="744" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000194">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 300" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="696" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="696" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="696" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000195">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="165" Y="122" Hor="1" Ver="2" SpX="165" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="165" Y="122" Hor="1" Ver="2" SpX="165" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="165" Y="122" Hor="1" Ver="2" SpX="165" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000196">
        <Set Vis="1" Prev="INI400_000219" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000219" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000219" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="117" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="117" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="117" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000197">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="165" Y="94" Hor="1" Ver="4" SpX="165" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="165" Y="94" Hor="1" Ver="4" SpX="165" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="165" Y="94" Hor="1" Ver="4" SpX="165" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000198">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000219">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000221">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="509" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="509" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="509" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="338" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="338" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="338" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000222">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="515" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="515" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="515" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="392" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="392" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="392" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000225">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="370" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="370" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="370" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="199" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="199" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="199" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000227">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000229">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="114" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="114" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="114" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000230">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="341" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="341" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="341" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000233">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="653" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="653" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="653" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
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
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006381">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="344" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="344" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="344" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006388">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006389">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006390">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006391">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006392">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006393">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006394">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006395">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006396">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006397">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006402">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006403">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006404">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006407">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006408">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006409">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006410">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006411">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006412">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006413">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006414">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006415">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006416">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006417">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006419">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006433">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006435">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006436">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006437">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006438">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006441">
        <Set Vis="1" Prev="" Style="0" StyleName="Check, follow dX 5, bold" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Check, follow dX 5, bold" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Check, follow dX 5, bold" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006442">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
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
      <VC ID="INI400_006496">
        <Set Vis="1" Prev="INI400_000196" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000196" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000219" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="117" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="117" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="117" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006497">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="165" Y="122" Hor="1" Ver="2" SpX="165" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="165" Y="122" Hor="1" Ver="2" SpX="165" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="165" Y="122" Hor="1" Ver="2" SpX="165" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006498">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006499">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006517">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006518">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="302" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="prekazka" Content="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" />
      <Image Name="prekazka_60" Content="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" />
      <Image Name="BG" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="" ID="66" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts TranslateID="DIALOG_000066">
          <ENU>Design settings</ENU>
        </Texts>
        <TGroupBox Name="par" ID="60" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000060">
            <ENU>Parameters of the snow load</ENU>
          </Texts>
          <TComboBox Name="Town0ONORM" ID="12" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town0ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3" Index="0">
            <Texts>
              <ENU>Neuwaldegg|Sievering|Simmering|Stephansplatz</ENU>
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
          <TComboBox Name="Town6ONORM" ID="18" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town6ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28" Index="0">
            <Texts>
              <ENU>Arnoldstein|Bad Kleinkirchheim|Bleiburg|Eisenkappel|Feldkirchen|Ferlach|Friesach|Gmünd|Gurk|Heiligenblut|Hermagor|Klagenfurt|Kötschach|Lavamünd|Mallnitz|Millstatt|Nassfeld|Oberdrauburg|Obervellach|Radenthein|Rennweg|St. Andrä/Lavantal|St. Lorenzen/Lesachtal|St. Veit/Glan|Spittal/Drau|Velden|Villach|Völkermarkt|Wolfsberg</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town7ONORM" ID="22" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town7ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33" Index="0">
            <Texts>
              <ENU>Ehrwald|Fulpmes|Hall in Tirol|Hintertux|Holzgau|Ischgl|Imst|Innsbruck|Jenbach|Kitzbühel|Kufstein|Landeck|Lienz|Matrei/Osttirol|Mayrhofen|Obergurgl|Pertisau|Reutte|St. Anton/Arlberg|St. Christoph/Arlberg|St. Jakob/Defereggental|St. Leonhard/Pitztal|St. Johann|Schwaz|Seefeld|Serfaus|Sillian|Sölden|Steinach/Brenner|Tannheim|Telfs|Wörgl|Virgen|Zell/Ziller</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Town8ONORM" ID="20" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Town8ONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16" Index="0">
            <Texts>
              <ENU>Bezau|Bludenz|Bregenz|Dornbirn|Egg|Feldkirch|Gargellen|Götzis|Hohenems|Langen|Lech|Lustenau|Mittelberg|Partenen|Schruns|Warth|Zürs</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="A_4_1_1" ID="28" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TComboBox Name="ZoneBS" ID="24" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneBS" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="1|2|3|4|5|6.5" Index="3">
            <Texts TranslateID="DIALOG_000024">
              <ENU>Zone 1|Zone 2|Zone 3|Zone 4|Zone 5|Zone 6,5</ENU>
            </Texts>
          </TComboBox>
          <TLabel Name="ZoneNEN" ID="37" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="28" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
            <Texts TranslateID="DIALOG_000037">
              <ENU>One snow load in the whole country</ENU>
            </Texts>
          </TLabel>
          <TDoubleInput Name="s_k_0" ID="26" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="s↓k,0←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TComboBox Name="ZoneNF" ID="27" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="19" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneNF" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7" Index="3">
            <Texts>
              <ENU>A1|A2|B1|B2|C1|C2|D|E</ENU>
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
          <TComboBox Name="ZoneIS" ID="31" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneIS" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="1|2|3" Index="1">
            <Texts>
              <ENU>1|2|3</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZonePN" ID="32" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZonePN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="3">
            <Texts>
              <ENU>1|2|3|4|5</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneSR" ID="33" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneSR" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2" Index="2">
            <Texts>
              <ENU>1|2|3</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneSTN" ID="34" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneSTN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="3">
            <Texts>
              <ENU>1|2|3|4|5</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneSIST" ID="35" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneSIST" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4" Index="3">
            <Texts>
              <ENU>A1|A2|A3|A4|M1</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="ZONORM" ID="22" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Z" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="4.5" MinValueWithDim="1.6" DescPos="1" />
          <TComboBox Name="StateONORM" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="StateONORM" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="210" Values="0|1|2|3|4|5|6|7|8" Index="0">
            <Texts TranslateID="DIALOG_000011">
              <ENU>Wien|Niederösterreich|Burgenland|Steiermark|Oberösterreich|Salzburg|Kärnten|Tirol|Vorarlberg</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="ZoneCSN" ID="8" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ZoneCSN" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1|2|3|4|5|6|7" Index="2">
            <Texts>
              <ENU>I|II|III|IV|V|VI|VII|VIII</ENU>
            </Texts>
          </TComboBox>
          <TCheckBox Name="UseTableA1" ID="21" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="UseTableA1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000021">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="Exposure_group" ID="61" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
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
        <TGroupBox Name="Thermal_group" ID="62" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
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
        <TGroupBox Name="" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000019">
            <ENU>Geometry of the roof</ENU>
          </Texts>
          <TDoubleInput Name="" ID="63" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="μ↓i←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="7" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="α" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="90" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="b" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
      </TPanel>
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts>
          <ENU>General settings</ENU>
        </Texts>
        <TGroupBox Name="" ID="65" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000065">
            <ENU>Layout blocks</ENU>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Rozmery" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000004">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="64" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000064">
            <ENU>Headline settings</ENU>
          </Texts>
          <TStringInput Name="TStringInput" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000003">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Headline" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000017">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000046">
            <ENU>National Annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Standard EN">
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
    <Item TranslateID="BLOCK_INI400_006498">
      <ENU>"Dimensions of the construction"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006499">
      <ENU>"Snow load at the snow fences"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000089">
      <ENU>Caption</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000158">
      <ENU>"Snow load at the unit area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000166">
      <ENU>"The load is caused by snow drifting at the unit lenght"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000195">
      <ENU>"α = " &amp; α &amp; " °"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000196">
      <ENU>"Roof slope"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000197">
      <ENU>"b = " &amp; b &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000198">
      <ENU>"Horizontal distance of the adjacent snow fences or the distance"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000219">
      <ENU>"of snow fence from the ridge of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000227">
      <ENU>"Snow load on snowguards and other obstacles according to"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006441">
      <ENU>IO.SetupNA.EC_1991_1_3.Name</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006496">
      <ENU>"Shape coefficient of the adjacent roof"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006497">
      <ENU>"μ↓i← = " &amp; μ↓i←</ENU>
    </Item>
  </Texts>
</Root>