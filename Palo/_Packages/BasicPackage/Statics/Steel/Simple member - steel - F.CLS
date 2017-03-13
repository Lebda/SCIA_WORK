<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="704de088-6655-4bf1-aac8-891e3f65f86f">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">void UpdateDialog() { 
    Dialog.GetComponentByName("ECSteel").Visible →INI400_007941= SteelType == 0; 
    Dialog.GetComponentByName("SteelProductLib").Visible →INI400_007942= SteelType == 1; 
} 
→INI400_006265BLOCK { //IO inputs 
    IF(IO.IsStandalone) { //Standalone IO inputs
        SWITCH(SteelType) { 
            CASE 0 :  { //Table 3.1 from EC 1993-1-1
                E →INI400_007943= IO.STEEL.EC.E; 
                f↓y← →INI400_007944= IO.STEEL.EC.fy; 
                SteelName →INI400_007947= IO.STEEL.EC.Item; 
            } 
            CASE 1 :  { //Table from product codes
                E →INI400_007949= IO.STEEL.PC.E; 
                f↓y← →INI400_007946= IO.STEEL.PC.fy; 
                SteelName →INI400_007948= IO.STEEL.PC.Item; 
            } 
        } 
    } ELSE { //SEN IO inputs
    } 
} 
IF(H1) { 
    →INI400_000152TEXT("Simple member - steel - simple free force"); 
    →INI400_005853TEXT(IO.SetupNA.EC_1993_1_1.Name); } 
IF(PrintCaption) { →INI400_000099TEXT(Caption); } 
→INI400_005850BLOCK("National Annex parameters") { //National annexes
    →INI400_005838BLOCK { //NA.2.13 Clause 6.1 General, paragraph (1), REMARK 1
        object Clause6_1_1P_2B →INI400_005851= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1993\EN_1993_1_1\Clause_6.1(1)2B.CLC"); 
        →INI400_005852Clause6_1_1P_2B.Calculate(false); 
        γ↓M0← →INI400_005843= Clause6_1_1P_2B.γ↓M0←; 
    } 
} 
IF(PrintSection) { 
    →INI400_005857BLOCK("Cross section") { 
        →INI400_000098BLOCK { 
            object G →INI400_005868= new Graphics(); 
            →INI400_005869G.DrawPolyLine(IO.CS.Component.Shape.Point); 
            →INI400_005870G.Draw(80, 80); 
            SWITCH(IO.CS.Geometry.FormCode) { 
                CASE 3 :  { 
                    →INI400_005871TEXT("d = " &amp; Val(1000*IO.CS.Geometry.d, 0)); 
                } 
                CASE 7 :  { 
                    →INI400_005872TEXT("h = " &amp; Val(1000*height, 0)); 
                    →INI400_005873TEXT("b = " &amp; Val(1000*width, 0)); 
                } 
                CASE 11 :  { 
                    →INI400_005874TEXT("d = " &amp; Val(1000*IO.CS.Geometry.d, 0)); 
                } 
                CASE 101 :  { 
                    →INI400_005876TEXT("h = " &amp; Val(1000*height, 0)); 
                    →INI400_005877TEXT("b = " &amp; Val(1000*IO.CS.Geometry.bb, 0)); 
                } 
                CASE 150 :  { 
                    →INI400_005878TEXT("h = " &amp; Val(1000*IO.CS.Geometry.h1, 0)); 
                    →INI400_005879TEXT("b = " &amp; Val(1000*IO.CS.Geometry.b1, 0)); 
                } 
                DEFAULT :  { 
                    →INI400_005864TEXT("h = " &amp; Val(1000*height, 0)); 
                    →INI400_005865TEXT("b = " &amp; Val(1000*width, 0)); 
                } 
            } 
            →INI400_000053TEXT("Cross section: " &amp; SectionName); 
            IF(IO.IsStandalone) { 
                →INI400_007961TEXT("The greatest thickness of the cross section"); 
                SWITCH(IO.CS.Geometry.FormCode) { 
                    CASE 1 :  { t↓max← →INI400_007962= MAX(IO.CS.Geometry.s, IO.CS.Geometry.t); } 
                    CASE 2 :  { t↓max← →INI400_007963= IO.CS.Geometry.s; } 
                    CASE 3 :  { t↓max← →INI400_007964= IO.CS.Geometry.w; } 
                    CASE 4 :  { t↓max← →INI400_007965= IO.CS.Geometry.t; } 
                    CASE 5 :  { t↓max← →INI400_007966= MAX(IO.CS.Geometry.s, IO.CS.Geometry.t); } 
                    CASE 6 :  { t↓max← →INI400_007967= MAX(IO.CS.Geometry.s, IO.CS.Geometry.t); } 
                    CASE 7 :  { t↓max← →INI400_007968= IO.CS.Geometry.h; } 
                    CASE 11 :  { t↓max← →INI400_007969= IO.CS.Geometry.d; } 
                    CASE 101 :  { t↓max← →INI400_007970= MAX(IO.CS.Geometry.s, IO.CS.Geometry.tt, IO.CS.Geometry.tb); } 
                    CASE 102 :  { t↓max← →INI400_007971= MAX(IO.CS.Geometry.s, IO.CS.Geometry.t); } 
                    CASE 111 :  { t↓max← →INI400_007972= IO.CS.Geometry.s; } 
                } 
            } 
            →INI400_000049TEXT("Moment of inertia - y axis"); 
            →INI400_000050TEXT("I↓y← = " &amp; I↓y← &amp; " m↑4←"); 
            →INI400_000092TEXT("Elastic cross section modulus y"); 
            →INI400_000068TEXT("W↓y← = " &amp; W↓y← &amp; " m↑3←"); 
            →INI400_000093TEXT("Bending bearing capacity"); 
            M↓Rd← →INI400_000066= W↓y←*f↓y←/γ↓M0←; 
        } 
    } 
} ELSE { M↓Rd← →INI400_000153= W↓y←*f↓y←/γ↓M0←; } 
b →INI400_000057= L-a; 
→INI400_000154PAGEBREAK(); 
IF(PrintSchema) { 
    →INI400_000106BLOCK { 
        →INI400_005858BLOCK("Static scheme") { 
            →INI400_000031IMG("IMG_7"); 
            →INI400_000112TEXT("F↓d← = " &amp; Val(F↓d←/1000, 2) &amp; " kN"); 
            →INI400_000111TEXT("F↓k← = " &amp; Val(F↓k←/1000, 2) &amp; " kN"); 
            →INI400_000103TEXT("L = " &amp; L &amp; " m"); 
            →INI400_000102TEXT("a = " &amp; a &amp; " m"); 
            →INI400_000101TEXT("b = " &amp; b &amp; " m"); 
        } 
    } 
} 
→INI400_000155PAGEBREAK(); 
→INI400_005861BLOCK("Reactions") { 
    double R↓a← →INI400_000162= (F↓d←*b)/L; 
    double R↓b← →INI400_000163= (F↓d←*a)/L; 
} 
→INI400_005863PAGEBREAK(); 
IF(PrintULS) { 
    →INI400_000110BLOCK { 
        →INI400_005859BLOCK("ULS check") { 
            M↓Ed← →INI400_000058= (F↓d←*a*b)/L; 
            s →INI400_000074= M↓Ed←/M↓Rd←; 
        } 
    } 
} 
→INI400_005862PAGEBREAK(); 
IF(PrintSLS) { 
    →INI400_000109BLOCK { 
        →INI400_005860BLOCK("SLS check") { 
            →INI400_000100BLOCK { 
                w →INI400_000001= ((F↓k←*a*b)/(27*E*I↓y←*L))*ODM(3*a*[L+b]↑3←); 
                →INI400_000083TEXT(" = 1 / " &amp; Val(L/w, 0) &amp; " L"); 
            } 
            ϕ↓a← →INI400_000002= ((F↓k←*a*b)/(6*E*I↓y←*L))*[L+b]; 
            x →INI400_000044= ODM((1/3)*a*[L+b]); 
        } 
    } 
} 
→INI400_000158PAGEBREAK(); </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="-1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="20" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Statics_simple_member_steel.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Simple member - steel - simple free force</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Caption" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Subcaption" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Headline 1" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 2" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 3" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 4" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 6" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Standard, dY 0" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 5, Understrike" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Standard, dY 10" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dX 10" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, follow, dX 5" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Check, follow dX 5, bold" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Remark, dX 50" X="0" Y="0" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Remark, dX 50, bold" X="0" Y="0" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" />
      <Style Key="Formula, dX 50" X="0" Y="0" Hor="1" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dY 10" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 100" X="0" Y="0" Hor="1" Ver="2" SpX="100" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 150" X="0" Y="0" Hor="1" Ver="2" SpX="150" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 200" X="0" Y="0" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 300" X="0" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 250" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
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
      <Variable Modifier="Public" Name="a" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_a">
          <ENU>Force position</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description>
          <ENU>Poloha síly</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause6_1_1P_2B" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="E" ESA_ID="" Type="Double" Value="210e9" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e9" Dim="GPa" />
      </Variable>
      <Variable Modifier="Public" Name="F↓d←" ESA_ID="" Type="Double" Value="35000" Precision="2">
        <Description TranslateID="VARIABLE_F↓d←">
          <ENU>Design loading</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓k←" ESA_ID="" Type="Double" Value="25000" Precision="2">
        <Description TranslateID="VARIABLE_F↓k←">
          <ENU>Characteristics loading</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="f↓y←" ESA_ID="" Type="Double" Value="275e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="G" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="H1" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_H1">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="height" ESA_ID="CS.Geometry.h" Type="Double" Value="220e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="I↓y←" ESA_ID="CS.Geometry.Iy" Type="Double" Value="27.72e-6" Precision="2">
        <Description TranslateID="VARIABLE_I↓y←">
          <ENU>Moment of inertia</ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="L" ESA_ID="" Type="Double" Value="7" Precision="2">
        <Description TranslateID="VARIABLE_L">
          <ENU>Member length</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Ed←" ESA_ID="Result.03" Type="Double" Value="60000" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Rd←" ESA_ID="Result.02" Type="Double" Value="69300" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintSchema" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintSchema">
          <ENU>Print static scheme</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintSection" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintSection">
          <ENU>Print cross section parameters</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintSLS" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintSLS">
          <ENU>Print SLS check</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintULS" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintULS">
          <ENU>Print ULS check</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="R↓a←" ESA_ID="Result.04" Type="Double" Value="20000" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="R↓b←" ESA_ID="Result.05" Type="Double" Value="15000" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="s" ESA_ID="Result.01" Type="Double" Value="865.8009e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="SectionName" ESA_ID="CS.SectionName" Type="String" Value="IPE220">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SteelName" ESA_ID="" Type="String" Value="S 275 NL (EN 10025-3)">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SteelType" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_SteelType">
          <ENU>Type of steel material library</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="t↓max←" ESA_ID="" Type="Double" Value="9.2e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="w" ESA_ID="Result.06" Type="Double" Value="29.84401e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="W↓y←" ESA_ID="CS.Geometry.Wy" Type="Double" Value="252e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="width" ESA_ID="CS.Geometry.b" Type="Double" Value="110e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="x" ESA_ID="Result.08" Type="Double" Value="3.316625" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓M0←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_γ↓M0←">
          <ENU>Partial safety factor</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓a←" ESA_ID="Result.07" Type="Double" Value="13.49746e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="rad" />
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
      <Layout Active="False">
        <Names TranslateID="LAYOUT_1">
          <ENU>2</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_2">
          <ENU>3</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_3">
          <ENU>4</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_4">
          <ENU>5</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_5">
          <ENU>6</ENU>
        </Names>
      </Layout>
    </Layouts>
    <VisualComponents>
      <VC ID="INI400_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="430" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="194" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="191" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="191" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="207" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="191" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="508" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="237" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="244" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000031">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="246" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="187" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="187" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="187" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="203" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="187" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000044">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="557" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="280" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="271" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="271" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="287" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="271" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000049">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="57.1" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="44" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="44" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="44" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="44" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="44" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000050">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="57.1" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000049" Style="0" StyleName="" X="380" Y="44" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000049" Style="0" StyleName="" X="380" Y="44" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000049" Style="0" StyleName="" X="380" Y="44" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000049" Style="0" StyleName="" X="380" Y="44" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000049" Style="0" StyleName="" X="380" Y="44" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000053">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="150" Y="32.3" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="200" Y="18" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Microsoft Sans Serif|13|1|2" Font2="Microsoft Sans Serif|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="200" Y="18" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Microsoft Sans Serif|13|1|2" Font2="Microsoft Sans Serif|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="200" Y="18" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Microsoft Sans Serif|13|1|2" Font2="Microsoft Sans Serif|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="200" Y="18" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Microsoft Sans Serif|13|1|2" Font2="Microsoft Sans Serif|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="200" Y="18" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Microsoft Sans Serif|13|1|2" Font2="Microsoft Sans Serif|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000057">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="48" Y="116" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="48" Y="116" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="48" Y="116" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="48" Y="116" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="48" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="48" Y="116" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000058">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="351" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="154" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="154" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="154" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="170" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="154" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000066">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="109" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="15" />
        <Set Vis="1" Prev="INI400_000093" Style="0" StyleName="" X="380" Y="96" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000093" Style="0" StyleName="" X="380" Y="96" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000093" Style="0" StyleName="" X="380" Y="96" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000093" Style="0" StyleName="" X="380" Y="96" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000093" Style="0" StyleName="" X="380" Y="96" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000068">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="82.9" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000092" Style="0" StyleName="" X="380" Y="70" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000092" Style="0" StyleName="" X="380" Y="70" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000092" Style="0" StyleName="" X="380" Y="70" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000092" Style="0" StyleName="" X="380" Y="70" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000092" Style="0" StyleName="" X="380" Y="70" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000074">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="269" Y="351" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="442" Y="154" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="597" Y="10" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="597" Y="10" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="597" Y="10" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="597" Y="10" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000083">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="370" Y="465" Hor="4" Ver="3" SpX="10" SpY="-10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="555" Y="213" Hor="3" Ver="4" SpX="0" SpY="-10" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="505" Y="116" Hor="3" Ver="4" SpX="0" SpY="-10" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="545" Y="116" Hor="3" Ver="4" SpX="0" SpY="-10" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="545" Y="116" Hor="3" Ver="4" SpX="0" SpY="-10" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="545" Y="116" Hor="3" Ver="4" SpX="0" SpY="-10" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000092">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="82.9" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="70" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="70" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="70" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="70" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="70" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000093">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="109" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="96" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="96" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="96" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="96" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="96" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000098">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="24.9" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000099">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000100">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="401" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000101">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="319" Y="266" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000102">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="255" Y="266" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000103">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="190" Y="266" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000106">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="172" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000109">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="376" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000110">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="310" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000111">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="190" Y="240" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000112">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="190" Y="214" Hor="4" Ver="1" SpX="20" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000152">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000153">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="350" Y="109" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="15" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="350" Y="109" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="15" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="350" Y="109" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="15" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="350" Y="109" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="15" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="350" Y="109" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="15" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="350" Y="109" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="15" />
      </VC>
      <VC ID="INI400_000154">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="162" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000155">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="300" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000158">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="181" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000162">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="372" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000163">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="407" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005838">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="44" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="44" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005843">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="97.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="97.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005850">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005851">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005852">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="237" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005853">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005857">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005858">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005859">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005860">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005861">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005862">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="181" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005863">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="181" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005864">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005865">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005868">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005869">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005870">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005871">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005872">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005873">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005874">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005876">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005877">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005878">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="15" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="78" Y="56" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005879">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000051" Style="0" StyleName="" X="37" Y="110" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006265">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
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
      <VC ID="INI400_007949">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007961">
        <Set Vis="1" Prev="INI400_006325" Style="0" StyleName="" X="250" Y="112" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007962">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="550" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007963">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="550" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007964">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="550" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007965">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="550" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007966">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="550" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007967">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="550" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007968">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="550" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007969">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="550" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007970">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="550" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007971">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="550" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007972">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="550" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="IMG_0" Content="/9j/4AAQSkZJRgABAQEAAAAAAAD/2wBDABALDA4MChAODQ4SERATGCkbGBYWGDIkJh4pOzQ+PTo0OThBSV5QQUVZRjg5Um9TWWFkaWppP09ze3Jmel5naWX/2wBDARESEhgVGDAbGzBlQzlDZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWVlZWX/wAARCABtAKYDASIAAhEBAxEB/8QAGgABAQEBAQEBAAAAAAAAAAAAAAUEAwYCB//EADwQAAEDAgMEBQkHBAMAAAAAAAECAwQAEQUSIQYTMUEUFSJVlBZRU1RxgdHS0zI2YXSRoaMjNFKyM0Kz/8QAFAEBAAAAAAAAAAAAAAAAAAAAAP/EABQRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/AP0ClKUClKUClKUClKUClKUClfLjiGm1OOLShCAVKUo2AA4kmvH4FLgNY1ERvIqH+jOtuvpktq6S6Vt9rRRN1anWx5cqD2VKUoFKUoFKUoFKUoFKUoFcGZkV95xlmSy460bOIQsFSPaBwrvUDB8Hmw8T6TIU0UBlbfYdUrMSsKBCSAlAtfQfvegv0qC5tns+24ptWIpJSSCUtLUPcQLH2ivny22d7w/hc+WgMTcYei4W90mCOsMunRV9i7SnPSa/Zty41oW5jCMRZidLgnetOOZuiL0ylAtbe88/7V5cbXYdHh7PstK3qoqAXjZSQ2oMlAB7Oouo3IvYJ4GtknbXCvKGK405njIjrQXilQAKloJBGW+gRyBuSBpqaC4hzGF4i9E6XBG6abczdEXrmKxa295ZP3pGcxiQ/Lb6XBT0d0N36Is5roSq/wDy6fat7qhs7a4UNopbinMsVbTTaXylVlBOcnTLe91gW4WBN+APzh222Gok4it1aWi65vEFefKpQbQkAEJJtdKtSAbW01IAXoLmMS2FOdLgoyuuN26Is/YWpN/+Xnlv76z9Nxjye626TB/tOk7roq/8M2W+8917VJwvbfC2ID+cqQoPuOIbUFZlhTilHgCB2VC1zqbg2Gpyja7DvIpMIqtLMQxlMgKuOyUBQOWx5G19ATxIsQ9BicfFGyzKemxHgl1ptDRjLCAVOBOYgO9oi4Ot7ZRaxua0LcxhGIsxOlwTvWnHM3RF6ZSgWtveef8AavP4xtxhz2FRyx/UkFbTq2RmBQpK0Ly3KbEaEXHO2hubdJO2uFeUMVxpzPGRHWgvFKgAVLQSCMt9AjkDckDTU0FxDmMLxF6J0uCN0025m6IvXMVi1t7yyfvWd+bjDMXFHukwT1fm06Kvt2aS56TT7VufCpbO2uFDaKW4pzLFW002l8pVZQTnJ0y3vdYFuFgTfgDjc2uw6RF2gZUrd9K3u5JCjvP6SW027Ol8pJva1xx1sH6BSvP+W2zveH8Lny08ttne8P4XPloPQUrz/lts73h/C58tPLbZ3vD+Fz5aD0FZZ05jD20OSVZW1rCMxIATfmSeA0qW3tns+44ltOIpBUQAVNLSPeSLD2mtmKx3MRiRXISmHN2+3ISVq7CwNRYgHj56De062+0l1lxLjahdK0G4I/A0rLhUVyJD3bxRvFOLcUGzdKSpRVYfgL0oNtS9o4mIT8IdiYY4w2492HFPXtkINwLA6nQey/OqlKDy+yOGz4MiU44qCILvYDUYuWQ42chsFDnlNzqSQDXqKixJreH4M9IdStSUy5Asmw4vr4kkAD8SQKo4fNaxGE1LYvu3AbXtfQ2PAkcRyNB1jvtyY7UhlWZp1AWhVrXBFwda6VP2f+72GflGv9BVCgUpSgUrPNlohMhxaFuFSwhCEAZlKPAC5A/U19RZBks7wsusquQW3U2UCDblcH2gkUHalKUCuch9uNHdkPKytNIK1qtewAuTpXSp+0H3exP8o7/oaChSlKBSseHTxiDJebYeabvZKnMoz6kGwBJ4jnatlB4fb2RiSZ0VDWHdLw+OjpCwphS2ysZh2yOQGtr89birGxAnI2daZxBDiHGlqQhLiFpUEcgc3t0tpaw4g1Q2g+72J/lHf9DVCgUpSgVxlSW4rYccS6oE2s0ytw/okE++u1cZUZEpsNOlW6vdaBwcH+Kvw8452sbgkEPKQprOJxRrOajNS3n2XmIa3C4ourIIORSQkBXMXv5rdqtCxDD8Jw/dXxDctZlqcehPaAkqJJyAczWvBP7Fz83J/wDZdanoyH3GlOFRS2cwb/6lWlifPblyvrxAIDz+zuLWwqFvm5jbbcZDaG0wnV5rJF1lQSRy0APA3NybJrdcxfRTvAP/ACVqhxkQ4TEVsqKGG0tpKuJAFhf9K7UE/rmL6Kd4B/5KdcxfRTvAP/JVClBHmzoU1kNrTiLZSsLQtEF7MlQ4EXQR+or6i4jGjM5CcTeUSVFbsJ4kk+xAA9gAFVq5x325MdqQyrM06gLQq1rgi4OtBj65i+ineAf+SnXMX0U7wD/yVQpQT+uYvop3gH/kqftBjUPqDEEqTLRnjrQC5DdQm6kkAElNhckCvQVjnYaziCXEyFOFK2lNAAiyMwIKhp9qxtc3sOFrm4Y4mMhed2Q1ORntkZ6A8d2PxIRqo87Gw0AvYk6OuYvop3gH/kqhSgkQp8KFFRHabxAoRexVBevqb/4fjXfrmL6Kd4B/5KoUoPP7QY1D6gxBKky0Z460AuQ3UJupJABJTYXJAqhhUxc7euuIfavbKy6wpvINeagMyjzsSBoB51cdooyF4RiEhZUotw3Q2k/ZQcirqA85BtfkOFrm9agUpSgUpWPE33mI6THcbS8pYShKmi4XDY9lICk687k2ABJsLkBxwZxCIakrWlJXMkpSCbZjvnDYefQE+6qVeZwGFiu5clKmQw8p99JCoylhv+qrMEnONCoE8LnS97C1bc4x69B8Gv6tBQrzBlKkbSQ0PTBvW5rqRDygZEBpeVfC+osddO1pwqvucY9eg+DX9Wm5xj16D4Nf1aChSp+5xj16D4Nf1abnGPXoPg1/VoKFTdnnEHAsObC0laYbKim+oBTobe4/oa4y3MYYyNty4Lshy+7a6IsXtxJO90SLi5/EAXJAOXZ2HiLOBQjGlQ0IcYQs54q1KN0jirea6WHsAAAAAoPRUqfucY9eg+DX9Wm5xj16D4Nf1aChUXaOdJhiKlh9uM24pW8ecWEBNhcDMUKAvry1tWrc4x69B8Gv6tNzjHr0Hwa/q0HfD3HXcPjOPlKnVtJUspBAJI1IBAI9hFaan7nGPXoPg1/VpucY9eg+DX9WgoUqfucY9eg+DX9Wm5xj16D4Nf1aBtB93sT/ACjv+hrcHEFxTYWkrSAopvqAb2Nvcf0Neb2idxVGFTWBKhvqMZanEJiqTkbym5Kt4bXsQNDc/gCRYwuHJhtuJkyGpClnMXEMlClK5lV1G/LhYACw0sAG6lKUClK4ypcaG2HJchphBOUKdWEgnzXPsoMuCf2Ln5uT/wCy6oV5nB8fgDeM9PhttokyFOLdeSM2Z1ZSEC+uhBzcOQuSctbr3B+9YPiEfGgoUqf17g/esHxCPjTr3B+9YPiEfGgoUqf17g/esHxCPjTr3B+9YPiEfGgoUqf17g/esHxCPjTr3B+9YPiEfGg74dL6dCbk5Mme/Zve1iRx91aa89heIQ4CEsL2gwp2Oi+VIISvU31VvCOfmqj17g/esHxCPjQUKVP69wfvWD4hHxp17g/esHxCPjQUKVP69wfvWD4hHxp17g/esHxCPjQUKVP69wfvWD4hHxp17g/esHxCPjQNoPu9if5R3/Q1QqDjmNYU7gWINt4nDWtcZxKUpfSSSUmwAvW7CsUZxXeux32Fsi2RKFhSwNe0qx7N+STqLa6khIUKUpQK4ymVvthtLymkk9so0UU+YH/rfTXja9rGxHalBlw2EjD4nRm8uQOOLSEpyhIUsqCQPwvb3VqpSgUpSgUpSgUpSgUpSgUpSgUpSgUpSgn4thnWsd6O69ZlbSkJRluAsgjOrXtW0IGljrqbFNClKBSlKD//2Q==" />
      <Image Name="IMG_1" Content="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" />
      <Image Name="IMG_2" Content="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" />
      <Image Name="IMG_3" Content="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" />
      <Image Name="IMG_4" Content="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" />
      <Image Name="IMG_5" Content="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" />
      <Image Name="IMG_6" Content="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" />
      <Image Name="IMG_7" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TGroupBox Name="" ID="26" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="19" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000026">
            <ENU>Geometry</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="7" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="a" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="L" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="25" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000025">
            <ENU>Loading</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="F↓k←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="F↓d←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TPanel Name="" ID="24" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
          <Texts>
            <ENU>
            </ENU>
          </Texts>
          <TComboBox Name="" ID="52" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="31" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="SteelType" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="250" Values="0|1" Index="1">
            <Texts TranslateID="DIALOG_000052">
              <ENU>Simplified from EC 1993-1-1 Table 3.1|From product list codes</ENU>
            </Texts>
          </TComboBox>
          <TCheckBox Name="TCheckBox" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintSLS" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000017">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="16" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintULS" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000016">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintSchema" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000015">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintSection" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000013">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TStringInput Name="TStringInput" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000012">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="23" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000023">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TSteelSectionLibrary2 Name="" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="300|30" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="1" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="CS" Collapsed="True" Type="0" SubType="1" P1="IPE220" P2="0" P3="24" P4="23" SectionFilter="2147483647" JustImp="False" ImpUnits="False" />
          <TCustomLibrary Name="SteelProductLib" ID="50" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="30" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="STEEL.PC" DataFile="EC_Steel_Product_List.xml" Collapsed="True" UseCombo="False" Category="3 mm &lt; t &lt;= 16 mm" Item="S 275 NL (EN 10025-3)">
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
                  <P>S 275 NL (EN 10025-3)</P>
                  <P>275</P>
                  <P>370</P>
                  <P>210</P>
                  <P>80.77</P>
                  <P>0.3</P>
                  <P>7850</P>
                  <P>12</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
          <TCustomLibrary Name="ECSteel" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="STEEL.EC" DataFile="EC_Steel.xml" Collapsed="True" UseCombo="False" Category="t &lt;= 40 mm" Item="S 355">
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
                  <P>S 355</P>
                  <P>355</P>
                  <P>490</P>
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
        <TGroupBox Name="" ID="35" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000035">
            <ENU>National annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="34" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Standard EN">
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
    <Item TranslateID="BLOCK_INI400_005850">
      <ENU>"National Annex parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005857">
      <ENU>"Cross section"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005858">
      <ENU>"Static scheme"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005859">
      <ENU>"ULS check"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005860">
      <ENU>"SLS check"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005861">
      <ENU>"Reactions"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000049">
      <ENU>"Moment of inertia - y axis"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000050">
      <ENU>"I↓y← = " &amp; I↓y← &amp; " m↑4←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000053">
      <ENU>"Cross section: " &amp; SectionName</ENU>
    </Item>
    <Item ID="TEXT_INI400_000068">
      <ENU>"W↓y← = " &amp; W↓y← &amp; " m↑3←"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000083">
      <ENU>" = 1 / " &amp; Val(L/w, 0) &amp; " L"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000092">
      <ENU>"Elastic cross section modulus y"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000093">
      <ENU>"Bending bearing capacity"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000099">
      <ENU>Caption</ENU>
    </Item>
    <Item ID="TEXT_INI400_000101">
      <ENU>"b = " &amp; b &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000102">
      <ENU>"a = " &amp; a &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000103">
      <ENU>"L = " &amp; L &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000111">
      <ENU>"F↓k← = " &amp; Val(F↓k←/1000, 2) &amp; " kN"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000112">
      <ENU>"F↓d← = " &amp; Val(F↓d←/1000, 2) &amp; " kN"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000152">
      <ENU>"Simple member - steel - simple free force"</ENU>
    </Item>
    <Item ID="TEXT_INI400_005853">
      <ENU>IO.SetupNA.EC_1993_1_1.Name</ENU>
    </Item>
    <Item ID="TEXT_INI400_005864">
      <ENU>"h = " &amp; Val(1000*height, 0)</ENU>
    </Item>
    <Item ID="TEXT_INI400_005865">
      <ENU>"b = " &amp; Val(1000*width, 0)</ENU>
    </Item>
    <Item ID="TEXT_INI400_005871">
      <ENU>"d = " &amp; Val(1000*IO.CS.Geometry.d, 0)</ENU>
    </Item>
    <Item ID="TEXT_INI400_005872">
      <ENU>"h = " &amp; Val(1000*height, 0)</ENU>
    </Item>
    <Item ID="TEXT_INI400_005873">
      <ENU>"b = " &amp; Val(1000*width, 0)</ENU>
    </Item>
    <Item ID="TEXT_INI400_005874">
      <ENU>"d = " &amp; Val(1000*IO.CS.Geometry.d, 0)</ENU>
    </Item>
    <Item ID="TEXT_INI400_005876">
      <ENU>"h = " &amp; Val(1000*height, 0)</ENU>
    </Item>
    <Item ID="TEXT_INI400_005877">
      <ENU>"b = " &amp; Val(1000*IO.CS.Geometry.bb, 0)</ENU>
    </Item>
    <Item ID="TEXT_INI400_005878">
      <ENU>"h = " &amp; Val(1000*IO.CS.Geometry.h1, 0)</ENU>
    </Item>
    <Item ID="TEXT_INI400_005879">
      <ENU>"b = " &amp; Val(1000*IO.CS.Geometry.b1, 0)</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007961">
      <ENU>"The greatest thickness of the cross section"</ENU>
    </Item>
  </Texts>
</Root>