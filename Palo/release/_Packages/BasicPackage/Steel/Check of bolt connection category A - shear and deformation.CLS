<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="c5b8842f-3d3f-4c01-af40-790321b33522">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">void UpdateDialog() { 
    Dialog.GetComponentByName("ECSteel").Visible →INI400_007941= SteelType == 0; 
    Dialog.GetComponentByName("SteelProductLib").Visible →INI400_007942= SteelType == 1; 
} 
→INI400_006265BLOCK { //IO inputs 
    IF(IO.IsStandalone) { //Standalone IO inputs
        SWITCH(SteelType) { 
            CASE 0 :  { //Table 3.1 from EC 1993-1-1
                f↓u← →INI400_007944= IO.STEEL.EC.fu; 
                SteelName →INI400_007947= IO.STEEL.EC.Item; 
            } 
            CASE 1 :  { //Table from product codes
                f↓u← →INI400_007946= IO.STEEL.PC.fu; 
                SteelName →INI400_007948= IO.STEEL.PC.Item; 
            } 
        } 
    } ELSE { //SEN IO inputs
    } 
} 
IF(H1) { 
    →INI400_000015TEXT("Check of bolt connection category A - shear and deformation according to Eurocode 3"); 
    →INI400_000187TEXT(IO.SetupNA.EC_1993_1_8.Name); 
} 
IF(H2) { →INI400_000186TEXT(headline); } 
→INI400_000168BLOCK("National Annex parameters") { //National annexes
    →INI400_005819BLOCK { //NA.2.2 Clause 2.2 Partial safety factors, Paragraph (2)
        object Clause2_2_2 →INI400_006231= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1993\EN_1993_1_8\Clause_2.2(2).CLC"); 
        →INI400_006238Clause2_2_2.Calculate(false); 
        double γ↓Μ2← →INI400_006219= Clause2_2_2.γ↓M2←; 
    } 
} 
→INI400_006221BLOCK("Bolt characteristics") { 
    →INI400_000076TEXT("Bolt type"); 
    D →INI400_000179= d*1000; 
    →INI400_000077TEXT("M" &amp; d &amp; " (" &amp; Material &amp; ")"); 
    →INI400_006269TEXT("f↓ub← = " &amp; f↓ub←); 
    →INI400_006270TEXT("f↓yb← = " &amp; f↓yb←); 
    IF(Material == 3.6 || Material == 12.9) { //3.6,12.9
        →INI400_000163TEXT("Check is not specified for this bolt type"); 
        Exit(); 
    } 
    →INI400_000152TEXT(Description("n") &amp; ": " &amp; n); 
    →INI400_006277TEXT(Description("d")); 
    →INI400_006278TEXT("d = " &amp; d); 
    →INI400_006225TEXT(Description("d↓0←")); 
    →INI400_006226TEXT("d↓0← = " &amp; d↓0←); 
    →INI400_000158TEXT(Description("A")); 
    →INI400_000157TEXT("A = " &amp; A); 
    →INI400_000156TEXT(Description("A↓s←")); 
    →INI400_000155TEXT("A↓s← = " &amp; A↓s←); 
    →INI400_006276PAGEBREAK(); 
} 

→INI400_006275BLOCK("Geometry") { 
    →INI400_006279TEXT(Description("e↓1←")); 
    →INI400_006280TEXT("e↓1← = " &amp; e↓1←); 
    →INI400_006281TEXT(Description("e↓2←")); 
    →INI400_006282TEXT("e↓2← = " &amp; e↓2←); 
    →INI400_006283TEXT(Description("p↓1←")); 
    →INI400_006284TEXT("p↓1← = " &amp; p↓1←); 
    →INI400_006285TEXT(Description("p↓2←")); 
    →INI400_006286TEXT("p↓2← = " &amp; p↓2←); 
    →INI400_006287TEXT(Description("t")); 
    →INI400_006288TEXT("t = " &amp; t); 
} 
→INI400_006222BLOCK("Loading") { 
    →INI400_000170TEXT(Description("F↓v,Ed←")); 
    →INI400_000169TEXT("F↓v,Ed← = " &amp; F↓v,Ed←); 
} 
→INI400_000188PAGEBREAK(); 
→INI400_000021IMG("sroub_strih"); 
→INI400_000189PAGEBREAK(); 
→INI400_006223BLOCK("Check of shear:") { 
    →INI400_000007TEXT("Condition F↓v,Ed ←≤ F↓v,Rd←"); 
    IF(zavit &amp;&amp; drik) { 
        →INI400_000185TEXT("Set only one type of shear plane, please"); 
        Exit(); 
    } 
    IF(zavit) { //differentalphafordifferenttype
        →INI400_000174TEXT("Fixative bolt area is used in calculation"); 
        IF(Material == 4.6 || Material == 5.6 || Material == 8.8) { //4.6,5.6,8.8
            α↓v← →INI400_000162= 0.6; 
        } 
        IF(Material == 4.8 || Material == 5.8 || Material == 6.8 || Material == 10.8) { //4.8,5.8,6.8,10.9
            α↓v← →INI400_000161= 0.5; 
            →INI400_006274TEXT("γ↓Μ2← = " &amp; γ↓Μ2←); 
        } 
        F↓v,Rd,1← →INI400_000180= n*(α↓v←*f↓ub←*A↓s←)/γ↓Μ2←; 
    } 
    IF(drik) { 
        →INI400_000173TEXT("Bolt shank area is used in calculation"); //alphaisthesameforeverybolttype
        α↓v← →INI400_000165= 0.6; 
        F↓v,Rd,1← →INI400_000014= n*(α↓v←*f↓ub←*A)/γ↓Μ2←; 
    } 
    IF(F↓v,Ed← &lt;= F↓v,Rd,1←) { 
        →INI400_000181TEXT("F↓v,Ed ←≤ F↓v,Rd,1← =&gt; " &amp; F↓v,Ed← &amp; " ≤ " &amp; F↓v,Rd,1←); 
        →INI400_000009TEXT("=&gt; Bolt during shear is SUFFICIENT"); 
    } ELSE { 
        →INI400_000184TEXT("F↓v,Ed ←&gt; F↓v,Rd,1← =&gt; " &amp; F↓v,Ed← &amp; " &gt; " &amp; F↓v,Rd,1←); 
        →INI400_000010TEXT("=&gt; Bolt during shear is INSUFFICIENT"); 
    } 
} 
→INI400_000190PAGEBREAK(); 
→INI400_006224BLOCK("Check of bolt deformation:") { 
    →INI400_006271TEXT(Description("SteelName")); 
    →INI400_006272TEXT(SteelName); 
    →INI400_006273TEXT("f↓u← = " &amp; f↓u←); 
    →INI400_000134TEXT("Condition F↓v,Ed ←≤ F↓b,Rd←"); 
    →INI400_000178TEXT("Force on one bolt:"); 
    F↓v,Ed,n← →INI400_000177= F↓v,Ed←/n; 
    →INI400_000191PAGEBREAK(); 
    →INI400_000143IMG("Sroub_geom", 0.7); 
    →INI400_000192PAGEBREAK(); 
    α↓b← →INI400_000153= PARMIN(e↓1←/(3*d↓0←), p↓1←/(3*d↓0←)-0.25, f↓ub←/f↓u←, 1.0); 
    k↓1← →INI400_000154= PARMIN(2.8*(e↓2←/d↓0←)-1.7, 1.4*(p↓2←/d↓0←)-1.7, 2.5); 
    F↓b,Rd← →INI400_000147= (k↓1←*α↓b←*f↓u←*d*t)/γ↓Μ2←; 
    IF(F↓v,Ed,n← &lt;= F↓b,Rd←) { 
        →INI400_000182TEXT("F↓v,Ed,n ←≤ F↓b,Rd← =&gt; " &amp; F↓v,Ed,n← &amp; " ≤ " &amp; F↓b,Rd←); 
        →INI400_000150TEXT("=&gt; Bolt deformation is SUFFICIENT"); 
    } ELSE { 
        →INI400_000183TEXT("F↓v,Ed,n  ←&gt; F↓b,Rd ←=&gt; " &amp; F↓v,Ed,n← &amp; " &gt; " &amp; F↓b,Rd←); 
        →INI400_000151TEXT("=&gt; Bolt deformation is INSUFFICIENT"); 
    } 
} 
//NA dependent variables:
//fy,fu - NA.2.3.
// γ↓M← - NA.2.13., NA.2.14</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="3000" Material="1" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="TRX" Autor2="" Version="93" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Steel_Check_of_bolt_shear_connection.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Check of bolt connections category A</ENU>
      </CalculationName>
    </Header>
    <Styles />
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="A" ESA_ID="Bolt.Bolt_A" Type="Double" Value="201.06e-6" Precision="2">
        <Description TranslateID="VARIABLE_A">
          <ENU>Bolt shank area</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓s←" ESA_ID="Bolt.Bolt_Anet" Type="Double" Value="157e-6" Precision="2">
        <Description TranslateID="VARIABLE_A↓s←">
          <ENU>Fixative bolt area</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="Clause2_2_2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="Bolt.Bolt_D" Type="Double" Value="16e-3" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>Bolt diameter</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="D" ESA_ID="" Type="Double" Value="16" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="d↓0←" ESA_ID="" Type="Double" Value="18e-3" Precision="2">
        <Description TranslateID="VARIABLE_d↓0←">
          <ENU>Opening diameter</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="drik" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_drik">
          <ENU>Shear plane goes through bolt shank</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="e↓1←" ESA_ID="" Type="Double" Value="30e-3" Precision="2">
        <Description TranslateID="VARIABLE_e↓1←">
          <ENU>Distance of bolts from edge - parallel</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="e↓2←" ESA_ID="" Type="Double" Value="30e-3" Precision="2">
        <Description TranslateID="VARIABLE_e↓2←">
          <ENU>Distance of bolts from edge - perpendicular</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="F↓b,Rd←" ESA_ID="Result.2" Type="Double" Value="32000" Precision="3">
        <Description TranslateID="VARIABLE_F↓b,Rd←">
          <ENU>Bearing capacity in deformation</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="f↓u←" ESA_ID="" Type="Double" Value="360e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓u←">
          <ENU>Material tensile strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ub←" ESA_ID="Bolt.Bolt_fub" Type="Double" Value="500e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ub←">
          <ENU>Characteristic tensile strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="F↓v,Ed,n←" ESA_ID="" Type="Double" Value="25000" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓v,Ed←" ESA_ID="" Type="Double" Value="500000" Precision="2">
        <Description TranslateID="VARIABLE_F↓v,Ed←">
          <ENU>Shear force</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓v,Rd,1←" ESA_ID="Result.1" Type="Double" Value="753600" Precision="3">
        <Description TranslateID="VARIABLE_F↓v,Rd,1←">
          <ENU>Shear bearing capacity in one shear plane</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yb←" ESA_ID="Bolt.Bolt_fyb" Type="Double" Value="300e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="H1" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_H1">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="H2" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_H2">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="headline" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_headline">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="k↓1←" ESA_ID="" Type="Double" Value="2.5" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Material" ESA_ID="Bolt.Bolt_Material" Type="Double" Value="5.6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n" ESA_ID="" Type="Double" Value="20" Precision="0">
        <Description TranslateID="VARIABLE_n">
          <ENU>Number of bolts</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="p↓1←" ESA_ID="" Type="Double" Value="70e-3" Precision="2">
        <Description TranslateID="VARIABLE_p↓1←">
          <ENU>Offsets for bolts - parallel</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="p↓2←" ESA_ID="" Type="Double" Value="68e-3" Precision="2">
        <Description TranslateID="VARIABLE_p↓2←">
          <ENU>Offsets for bolts - perpendicular</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="SteelName" ESA_ID="" Type="String" Value="S 235">
        <Description TranslateID="VARIABLE_SteelName">
          <ENU>Steel sheet material</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SteelType" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_SteelType">
          <ENU>Type of steel material library</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="t" ESA_ID="" Type="Double" Value="5e-3" Precision="2">
        <Description TranslateID="VARIABLE_t">
          <ENU>Member thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="zavit" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_zavit">
          <ENU>Shear plane goes through bolt thread</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="α↓b←" ESA_ID="" Type="Double" Value="555.5556e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓v←" ESA_ID="" Type="Double" Value="600e-3" Precision="2">
        <Description TranslateID="VARIABLE_α↓v←">
          <ENU>Coefficient for shear plane</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓Μ2←" ESA_ID="" Type="Double" Value="1.25" Precision="2">
        <Description TranslateID="VARIABLE_γ↓Μ2←">
          <ENU>Partial safety factor</ENU>
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
      <VC ID="INI400_000007">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="312" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="280" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="280" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="68" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="68" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="68" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000009">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="349" Y="412" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="245" Y="362" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="245" Y="224" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="323" Y="266" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="323" Y="266" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="323" Y="266" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="389" Y="386" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="246" Y="342" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="249" Y="203" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000014">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="351" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="322" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="322" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="266" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="266" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="266" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000015">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14.3|5|2" Font2="Tahoma|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14.3|5|2" Font2="Tahoma|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14.3|5|2" Font2="Tahoma|14.3|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000021">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="218" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="192" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="131" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="131" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="131" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000076">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="67" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="52" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="52" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000077">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="67" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000134">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="462" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="384" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="384" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="407" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="407" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="407" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000143">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="680" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="600" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="582" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="591" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="591" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="591" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000147">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="1074" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="988" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="307" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="855" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="855" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="855" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000150">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="370" Y="1066" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="230" Y="1021" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="230" Y="321" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="382" Y="855" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="382" Y="855" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="382" Y="855" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000151">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="217" Y="1107" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="233" Y="1021" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="233" Y="333" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="921" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="921" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="921" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000152">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="15" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="450" Y="84.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000153">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="913" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="828" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="291" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="782" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="782" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="782" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
      </VC>
      <VC ID="INI400_000154">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="1007" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="922" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="291" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="818" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="818" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="818" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
      </VC>
      <VC ID="INI400_000155">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="107" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="103" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="450" Y="84.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000156">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="90" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="90" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000157">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="86.9" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="84.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000158">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000161">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="313" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="191" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000162">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="343" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="313" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="193" Hor="0" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000163">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="66" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="66" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="66" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000165">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="294" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="294" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000168">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000169">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="152" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="130" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000170">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="129" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="129" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000173">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="299" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="280" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="280" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000174">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="328" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="298" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="176" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000177">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="150" Y="482" Hor="0" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="150" Y="407" Hor="0" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="150" Y="269" Hor="0" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000178">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="482" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="407" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="269" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000179">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000180">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="150" Y="379" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="339" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="209" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000181">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="412" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="362" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="224" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000182">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="1066" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="1021" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="321" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000183">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="1107" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="1021" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="333" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000184">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="386" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="342" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="203" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000185">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="318" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="299" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="299" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|3|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000186">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000187">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000188">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000189">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="275" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000190">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="349" Y="424" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000191">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="502" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000192">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="858" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005819">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="274" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006219">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="328" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006221">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006222">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006223">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006224">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006225">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006226">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="67" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="84.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006231">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="287" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006238">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006265">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006269">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="84.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006270">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="400" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="84.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006271">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006272">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="407" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="191" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006273">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="407" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="191" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006274">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006275">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006276">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="166" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006277">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006278">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="67" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006279">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006280">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="86.9" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006281">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006282">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="86.9" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="84.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006283">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006284">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="86.9" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="84.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006285">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006286">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="86.9" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="450" Y="84.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006287">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="71" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006288">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="86.9" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007941">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007942">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007944">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007946">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007947">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007948">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="sroub_strih" Content="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" />
      <Image Name="Sroub_geom" Content="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" />
      <Image Name="BG" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="562">
      <TPanel Name="" ID="98" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts TranslateID="DIALOG_000098">
          <ENU>Load</ENU>
        </Texts>
        <TGroupBox Name="" ID="31" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000031">
            <ENU>Load value</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="F↓v,Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
      </TPanel>
      <TPanel Name="" ID="95" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
        <Texts TranslateID="DIALOG_000095">
          <ENU>Material, bolts settings</ENU>
        </Texts>
        <TGroupBox Name="" ID="32" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000032">
            <ENU>Geometry</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="t" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="p↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="p↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="e↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="e↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="n" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="d↓0←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="105" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000105">
            <ENU>Bolt settings</ENU>
          </Texts>
          <TBoltsLibrary Name="TBoltsLibrary" ID="29" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="224|41" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="Bolt" Diameter="3" Material="3" />
        </TGroupBox>
        <TGroupBox Name="" ID="103" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000103">
            <ENU>Additional settings</ENU>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="16" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="drik" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000016">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="zavit" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000015">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TComboBox Name="" ID="48" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="SteelType" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="290" Values="0|1" Index="0">
            <Texts TranslateID="DIALOG_000048">
              <ENU>Simplified from EC 1993-1-1 Table 3.1|From product list codes</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
        <TGroupBox Name="" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000036">
            <ENU>Steel sheet material</ENU>
          </Texts>
          <TCustomLibrary Name="SteelProductLib" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="STEEL.PC" DataFile="EC_Steel_Product_List.xml" Collapsed="True" UseCombo="False" Category="3 mm &lt; t &lt;= 16 mm" Item="S 235 JR (EN 10025-2)">
            <Data>
              <Header>
                <PropertySet Symbol="f↓y←" ESA_ID="fy" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓u←" ESA_ID="fu" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="E" ESA_ID="E" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="G" ESA_ID="G" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="ν" ESA_ID="ν" Unit="" Type="Numeric" />
                <PropertySet Symbol="γ" ESA_ID="γ" Unit="kg/m↑3←" Type="Numeric" />
                <PropertySet Symbol="α" ESA_ID="α" Unit="10↑-6←" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>3 mm &lt; t &lt;= 16 mm</P>
                  <P>S 235 JR (EN 10025-2)</P>
                  <P>235</P>
                  <P>360</P>
                  <P>210</P>
                  <P>80.77</P>
                  <P>0.3</P>
                  <P>7850</P>
                  <P>12</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
          <TCustomLibrary Name="ECSteel" ID="44" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="STEEL.EC" DataFile="EC_Steel.xml" Collapsed="True" UseCombo="False" Category="t &lt;= 40 mm" Item="S 235">
            <Data>
              <Header>
                <PropertySet Symbol="f↓y←" ESA_ID="fy" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓u←" ESA_ID="fu" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="E" ESA_ID="E" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="G" ESA_ID="G" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="ν" ESA_ID="ν" Unit="" Type="Numeric" />
                <PropertySet Symbol="γ" ESA_ID="γ" Unit="kg/m↑3←" Type="Numeric" />
                <PropertySet Symbol="α" ESA_ID="α" Unit="10↑-6←" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>t &lt;= 40 mm</P>
                  <P>S 235</P>
                  <P>235</P>
                  <P>360</P>
                  <P>210</P>
                  <P>80.77</P>
                  <P>0.3</P>
                  <P>7850</P>
                  <P>12</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
        </TGroupBox>
      </TPanel>
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
        <Texts>
          <ENU>General settings</ENU>
        </Texts>
        <TGroupBox Name="" ID="101" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000101">
            <ENU>Headline settings</ENU>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="H1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000017">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TStringInput Name="TStringInput" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="headline" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="18" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="H2" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000018">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="40" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000040">
            <ENU>National Annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="35" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Standard EN">
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
    <Item TranslateID="BLOCK_INI400_000168">
      <ENU>"National Annex parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006221">
      <ENU>"Bolt characteristics"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006222">
      <ENU>"Loading"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006223">
      <ENU>"Check of shear:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006224">
      <ENU>"Check of bolt deformation:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006275">
      <ENU>"Geometry"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000007">
      <ENU>"Condition F↓v,Ed ←≤ F↓v,Rd←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000009">
      <ENU>"=&gt; Bolt during shear is SUFFICIENT"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000010">
      <ENU>"=&gt; Bolt during shear is INSUFFICIENT"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000015">
      <ENU>"Check of bolt connection category A - shear and deformation according to Eurocode 3"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000076">
      <ENU>"Bolt type"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000077">
      <ENU>"M" &amp; d &amp; " (" &amp; Material &amp; ")"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000134">
      <ENU>"Condition F↓v,Ed ←≤ F↓b,Rd←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000150">
      <ENU>"=&gt; Bolt deformation is SUFFICIENT"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000151">
      <ENU>"=&gt; Bolt deformation is INSUFFICIENT"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000152">
      <ENU>Description("n") &amp; ": " &amp; n</ENU>
    </Item>
    <Item ID="TEXT_INI400_000155">
      <ENU>"A↓s← = " &amp; A↓s←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000156">
      <ENU>Description("A↓s←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000157">
      <ENU>"A = " &amp; A</ENU>
    </Item>
    <Item ID="TEXT_INI400_000158">
      <ENU>Description("A")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000163">
      <ENU>"Check is not specified for this bolt type"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000169">
      <ENU>"F↓v,Ed← = " &amp; F↓v,Ed←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000170">
      <ENU>Description("F↓v,Ed←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000173">
      <ENU>"Bolt shank area is used in calculation"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000174">
      <ENU>"Fixative bolt area is used in calculation"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000178">
      <ENU>"Force on one bolt:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000181">
      <ENU>"F↓v,Ed ←≤ F↓v,Rd,1← =&gt; " &amp; F↓v,Ed← &amp; " ≤ " &amp; F↓v,Rd,1←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000182">
      <ENU>"F↓v,Ed,n ←≤ F↓b,Rd← =&gt; " &amp; F↓v,Ed,n← &amp; " ≤ " &amp; F↓b,Rd←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000183">
      <ENU>"F↓v,Ed,n  ←&gt; F↓b,Rd ←=&gt; " &amp; F↓v,Ed,n← &amp; " &gt; " &amp; F↓b,Rd←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000184">
      <ENU>"F↓v,Ed ←&gt; F↓v,Rd,1← =&gt; " &amp; F↓v,Ed← &amp; " &gt; " &amp; F↓v,Rd,1←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000185">
      <ENU>"Set only one type of shear plane, please"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000186">
      <ENU>headline</ENU>
    </Item>
    <Item ID="TEXT_INI400_000187">
      <ENU>IO.SetupNA.EC_1993_1_8.Name</ENU>
    </Item>
    <Item ID="TEXT_INI400_006225">
      <ENU>Description("d↓0←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006226">
      <ENU>"d↓0← = " &amp; d↓0←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006269">
      <ENU>"f↓ub← = " &amp; f↓ub←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006270">
      <ENU>"f↓yb← = " &amp; f↓yb←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006271">
      <ENU>Description("SteelName")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006272">
      <ENU>SteelName</ENU>
    </Item>
    <Item ID="TEXT_INI400_006273">
      <ENU>"f↓u← = " &amp; f↓u←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006274">
      <ENU>"γ↓Μ2← = " &amp; γ↓Μ2←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006277">
      <ENU>Description("d")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006278">
      <ENU>"d = " &amp; d</ENU>
    </Item>
    <Item ID="TEXT_INI400_006279">
      <ENU>Description("e↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006280">
      <ENU>"e↓1← = " &amp; e↓1←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006281">
      <ENU>Description("e↓2←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006282">
      <ENU>"e↓2← = " &amp; e↓2←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006283">
      <ENU>Description("p↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006284">
      <ENU>"p↓1← = " &amp; p↓1←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006285">
      <ENU>Description("p↓2←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006286">
      <ENU>"p↓2← = " &amp; p↓2←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006287">
      <ENU>Description("t")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006288">
      <ENU>"t = " &amp; t</ENU>
    </Item>
  </Texts>
</Root>