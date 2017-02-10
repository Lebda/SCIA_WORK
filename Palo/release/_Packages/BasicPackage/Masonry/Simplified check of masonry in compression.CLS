<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="bceeddcc-d853-45b6-9dad-5a0d898a2c39">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">→INI400_006607BLOCK { //Set of Result on 0
    N↓Rd← →INI400_006608= 0; Φ↓s← →INI400_006609= 0; t↓min← →INI400_006610= 0; 
} 

IF(Headline) { 
    →INI400_000061TEXT("Simplified check of masonry in concentric compression (calculation according to ČKAIT)"); } 
IF(PrintCaption) { 
    →INI400_000062TEXT(caption); 
} 
object mat_char →INI400_000116= LoadExternCLC("Masonry material characteristics.clc"); 
method →INI400_000120= 0; //according to CZ annex
→INI400_000117mat_char.Draw(true, 0); 
→INI400_000118mat_char.Draw(true, 1); 
→INI400_000119mat_char.Draw(true, 2); 
IF(input) { 
    →INI400_000071TEXT("Wall geometry"); 
    →INI400_000072TEXT("Wall thickness"); →INI400_000073TEXT("t = " &amp; Val(t*1000, 2) &amp; " mm"); 
    →INI400_000074TEXT("Wall height"); →INI400_000075TEXT("h = " &amp; h &amp; " m"); 
    →INI400_000080TEXT("Effective wall height"); →INI400_000081TEXT("h↓ef← = " &amp; h↓ef← &amp; " m"); 
    →INI400_000076TEXT("Char. compressive strength"); →INI400_000077TEXT("b = " &amp; b &amp; " m"); 
    →INI400_000082TEXT("Effective ceiling length"); →INI400_000083TEXT("l↓f,ef← = " &amp; l↓f,ef← &amp; " m"); 
} 
→INI400_000057BLOCK { 
    →INI400_000055TEXT("Check of wall geometry:"); 
    →INI400_000029TEXT("Ration of verical load"); 
    α↓N← →INI400_000024= N↓Ed←/(t*b*f↓d←); 
    IF(B2) { 
        →INI400_000030TEXT("Min. allowed wall thickness"); 
        t↓min← →INI400_000025= (c↓1←*q↓Ewd←*b*h↑2←)/N↓Ed←+c↓2←*h; 
        IF(t &gt;= t↓min←) { 
            →INI400_000035TEXT("t = " &amp; Val(t*1000, 2) &amp; " mm &gt; t↓min← = " &amp; Val(t↓min←*1000, 2) &amp; " mm"); 
            →INI400_000063TEXT(" =&gt; Wall thickness is SUFFICIENT"); 
        } ELSE { 
            →INI400_000036TEXT("t = " &amp; Val(t*1000, 2) &amp; " mm &lt; t↓min← = " &amp; Val(t↓min←*1000, 2) &amp; " mm"); 
            →INI400_000064TEXT(" =&gt; Wall thickness is INSUFFICIENT!"); 
        } 
    } 
} 
→INI400_000058BLOCK { 
    IF(N↓Ed← &lt; k*t*b*f↓d←) { 
        l↓f,max← →INI400_000003= 7; 
    } ELSE { 
        IF(f↓d← &lt;= 2500000) { l↓f,max← →INI400_000001= MIN(4.5+10*t, 6); } ELSE { l↓f,max← →INI400_000002= MIN(4.5+10*t, 7); } 
    } 
    IF(l↓f,ef← &lt;= l↓f,max←) { 
        →INI400_000047TEXT("l↓f,ef← = " &amp; l↓f,ef← &amp; " m &lt;= l↓f,max← = " &amp; l↓f,max← &amp; " m"); 
        →INI400_000065TEXT(" =&gt; Ceiling length is SUFFICIENT"); 
    } ELSE { 
        →INI400_000048TEXT("l↓f,ef← = " &amp; l↓f,ef← &amp; " m &gt; l↓f,max← = " &amp; l↓f,max← &amp; " m"); 
        →INI400_000066TEXT(" =&gt; Ceiling length is INSUFFICIENT!"); 
    } 
    →INI400_000037TEXT("Maximum allowed ceiling length"); 
} 
→INI400_000059BLOCK { 
    λ →INI400_000026= h↓ef←/t; 
    IF(λ &lt;= 27) { 
        →INI400_000039TEXT("λ = " &amp; λ &amp; " &lt; λ↓max← = 27"); 
        →INI400_000067TEXT(" =&gt; Wall slenderness is SUFFICIENT"); 
    } ELSE { 
        →INI400_000040TEXT("λ = " &amp; λ &amp; " &gt; λ↓max← = 27"); 
        →INI400_000068TEXT(" =&gt; Wall slenderness is INSUFFICIENT!"); 
    } 
    →INI400_000049TEXT("Wall slenderness"); 
} 

→INI400_000084PAGEBREAK(); 
→INI400_000042TEXT("Bearing capacity in simple compression"); 
→INI400_000060BLOCK { 
    IF(B1 &amp;&amp; B2) { 
        Φ↓s← →INI400_000009= PARMIN(0.85-0.0011*[h↓ef←/t]↑2←, 1.3-l↓f,ef←/8, 0.5); 
    } 
    IF(B1 &amp;&amp; !(B2)) { 
        Φ↓s← →INI400_000010= PARMIN(0.85-0.0011*[h↓ef←/t]↑2←, 1.3-l↓f,ef←/8, 0.85); 
    } 
    IF(!(B1) &amp;&amp; B2) { 
        Φ↓s← →INI400_000011= MIN(0.85-0.0011*[h↓ef←/t]↑2←, 0.5); 
    } 
    IF(!(B1) &amp;&amp; !(B2)) { 
        Φ↓s← →INI400_000012= 0.85-0.0011*[h↓ef←/t]↑2←; 
    } 
    →INI400_000038TEXT("Decreasing coefficient"); 
} 
→INI400_000034TEXT("Bearing capacity in compression"); 
N↓Rd← →INI400_000008= Φ↓s←*t*b*f↓d←; 
→INI400_000044TEXT("Check:"); 
IF(N↓Rd← &gt; N↓Ed←) { 
    →INI400_000045TEXT("N↓Rd← = " &amp; Val(N↓Rd←/1000, 2) &amp; " kN &gt; N↓Ed← = " &amp; Val(N↓Ed←/1000, 2) &amp; " kN"); 
    →INI400_000069TEXT(" =&gt; Wall is SUFFICIENT"); 
} ELSE { 
    →INI400_000046TEXT("N↓Rd← = " &amp; Val(N↓Rd←/1000, 2) &amp; " kN &lt; N↓Ed← = " &amp; Val(N↓Ed←/1000, 2) &amp; " kN"); 
    →INI400_000070TEXT(" =&gt; Wall is INSUFFICIENT!"); 
} 
//NA dependent variables:
//γM - NA.2.1
//rules for mortar - NA.2.3.
//fk - used method - NA.2.4.
//tmin (=140mm CZ) - NA.2.12. </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="-1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="16" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Masonry_compression_simple.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Simplified check of masonry in concentric compression</ENU>
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
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>Length of wall loaded by axial force</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="B1" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_B1">
          <ENU>Wall is end support of the ceiling</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="B2" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_B2">
          <ENU>Wall is support of last ceiling (roof)</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="c↓1←" ESA_ID="" Type="Double" Value="230e-3" Precision="2">
        <Description TranslateID="VARIABLE_c↓1←">
          <ENU>Coefficient of ration of vertical load</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓2←" ESA_ID="" Type="Double" Value="31e-3" Precision="2">
        <Description TranslateID="VARIABLE_c↓2←">
          <ENU>Coefficient of ration of vertical load</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="caption" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_caption">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="f↓b←" ESA_ID="" Type="Double" Value="20e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓b←">
          <ENU>Strenght of construction blocks</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓d←" ESA_ID="" Type="Double" Value="3.628647e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓d←">
          <ENU>Design value of mansonry compressive strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓k←" ESA_ID="" Type="Double" Value="7.257294e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓m←" ESA_ID="" Type="Double" Value="5e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓m←">
          <ENU>Strenght of mortar</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Wall height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓ef←" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_h↓ef←">
          <ENU>Effective wall height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="Headline" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Headline">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="input" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_input">
          <ENU>Print geometry</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="k" ESA_ID="" Type="Double" Value="100e-3" Precision="2">
        <Description TranslateID="VARIABLE_k">
          <ENU>Coefficient of construction block type</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="K" ESA_ID="" Type="Double" Value="550e-3" Precision="2">
        <Description TranslateID="VARIABLE_K">
          <ENU>Coefficient of masonry strenght</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="l↓f,ef←" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_l↓f,ef←">
          <ENU>Effective ceiling length</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="l↓f,max←" ESA_ID="" Type="Double" Value="7" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="mat_char" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="method" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓Ed←" ESA_ID="" Type="Double" Value="300000" Precision="2">
        <Description TranslateID="VARIABLE_N↓Ed←">
          <ENU>Axial force</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="N↓Rd←" ESA_ID="Result.01" Type="Double" Value="544297.1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="q↓Ewd←" ESA_ID="" Type="Double" Value="2000" Precision="2">
        <Description TranslateID="VARIABLE_q↓Ewd←">
          <ENU>Design wind load on the wall</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="t" ESA_ID="" Type="Double" Value="300e-3" Precision="2">
        <Description TranslateID="VARIABLE_t">
          <ENU>Wall thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="t↓min←" ESA_ID="Result.03" Type="Double" Value="106.8e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="α" ESA_ID="" Type="Double" Value="700e-3" Precision="1">
        <Description TranslateID="VARIABLE_α">
          <ENU>Index for calculation of the compressive strength</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓N←" ESA_ID="" Type="Double" Value="275.5848e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="β" ESA_ID="" Type="Double" Value="300e-3" Precision="1">
        <Description TranslateID="VARIABLE_β">
          <ENU>Index for calculation of the compressive strength</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓M←" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_γ↓M←">
          <ENU>Partial safety factor of masonry</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ" ESA_ID="" Type="Double" Value="10" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Φ↓s←" ESA_ID="Result.02" Type="Double" Value="500e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
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
      <VC ID="INI400_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="401" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="378" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="223" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="140" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="140" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="140" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="458" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="394" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="228" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="145" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="145" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="145" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="287" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="154" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="265" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="265" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="265" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="265" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000008">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="757" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="608" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="353" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="439" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="439" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="439" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000009">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="621" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="548" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="326" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="380" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="380" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="380" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="413" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="383" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="247" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="365" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="365" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="365" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000011">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="487" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="426" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="283" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="408" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="408" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="408" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000012">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="335" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="335" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="335" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="335" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="335" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="335" Hor="0" Ver="4" SpX="0" SpY="-5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000024">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="298" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="171" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="31" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="31" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="31" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000025">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="370" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="341" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="187" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="75" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="75" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="75" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000026">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="512" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="443" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="268" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="199" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="199" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="199" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000029">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="330" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="126" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="126" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="31" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="31" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="31" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000030">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="370" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="196" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="196" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="75" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="75" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="75" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000034">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="757" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="515" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="515" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="439" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="439" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="439" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000035">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="431" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="368" Hor="0" Ver="4" SpX="30" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="207" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="114" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="114" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="114" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000036">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="279" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="248" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="167" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="105" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="105" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="105" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000037">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="478" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="269" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="269" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="145" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="145" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="145" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000038">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="621" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="441" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="441" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="380" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="380" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="380" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000039">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="538" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="465" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="288" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="233" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="233" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="233" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000040">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="355" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="238" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="226" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="226" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="226" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000042">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="569" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="496" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="318" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="265" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="265" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="265" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000044">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="783" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="634" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="379" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="476" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="476" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="476" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000045">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="802" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="653" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="398" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="533" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="533" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="533" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000046">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="749" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="639" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="400" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="496" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="496" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="496" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000047">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="205" Y="478" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="415" Hor="0" Ver="4" SpX="30" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="248" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="162" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="162" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="162" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000048">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="325" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="203" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="321" Y="242" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="321" Y="242" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="321" Y="242" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000049">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="538" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="317" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="317" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="199" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="199" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="199" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000055">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="306" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="270" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="147" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|5|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000057">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="253" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="130" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000058">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="440" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="376" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="215" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="117" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="117" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="117" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000059">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="486" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="423" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="256" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="172" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="172" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="172" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000060">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="576" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="503" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="326" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="272" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="272" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="272" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000061">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000062">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="13" Font1="Tahoma|14.3|5|2" Font2="Tahoma|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="13" Font1="Tahoma|14.3|5|2" Font2="Tahoma|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="13" Font1="Tahoma|14.3|5|2" Font2="Tahoma|14.3|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000063">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="360" Y="431" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="170" Y="368" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="170" Y="207" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000064">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="279" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="190" Y="248" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="190" Y="167" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000065">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="341" Y="478" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="146" Y="415" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="146" Y="248" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000066">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="411" Y="325" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="201" Y="295" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="201" Y="203" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000067">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="304" Y="538" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="114" Y="465" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="114" Y="288" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000068">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="339" Y="386" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="129" Y="355" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="129" Y="238" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000069">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="170" Y="802" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="653" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="398" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000070">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="197" Y="749" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="207" Y="639" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="207" Y="400" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000071">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="202" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="167" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.6" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000072">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="221" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000073">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="221" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="186" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="106" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000074">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="236" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="80.4" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="80.4" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000075">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="236" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="201" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="106" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000076">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="266" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="110" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="110" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000077">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="266" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="231" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="121" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000080">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="94.9" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="94.9" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000081">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="251" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="215" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="106" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000082">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="280" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="125" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="125" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000083">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="280" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="245" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="121" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000084">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="551" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="478" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="301" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000116">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000117">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="19.5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000118">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="145" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="19.5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000119">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="270" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="159" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="19.5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000120">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="26.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="26.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="26.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
      <VC ID="INI400_007864">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007865">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007866">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007867">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007868">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007869">
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
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TGroupBox Name="" ID="30" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="30" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000030">
            <ENU>Coefficients</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="25" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="γ↓M←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="24" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="c↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="23" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="c↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="22" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="k" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="29" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="29" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000029">
            <ENU>Geometry</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="l↓f,ef←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="18" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="b" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h↓ef←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="16" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="t" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="28" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="28" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000028">
            <ENU>Masonry strength</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="β" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="α" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="K" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="f↓m←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="f↓b←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="27" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000027">
            <ENU>Loading</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="q↓Ewd←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="N↓Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TPanel Name="" ID="26" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
          <Texts>
            <ENU>
            </ENU>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="input" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000004">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="B2" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000002">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="B1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000001">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TStringInput Name="TStringInput" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000003">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="Headline" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000002">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TPanel>
      </TPanel>
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="TEXT_INI400_000029">
      <ENU>"Ration of verical load"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000030">
      <ENU>"Min. allowed wall thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000034">
      <ENU>"Bearing capacity in compression"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000035">
      <ENU>"t = " &amp; Val(t*1000, 2) &amp; " mm &gt; t↓min← = " &amp; Val(t↓min←*1000, 2) &amp; " mm"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000036">
      <ENU>"t = " &amp; Val(t*1000, 2) &amp; " mm &lt; t↓min← = " &amp; Val(t↓min←*1000, 2) &amp; " mm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000037">
      <ENU>"Maximum allowed ceiling length"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000038">
      <ENU>"Decreasing coefficient"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000039">
      <ENU>"λ = " &amp; λ &amp; " &lt; λ↓max← = 27"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000040">
      <ENU>"λ = " &amp; λ &amp; " &gt; λ↓max← = 27"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000042">
      <ENU>"Bearing capacity in simple compression"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000044">
      <ENU>"Check:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000045">
      <ENU>"N↓Rd← = " &amp; Val(N↓Rd←/1000, 2) &amp; " kN &gt; N↓Ed← = " &amp; Val(N↓Ed←/1000, 2) &amp; " kN"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000046">
      <ENU>"N↓Rd← = " &amp; Val(N↓Rd←/1000, 2) &amp; " kN &lt; N↓Ed← = " &amp; Val(N↓Ed←/1000, 2) &amp; " kN"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000047">
      <ENU>"l↓f,ef← = " &amp; l↓f,ef← &amp; " m &lt;= l↓f,max← = " &amp; l↓f,max← &amp; " m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000048">
      <ENU>"l↓f,ef← = " &amp; l↓f,ef← &amp; " m &gt; l↓f,max← = " &amp; l↓f,max← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000049">
      <ENU>"Wall slenderness"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000053">
      <ENU>"Char. compression bearing capacity"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000054">
      <ENU>"Design compression bearing capacity"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000055">
      <ENU>"Check of wall geometry:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000061">
      <ENU>"Simplified check of masonry in concentric compression (calculation according to ČKAIT)"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000062">
      <ENU>caption</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000063">
      <ENU>" =&gt; Wall thickness is SUFFICIENT"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000064">
      <ENU>" =&gt; Wall thickness is INSUFFICIENT!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000065">
      <ENU>" =&gt; Ceiling length is SUFFICIENT"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000066">
      <ENU>" =&gt; Ceiling length is INSUFFICIENT!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000067">
      <ENU>" =&gt; Wall slenderness is SUFFICIENT"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000068">
      <ENU>" =&gt; Wall slenderness is INSUFFICIENT!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000069">
      <ENU>" =&gt; Wall is SUFFICIENT"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000070">
      <ENU>" =&gt; Wall is INSUFFICIENT!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000071">
      <ENU>"Wall geometry"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000072">
      <ENU>"Wall thickness"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000073">
      <ENU>"t = " &amp; Val(t*1000, 2) &amp; " mm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000074">
      <ENU>"Wall height"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000075">
      <ENU>"h = " &amp; h &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000076">
      <ENU>"Char. compressive strength"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000077">
      <ENU>"b = " &amp; b &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000080">
      <ENU>"Effective wall height"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000081">
      <ENU>"h↓ef← = " &amp; h↓ef← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000082">
      <ENU>"Effective ceiling length"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000083">
      <ENU>"l↓f,ef← = " &amp; l↓f,ef← &amp; " m"</ENU>
    </Item>
  </Texts>
</Root>