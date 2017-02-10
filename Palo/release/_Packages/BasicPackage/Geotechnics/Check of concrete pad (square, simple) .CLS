<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="08419193-feb5-45c7-8cea-48e21a334c08">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">IF(H1) { 
    →INI400_000206TEXT("Check of concrete pad foundation according to Eurocode 7"); 
    →INI400_000212TEXT(IO.SetupNA.EC_1997_1.Name); 
} 
IF(PrintCaption) { 
    →INI400_000001TEXT(Caption); 
} 
double π →INI400_000226= Math.PI; 
→INI400_005850BLOCK("National Annex parameters") { //National annexes
    →INI400_005838BLOCK { //NA.2.7 Clause 2.4.2.4 Partial factors for materials - Ultimate limit state, Paragraph (1)
        object Clause2_4_2_4_1 →INI400_005839= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_2.4.2.4(1).CLC"); 
        →INI400_005845Clause2_4_2_4_1.Calculate(false); 
        γ↓c← →INI400_005843= Clause2_4_2_4_1.γ↓C←; 
        γ↓s← →INI400_005851= Clause2_4_2_4_1.γ↓S←; 
    } 
    →INI400_000616BLOCK { //NA.2.12 Clause 3.1.6 Design compressive and tensile strength, Paragraph(1)P
        object Clause3_1_6_1P →INI400_000617= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_3.1.6(1)P.CLC"); 
        →INI400_005852Clause3_1_6_1P.Calculate(false); 
        α↓cc← →INI400_000618= Clause3_1_6_1P.α↓cc←; 
    } 
    →INI400_005871BLOCK { //NA.2.14 Clause 3.2.2 Properties, Paragraph(3)P
        object Clause3_2_2 →INI400_005853= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_3.2.2(3)P.CLC"); 
        →INI400_005872Clause3_2_2.Calculate(false); 
        double f↓yk,max← →INI400_005873= Clause3_2_2.f↓yk,max←; 
    } 
    →INI400_005888BLOCK { //NA.2.81 Clause 9.2.1.1 Maximum and minimum reinforcement areas, Paragraph(3)
        object Clause9_2_1_1_3P →INI400_005889= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_9.2.1.1(3).CLC"); 
    } 
} 
BOOKMARK("Begin"); 
IF(PrintRozmery) { 
    →INI400_005896BLOCK("Pad diameters and loading") { 
        →INI400_000011TEXT("Simple rectangle pad"); 
        →INI400_000211BLOCK { 
            →INI400_000186IMG("patka1"); 
            →INI400_000003TEXT(Description("σ↓d←")); 
            →INI400_000004TEXT("σ↓d← = " &amp; σ↓d←); 
            →INI400_000010TEXT(Description("b")); 
            →INI400_000072TEXT("b = " &amp; b); 
            →INI400_000021TEXT(Description("h")); 
            →INI400_000020TEXT("h = " &amp; h); 
            →INI400_000017TEXT(Description("c↓1←")); 
            →INI400_000016TEXT("c↓1← = " &amp; c↓1←); 
        } 
        →INI400_000090TEXT(Description("a")); 
        a →INI400_000091= (b-c↓1←)/2; 
        →INI400_000019TEXT(Description("a↓k←")); 
        a↓k← →INI400_000018= a+[0.15*c↓1←]; 
    } 
} ELSE { 
    a →INI400_000227= (b-c↓1←)/2; 
    a →INI400_000228= (b-c↓1←)/2; 
} 
→INI400_000216PAGEBREAK(); 
IF(mat) { 
    object mat_char →INI400_005846= LoadExternCLC(Tools.CLC_Dir &amp; "\..\Concrete\Concrete material characteristics.CLC"); 
    
    →INI400_005847mat_char.Draw(true); 
} 
object mat_char →INI400_005848= LoadExternCLC(Tools.CLC_Dir &amp; "\..\Concrete\Concrete material characteristics.CLC"); 
→INI400_005849mat_char.Calculate(true); 
→INI400_000217PAGEBREAK(); 
→INI400_005897BLOCK("Reinforcement parameters") { 
    →INI400_000030TEXT(Description("c")); 
    →INI400_000029TEXT("c = " &amp; c); 
    →INI400_000028TEXT(Description("ϕ")); 
    →INI400_000027TEXT("ϕ = " &amp; ϕ); 
    →INI400_000032TEXT("Distance between bars"); 
    →INI400_000031TEXT("s = " &amp; s); 
    →INI400_000107TEXT("Design value of modulus of elasticity"); 
    →INI400_000106TEXT("E↓s← = " &amp; E↓s←); 
    →INI400_000100TEXT("Characteristic yield strength"); 
    →INI400_000099TEXT("f↓yk← = " &amp; f↓yk←); 
    →INI400_000105TEXT(Description("f↓yd←")); 
    f↓yd← →INI400_000104= f↓yk←/γ↓s←; 
    →INI400_000108TEXT("Strain at the peak yield strength"); 
    ε↓yd← →INI400_000103= f↓yd←/E↓s←; 
    →INI400_000102TEXT(Description("γ↓s←")); 
    →INI400_000101TEXT("γ↓s← = " &amp; γ↓s←); 
    IF(f↓yk← &gt; f↓yk,max←) { //Condition if Clause 3.2.2 is fulfill
        →INI400_005859TEXT("f↓yk← &gt; f↓yk,max← =&gt; "); 
        →INI400_005860TEXT(f↓yk← &amp; " &gt; " &amp; f↓yk,max←); 
        →INI400_005861TEXT("f↓yk← is bigger than maximum allowed f↓yk← by national annex"); 
        →INI400_005862TEXT("Calculation stopped!"); 
        Exit(); 
    } 
} 
→INI400_000218PAGEBREAK(); 
BOOKMARK("Bending"); 
→INI400_005900BLOCK("Check bending moment on concrete pad") { 
    IF(s &gt; 0.25) { 
        →INI400_000060TEXT("Bars distances must be max. 0,250 m"); 
        Exit(); 
    } 
    →INI400_005903BLOCK("Reinforcement design") { 
        →INI400_000025TEXT("Effective cross section height"); 
        d →INI400_000026= h-c-ϕ/2; 
        →INI400_000047TEXT("Lever arm of inner forces"); 
        z →INI400_000046= 0.9*d; 
        →INI400_000024TEXT("Maximal design moment"); 
        M↓Ed← →INI400_000023= (1/2)*σ↓d←*b*a↓k←↑2←; 
        →INI400_000034TEXT("Required reinf. area"); 
        A↓s,reg← →INI400_000045= M↓Ed←/(f↓yd←*z); 
        →INI400_000111TEXT("Designed reinf. area"); 
        A↓s← →INI400_000110= π*[ϕ/2]↑2←*(b/s); 
    } 
    IF(KostrPoz) { 
        →INI400_000219PAGEBREAK(); 
        →INI400_005904BLOCK("Check of struct. requirements for reinforcement") { 
            →INI400_000120TEXT("Check of geometrical ration of reinf."); 
            ρ →INI400_000116= A↓s←/(b*d); 
            ρ↓min← →INI400_000115= PARMAX(0.26*f↓ctm←/f↓yk←, 0.0013); 
            ρ↓max← →INI400_000114= 0.04; 
            IF(ρ↓min← &lt;= ρ &amp;&amp; ρ &lt;= ρ↓max←) { 
                →INI400_000119TEXT("ρ↓min← ≤ ρ ≤ ρ↓max← =&gt;"); 
                →INI400_000122TEXT(ρ↓min← &amp; " &lt; " &amp; ρ &amp; " &lt; " &amp; ρ↓max←); 
                →INI400_000118TEXT("Designed reinforcement is SUFFICIENT, it fulfills geometrical ration of reinf."); 
            } ELSE { 
                →INI400_000183TEXT("ρ is not within limits"); 
                →INI400_000117TEXT("Designed reinf. is INSUFFICIENT, it doesnt fulfills geom. ration of reinf. Adapt reinf. area."); 
                Exit(); 
            } 
            →INI400_000220PAGEBREAK(); 
            →INI400_005885TEXT("Check of the reinforcement area"); 
            →INI400_005880TEXT("A↓s← = A↓sy1 ← for min and max reinforcement check"); 
            object min_area →INI400_005875= LoadExternCLC(Tools.CLC_Dir &amp; "\..\Concrete\Check minimum reinforcement area.CLC"); 
            min_area.A↓sy1← →INI400_005887= A↓s←; 
            min_area.b →INI400_005879= b; 
            min_area.d →INI400_005890= d; 
            min_area.f↓ctm← →INI400_005893= f↓ctm←; 
            min_area.f↓yk← →INI400_005894= f↓yk←; 
            →INI400_005877min_area.Draw(false); 
            →INI400_005909PAGEBREAK(); 
            object max_area →INI400_005881= LoadExternCLC(Tools.CLC_Dir &amp; "\..\Concrete\Check maximum reinforcement area.CLC"); 
            max_area.A↓sy1← →INI400_005883= A↓s←; 
            max_area.b →INI400_005891= b; 
            max_area.h →INI400_005892= h; 
            →INI400_005884max_area.Draw(false); 
        } 
    } 
    →INI400_000221PAGEBREAK(); 
    IF(A↓s← &lt; A↓s,reg←) { 
        →INI400_000044TEXT("As&lt; As,reg =&gt; Reinforcement area is not sufficient."); 
        →INI400_000199TEXT("Bigger diameter of reinf. or smaller bars distances are required."); 
        Exit(); 
    } 
    →INI400_005905BLOCK("Check of designed reinforcement and calculation of bearing capacity moment") { 
        →INI400_000195BLOCK { 
            →INI400_000187IMG("patka2"); 
            →INI400_000197TEXT("1 - Critical area"); 
            →INI400_000196TEXT("2 - Neutral axis x"); 
        } 
        →INI400_005910PAGEBREAK(); 
        →INI400_000062TEXT(Description("x")); 
        x →INI400_000063= (A↓s←*f↓yd←)/(η*λ*b*f↓cd←); 
        →INI400_000065TEXT("Lever arm of inner forces"); 
        z↓s← →INI400_000064= d-(λ*x)/2; 
        →INI400_000069TEXT("Force in reinforcement"); 
        F↓s← →INI400_000067= A↓s←*f↓yd←; 
        →INI400_000068TEXT("Bearing capacity moment"); 
        M↓Rd← →INI400_000066= F↓s←*z↓s←; 
        IF(M↓Rd← &gt;= M↓Ed←) { 
            →INI400_000073TEXT("M↓Rd← ≥ M↓Ed← =&gt;"); 
            →INI400_000074TEXT(M↓Rd← &amp; " &gt; " &amp; M↓Ed←); 
            →INI400_000071TEXT(" =&gt; Designed reinforcement is SUFFICIENT"); 
        } ELSE { 
            →INI400_000132TEXT("M↓Rd← &lt; M↓Ed← =&gt;"); 
            →INI400_000131TEXT(M↓Rd← &amp; " &lt; " &amp; M↓Ed←); 
            →INI400_000070TEXT(" =&gt; Designed reinforcement is INSUFFICIENT!"); 
            Exit(); 
        } 
    } 
    →INI400_000222PAGEBREAK(); 
    →INI400_005906BLOCK("Check of plastic reserve") { 
        →INI400_000126TEXT("Max. ration"); 
        →INI400_000125TEXT("ξ↓max← = " &amp; ξ↓max←); 
        ξ →INI400_000128= x/d; 
        IF(ξ &lt;= ξ↓max←) { 
            →INI400_000130TEXT("ξ ≤ ξ↓max← =&gt;"); 
            →INI400_000129TEXT(ξ &amp; " &lt; " &amp; ξ↓max←); 
            →INI400_000133TEXT(" =&gt; Plastic reserve is SUFFICIENT"); 
        } ELSE { 
            →INI400_000137TEXT("ξ &gt; ξ↓max← =&gt;"); 
            →INI400_000136TEXT(ξ &amp; " &gt; " &amp; ξ↓max←); 
            →INI400_000135TEXT(" =&gt; Plastic reserve is INSUFFICIENT!"); 
            Exit(); 
        } 
    } 
} 
→INI400_000223PAGEBREAK(); 
BOOKMARK("Shear"); 
IF(Smyk) { 
    →INI400_005901BLOCK("Shear check") { 
        →INI400_005907BLOCK("Bearing capacity of compr. diagonals on circuit of column tip") { 
            →INI400_000209BLOCK { 
                →INI400_000188IMG("patka3"); 
                →INI400_000194TEXT("1 - Compressed diagonal"); 
                →INI400_000080TEXT("Pad width = Pad length"); 
                →INI400_000078TEXT("Column widht = Column length"); 
            } 
            →INI400_005911PAGEBREAK(); 
            →INI400_000085TEXT("Max. design value of shear bearing capacity of compr. diagonal"); 
            →INI400_000203TEXT("Reduction factor"); 
            v →INI400_000202= 0.6*[1-(CUnit(f↓ck←, "MPa")/250)]; 
            ν↓Rd,max← →INI400_000084= 0.4*v*f↓cd←; 
            →INI400_000087TEXT("Max. design shear stress in column surface"); 
            ν↓Ed,0← →INI400_000086= (σ↓d←*[b↑2←-c↓1←↑2←])/((2*[c↓1←+c↓1←])*d); 
            IF(ν↓Rd,max← &gt;= ν↓Ed,0←) { 
                →INI400_000144TEXT("ν↓Rd,max← ≥ ν↓Ed,0← =&gt;"); 
                →INI400_000143TEXT(ν↓Rd,max← &amp; " &gt; " &amp; ν↓Ed,0←); 
                →INI400_000142TEXT(" =&gt; Compressed dialgonal is SUFFICIENT"); 
            } ELSE { 
                →INI400_000146TEXT("ν↓Rd,max← &lt; ν↓Ed,0← =&gt;"); 
                →INI400_000145TEXT(ν↓Rd,max← &amp; " &lt; " &amp; ν↓Ed,0←); 
                →INI400_000139TEXT(" =&gt; Compressed dialgonal is INSUFFICIENT!"); 
                Exit(); 
            } 
        } 
        →INI400_000224PAGEBREAK(); 
        →INI400_005908BLOCK("Shear bearing capacity in checked circuit u↓a←") { 
            →INI400_000210BLOCK { 
                →INI400_000189IMG("patka4"); 
                →INI400_000198TEXT("1 - Critical crack"); 
            } 
            →INI400_005912PAGEBREAK(); 
            →INI400_000149TEXT(Description("a↓i←")); 
            →INI400_000148TEXT("a↓i← = " &amp; a↓i←); 
            →INI400_000150TEXT("Remark: Check must be executed repeatedly in all distances a↓i← between d/2 and 2d"); 
            →INI400_000153TEXT("Limit values a↓i←"); 
            a↓i,min← →INI400_000152= d/2; 
            a↓i,max← →INI400_000151= PARMIN((b-c↓1←)/2-2*c, 2*d); 
            →INI400_000155TEXT("Checked circuit"); 
            u↓a← →INI400_000154= 2*[c↓1←+c↓1←]+2*π*a↓i←; 
            →INI400_000156TEXT("Area A↓a← in checked circuit u↓a←"); 
            A↓a← →INI400_000157= c↓1←*c↓1←+2*a↓i←*[c↓1←+c↓1←]+π*(a↓i←)↑2←; 
            →INI400_000170TEXT("Coefficient"); 
            c↓rdc← →INI400_000169= 0.18/γ↓c←; 
            →INI400_000172TEXT("Cross section height parameter"); 
            k →INI400_000171= 1+[200/CUnit(d, "mm")]↑1/2←; 
            →INI400_000159TEXT("Design value of traverse force"); 
            V↓Ed,a← →INI400_000158= σ↓d←*[b*b-A↓a←]; 
            →INI400_000160TEXT("Shear stress on checked circuit"); 
            ν↓Ed,a← →INI400_000161= (V↓Ed,a←)/(u↓a←*d); 
            →INI400_005913PAGEBREAK(); 
            →INI400_000168TEXT("Design shear bearing capacity of concrete cross section"); 
            →INI400_000215BLOCK { 
                ν↓Rd,c← →INI400_000167= PARMAX(10↑6←*((2*d)/a↓i←)*c↓rdc←*k*[100*ρ*CUnit(f↓ck←, "MPa")]↑1/3←, 10↑6←*((2*d)/a↓i←)*[0.035*k↑3/2←*CUnit(f↓ck←, "MPa")↑1/2←]); 
            } 
        } 
    } 
    →INI400_000225PAGEBREAK(); 
    →INI400_005902BLOCK("Check") { 
        IF(ν↓Rd,c← &gt;= ν↓Ed,a←) { 
            →INI400_000173TEXT("ν↓Rd,c← ≥ ν↓Ed,a← =&gt;"); 
            →INI400_000174TEXT(ν↓Rd,c← &amp; " &gt; " &amp; ν↓Ed,a←); 
            →INI400_000176TEXT(" =&gt; Checked circuit u↓a← is SUFFICIENT"); 
        } ELSE { 
            →INI400_000180TEXT("ν↓Rd,c← &lt; ν↓Ed,a← =&gt;"); 
            →INI400_000179TEXT(ν↓Rd,c← &amp; " &lt; " &amp; ν↓Ed,a←); 
            →INI400_000178TEXT(" =&gt; Checked circuit u↓a← is INSUFFICIENT!"); 
            →INI400_000177TEXT("Shear reinforcement is required"); 
        } 
    } 
} 
//NA dependent variables:
//γ↓c←,γ↓st← - NA.2.8
//α↓cc← - NA.2.12
//f↓yk← - NA.2.14
//A↓s,min← - NA.2.79
//A↓s,max ←- NA.2.80</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="4000" Material="2" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="KRS" Autor2="" Version="435" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Geotechnics_Pad_foundation.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Check of concrete pad (square, simple)</ENU>
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
      <Variable Modifier="Public" Name="a" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_a">
          <ENU>Distance from column to pad edge</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓a←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="a↓i,max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="a↓i,min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="a↓i←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_a↓i←">
          <ENU>Distance of checked circuit from column surface</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="a↓k←" ESA_ID="Result.09" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_a↓k←">
          <ENU>Distance of the critical section</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓s,reg←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓s←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>Pad width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="c" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_c">
          <ENU>Concrete cover</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_c↓1←">
          <ENU>Column width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="c↓rdc←" ESA_ID="" Type="Double" Value="0" Precision="2">
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
      <Variable Modifier="Public" Name="Clause2_4_2_4_1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause3_1_6_1P" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause3_2_2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause9_2_1_1_3P" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="E↓s←" ESA_ID="REINF.Es" Type="Double" Value="200e9" Precision="2">
        <Description TranslateID="VARIABLE_E↓s←">
          <ENU>Design value of modulus of elasticity of reinforcement</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e9" Dim="GPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓cd←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_f↓cd←">
          <ENU>Design value of concrete compressive strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ck←" ESA_ID="CONCRETE.EC.fck" Type="Double" Value="16e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctm←" ESA_ID="CONCRETE.EC.fctm" Type="Double" Value="1.9e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ctm←">
          <ENU>Mean value of axial tensile strength of concrete</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="F↓s←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yd←" ESA_ID="" Type="Double" Value="347.8261e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓yd←">
          <ENU>Design yield strength of reinforcement</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yk,max←" ESA_ID="" Type="Double" Value="600e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yk←" ESA_ID="REINF.fyk" Type="Double" Value="400e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓yk←">
          <ENU>Characteristic yield strength  of reinforcement</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Pad height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="H1" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_H1">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="k" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="KostrPoz" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_KostrPoz">
          <ENU>Print structural requirements</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="M↓Ed←" ESA_ID="Result.07" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Rd←" ESA_ID="Result.06" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="mat" ESA_ID="" Type="Boolean" Value="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="mat_char" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="max_area" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="min_area" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintRozmery" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintRozmery">
          <ENU>Print pad dimensions and loading</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="s" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_s">
          <ENU>Bars distances</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="Smyk" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Smyk">
          <ENU>Print shear check</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="u↓a←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="v" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Ed,a←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MN" />
      </Variable>
      <Variable Modifier="Public" Name="x" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_x">
          <ENU>Height of the compression area</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="z" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="z↓s←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="α↓cc←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_α↓cc←">
          <ENU>Coefficient taking account of long term effects on the compressive strength</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓c←" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_γ↓c←">
          <ENU>Partial safety factor for concrete</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓s←" ESA_ID="" Type="Double" Value="1.15" Precision="2">
        <Description TranslateID="VARIABLE_γ↓s←">
          <ENU>Partial safety factor for reinforcement</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓yd←" ESA_ID="" Type="Double" Value="1.73913e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="‰" />
      </Variable>
      <Variable Modifier="Public" Name="η" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_η">
          <ENU>Coefficient of concrete strength for rectangle diagram</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_λ">
          <ENU>Coefficient for effective  height of compressed area</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ν↓Ed,0←" ESA_ID="Result.04" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="ν↓Ed,a←" ESA_ID="Result.02" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="ν↓Rd,c←" ESA_ID="Result.01" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ν↓Rd,c←">
          <ENU>value in MPa</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="ν↓Rd,max←" ESA_ID="Result.03" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ν↓Rd,max←">
          <ENU>value in MPa</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="ξ" ESA_ID="Result.05" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ξ↓max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ξ↓max←">
          <ENU>Max. ration x/d</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="π" ESA_ID="" Type="Double" Value="3.141593" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ρ" ESA_ID="Result.08" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="σ↓d←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_σ↓d←">
          <ENU>Contact stress</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kPa" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ϕ">
          <ENU>Reinforcement diameter</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
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
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.6|5|2" Font2="Tahoma|13.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.6|5|2" Font2="Tahoma|13.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.6|5|2" Font2="Tahoma|13.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="140" Hor="0" Ver="1" SpX="0" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="140" Hor="0" Ver="0" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="140" Hor="0" Ver="0" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="407" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="407" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="407" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000004">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="455" Y="140" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="220" Y="224" Hor="4" Ver="2" SpX="15" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="84.5" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="407" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="407" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="407" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="162" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="162" Hor="0" Ver="0" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="162" Hor="0" Ver="0" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="431" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="431" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="431" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000011">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="64.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="64.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="64.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000016">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="455" Y="200" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="220" Y="269" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="148" Y="99.9" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="473" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="473" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="473" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="200" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="200" Hor="0" Ver="0" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="200" Hor="0" Ver="0" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="473" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="473" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="473" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000018">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="415" Hor="1" Ver="2" SpX="250" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="419" Hor="0" Ver="4" SpX="250" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="80.8" Y="115" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="580" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="580" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="580" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000019">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="410" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="397" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="397" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="558" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="558" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="558" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000020">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="455" Y="181" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="220" Y="254" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="73.7" Y="99.9" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="452" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="452" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="452" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000021">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="181" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="181" Hor="0" Ver="0" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="181" Hor="0" Ver="0" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000023">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="441" Hor="0" Ver="2" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="448" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="136" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="634" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="634" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="634" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000024">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="436" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="420" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="420" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="605" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="605" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="605" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000025">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="896" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="778" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="778" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1135" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1135" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1135" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000026">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="896" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="799" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="369" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1164" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1164" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1164" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000027">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="680" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="632" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="268" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="846" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="846" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="846" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000028">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="680" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="622" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="622" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="846" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="846" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="846" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000029">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="660" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="617" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="254" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="825" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="825" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="825" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000030">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="660" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="603" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="603" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="825" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="825" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="825" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000031">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="699" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="646" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="283" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="867" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="867" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="867" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000032">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="699" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="641" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="641" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="867" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="867" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="867" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000034">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="948" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="828" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="828" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1235" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1235" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1235" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000044">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1307" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1307" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1307" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="610" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="610" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="610" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000045">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="948" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="844" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000026" Style="0" StyleName="" X="150" Y="369" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1267" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1267" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1267" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000046">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="923" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="821" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="384" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1214" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1214" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1214" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000047">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="923" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="804" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="804" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1193" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1193" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1193" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000060">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="820" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="735" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="820" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="362" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="362" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="362" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000062">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1607" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1473" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1473" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2026" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2026" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2026" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000063">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1607" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1460" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="599" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2058" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2058" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2058" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000064">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1636" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1492" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="613" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2124" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000065">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1636" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1503" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1503" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2095" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2095" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2095" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000066">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="1684" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="1535" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="614" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2219" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2219" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2219" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000067">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1663" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1517" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000063" Style="0" StyleName="" X="150" Y="599" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2174" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2174" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2174" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000068">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1684" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1551" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1551" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2198" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2198" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2198" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000069">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1663" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1529" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1529" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2153" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2153" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2153" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000070">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="222" Y="1694" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="222" Y="1694" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="222" Y="1694" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1763" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1763" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1763" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000071">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="255" Y="1704" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="202" Y="1565" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="223" Y="634" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2288" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2288" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2288" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000072">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="455" Y="162" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="220" Y="240" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="99.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="431" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="431" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="431" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000073">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1704" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1565" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="634" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000074">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="131" Y="1704" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="90.6" Y="1565" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="90.6" Y="634" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2267" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2267" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2267" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000078">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="2220" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="2086" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="320" Y="2045" Hor="0" Ver="0" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000080">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="2201" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="2067" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="320" Y="2026" Hor="0" Ver="0" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2951" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2951" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2951" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000084">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="2399" Hor="0" Ver="4" SpX="250" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="2234" Hor="0" Ver="4" SpX="250" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="84.1" Y="772" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3035" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3035" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3035" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
      </VC>
      <VC ID="INI400_000085">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2346" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2205" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2205" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2993" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2993" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2993" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000086">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="2468" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2265" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="182" Y="772" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3152" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3152" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3152" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000087">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2434" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2257" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2257" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3113" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3113" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3113" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000090">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="383" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="371" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="371" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="497" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="497" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="497" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000091">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="388" Hor="0" Ver="2" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="392" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="115" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="529" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="529" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="529" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000099">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="739" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="676" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000029" Style="2" StyleName="" X="150" Y="254" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="888" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="888" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="888" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000100">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="739" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="660" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="660" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="888" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="888" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="888" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000101">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="827" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="723" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="300" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="912" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="912" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="912" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000102">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="827" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="682" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="682" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="912" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="912" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="912" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000103">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="797" Hor="0" Ver="2" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="707" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="285" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1056" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1056" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1056" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000104">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="765" Hor="1" Ver="2" SpX="250" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="692" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="269" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="968" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="968" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="968" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000105">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="760" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="704" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="704" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="936" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="936" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="936" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000106">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="719" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="661" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="297" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1000" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1000" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1000" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000107">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="719" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="738" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="738" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1000" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1000" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1000" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000108">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="792" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="760" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="760" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1024" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1024" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1024" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000110">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="977" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="880" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="388" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1328" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1328" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1328" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000111">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="977" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="858" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="858" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1299" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1299" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1299" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000114">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1121" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1019" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="190" Y="437" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1508" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1508" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1508" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000115">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="1084" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="987" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="437" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1466" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1466" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1466" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000116">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="1040" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="948" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="437" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1415" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1415" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1415" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000117">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1136" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1050" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1113" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1226" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1226" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1226" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000118">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1166" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1069" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="477" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1580" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1580" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1580" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000119">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1147" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1050" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="458" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1532" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1532" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1532" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000120">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1016" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="912" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="912" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1383" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1383" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1383" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000122">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="156" Y="1147" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="116" Y="1050" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="116" Y="458" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1559" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1559" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1559" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000125">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1753" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1614" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="683" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="2330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="2330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="2330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000126">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1753" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1622" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1622" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2330" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2330" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2330" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000128">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1781" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1637" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="93.1" Y="683" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2362" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2362" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2362" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000129">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="115" Y="1807" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="74.9" Y="1674" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="74.9" Y="703" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2415" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2415" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2415" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000130">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1807" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1674" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="703" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2391" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2391" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2391" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000131">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="87" Y="1694" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="87" Y="1694" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="87" Y="1694" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1742" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1742" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1742" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000132">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1694" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1694" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1694" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1720" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1720" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1720" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000133">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="198" Y="1807" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="158" Y="1674" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="158" Y="703" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2436" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2436" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2436" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000135">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1049" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1049" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1049" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1049" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1049" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1049" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000136">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1028" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1028" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1028" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1028" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1028" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1028" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000137">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1004" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1004" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1004" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1004" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1004" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1004" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000139">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="238" Y="2487" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="238" Y="2487" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="238" Y="2487" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000142">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="283" Y="2497" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="247" Y="2304" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="247" Y="792" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3231" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3231" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3231" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000143">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="151" Y="2497" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="111" Y="2304" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="111" Y="792" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3210" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3210" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3210" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000144">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2497" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2304" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="792" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000145">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="106" Y="2487" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="106" Y="2487" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="106" Y="2487" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2240" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2240" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2240" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000146">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2487" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2487" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2487" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2216" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2216" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="2216" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000148">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="3003" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="2810" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="847" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="3728" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="3728" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="3728" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000149">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3003" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2812" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2812" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3728" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3728" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3728" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000150">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3019" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2825" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="798" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3745" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3745" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3745" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000151">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="3086" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2884" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="191" Y="847" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3846" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3846" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3846" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000152">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="3044" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2848" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="86.6" Y="847" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3799" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3799" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3799" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000153">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3044" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2856" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2856" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3767" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3767" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3767" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000154">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="3120" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2915" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="290" Y="847" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3906" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3906" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3906" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000155">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3120" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2932" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2932" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3884" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3884" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3884" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000156">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3157" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2955" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2955" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3931" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3931" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3931" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000157">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="3157" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2936" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="865" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3960" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3960" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3960" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
      </VC>
      <VC ID="INI400_000158">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="3265" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="3023" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="155" Y="880" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4029" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4029" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4029" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000159">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3265" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2998" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2998" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4007" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4007" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4007" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000160">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3291" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4054" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4054" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4054" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000161">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="3291" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="3050" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="896" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4086" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4086" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4086" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000167">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="3359" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="3098" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="916" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4308" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4308" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4308" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
      </VC>
      <VC ID="INI400_000168">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3318" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3121" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3121" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4251" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4251" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4251" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000169">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="3204" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2959" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="880" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4147" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4147" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4147" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000170">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3204" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3060" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3060" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4118" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4118" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4118" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000171">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="3236" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2999" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="88.7" Y="880" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4220" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4220" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4220" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000172">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3236" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3094" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3094" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4179" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4179" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="4179" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000173">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3497" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="3236" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="961" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4468" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4468" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4468" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000174">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="88" Y="3497" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="98" Y="3236" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="98" Y="961" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4492" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4492" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4492" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000176">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="214" Y="3497" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="215" Y="3236" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="227" Y="961" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4513" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4513" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="4513" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000177">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000178">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000179">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000180">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000183">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1117" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1036" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1094" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000186">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000187">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1484" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1342" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="638" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1909" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1909" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1909" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000188">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2099" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1965" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="932" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2717" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2717" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2717" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000189">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2768" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2574" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="997" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3494" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3494" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3494" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000194">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="2181" Hor="1" Ver="4" SpX="350" SpY="-150" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="2047" Hor="1" Ver="4" SpX="350" SpY="-150" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="817" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000195">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1379" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1237" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="586" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000196">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="1456" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="1314" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="554" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000197">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="1442" Hor="1" Ver="4" SpX="350" SpY="-150" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="1300" Hor="1" Ver="4" SpX="350" SpY="-150" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="540" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000198">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="2768" Hor="1" Ver="2" SpX="350" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="2574" Hor="1" Ver="2" SpX="350" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="350" Y="997" Hor="1" Ver="2" SpX="350" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000199">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1324" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1324" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1324" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000202">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="2371" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="2206" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="772" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000203">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2229" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2229" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000206">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.04" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.04" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.04" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000209">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1864" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1730" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="805" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000210">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2540" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2346" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="835" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000211">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72.2" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72.2" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="72.2" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000212">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|12.6|5|2" Font2="Tahoma|12.6|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000215">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3326" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="3065" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="904" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000216">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="461" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="467" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="149" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000217">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="623" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="581" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="217" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000218">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="840" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="736" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000219">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="998" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="901" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="401" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000220">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1178" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1081" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="490" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000221">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="1350" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1208" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="557" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000222">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="255" Y="1716" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="202" Y="1578" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="223" Y="647" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000223">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="198" Y="1820" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="158" Y="1686" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="158" Y="715" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000224">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="283" Y="2510" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="247" Y="2316" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="247" Y="804" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000225">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3465" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="3204" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="929" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000226">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="40.4" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000227">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="26.1" Hor="0" Ver="2" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="26.1" Hor="0" Ver="2" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="26.1" Hor="0" Ver="2" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="529" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="529" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="529" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000228">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="31.1" Hor="0" Ver="2" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="31.1" Hor="0" Ver="2" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="31.1" Hor="0" Ver="2" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="529" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="529" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="529" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000616">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000617">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000618">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
      <VC ID="INI400_005839">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
      <VC ID="INI400_005845">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="237" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005846">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005847">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005848">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005849">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="97.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="97.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005852">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005853">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="170" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="170" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005859">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005860">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="66.7" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005861">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="86.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005862">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005871">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="157" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="157" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005872">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="183" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="183" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005873">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="193" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="193" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005875">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005877">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005879">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005880">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005881">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005883">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005884">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005885">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1016" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="918" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="418" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1362" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005887">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005888">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="157" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="157" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="157" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005889">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="170" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="170" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="170" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005890">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005891">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005892">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005893">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005894">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005896">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005897">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005900">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005901">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005902">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005903">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005904">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005905">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005906">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005907">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005908">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005909">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005910">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005911">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005912">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005913">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="patka2" Content="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" />
      <Image Name="patka3" Content="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" />
      <Image Name="patka4" Content="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" />
      <Image Name="patka1" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TGroupBox Name="" ID="49" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="34" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000049">
            <ENU>Bookmarks</ENU>
          </Texts>
          <TLabel Name="" ID="51" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="35" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|5|3" Alignment="16" ForeColor="-16776961" BookMarkID="Shear">
            <Texts TranslateID="DIALOG_000051">
              <ENU>Shear check</ENU>
            </Texts>
          </TLabel>
          <TLabel Name="" ID="52" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="36" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|5|3" Alignment="16" ForeColor="-16776961" BookMarkID="Bending">
            <Texts TranslateID="DIALOG_000052">
              <ENU>Bending check</ENU>
            </Texts>
          </TLabel>
          <TLabel Name="" ID="50" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="35" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|5|3" Alignment="16" ForeColor="-16776961" BookMarkID="Begin">
            <Texts TranslateID="DIALOG_000050">
              <ENU>Calculation start</ENU>
            </Texts>
          </TLabel>
        </TGroupBox>
        <TGroupBox Name="" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="32" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000047">
            <ENU>Concrete and steel parameters</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="29" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="ξ↓max←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="31" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000046">
            <ENU>Reinforcement parameters</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="s" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="18" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="c" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="ϕ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="45" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="30" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000045">
            <ENU>Structure dimensions</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="a↓i←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="c↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="b" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="44" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="29" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000044">
            <ENU>Contact stress</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="σ↓d←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TPanel Name="" ID="43" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="28" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
          <Texts>
            <ENU>
            </ENU>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="Smyk" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000005">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="KostrPoz" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000004">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintRozmery" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000002">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TStringInput Name="TStringInput" ID="38" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000001">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="37" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000037">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCustomLibrary Name="" ID="55" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="REINF" DataFile="EC_Reinf.xml" Collapsed="True" UseCombo="False" Category="Inclined top branch" Item="B 400 B">
            <Data>
              <Header>
                <PropertySet Symbol="f↓yk←" ESA_ID="fyk" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="k" ESA_ID="k" Unit="" Type="Numeric" />
                <PropertySet Symbol="f↓tk←" ESA_ID="ftk" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓yd←" ESA_ID="fyd" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="ε↓υκ←" ESA_ID="eps_uk" Unit="" Type="Numeric" />
                <PropertySet Symbol="ε↓ud←" ESA_ID="eps_ud" Unit="" Type="Numeric" />
                <PropertySet Symbol="ε↓s1←" ESA_ID="eps_s1" Unit="" Type="Numeric" />
                <PropertySet Symbol="E↓s←" ESA_ID="Es" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="Class" ESA_ID="Class" Unit="" Type="String" />
                <PropertySet Symbol="Inclined" ESA_ID="Inclined" Unit="" Type="Bool" />
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                  </StructMembers>
                </PropertySet>
              </Header>
              <Items>
                <Item>
                  <P>Inclined top branch</P>
                  <P>B 400 B</P>
                  <P>400</P>
                  <P>1.08</P>
                  <P>432</P>
                  <P>347.83</P>
                  <P>0.05</P>
                  <P>0.045</P>
                  <P>0.00173913</P>
                  <P>200000</P>
                  <P>B</P>
                  <P>true</P>
                  <P>-0.05;-376.51;</P>
                  <P>-0.0017;-347.83;</P>
                  <P>0;0;</P>
                  <P>0.0017;347.83;</P>
                  <P>0.05;376.51;</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
          <TCustomLibrary Name="TCustomLibrary" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="CONCRETE.EC" DataFile="EC_Concrete.xml" Collapsed="True" UseCombo="False" Category="Bilinear" Item="C 16/20">
            <Data>
              <Header>
                <PropertySet Symbol="f↓ck←" ESA_ID="fck" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓ck,cube←" ESA_ID="fckcube" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓cm←" ESA_ID="fcm" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓ctm←" ESA_ID="fctm" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓ctk, 0.05←" ESA_ID="fctk_05" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓ctk, 0.95←" ESA_ID="fctk_95" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="E↓cm←" ESA_ID="Ecm" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="ε↓c1←" ESA_ID="eps_c1" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="ε↓cu1←" ESA_ID="eps_cu1" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="ε↓c2←" ESA_ID="eps_c2" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="ε↓cu2←" ESA_ID="eps_cu2" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="ε↓c3←" ESA_ID="eps_c3" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="ε↓cu3←" ESA_ID="eps_cu3" Unit="‰" Type="Numeric" />
                <PropertySet Symbol="n" ESA_ID="n" Unit="" Type="Numeric" />
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                  <StructMembers>
                    <StructMember Symbol="eps" Type="Numeric" Unit="" />
                    <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
                  </StructMembers>
                </PropertySet>
                <PropertySet Symbol="Bilinear" ESA_ID="Bilinear" Unit="" Type="Bool" />
                <PropertySet Symbol="d↓g←" ESA_ID="dg" Unit="mm" Type="Numeric" />
                <PropertySet Symbol="μ" ESA_ID="μ" Unit="" Type="Numeric" />
                <PropertySet Symbol="ρ" ESA_ID="ρ" Unit="kg/m↑3←" Type="Numeric" />
                <PropertySet Symbol="G" ESA_ID="G" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="υ" ESA_ID="υ" Unit="" Type="Numeric" />
                <PropertySet Symbol="λ" ESA_ID="λ" Unit="W/m*K" Type="Numeric" />
                <PropertySet Symbol="c" ESA_ID="c" Unit="J/kg*K" Type="Numeric" />
                <PropertySet Symbol="α" ESA_ID="α" Unit="" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>Bilinear</P>
                  <P>C 16/20</P>
                  <P>16</P>
                  <P>20</P>
                  <P>24</P>
                  <P>1.9</P>
                  <P>1.3</P>
                  <P>2.5</P>
                  <P>29</P>
                  <P>1.9</P>
                  <P>3.5</P>
                  <P>2</P>
                  <P>3.5</P>
                  <P>1.75</P>
                  <P>3.5</P>
                  <P>2</P>
                  <P>0;0;</P>
                  <P>-0.00175;-10666670;</P>
                  <P>-0.0035;-10666670;</P>
                  <P>true</P>
                  <P>32</P>
                  <P>0.2</P>
                  <P>2500</P>
                  <P>11.9</P>
                  <P>0.2</P>
                  <P>4500</P>
                  <P>0.0006</P>
                  <P>1.00E-05</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
        </TPanel>
        <TGroupBox Name="" ID="57" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="35" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000057">
            <ENU>National Annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="56" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Standard EN">
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
    <Item TranslateID="BLOCK_INI400_005896">
      <ENU>"Pad diameters and loading"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005897">
      <ENU>"Reinforcement parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005900">
      <ENU>"Check bending moment on concrete pad"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005901">
      <ENU>"Shear check"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005902">
      <ENU>"Check"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005903">
      <ENU>"Reinforcement design"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005904">
      <ENU>"Check of struct. requirements for reinforcement"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005905">
      <ENU>"Check of designed reinforcement and calculation of bearing capacity moment"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005906">
      <ENU>"Check of plastic reserve"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005907">
      <ENU>"Bearing capacity of compr. diagonals on circuit of column tip"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005908">
      <ENU>"Shear bearing capacity in checked circuit u↓a←"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000001">
      <ENU>Caption</ENU>
    </Item>
    <Item ID="TEXT_INI400_000003">
      <ENU>Description("σ↓d←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000004">
      <ENU>"σ↓d← = " &amp; σ↓d←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000010">
      <ENU>Description("b")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000011">
      <ENU>"Simple rectangle pad"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000016">
      <ENU>"c↓1← = " &amp; c↓1←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000017">
      <ENU>Description("c↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000019">
      <ENU>Description("a↓k←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000020">
      <ENU>"h = " &amp; h</ENU>
    </Item>
    <Item ID="TEXT_INI400_000021">
      <ENU>Description("h")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000024">
      <ENU>"Maximal design moment"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000025">
      <ENU>"Effective cross section height"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000027">
      <ENU>"ϕ = " &amp; ϕ</ENU>
    </Item>
    <Item ID="TEXT_INI400_000028">
      <ENU>Description("ϕ")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000029">
      <ENU>"c = " &amp; c</ENU>
    </Item>
    <Item ID="TEXT_INI400_000030">
      <ENU>Description("c")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000031">
      <ENU>"s = " &amp; s</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000032">
      <ENU>"Distance between bars"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000034">
      <ENU>"Required reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000044">
      <ENU>"As&lt; As,reg =&gt; Reinforcement area is not sufficient."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000047">
      <ENU>"Lever arm of inner forces"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000060">
      <ENU>"Bars distances must be max. 0,250 m"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000062">
      <ENU>Description("x")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000065">
      <ENU>"Lever arm of inner forces"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000068">
      <ENU>"Bearing capacity moment"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000069">
      <ENU>"Force in reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000070">
      <ENU>" =&gt; Designed reinforcement is INSUFFICIENT!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000071">
      <ENU>" =&gt; Designed reinforcement is SUFFICIENT"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000072">
      <ENU>"b = " &amp; b</ENU>
    </Item>
    <Item ID="TEXT_INI400_000073">
      <ENU>"M↓Rd← ≥ M↓Ed← =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000074">
      <ENU>M↓Rd← &amp; " &gt; " &amp; M↓Ed←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000078">
      <ENU>"Column widht = Column length"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000080">
      <ENU>"Pad width = Pad length"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000085">
      <ENU>"Max. design value of shear bearing capacity of compr. diagonal"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000087">
      <ENU>"Max. design shear stress in column surface"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000090">
      <ENU>Description("a")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000099">
      <ENU>"f↓yk← = " &amp; f↓yk←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000100">
      <ENU>"Characteristic yield strength"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000101">
      <ENU>"γ↓s← = " &amp; γ↓s←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000102">
      <ENU>Description("γ↓s←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000105">
      <ENU>Description("f↓yd←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000106">
      <ENU>"E↓s← = " &amp; E↓s←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000107">
      <ENU>"Design value of modulus of elasticity"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000108">
      <ENU>"Strain at the peak yield strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000111">
      <ENU>"Designed reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000117">
      <ENU>"Designed reinf. is INSUFFICIENT, it doesnt fulfills geom. ration of reinf. Adapt reinf. area."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000118">
      <ENU>"Designed reinforcement is SUFFICIENT, it fulfills geometrical ration of reinf."</ENU>
    </Item>
    <Item ID="TEXT_INI400_000119">
      <ENU>"ρ↓min← ≤ ρ ≤ ρ↓max← =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000120">
      <ENU>"Check of geometrical ration of reinf."</ENU>
    </Item>
    <Item ID="TEXT_INI400_000122">
      <ENU>ρ↓min← &amp; " &lt; " &amp; ρ &amp; " &lt; " &amp; ρ↓max←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000125">
      <ENU>"ξ↓max← = " &amp; ξ↓max←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000126">
      <ENU>"Max. ration"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000129">
      <ENU>ξ &amp; " &lt; " &amp; ξ↓max←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000130">
      <ENU>"ξ ≤ ξ↓max← =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000131">
      <ENU>M↓Rd← &amp; " &lt; " &amp; M↓Ed←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000132">
      <ENU>"M↓Rd← &lt; M↓Ed← =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000133">
      <ENU>" =&gt; Plastic reserve is SUFFICIENT"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000135">
      <ENU>" =&gt; Plastic reserve is INSUFFICIENT!"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000136">
      <ENU>ξ &amp; " &gt; " &amp; ξ↓max←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000137">
      <ENU>"ξ &gt; ξ↓max← =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000139">
      <ENU>" =&gt; Compressed dialgonal is INSUFFICIENT!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000142">
      <ENU>" =&gt; Compressed dialgonal is SUFFICIENT"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000143">
      <ENU>ν↓Rd,max← &amp; " &gt; " &amp; ν↓Ed,0←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000144">
      <ENU>"ν↓Rd,max← ≥ ν↓Ed,0← =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000145">
      <ENU>ν↓Rd,max← &amp; " &lt; " &amp; ν↓Ed,0←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000146">
      <ENU>"ν↓Rd,max← &lt; ν↓Ed,0← =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000148">
      <ENU>"a↓i← = " &amp; a↓i←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000149">
      <ENU>Description("a↓i←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000150">
      <ENU>"Remark: Check must be executed repeatedly in all distances a↓i← between d/2 and 2d"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000153">
      <ENU>"Limit values a↓i←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000155">
      <ENU>"Checked circuit"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000156">
      <ENU>"Area A↓a← in checked circuit u↓a←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000159">
      <ENU>"Design value of traverse force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000160">
      <ENU>"Shear stress on checked circuit"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000168">
      <ENU>"Design shear bearing capacity of concrete cross section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000170">
      <ENU>"Coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000172">
      <ENU>"Cross section height parameter"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000173">
      <ENU>"ν↓Rd,c← ≥ ν↓Ed,a← =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000174">
      <ENU>ν↓Rd,c← &amp; " &gt; " &amp; ν↓Ed,a←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000176">
      <ENU>" =&gt; Checked circuit u↓a← is SUFFICIENT"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000177">
      <ENU>"Shear reinforcement is required"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000178">
      <ENU>" =&gt; Checked circuit u↓a← is INSUFFICIENT!"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000179">
      <ENU>ν↓Rd,c← &amp; " &lt; " &amp; ν↓Ed,a←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000180">
      <ENU>"ν↓Rd,c← &lt; ν↓Ed,a← =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000183">
      <ENU>"ρ is not within limits"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000194">
      <ENU>"1 - Compressed diagonal"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000196">
      <ENU>"2 - Neutral axis x"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000197">
      <ENU>"1 - Critical area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000198">
      <ENU>"1 - Critical crack"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000199">
      <ENU>"Bigger diameter of reinf. or smaller bars distances are required."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000203">
      <ENU>"Reduction factor"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000206">
      <ENU>"Check of concrete pad foundation according to Eurocode 7"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000212">
      <ENU>IO.SetupNA.EC_1997_1.Name</ENU>
    </Item>
    <Item ID="TEXT_INI400_005859">
      <ENU>"f↓yk← &gt; f↓yk,max← =&gt; "</ENU>
    </Item>
    <Item ID="TEXT_INI400_005860">
      <ENU>f↓yk← &amp; " &gt; " &amp; f↓yk,max←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005861">
      <ENU>"f↓yk← is bigger than maximum allowed f↓yk← by national annex"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005862">
      <ENU>"Calculation stopped!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005880">
      <ENU>"A↓s← = A↓sy1 ← for min and max reinforcement check"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005885">
      <ENU>"Check of the reinforcement area"</ENU>
    </Item>
  </Texts>
</Root>