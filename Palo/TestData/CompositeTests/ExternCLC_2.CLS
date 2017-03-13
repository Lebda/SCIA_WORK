<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="152004" GUID="ce83559b-f322-4876-83e3-cdc2fdd03cad">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">IF(h1) { →000157TEXT("Check of steel profile for bending: " &amp; SectionName); } 
IF(PrintCaption) { →000045TEXT(Caption); } 

SectionClass →000158= EuroCode.SteelSectionBendingClass(IO.CS.Geometry, f↓y←); 

IF(PrintLoad) { 
    →000132BLOCK { 
        →000131TEXT("Loading:"); 
        →000128TEXT("Bending moment"); →000127TEXT("M↓Ed,y← = " &amp; Val(M↓Ed,y←/1000, 2) &amp; " kNm"); 
        →000077TEXT("Bending moment"); →000076TEXT("M↓Ed,z← = " &amp; Val(M↓Ed,z←/1000, 2) &amp; " kNm"); 
    } 
    →000159PAGEBREAK(); 
} 

IF(PrintSection) { 
    →000120BLOCK { 
        →000041TEXT("Cross section parameters:"); 
        →000031IMG(SectionImage); 
        →000029TEXT("h = " &amp; Val(1000*h, 0)); 
        →000030TEXT("b = " &amp; Val(1000*b, 0)); 
        →000149TEXT("G = " &amp; G &amp; " kg/m"); 
        →000048TEXT("Cross section area"); 
        →000032TEXT("A = " &amp; A &amp; " m↑2←"); 
        →000156TEXT("Cross section modulus y"); 
        →000155TEXT("W↓el,y← = " &amp; W↓el,y← &amp; " m↑4←"); 
        →000154TEXT("W↓pl,y← = " &amp; W↓pl,y← &amp; " m↑4←"); 
        →000153TEXT("Cross section modulus z"); 
        →000152TEXT("W↓el,z← = " &amp; W↓el,z← &amp; " m↑4←"); 
        →000151TEXT("W↓pl,z← = " &amp; W↓pl,z← &amp; " m↑4←"); 
    } 
    →000160PAGEBREAK(); 
} 

IF(SectionClass &gt;= 0 &amp;&amp; SectionClass &lt;= 3) { 
    →000058TEXT("Bearing capacity for bending"); 
    IF(SectionClass == 1 || SectionClass == 2) { M↓Rd,y← →000010= W↓pl,y←*f↓y←/γ↓M0←; } 
    IF(SectionClass == 3) { M↓Rd,y← →000001= W↓el,y←*f↓y←/γ↓M0←; } 
    s↓y← →000056= M↓Ed,y←/M↓Rd,y←; 
    
    IF(SectionClass == 1 || SectionClass == 2) { M↓Rd,z← →000024= W↓pl,z←*f↓y←/γ↓M0←; } 
    IF(SectionClass == 3) { M↓Rd,z← →000026= W↓el,z←*f↓y←/γ↓M0←; } 
    s↓z← →000057= M↓Ed,z←/M↓Rd,z←; 
    
    →000038TEXT("Check"); 
    s↓max← →000037= max(s↓y←, s↓z←); 
    IF(s↓max← &lt; 1) { →000054TEXT("=&gt; Is SUFFICIENT"); } ELSE { →000055TEXT("=&gt; Is INSUFFICIENT!"); } 
} ELSE { 
    →000059TEXT("Calculation is determined only for cross section class 1, 2 and 3"); Exit(); 
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="-1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="701" Autor="User" Autor2="" Version="50" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
        <Language Code="CSY" LangName="Čeština" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia-online.com/forms/cz/Ocel_Posouzeni_prosty_ohyb.htm</ENU>
        <CSY>http://design-forms.scia-online.com/forms/cz/Ocel_Posouzeni_prosty_ohyb.htm</CSY>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Check for bending</ENU>
        <CSY>Posouzení na prostý ohyb</CSY>
      </CalculationName>
    </Header>
    <Styles />
    <NormRef>
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="A" ESA_ID="CS.Geometry.A" Type="Double" Value="2.848e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="CS.Geometry.B" Type="Double" Value="100e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Caption" ESA_ID="Result.14" Type="String" Value="uživatelský popis">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
          <CSY>Uživatelský nadpis</CSY>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" Numeric="s↓max←" />
      </Variable>
      <Variable Modifier="Public" Name="f↓y←" ESA_ID="STEEL.EC.fy" Type="Double" Value="235e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓y←">
          <ENU>Yield strength</ENU>
          <CSY>Mez kluzu</CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="G" ESA_ID="CS.Geometry.g" Type="Double" Value="22.3568" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="CS.Geometry.H" Type="Double" Value="200e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="h1" ESA_ID="Result.23" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_h1">
          <ENU>Print headline</ENU>
          <CSY>Tisknout nadpis</CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="M↓Ed,y←" ESA_ID="" Type="Double" Value="25000" Precision="2">
        <Description TranslateID="VARIABLE_M↓Ed,y←">
          <ENU>Bending moment - axis y</ENU>
          <CSY>Působící ohybový moment k ose y</CSY>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Ed,z←" ESA_ID="" Type="Double" Value="5000" Precision="2">
        <Description TranslateID="VARIABLE_M↓Ed,z←">
          <ENU>Bending moment - axis z</ENU>
          <CSY>Působící ohybový moment k ose z</CSY>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Rd,y←" ESA_ID="Result.9" Type="Double" Value="45079.13" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Rd,z←" ESA_ID="Result.10" Type="Double" Value="9115.957" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="Result.15" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
          <CSY>Tisknout uživatelský nadpis </CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintLoad" ESA_ID="Result.16" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintLoad">
          <ENU>Print loading</ENU>
          <CSY>Tisknout zatížení</CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintSection" ESA_ID="Result.17" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintSection">
          <ENU>Print cross section parameters</ENU>
          <CSY>Tisknout parametry průřezu</CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="s↓max←" ESA_ID="Result.13" Type="Double" Value="554.5804e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="s↓y←" ESA_ID="Result.11" Type="Double" Value="554.5804e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="s↓z←" ESA_ID="Result.12" Type="Double" Value="548.4888e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="SectionClass" ESA_ID="Result.2" Type="Double" Value="1" Precision="0">
        <Description TranslateID="VARIABLE_SectionClass">
          <ENU>Cross section class</ENU>
          <CSY>Třída průřezu</CSY>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="-" />
      </Variable>
      <Variable Modifier="Public" Name="SectionImage" ESA_ID="CS.SectionImage" Type="String" Value="SSL_IPE">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SectionName" ESA_ID="CS.SectionName" Type="String" Value="IPE 200">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="W↓el,y←" ESA_ID="CS.Geometry.Wy" Type="Double" Value="194.3e-6" Precision="2">
        <Description TranslateID="VARIABLE_W↓el,y←">
          <ENU>Elastic cross section modulus y</ENU>
          <CSY>Pružný modul průřezu k ose y</CSY>
        </Description>
        <Unit m="3" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-9" Dim="mm↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="W↓el,z←" ESA_ID="CS.Geometry.Wz" Type="Double" Value="28.47e-6" Precision="2">
        <Description TranslateID="VARIABLE_W↓el,z←">
          <ENU>Elastic cross section modulus z</ENU>
          <CSY>Pružný modul průřezu k ose z</CSY>
        </Description>
        <Unit m="3" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-9" Dim="mm↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="W↓pl,y←" ESA_ID="CS.Geometry.Wply" Type="Double" Value="220.6e-6" Precision="2">
        <Description TranslateID="VARIABLE_W↓pl,y←">
          <ENU>Plastic cross section modulus y</ENU>
          <CSY>Plastický modul průřezu k ose y</CSY>
        </Description>
        <Unit m="3" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-9" Dim="mm↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="W↓pl,z←" ESA_ID="CS.Geometry.Wplz" Type="Double" Value="44.61e-6" Precision="2">
        <Description TranslateID="VARIABLE_W↓pl,z←">
          <ENU>Plastic cross section modulus z</ENU>
          <CSY>Plastický modul průřezu k ose z</CSY>
        </Description>
        <Unit m="3" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-9" Dim="mm↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓M0←" ESA_ID="" Type="Double" Value="1.15" Precision="2">
        <Description TranslateID="VARIABLE_γ↓M0←">
          <ENU>Coefficient of reliability of material</ENU>
          <CSY>Součinitel spolehlivosti materiálu</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="-" />
      </Variable>
    </Variables>
    <DrawingGroups />
    <ResultTables />
    <ResultGroups />
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Full</ENU>
          <CSY>Plný</CSY>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Brief</ENU>
          <CSY>Stručný</CSY>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_2">
          <ENU>Layout 3</ENU>
          <CSY>Layout 3</CSY>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_3">
          <ENU>Layout 4</ENU>
          <CSY>Layout 4</CSY>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_4">
          <ENU>Layout 5</ENU>
          <CSY>Layout 5</CSY>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_5">
          <ENU>Layout 6</ENU>
          <CSY>Layout 6</CSY>
        </Names>
      </Layout>
    </Layouts>
    <VisualComponents>
      <VC ID="000001">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="287" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="77" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="77" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="77" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="77" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="77" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="000010">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="300" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="162" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="260" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="000024">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="376" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="178" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="294" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="120" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="120" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="120" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="000026">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="000029">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="85" Y="162" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="85" Y="178" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="85" Y="178" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000030">
        <Set Vis="1" Prev="31" Style="0" StyleName="" X="35.1" Y="216" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="31" Style="0" StyleName="" X="37.5" Y="231" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="31" Style="0" StyleName="" X="37.5" Y="231" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000031">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="30" Y="162" Hor="1" Ver="4" SpX="30" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="30" Y="178" Hor="1" Ver="4" SpX="30" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="30" Y="178" Hor="1" Ver="4" SpX="30" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000032">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="134" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="116" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="139" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000037">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="466" Hor="0" Ver="4" SpX="10" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="224" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|1|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="10" Y="173" Hor="0" Ver="4" SpX="10" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="126" Hor="0" Ver="4" SpX="10" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="126" Hor="0" Ver="4" SpX="10" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="126" Hor="0" Ver="4" SpX="10" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|1|2" EqStyle="7" />
      </VC>
      <VC ID="000038">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="204" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="146" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="101" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="101" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="101" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="000041">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="77.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000045">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="22.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
      </VC>
      <VC ID="000048">
        <Set Vis="1" Prev="31" Style="0" StyleName="" X="150" Y="134" Hor="0" Ver="1" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="31" Style="0" StyleName="" X="150" Y="139" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="31" Style="0" StyleName="" X="150" Y="139" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000054">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="287" Y="466" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13.3|1|2" Font2="Arial|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="297" Y="224" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13.3|1|2" Font2="Arial|13.3|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="535" Y="79" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|1|2" Font2="Arial|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="258" Y="126" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|1|2" Font2="Arial|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="258" Y="126" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|1|2" Font2="Arial|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="258" Y="126" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|1|2" Font2="Arial|11.7|1|2" EqStyle="7" />
      </VC>
      <VC ID="000055">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="268" Y="456" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13.3|1|2" Font2="Arial|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="278" Y="224" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13.3|1|2" Font2="Arial|13.3|3|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="510" Y="84" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|1|2" Font2="Arial|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="277" Y="135" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|1|2" Font2="Arial|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="277" Y="135" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|1|2" Font2="Arial|11.7|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="277" Y="135" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|1|2" Font2="Arial|11.7|1|2" EqStyle="7" />
      </VC>
      <VC ID="000056">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="332" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="128" Y="162" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="301" Y="260" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="304" Y="67" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="304" Y="67" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="304" Y="67" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="000057">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="407" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="128" Y="178" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="310" Y="294" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="321" Y="120" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="321" Y="120" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="321" Y="120" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="000058">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="265" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="142" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="34" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="33" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="33" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="33" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="000059">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="265" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Arial|13.3|3|2" Font2="Arial|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="46" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Arial Black|13|0|2" Font2="Arial Black|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="46" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Arial Black|13|0|2" Font2="Arial Black|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="46" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Arial Black|13|0|2" Font2="Arial Black|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000076">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="200" Y="72.9" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="140" Y="52.2" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="200" Y="94" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000077">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="72.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="10" Y="73" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="94" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000120">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="96.2" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="70.5" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="113" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000127">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="200" Y="52.1" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="52.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="200" Y="73" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000128">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="52.1" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="10" Y="52" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="73" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000131">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="32.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="32.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000132">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="24.9" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="24.9" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000149">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="15.5" Y="235" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="10" Y="97.8" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000151">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="222" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="286" Y="116" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="227" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000152">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="203" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="155" Style="0" StyleName="" X="142" Y="116" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="203" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000153">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="150" Y="203" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="150" Y="203" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="150" Y="203" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000154">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="177" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="282" Y="97.8" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="182" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000155">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="158" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="149" Style="0" StyleName="" X="142" Y="97.8" Hor="4" Ver="2" SpX="40" SpY="0" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="158" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000156">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="150" Y="158" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="150" Y="158" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="150" Y="158" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000157">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13.3|5|2" Font2="Arial|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000158">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="22.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="22.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="22.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="22.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="22.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="22.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000159">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="86.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000160">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="248" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="TPanel" ID="0" Translate="1" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts TranslateID="DIALOG_000000">
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Texts>
        <TDoubleInput Name="TDoubleInput" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="γ↓M0←" VarNameVisible="False" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        <TLabel Name="TCheckBox" ID="7" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|5|2" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000007">
            <ENU>Coefficients:</ENU>
            <CSY>Součinitele:</CSY>
          </Texts>
        </TLabel>
        <TDoubleInput Name="TDoubleInput" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="M↓Ed,z←" VarNameVisible="False" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="M↓Ed,y←" VarNameVisible="False" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        <TLabel Name="TCheckBox" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|5|2" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000003">
            <ENU>Loading:</ENU>
            <CSY>Zatížení:</CSY>
          </Texts>
        </TLabel>
        <TCheckBox Name="TCheckBox" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintSection" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000010">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TCheckBox Name="TCheckBox" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintLoad" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000009">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TStringInput Name="TStringInput" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
        <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000001">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TCheckBox Name="TCheckBox" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000012">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TSteelSectionLibrary Name="TSteelSectionLibrary" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="300|30" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="2" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="CS" Group="1" Section="6" Collapsed="True" />
        <TCustomLibrary Name="TCustomLibrary" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="TIMBER.EC" DataFile="EC_Steel.xml" Collapsed="True" UseCombo="False" Category="t &lt;= 40 mm" Item="S 235">
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
      </TPanel>
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="TEXT_000029">
      <ENU>"h = " &amp; Val(1000*h, 0)</ENU>
      <CSY>"h = " &amp; Val(1000*h, 0)</CSY>
    </Item>
    <Item TranslateID="TEXT_000030">
      <ENU>"b = " &amp; Val(1000*b, 0)</ENU>
      <CSY>"b = " &amp; Val(1000*b, 0)</CSY>
    </Item>
    <Item TranslateID="TEXT_000032">
      <ENU>"A = " &amp; A &amp; " m↑2←"</ENU>
      <CSY>"A = " &amp; A &amp; " m↑2←"</CSY>
    </Item>
    <Item TranslateID="TEXT_000038">
      <ENU>"Check"</ENU>
      <CSY>"Check"</CSY>
    </Item>
    <Item TranslateID="TEXT_000041">
      <ENU>"Cross section parameters:"</ENU>
      <CSY>"Cross section parameters:"</CSY>
    </Item>
    <Item TranslateID="TEXT_000045">
      <ENU>Caption</ENU>
      <CSY>Caption</CSY>
    </Item>
    <Item TranslateID="TEXT_000048">
      <ENU>"Cross section area"</ENU>
      <CSY>"Cross section area"</CSY>
    </Item>
    <Item TranslateID="TEXT_000054">
      <ENU>"=&gt; Is SUFFICIENT"</ENU>
      <CSY>"=&gt; Is SUFFICIENT"</CSY>
    </Item>
    <Item TranslateID="TEXT_000055">
      <ENU>"=&gt; Is INSUFFICIENT!"</ENU>
      <CSY>"=&gt; Is INSUFFICIENT!"</CSY>
    </Item>
    <Item TranslateID="TEXT_000058">
      <ENU>"Bearing capacity for bending"</ENU>
      <CSY>"Bearing capacity for bending"</CSY>
    </Item>
    <Item TranslateID="TEXT_000059">
      <ENU>"Calculation is determined only for cross section class 1, 2 and 3"</ENU>
      <CSY>"Calculation is determined only for cross section class 1, 2 and 3"</CSY>
    </Item>
    <Item TranslateID="TEXT_000076">
      <ENU>"M↓Ed,z← = " &amp; Val(M↓Ed,z←/1000, 2) &amp; " kNm"</ENU>
      <CSY>"M↓Ed,z← = " &amp; Val(M↓Ed,z←/1000, 2) &amp; " kNm"</CSY>
    </Item>
    <Item TranslateID="TEXT_000077">
      <ENU>"Bending moment"</ENU>
      <CSY>"Bending moment"</CSY>
    </Item>
    <Item TranslateID="TEXT_000127">
      <ENU>"M↓Ed,y← = " &amp; Val(M↓Ed,y←/1000, 2) &amp; " kNm"</ENU>
      <CSY>"M↓Ed,y← = " &amp; Val(M↓Ed,y←/1000, 2) &amp; " kNm"</CSY>
    </Item>
    <Item TranslateID="TEXT_000128">
      <ENU>"Bending moment"</ENU>
      <CSY>"Bending moment"</CSY>
    </Item>
    <Item TranslateID="TEXT_000131">
      <ENU>"Loading:"</ENU>
      <CSY>"Loading:"</CSY>
    </Item>
    <Item TranslateID="TEXT_000149">
      <ENU>"G = " &amp; G &amp; " kg/m"</ENU>
      <CSY>"G = " &amp; G &amp; " kg/m"</CSY>
    </Item>
    <Item TranslateID="TEXT_000151">
      <ENU>"W↓pl,z← = " &amp; W↓pl,z← &amp; " m↑4←"</ENU>
      <CSY>"W↓pl,z← = " &amp; W↓pl,z← &amp; " m↑4←"</CSY>
    </Item>
    <Item TranslateID="TEXT_000152">
      <ENU>"W↓el,z← = " &amp; W↓el,z← &amp; " m↑4←"</ENU>
      <CSY>"W↓el,z← = " &amp; W↓el,z← &amp; " m↑4←"</CSY>
    </Item>
    <Item TranslateID="TEXT_000153">
      <ENU>"Cross section modulus z"</ENU>
      <CSY>"Cross section modulus z"</CSY>
    </Item>
    <Item TranslateID="TEXT_000154">
      <ENU>"W↓pl,y← = " &amp; W↓pl,y← &amp; " m↑4←"</ENU>
      <CSY>"W↓pl,y← = " &amp; W↓pl,y← &amp; " m↑4←"</CSY>
    </Item>
    <Item TranslateID="TEXT_000155">
      <ENU>"W↓el,y← = " &amp; W↓el,y← &amp; " m↑4←"</ENU>
      <CSY>"W↓el,y← = " &amp; W↓el,y← &amp; " m↑4←"</CSY>
    </Item>
    <Item TranslateID="TEXT_000156">
      <ENU>"Cross section modulus y"</ENU>
      <CSY>"Cross section modulus y"</CSY>
    </Item>
    <Item TranslateID="TEXT_000157">
      <ENU>"Check of steel profile for bending: " &amp; SectionName</ENU>
      <CSY>"Check of steel profile for bending: " &amp; SectionName</CSY>
    </Item>
  </Texts>
</Root>