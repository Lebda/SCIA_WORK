<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="63076e2a-c4cc-4291-9181-9fddaa2c422b">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">
double π →INI400_000275= Math.PI; 
IF(H1) { 
    →INI400_000194TEXT("Check of the punching of the plate according to Eurocode 2"); 
    →INI400_000199TEXT(IO.SetupNA.EC_1992_1_1.Name &amp; "§, 6.2.3, §6.4.4, §6.4.5"); 
} 
IF(PrintCaption) { 
    →INI400_000177TEXT(Caption); 
} 

→INI400_000134BLOCK("National Annex parameters") { //National annexes
    →INI400_005838BLOCK { //NA.2.7 Clause 2.4.2.4 Partial factors for materials - Ultimate limit state, Paragraph (1)
        object Clause2_4_2_4_1 →INI400_005839= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_2.4.2.4(1).CLC"); 
        →INI400_005845Clause2_4_2_4_1.Calculate(false); 
        γ↓c← →INI400_005843= Clause2_4_2_4_1.γ↓C←; 
    } 
    →INI400_000616BLOCK { //NA.2.12 Clause 3.1.6 Design compressive and tensile strength, Paragraph(1)P
        object Clause3_1_6_1P →INI400_000617= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_3.1.6(1)P.CLC"); 
        →INI400_000145Clause3_1_6_1P.Calculate(false); 
        α↓cc← →INI400_000618= Clause3_1_6_1P.α↓cc←; 
    } 
    →INI400_000150BLOCK { //NA.2.14 Clause 3.2.2 Properties, Paragraph(3)P
        object Clause3_2_2 →INI400_000154= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_3.2.2(3)P.CLC"); 
        →INI400_000280Clause3_2_2.Calculate(false); 
        double f↓yk,max← →INI400_005850= Clause3_2_2.f↓yk,max←; 
    } 
    //    →INI400_005858BLOCK { //NA.2.45 Clause 6.2.2 Elements which doesnt require design of shear reinf., Paragraph(1)P
    //        object Clause6_2_2_1P →INI400_005859= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_6.2.2(1).CLC"); 
    //        →INI400_005856Clause6_2_2_1P.Calculate(false); 
    //        C↓Rdc← →INI400_005878= Clause6_2_2_1P.C↓Rdc←; 
    //        v↓min← →INI400_005879= Clause6_2_2_1P.v↓min←; 
    //    } 
    →INI400_005888BLOCK { //NA.2.51 Clause 6.4.3 Punching shear calculation, Paragraph(6)
        object Clause6_4_3_6P →INI400_005889= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_6.4.3(6).CLC"); 
        Clause6_4_3_6P.ColType →INI400_006396= ColType; 
        →INI400_005890Clause6_4_3_6P.Calculate(false); 
        double β →INI400_005891= Clause6_4_3_6P.β; 
    } 
} 
→INI400_006299BLOCK("Geometry") { 
    →INI400_005934TEXT(Description("h")); 
    →INI400_005935TEXT("h = " &amp; h); 
    →INI400_005936TEXT(Description("u↓0←")); 
    →INI400_005937TEXT("u↓0← = " &amp; u↓0←); 
    →INI400_005938TEXT(Description("u↓1←")); 
    →INI400_005939TEXT("u↓1← = " &amp; u↓1←); 
    →INI400_006300TEXT(Description("c")); 
    →INI400_006301TEXT("c = " &amp; c); 
    →INI400_006302TEXT("Effective height"); 
    d↓x← →INI400_006303= h-c-ϕ↓x←*0.5; 
    d↓y← →INI400_006304= h-c-ϕ↓y←*0.5; 
    d →INI400_006305= (d↓x←+d↓y←)/2; 
    →INI400_005940TEXT(Description("z")); 
    z →INI400_005941= 0.9*d; 
    →INI400_005942TEXT(Description("k")); 
    k →INI400_005943= MIN(1+SQRT(200/CUnit(d, "mm")), 2); 
    →INI400_005944PAGEBREAK(); 
    →INI400_005945IMG("punch", 0.6); 
    →INI400_005946PAGEBREAK(); 
} 
→INI400_006317BLOCK { // Concrete material parameters
    object mat_char →INI400_006307= LoadExternCLC("Concrete material characteristics.CLC"); 
    →INI400_006308mat_char.Draw(false); 
    f↓cd← →INI400_006309= mat_char.f↓cd←; 
    α↓cc← →INI400_006311= mat_char.α↓cc←; 
    ν↓1← →INI400_006313= mat_char.ν↓1←; 
    α↓cw← →INI400_006315= mat_char.α↓cw←; 
} 
→INI400_006394PAGEBREAK(); 
→INI400_005877BLOCK("Reinforcement parameters") { 
    →INI400_006318TEXT("Tension reinforcement"); 
    →INI400_006319TEXT("Number and diameter"); 
    →INI400_000072TEXT("n↓x ←= " &amp; n↓x← &amp; "  ϕ↓x← = " &amp; ϕ↓x←); 
    →INI400_006320TEXT("n↓y ←= " &amp; n↓y← &amp; "  ϕ↓y← = " &amp; ϕ↓y←); 
    →INI400_000066TEXT(Description("A↓sx←")); 
    A↓sx← →INI400_006321= n↓x←*π*[ϕ↓x←/2]↑2←; 
    A↓sy← →INI400_006322= n↓y←*π*[ϕ↓y←/2]↑2←; 
    →INI400_006323TEXT(Description("ρ↓1←")); 
    ρ↓x← →INI400_006324= A↓sx←/d↓x←; 
    ρ↓y← →INI400_006325= A↓sy←/d↓y←; 
    ρ↓1← →INI400_006326= MIN(SQRT(ρ↓x←*ρ↓y←), 0.02); 
    cot →INI400_006327= COTG(θ); 
    →INI400_006360PAGEBREAK(); 
    
    →INI400_006318TEXT("Vertical stirrups"); 
    →INI400_006358TEXT("Reinforcement"); 
    →INI400_006359TEXT(IO.STIRRUPS.EC.Item); 
    →INI400_006361TEXT(Description("f↓ywk←")); 
    f↓ywk← →INI400_006362= f↓ywk←; 
    f↓ywd← →INI400_006398= PARMIN((250+CUnit(d, "mm")*0.25)*10↑6←, f↓ywk←/1.15); 
    →INI400_006364TEXT(Description("s↓r←")); 
    →INI400_000110TEXT("s↓r← = " &amp; s↓r←); 
    →INI400_006365TEXT(Description("n↓w←")); 
    →INI400_006366TEXT("n↓w ←= " &amp; n↓w← &amp; "  ϕ↓w← = " &amp; ϕ↓w←); 
    →INI400_006367TEXT(Description("A↓sw←")); 
    A↓sw← →INI400_006328= n↓w←*π*[ϕ↓w←/2]↑2←; 
    →INI400_006368PAGEBREAK(); 
    
    IF(IO.IsStandalone) { 
        →INI400_006369TEXT("Longitudinal bends"); 
        →INI400_006370TEXT("Reinforcement"); 
        →INI400_006371TEXT(IO.BENDS.EC.Item); 
        →INI400_006372TEXT(Description("f↓ybk←")); 
        f↓ybk← →INI400_006373= f↓ybk←; 
        f↓ybd← →INI400_006397= PARMIN((250+CUnit(d, "mm")*0.25)*10↑6←, f↓ybk←/1.15); 
        →INI400_006375TEXT(Description("n↓b←")); 
        →INI400_006376TEXT("n↓b ←= " &amp; n↓b← &amp; "  ϕ↓b← = " &amp; ϕ↓b←); 
        →INI400_006381TEXT(Description("α")); 
        →INI400_006382TEXT("α = " &amp; α); 
        →INI400_006377TEXT(Description("A↓sb←")); 
        A↓sb← →INI400_006380= n↓b←*π*[ϕ↓b←/2]↑2←; 
        →INI400_006379PAGEBREAK(); 
    } 
} 
→INI400_005893BLOCK("Loading") { 
    →INI400_000178TEXT(Description("V↓Ed←")); 
    →INI400_000143TEXT("V↓Ed← = " &amp; V↓Ed←); 
    →INI400_000189TEXT(Description("β")); 
    →INI400_000188TEXT("β = " &amp; β); //mělo by se počítat, složité(6.38)(6.42)(6.43)(6.44)(6.46)
    →INI400_006393PAGEBREAK(); 
} 
→INI400_005866BLOCK("Coefficient of shear bearing capacity") { 
    →INI400_005923TEXT("Coefficient of shear strenght (without stirrups)"); 
    C↓Rdc← →INI400_005922= 0.18/γ↓c←; 
    →INI400_005924TEXT("Coefficient of minimum value of shear resistance of the member without shear reinforcement)"); 
    v↓min← →INI400_005925= 0.035*10↑3←*k↑3/2←*f↓ck←↑1/2←; 
    →INI400_005928TEXT("Coefficient of shear strenght"); 
    k →INI400_005930= PARMIN(1+(200/(1000*d))↑0.5←, 2); 
    
    //→INI400_006399Clause6_2_2_1P.Draw(true); 
} 
IF(f↓ywk← &gt; f↓yk,max←) { //Condition if Clause 3.2.2 is fulfill
    →INI400_005851TEXT("f↓ywk← &gt; f↓yk,max← =&gt; "); 
    →INI400_005852TEXT(Val(f↓ywk←/10↑6←, 0) &amp; " MPa &gt; " &amp; Val(f↓yk,max←/10↑6←, 0) &amp; " MPa"); 
    →INI400_005851TEXT("f↓ywk← is bigger than maximum allowed f↓yk← by national annex"); 
    →INI400_005853TEXT("Calculation stopped!"); 
    Exit(); 
} 
IF(f↓ybk← &gt; f↓yk,max←) { //Condition if Clause 3.2.2 is fulfill
    →INI400_005854TEXT("f↓ybk← &gt; f↓yk,max← =&gt; "); 
    →INI400_005855TEXT(Val(f↓ybk←/10↑6←, 0) &amp; " MPa &gt; " &amp; Val(f↓yk,max←/10↑6←, 0) &amp; " MPa"); 
    →INI400_005854TEXT("f↓ybk← is bigger than maximum allowed f↓yk← by national annex"); 
    →INI400_005857TEXT("Calculation stopped!"); 
    Exit(); 
} 
→INI400_000203PAGEBREAK(); 
→INI400_005896BLOCK("Bearing capacity of column face") { 
    →INI400_000151TEXT("Maximum bearing capacity of concrete"); 
    V↓Rd,max← →INI400_000141= α↓cw←*u↓0←*z*ν↓1←*f↓cd←/(COTG(θ)+TG(θ)); // (6.9),(6.14)
} 
→INI400_000204PAGEBREAK(); 
→INI400_005897BLOCK("Bearing capacity on critical circumference") { 
    →INI400_000086TEXT("Bearing capacity of concrete"); 
    v↓Rd,c← →INI400_000144= PARMAX(C↓Rdc←*10↑6←*k*[CUnit(ρ↓1←, "%")*CUnit(f↓ck←, "MPa")]↑1/3←, v↓min←); 
    
    →INI400_000092TEXT("Bearing capacity of vertical stir."); 
    IF(A↓sw← &gt; 0) { 
        v↓Rd,sw← →INI400_000017= 1.5*(d/s↓r←)*(A↓sw←*f↓ywd←)/(u↓1←*d); 
    } ELSE { 
        v↓Rd,sw← →INI400_000175= 0; 
    } 
    →INI400_000160TEXT("Bearing capacity of inclined bends"); 
    IF(A↓sb← &gt; 0) { 
        v↓Rd,sb← →INI400_000158= (A↓sb←*f↓ybd←*SIN(α))/(u↓1←*d); 
    } ELSE { 
        v↓Rd,sb← →INI400_000176= 0; 
    } 
} 
→INI400_000205PAGEBREAK(); 
→INI400_005898BLOCK("Check") { 
    →INI400_000157TEXT("Critical circumference strain"); 
    v↓Ed,1← →INI400_000156= β*(V↓Ed←/(u↓1←*d)); 
    →INI400_000165TEXT("Bearing capacity of plate in punching"); 
    IF(v↓Rd,sw← &gt; 0 || v↓Rd,sb← &gt; 0) { 
        v↓Rd,cs← →INI400_000161= 0.75*v↓Rd,c←+v↓Rd,sw←+v↓Rd,sb←; 
    } ELSE { 
        v↓Rd,cs← →INI400_000162= v↓Rd,c←; 
    } 
    →INI400_000172TEXT("Ratio of exploitation in column face"); 
    s↓0← →INI400_000171= V↓Ed←/V↓Rd,max←; 
    IF(s↓0← &lt;= 1) { 
        →INI400_005917TEXT("&lt; 1"); 
        →INI400_000173TEXT("=&gt; is SUFFICIENT"); 
    } ELSE { 
        →INI400_005918TEXT("&gt; 1"); 
        →INI400_000174TEXT("=&gt; is INSUFFICIENT!"); 
    } 
    →INI400_000168TEXT("Ratio of exploit. on critical circumference"); 
    s↓1← →INI400_000163= v↓Ed,1←/v↓Rd,cs←; 
    IF(s↓1← &lt;= 1) { 
        →INI400_005919TEXT("&lt; 1"); 
        →INI400_000166TEXT("=&gt; is SUFFICIENT"); 
    } ELSE { 
        →INI400_005920TEXT("&gt; 1"); 
        →INI400_000167TEXT("=&gt; is INSUFFICIENT!"); 
    } 
} 
//NA dependent variables:
//γ↓c←,γ↓st← - NA.2.8
//α↓cc← - NA.2.12
//α↓ct← - NA.2.13
//f↓yk← - NA.2.14
//β - NA.2.51
//k↓1← - NA.2.52
//v↓Rd,max← - NA.2.53
//k - NA.2.54
//α↓wc← , v↓1←- NA.2.48
// explanation for e - NA.4.1, NA.4.3
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="1" Material="2" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="883" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
        <Language Code="CSY" LangName="Čeština" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Concrete_puching_plate.htm</ENU>
        <CSY>http://design-forms.scia-online.com/forms/en/Concrete_puching_plate.htm</CSY>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Punching check for plates</ENU>
        <CSY>Protlačení desky</CSY>
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
      <Variable Modifier="Public" Name="A↓sb←" ESA_ID="" Type="Double" Value="226.1947e-6" Precision="2">
        <Description TranslateID="VARIABLE_A↓sb←">
          <ENU>Bends area</ENU>
          <CSY>Bends area</CSY>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sw←" ESA_ID="" Type="Double" Value="169.646e-6" Precision="2">
        <Description TranslateID="VARIABLE_A↓sw←">
          <ENU>Stirrups area</ENU>
          <CSY>Stirrups area</CSY>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sx←" ESA_ID="" Type="Double" Value="339.292e-6" Precision="2">
        <Description TranslateID="VARIABLE_A↓sx←">
          <ENU>Tension reinforcement area</ENU>
          <CSY>Tension reinforcement area</CSY>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sy←" ESA_ID="" Type="Double" Value="339.292e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="c" ESA_ID="" Type="Double" Value="35e-3" Precision="2">
        <Description TranslateID="VARIABLE_c">
          <ENU>Concrete cover</ENU>
          <CSY>Krytí výztuže</CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="C↓Rdc←" ESA_ID="" Type="Double" Value="120e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
          <CSY>Uživatelský nadpis</CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause2_4_2_4_1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause3_1_6_1P" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause3_2_2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause6_2_2_1P" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause6_4_3_6P" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ColType" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_ColType">
          <ENU>Type of column for simplified calculation of coefficient Beta</ENU>
          <CSY>Type of column for simplified calculation of coefficient Beta</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="cot" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_cot">
          <ENU>Cotangent of compression diagonal</ENU>
          <CSY>Úhel tlačených diagonál</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Value="259e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="d↓x←" ESA_ID="" Type="Double" Value="259e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="d↓y←" ESA_ID="" Type="Double" Value="259e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="f↓cd←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ck←" ESA_ID="CONCRETE.EC.fck" Type="Double" Value="25e6" Precision="1">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ybd←" ESA_ID="" Type="Double" Value="314.75e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ybk←" ESA_ID="BENDS.EC.fyk" Type="Double" Value="400e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ybk←">
          <ENU>Tensile strength of bends</ENU>
          <CSY>Tahová pevnost ohybů</CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yk,max←" ESA_ID="" Type="Double" Value="600e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ywd←" ESA_ID="" Type="Double" Value="314.75e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ywk←" ESA_ID="STIRRUPS.EC.fyk" Type="Double" Value="400e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ywk←">
          <ENU>Stirrups strength</ENU>
          <CSY>Tahová pevnost třmínků</CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="fck" ESA_ID="" Type="Double" Value="25" Precision="1">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="300e-3" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Height of the plate</ENU>
          <CSY>Průměrná tloušťka desky</CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="H1" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_H1">
          <ENU>Print headline</ENU>
          <CSY>Tisknout nadpis</CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="k" ESA_ID="" Type="Double" Value="1.87875" Precision="3">
        <Description TranslateID="VARIABLE_k">
          <ENU>Coefficient of cross section height</ENU>
          <CSY>Coefficient of cross section height</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="mat_char" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="n↓b←" ESA_ID="" Type="Double" Value="2" Precision="0">
        <Description TranslateID="VARIABLE_n↓b←">
          <ENU>The total number of bends which cross a critical plane</ENU>
          <CSY>Celkový počet ohybů procházejících kritickým průřezem</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓w←" ESA_ID="" Type="Double" Value="6" Precision="0">
        <Description TranslateID="VARIABLE_n↓w←">
          <ENU>The number of stirrups in one circle around the column</ENU>
          <CSY>Počet třmínků v jedné řadě okolo sloupu</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓x←" ESA_ID="" Type="Double" Value="3" Precision="0">
        <Description TranslateID="VARIABLE_n↓x←">
          <ENU>The number of main reinforcement bars in x direction</ENU>
          <CSY>Počet prutů podélné výztuže ve směru x</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓y←" ESA_ID="" Type="Double" Value="3" Precision="0">
        <Description TranslateID="VARIABLE_n↓y←">
          <ENU>The number of main reinforcement bars in y direction</ENU>
          <CSY>Počet prutů podélné výztuže ve směru x</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
          <CSY>Tisknout uživatelský nadpis</CSY>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="s↓0←" ESA_ID="Result.1" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_s↓0←">
          <ENU>Ratio of exploitation in column face</ENU>
          <CSY>Ratio of exploitation in column face</CSY>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="s↓1←" ESA_ID="Result.2" Type="Double" Value="638.9001e-3" Precision="2">
        <Description TranslateID="VARIABLE_s↓1←">
          <ENU>Ratio of exploit. on critical circumference</ENU>
          <CSY>Ratio of exploit. on critical circumference</CSY>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="s↓r←" ESA_ID="" Type="Double" Value="250e-3" Precision="2">
        <Description TranslateID="VARIABLE_s↓r←">
          <ENU>Radial spacing of circles of vertical stirrups</ENU>
          <CSY>Radiální vzdálenost svislých třmínků</CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="u↓0←" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_u↓0←">
          <ENU>Column circumference</ENU>
          <CSY>Obvod sloupu</CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="u↓1←" ESA_ID="" Type="Double" Value="2.5" Precision="2">
        <Description TranslateID="VARIABLE_u↓1←">
          <ENU>The critical circumference length</ENU>
          <CSY>Délka kritického průřezu</CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="v↓Ed,1←" ESA_ID="" Type="Double" Value="347490.3" Precision="2">
        <Description TranslateID="VARIABLE_v↓Ed,1←">
          <ENU>Critical circumference strain</ENU>
          <CSY>Critical circumference strain</CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Ed←" ESA_ID="" Type="Double" Value="150000" Precision="2">
        <Description TranslateID="VARIABLE_V↓Ed←">
          <ENU>Shear force on a critical circumference</ENU>
          <CSY>Smyková síla působící na kritickém průřezu</CSY>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="v↓min←" ESA_ID="" Type="Double" Value="450652.1" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="v↓Rd,c←" ESA_ID="" Type="Double" Value="450652.1" Precision="2">
        <Description TranslateID="VARIABLE_v↓Rd,c←">
          <ENU>Bearing capacity of concrete</ENU>
          <CSY>Bearing capacity of concrete</CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="v↓Rd,cs←" ESA_ID="" Type="Double" Value="543888.4" Precision="2">
        <Description TranslateID="VARIABLE_v↓Rd,cs←">
          <ENU>Bearing capacity of plate in punching</ENU>
          <CSY>Bearing capacity of plate in punching</CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Rd,max←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_V↓Rd,max←">
          <ENU>Maximum bearing capacity of concrete</ENU>
          <CSY>Maximum bearing capacity of concrete</CSY>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="v↓Rd,sb←" ESA_ID="" Type="Double" Value="77748.74" Precision="2">
        <Description TranslateID="VARIABLE_v↓Rd,sb←">
          <ENU>Bearing capacity of inclined bends</ENU>
          <CSY>Bearing capacity of inclined bends</CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="v↓Rd,sw←" ESA_ID="" Type="Double" Value="128150.6" Precision="2">
        <Description TranslateID="VARIABLE_v↓Rd,sw←">
          <ENU>Bearing capacity of vertical stirrups</ENU>
          <CSY>Bearing capacity of vertical stirrups</CSY>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="z" ESA_ID="" Type="Double" Value="233.1e-3" Precision="2">
        <Description TranslateID="VARIABLE_z">
          <ENU>Inner lever arm of forces</ENU>
          <CSY>Inner lever arm of forces</CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="α" ESA_ID="" Type="Double" Value="45" Precision="1">
        <Description TranslateID="VARIABLE_α">
          <ENU>Angle of bends</ENU>
          <CSY>Úhel ohybů</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓cc←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_α↓cc←">
          <ENU>Coefficient of action conditions</ENU>
          <CSY>Coefficient of action conditions</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓cw←" ESA_ID="" Type="Double" Value="NaN" Precision="1">
        <Description TranslateID="VARIABLE_α↓cw←">
          <ENU>Coefficient of maximum bearing capacity of concrete</ENU>
          <CSY>Koeficient max. kapacity nosnosti betonu</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="β" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_β">
          <ENU>Coefficient for taking account of bending moments</ENU>
          <CSY>Koeficient vlivu ohybových momentů </CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓c←" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_γ↓c←">
          <ENU>Partial safety factor for concrete</ENU>
          <CSY>Parciální součinitel spolehlivosti betonu</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="θ" ESA_ID="" Type="Double" Value="45" Precision="1">
        <Description TranslateID="VARIABLE_θ">
          <ENU>Angle of inclined compression diagonal</ENU>
          <CSY>Úhel šikmých tlačených diagonál</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ν↓1←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="π" ESA_ID="" Type="Double" Value="3.141593" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓1←" ESA_ID="" Type="Double" Value="1.310008e-3" Precision="2">
        <Description TranslateID="VARIABLE_ρ↓1←">
          <ENU>The ratio of reinforcement</ENU>
          <CSY>The ratio of reinforcement</CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓x←" ESA_ID="" Type="Double" Value="1.310008e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓y←" ESA_ID="" Type="Double" Value="1.310008e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
          <CSY>
          </CSY>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓b←" ESA_ID="" Type="Double" Value="12e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓b←">
          <ENU>Diameter of bar bend</ENU>
          <CSY>Průměr ohybů</CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓w←" ESA_ID="" Type="Double" Value="6e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓w←">
          <ENU>Stirrup diameter</ENU>
          <CSY>Průměr třmínků</CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓x←" ESA_ID="" Type="Double" Value="12e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓x←">
          <ENU>Diameter of main reinforcement bars in x direction</ENU>
          <CSY>Průměr podélné výztuže ve směru x</CSY>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓y←" ESA_ID="" Type="Double" Value="12e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓y←">
          <ENU>Diameter of main reinforcement bars in y direction</ENU>
          <CSY>Průměr podélné výztuže ve směru y</CSY>
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
          <CSY>Plný</CSY>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Standard</ENU>
          <CSY>Standart</CSY>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_2">
          <ENU>Brief</ENU>
          <CSY>Stručný</CSY>
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
      <VC ID="INI400_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1579" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1128" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="411" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="690" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="690" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="690" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000066">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="538" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000070">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000072">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="220" Y="435" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="364" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="147" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="399" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000073">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="1196" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="863" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="277" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000082">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1196" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000119" Style="0" StyleName="" X="0" Y="879" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000119" Style="0" StyleName="" X="0" Y="879" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000086">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1483" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1106" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="389" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="602" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="602" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="602" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000092">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1579" Hor="0" Ver="4" SpX="0" SpY="35" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000086" Style="0" StyleName="" X="0" Y="1170" Hor="0" Ver="4" SpX="0" SpY="50" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000086" Style="0" StyleName="" X="10" Y="641" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000086" Style="0" StyleName="" X="10" Y="641" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000086" Style="0" StyleName="" X="10" Y="641" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000110">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="424" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="427" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="223" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="146" Y="64" Hor="4" Ver="1" SpX="-33" SpY="17" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="146" Y="64" Hor="4" Ver="1" SpX="-33" SpY="17" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="146" Y="64" Hor="4" Ver="1" SpX="-33" SpY="17" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000111">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="1196" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="879" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="292" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000112">
        <Set Vis="1" Prev="INI400_000082" Style="0" StyleName="" X="0" Y="1225" Hor="1" Ver="4" SpX="0" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000082" Style="0" StyleName="" X="0" Y="908" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000082" Style="0" StyleName="" X="0" Y="908" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000082" Style="0" StyleName="" X="10" Y="396" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000082" Style="0" StyleName="" X="10" Y="396" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000082" Style="0" StyleName="" X="10" Y="396" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000134">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000141">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1387" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1004" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="342" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="545" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="545" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="545" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000143">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="65.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="65.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="65.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000144">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1483" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1071" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="3" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="392" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="0" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="639" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="3" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="639" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="3" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="639" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="3" />
      </VC>
      <VC ID="INI400_000145">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000150">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="157" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="157" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000151">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1364" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="991" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="331" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="545" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="545" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="545" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000154">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="170" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="170" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000156">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1726" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1242" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="482" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="741" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="741" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="741" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000157">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1726" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1328" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="476" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="741" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="741" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="741" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000158">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="134" Y="1654" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1166" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="432" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="711" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="711" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="711" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000160">
        <Set Vis="1" Prev="INI400_000092" Style="0" StyleName="" X="0" Y="1654" Hor="0" Ver="1" SpX="0" SpY="94" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="468" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000092" Style="0" StyleName="" X="10" Y="680" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000092" Style="0" StyleName="" X="10" Y="680" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000092" Style="0" StyleName="" X="10" Y="680" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000161">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1773" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1269" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="497" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="831" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="831" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="831" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000162">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="898" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1377" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="898" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="775" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="775" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="775" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000163">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1908" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1325" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="527" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="852" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="852" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="852" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000165">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1759" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1391" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="539" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="775" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="775" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="775" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000166">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="384" Y="1908" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="201" Y="1325" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="93.2" Y="527" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="395" Y="910" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="395" Y="910" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="395" Y="910" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000167">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="423" Y="981" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="236" Y="1501" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="94.2" Y="527" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="427" Y="852" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="427" Y="852" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="427" Y="852" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000168">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1885" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1524" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="667" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="852" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="852" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="852" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000171">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1846" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1293" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="513" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="812" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="812" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="812" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000172">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1461" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="604" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="812" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="812" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="812" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000173">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="402" Y="1846" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="212" Y="1293" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="93.2" Y="513" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="407" Y="859" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="407" Y="859" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="407" Y="859" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000174">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="407" Y="934" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="407" Y="934" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="94.2" Y="513" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="410" Y="812" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="410" Y="812" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="410" Y="812" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Microsoft Sans Serif|11.7|0|2" Font2="Microsoft Sans Serif|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000175">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="766" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1193" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="766" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="641" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="641" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="641" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000176">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="805" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1234" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="805" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="680" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="680" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="680" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000177">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14.3|5|2" Font2="Tahoma|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14.3|5|2" Font2="Tahoma|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14.3|5|2" Font2="Tahoma|14.3|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000178">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="50" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000188">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="86.2" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="81.2" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="81.2" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000189">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="72" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000194">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000198">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1114" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="820" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="234" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000199">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000203">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1322" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="962" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="305" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000204">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1441" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1025" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="355" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000205">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1674" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1187" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="445" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000275">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000280">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="183" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="183" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000618">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
      <VC ID="INI400_005850">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="193" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="193" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005851">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="86.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005852">
        <Set Vis="1" Prev="INI400_005851" Style="0" StyleName="" X="0" Y="66.7" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005853">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005854">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="86.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005855">
        <Set Vis="1" Prev="INI400_005851" Style="0" StyleName="" X="0" Y="66.7" Hor="4" Ver="2" SpX="3" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005856">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005857">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005858">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005859">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005866">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005877">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005878">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005879">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005880">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="919" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005888">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="157" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="157" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005889">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="170" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="170" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005890">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="183" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="183" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005891">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="238" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="193" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="193" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005893">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005895">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
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
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005898">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005917">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005918">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005919">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005920">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005922">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="100" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005923">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1196" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000119" Style="0" StyleName="" X="0" Y="879" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000119" Style="0" StyleName="" X="0" Y="879" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005924">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1196" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000119" Style="0" StyleName="" X="0" Y="879" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000119" Style="0" StyleName="" X="0" Y="879" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005925">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="100" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="112" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005928">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1196" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000119" Style="0" StyleName="" X="0" Y="879" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="INI400_000119" Style="0" StyleName="" X="0" Y="879" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000119" Style="0" StyleName="" X="10" Y="367" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005930">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="100" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="165" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005934">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="96" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="96" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005935">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="111" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="95.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="95.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005936">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="130" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005937">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="130" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="110" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="65.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005938">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="151" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005939">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="151" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="126" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="81.2" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005940">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="906" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="795" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="795" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000114" Style="0" StyleName="" X="10" Y="168" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000114" Style="0" StyleName="" X="10" Y="168" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000114" Style="0" StyleName="" X="10" Y="168" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005941">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="906" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="754" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="159" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="168" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="168" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="168" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005942">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="940" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="829" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="829" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000090" Style="0" StyleName="" X="10" Y="202" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000090" Style="0" StyleName="" X="10" Y="202" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000090" Style="0" StyleName="" X="10" Y="202" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005943">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="940" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="768" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="174" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="INI400_000068" Style="0" StyleName="" X="200" Y="202" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
        <Set Vis="1" Prev="INI400_000068" Style="0" StyleName="" X="200" Y="202" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
        <Set Vis="1" Prev="INI400_000068" Style="0" StyleName="" X="200" Y="202" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
      </VC>
      <VC ID="INI400_005944">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="164" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="139" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005945">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="410" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="385" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="368" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005946">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="661" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="636" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="113" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006299">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006300">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="151" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006301">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="151" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="126" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="450" Y="81.2" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006302">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="791" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="768" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="768" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000061" Style="0" StyleName="" X="10" Y="144" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000061" Style="0" StyleName="" X="10" Y="144" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000061" Style="0" StyleName="" X="10" Y="144" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006303">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="816" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="71.5" Y="744" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="216" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006304">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="841" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="71.5" Y="765" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="71.5" Y="237" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006305">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="875" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="739" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="145" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="144" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="144" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="144" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006307">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006308">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006309">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006311">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006313">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006315">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006317">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006318">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="420" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|4|2" Font2="Tahoma|11.7|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006319">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="420" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|4|2" Font2="Tahoma|11.7|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006320">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="435" Hor="0" Ver="4" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="364" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="147" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="399" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006321">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="698" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="152" Y="673" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="145" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="318" Y="52" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="318" Y="52" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="318" Y="52" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_006322">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="717" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="152" Y="693" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="165" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="318" Y="71" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="318" Y="71" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="318" Y="71" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_006323">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="985" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="881" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="881" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000068" Style="0" StyleName="" X="10" Y="246" Hor="1" Ver="4" SpX="0" SpY="30" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000068" Style="0" StyleName="" X="10" Y="246" Hor="1" Ver="4" SpX="0" SpY="30" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000068" Style="0" StyleName="" X="10" Y="246" Hor="1" Ver="4" SpX="0" SpY="30" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006324">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1012" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="798" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="204" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006325">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1048" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="836" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="241" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006326">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1077" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="783" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="450" Y="188" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="246" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="246" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="246" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006327">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="222" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="222" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="222" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="222" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="222" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="400" Y="222" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006328">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="742" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="67.9" Y="708" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="181" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="251" Y="96" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="251" Y="96" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="251" Y="96" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_006358">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006359">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006360">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="919" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006361">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="131" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="338" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="338" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="338" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006362">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="131" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006363">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="131" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="134" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="96.6" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="338" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="338" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="338" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006364">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="424" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="398" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="398" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006365">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="420" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|4|2" Font2="Tahoma|11.7|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006366">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="220" Y="435" Hor="1" Ver="4" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="364" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="147" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="399" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006367">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="538" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006368">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="919" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006369">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="420" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|4|2" Font2="Tahoma|11.7|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006370">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006371">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006372">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="157" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="135" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="135" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="367" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="367" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="367" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006373">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="157" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="153" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="112" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006374">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="157" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="153" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="112" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006375">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="420" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|4|2" Font2="Tahoma|11.7|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006376">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="220" Y="435" Hor="1" Ver="4" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="364" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="147" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="399" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006377">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="538" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006379">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="919" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006380">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="767" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="71.5" Y="724" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="196" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="251" Y="120" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="251" Y="120" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="251" Y="120" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_006381">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="424" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="398" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="398" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006382">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="424" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="427" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="223" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="146" Y="64" Hor="4" Ver="1" SpX="-33" SpY="17" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="146" Y="64" Hor="4" Ver="1" SpX="-33" SpY="17" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="146" Y="64" Hor="4" Ver="1" SpX="-33" SpY="17" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006393">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="919" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006394">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="661" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="636" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="113" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006395">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="183" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="183" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006396">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006397">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="1196" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="879" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="292" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006398">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="1196" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="863" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="277" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="367" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006399">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="punch" Content="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" />
      <Image Name="BG" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="630">
      <TPanel Name="" ID="129" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts TranslateID="DIALOG_000129">
          <ENU>Load</ENU>
          <CSY>Load</CSY>
        </Texts>
        <TGroupBox Name="" ID="48" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="34" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000048">
            <ENU>Load value</ENU>
            <CSY>Zatížení</CSY>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="V↓Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TComboBox Name="" ID="61" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ColType" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2" Index="2">
          <Texts TranslateID="DIALOG_000061">
            <ENU>Internal column|Edge column|Corner column</ENU>
            <CSY>Internal column|Edge column|Corner column</CSY>
          </Texts>
        </TComboBox>
      </TPanel>
      <TPanel Name="" ID="127" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts TranslateID="DIALOG_000127">
          <ENU>Design settings</ENU>
          <CSY>Design settings</CSY>
        </Texts>
        <TGroupBox Name="" ID="51" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000051">
            <ENU>Stirrups</ENU>
            <CSY>Třmínky</CSY>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="24" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="s↓r←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="22" Translate="1" Height="28" AutoWidth="False" AutoHeight="False" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ϕ↓w←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="23" Translate="1" Height="28" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="n↓w←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="52" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000052">
            <ENU>Bends</ENU>
            <CSY>Ohyby</CSY>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="30" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="α" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="29" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ϕ↓b←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="28" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="n↓b←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="50" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000050">
            <ENU>Longitudinal reinforcement</ENU>
            <CSY>Podélná výztuž</CSY>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ϕ↓y←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="18" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="n↓y←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ϕ↓x←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="16" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="n↓x←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
      </TPanel>
      <TPanel Name="" ID="125" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
        <Texts TranslateID="DIALOG_000125">
          <ENU>Cross section</ENU>
          <CSY>Cross section</CSY>
        </Texts>
        <TGroupBox Name="" ID="49" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000049">
            <ENU>Geometry</ENU>
            <CSY>Geometrie průřezu</CSY>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="θ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="u↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="u↓0←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
      </TPanel>
      <TPanel Name="" ID="121" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
        <Texts TranslateID="DIALOG_000121">
          <ENU>Material</ENU>
          <CSY>Material</CSY>
        </Texts>
        <TCustomLibrary Name="" ID="58" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="STIRRUPS.EC" DataFile="EC_Reinf.xml" Collapsed="True" UseCombo="False" Category="Inclined top branch" Item="B 400 A">
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
                <P>B 400 A</P>
                <P>400</P>
                <P>1.05</P>
                <P>420</P>
                <P>347.83</P>
                <P>0.025</P>
                <P>0.0225</P>
                <P>0.00173913</P>
                <P>200000</P>
                <P>A</P>
                <P>true</P>
                <P>-0.025;-365.68;</P>
                <P>-0.0017;-347.83;</P>
                <P>0;0;</P>
                <P>0.0017;347.83;</P>
                <P>0.025;365.68;</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TLabel Name="" ID="133" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="5|5|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000133">
            <ENU>Stirrups:</ENU>
            <CSY>Stirrups:</CSY>
          </Texts>
        </TLabel>
        <TCustomLibrary Name="" ID="59" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="BENDS.EC" DataFile="EC_Reinf.xml" Collapsed="True" UseCombo="False" Category="Inclined top branch" Item="B 400 B">
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
        <TLabel Name="" ID="131" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000131">
            <ENU>Bends:</ENU>
            <CSY>Bends:</CSY>
          </Texts>
        </TLabel>
        <TCustomLibrary Name="TCustomLibrary" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="CONCRETE.EC" DataFile="EC_Concrete.xml" Collapsed="True" UseCombo="False" Category="Bilinear" Item="C 25/30">
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
                <P>C 25/30</P>
                <P>25</P>
                <P>30</P>
                <P>33</P>
                <P>2.6</P>
                <P>1.8</P>
                <P>3.3</P>
                <P>31</P>
                <P>2.1</P>
                <P>3.5</P>
                <P>2</P>
                <P>3.5</P>
                <P>1.75</P>
                <P>3.5</P>
                <P>2</P>
                <P>0;0;</P>
                <P>-0.00175;-16666670;</P>
                <P>-0.0035;-16666670;</P>
                <P>true</P>
                <P>32</P>
                <P>0.2</P>
                <P>2500</P>
                <P>13.1</P>
                <P>0.2</P>
                <P>4500</P>
                <P>0.0006</P>
                <P>1.00E-05</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TLabel Name="" ID="130" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000130">
            <ENU>Concrete:</ENU>
            <CSY>Concrete:</CSY>
          </Texts>
        </TLabel>
      </TPanel>
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
        <Texts>
          <ENU>General settings</ENU>
          <CSY>General settings</CSY>
        </Texts>
        <TGroupBox Name="" ID="123" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000123">
            <ENU>Headline settings</ENU>
            <CSY>Headline settings</CSY>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="44" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="H1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000044">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TStringInput Name="TStringInput" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000001">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="60" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000060">
            <ENU>National annex</ENU>
            <CSY>Národní příloha</CSY>
          </Texts>
          <TCustomLibrary Name="" ID="49" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Czech CSN-EN">
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
    <Item TranslateID="BLOCK_INI400_000134">
      <ENU>"National Annex parameters"</ENU>
      <CSY>"National Annex parameters"</CSY>
    </Item>
    <Item TranslateID="BLOCK_INI400_005866">
      <ENU>"Coefficient of shear bearing capacity"</ENU>
      <CSY>"Součinitel únosnosti ve smyku"</CSY>
    </Item>
    <Item TranslateID="BLOCK_INI400_005877">
      <ENU>"Reinforcement parameters"</ENU>
      <CSY>"Reinforcement parameters"</CSY>
    </Item>
    <Item TranslateID="BLOCK_INI400_005893">
      <ENU>"Loading"</ENU>
      <CSY>"Vstupní údaje"</CSY>
    </Item>
    <Item TranslateID="BLOCK_INI400_005895">
      <ENU>"Reinforcement material parameters"</ENU>
      <CSY>"Charakteristiky výztuže"</CSY>
    </Item>
    <Item TranslateID="BLOCK_INI400_005896">
      <ENU>"Bearing capacity of column face"</ENU>
      <CSY>"Únosnost na líci sloupu"</CSY>
    </Item>
    <Item TranslateID="BLOCK_INI400_005897">
      <ENU>"Bearing capacity on critical circumference"</ENU>
      <CSY>"Únosnost kritického průřezu"</CSY>
    </Item>
    <Item TranslateID="BLOCK_INI400_005898">
      <ENU>"Check"</ENU>
      <CSY>"Posouzení"</CSY>
    </Item>
    <Item TranslateID="BLOCK_INI400_006299">
      <ENU>"Geometry"</ENU>
      <CSY>"Geometry"</CSY>
    </Item>
    <Item ID="TEXT_INI400_000066">
      <ENU>Description("A↓sx←")</ENU>
      <CSY>Description("A↓sx←")</CSY>
    </Item>
    <Item ID="TEXT_INI400_000072">
      <ENU>"n↓x ←= " &amp; n↓x← &amp; "  ϕ↓x← = " &amp; ϕ↓x←</ENU>
      <CSY>"n↓x ←= " &amp; n↓x← &amp; "  ϕ↓x← = " &amp; ϕ↓x←</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000082">
      <ENU>"Stirrups strength"</ENU>
      <CSY>"Pevnost třmínků"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000086">
      <ENU>"Bearing capacity of concrete"</ENU>
      <CSY>"Únosnost betonu"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000092">
      <ENU>"Bearing capacity of vertical stir."</ENU>
      <CSY>"Únosnost svislých třmínků"</CSY>
    </Item>
    <Item ID="TEXT_INI400_000110">
      <ENU>"s↓r← = " &amp; s↓r←</ENU>
      <CSY>"s↓r← = " &amp; s↓r←</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000112">
      <ENU>"Bends strength"</ENU>
      <CSY>"Pevnost ohybů"</CSY>
    </Item>
    <Item ID="TEXT_INI400_000143">
      <ENU>"V↓Ed← = " &amp; V↓Ed←</ENU>
      <CSY>"V↓Ed← = " &amp; V↓Ed←</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000151">
      <ENU>"Maximum bearing capacity of concrete"</ENU>
      <CSY>"Maximální únosnost betonu"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000157">
      <ENU>"Critical circumference strain"</ENU>
      <CSY>"Napětí na kritickém průřezu"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000160">
      <ENU>"Bearing capacity of inclined bends"</ENU>
      <CSY>"Únosnost šikmých ohybů"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000165">
      <ENU>"Bearing capacity of plate in punching"</ENU>
      <CSY>"Únosnost desky v protlačení"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000166">
      <ENU>"=&gt; is SUFFICIENT"</ENU>
      <CSY>"=&gt; VYHOVUJE!"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000167">
      <ENU>"=&gt; is INSUFFICIENT!"</ENU>
      <CSY>"=&gt; NEVYHOVUJE!"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000168">
      <ENU>"Ratio of exploit. on critical circumference"</ENU>
      <CSY>"Využití na kritickém průřezu"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000172">
      <ENU>"Ratio of exploitation in column face"</ENU>
      <CSY>"Využití na líci sloupu"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000173">
      <ENU>"=&gt; is SUFFICIENT"</ENU>
      <CSY>"=&gt; VYHOVUJE!"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000174">
      <ENU>"=&gt; is INSUFFICIENT!"</ENU>
      <CSY>"=&gt; NEVYHOVUJE!"</CSY>
    </Item>
    <Item ID="TEXT_INI400_000177">
      <ENU>Caption</ENU>
      <CSY>Caption</CSY>
    </Item>
    <Item ID="TEXT_INI400_000178">
      <ENU>Description("V↓Ed←")</ENU>
      <CSY>"Smyková síla"</CSY>
    </Item>
    <Item ID="TEXT_INI400_000188">
      <ENU>"β = " &amp; β</ENU>
      <CSY>"β = " &amp; β</CSY>
    </Item>
    <Item ID="TEXT_INI400_000189">
      <ENU>Description("β")</ENU>
      <CSY>"Součinitel napětí na kritickém průřezu"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_000194">
      <ENU>"Check of the punching of the plate according to Eurocode 2"</ENU>
      <CSY>"Posouzení protlačení desky dle Eurokódu 2"</CSY>
    </Item>
    <Item ID="TEXT_INI400_000199">
      <ENU>IO.SetupNA.EC_1992_1_1.Name &amp; "§, 6.2.3, §6.4.4, §6.4.5"</ENU>
      <CSY>IO.SetupNA.EC_1992_1_1.Name &amp; "§, 6.2.3, §6.4.4, §6.4.5"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_005851">
      <ENU>"f↓ywk← is bigger than maximum allowed f↓yk← by national annex"</ENU>
      <CSY>"f↓ywk← is bigger than maximum allowed f↓yk← by national annex"</CSY>
    </Item>
    <Item ID="TEXT_INI400_005852">
      <ENU>Val(f↓ywk←/10↑6←, 0) &amp; " MPa &gt; " &amp; Val(f↓yk,max←/10↑6←, 0) &amp; " MPa"</ENU>
      <CSY>Val(f↓ywk←/10↑6←, 0) &amp; " MPa &gt; " &amp; Val(f↓yk,max←/10↑6←, 0) &amp; " MPa"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_005853">
      <ENU>"Calculation stopped!"</ENU>
      <CSY>"Calculation stopped!"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_005854">
      <ENU>"f↓ybk← is bigger than maximum allowed f↓yk← by national annex"</ENU>
      <CSY>"f↓ybk← is bigger than maximum allowed f↓yk← by national annex"</CSY>
    </Item>
    <Item ID="TEXT_INI400_005855">
      <ENU>Val(f↓ybk←/10↑6←, 0) &amp; " MPa &gt; " &amp; Val(f↓yk,max←/10↑6←, 0) &amp; " MPa"</ENU>
      <CSY>Val(f↓ybk←/10↑6←, 0) &amp; " MPa &gt; " &amp; Val(f↓yk,max←/10↑6←, 0) &amp; " MPa"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_005857">
      <ENU>"Calculation stopped!"</ENU>
      <CSY>"Calculation stopped!"</CSY>
    </Item>
    <Item ID="TEXT_INI400_005917">
      <ENU>"&lt; 1"</ENU>
      <CSY>"&lt; 1"</CSY>
    </Item>
    <Item ID="TEXT_INI400_005918">
      <ENU>"&gt; 1"</ENU>
      <CSY>"&gt; 1"</CSY>
    </Item>
    <Item ID="TEXT_INI400_005919">
      <ENU>"&lt; 1"</ENU>
      <CSY>"&lt; 1"</CSY>
    </Item>
    <Item ID="TEXT_INI400_005920">
      <ENU>"&gt; 1"</ENU>
      <CSY>"&gt; 1"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_005923">
      <ENU>"Coefficient of shear strenght (without stirrups)"</ENU>
      <CSY>"Součinitel smykové pevnosti (bez třmínků)"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_005924">
      <ENU>"Coefficient of minimum value of shear resistance of the member without shear reinforcement)"</ENU>
      <CSY>"Součinitel minimální smykové pevnosti prvku bez smykové výztuže"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_005928">
      <ENU>"Coefficient of shear strenght"</ENU>
      <CSY>"Součinitel smykové pevnosti"</CSY>
    </Item>
    <Item ID="TEXT_INI400_005934">
      <ENU>Description("h")</ENU>
      <CSY>Description("h")</CSY>
    </Item>
    <Item ID="TEXT_INI400_005935">
      <ENU>"h = " &amp; h</ENU>
      <CSY>"h = " &amp; h</CSY>
    </Item>
    <Item ID="TEXT_INI400_005936">
      <ENU>Description("u↓0←")</ENU>
      <CSY>Description("u↓0←")</CSY>
    </Item>
    <Item ID="TEXT_INI400_005937">
      <ENU>"u↓0← = " &amp; u↓0←</ENU>
      <CSY>"u↓0← = " &amp; u↓0←</CSY>
    </Item>
    <Item ID="TEXT_INI400_005938">
      <ENU>Description("u↓1←")</ENU>
      <CSY>Description("u↓1←")</CSY>
    </Item>
    <Item ID="TEXT_INI400_005939">
      <ENU>"u↓1← = " &amp; u↓1←</ENU>
      <CSY>"u↓1← = " &amp; u↓1←</CSY>
    </Item>
    <Item ID="TEXT_INI400_005940">
      <ENU>Description("z")</ENU>
      <CSY>Description("z")</CSY>
    </Item>
    <Item ID="TEXT_INI400_005942">
      <ENU>Description("k")</ENU>
      <CSY>Description("k")</CSY>
    </Item>
    <Item ID="TEXT_INI400_006300">
      <ENU>Description("c")</ENU>
      <CSY>Description("c")</CSY>
    </Item>
    <Item ID="TEXT_INI400_006301">
      <ENU>"c = " &amp; c</ENU>
      <CSY>"c = " &amp; c</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_006302">
      <ENU>"Effective height"</ENU>
      <CSY>"Effective height"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_006318">
      <ENU>"Vertical stirrups"</ENU>
      <CSY>"Vertical stirrups"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_006319">
      <ENU>"Number and diameter"</ENU>
      <CSY>"Number and diameter"</CSY>
    </Item>
    <Item ID="TEXT_INI400_006320">
      <ENU>"n↓y ←= " &amp; n↓y← &amp; "  ϕ↓y← = " &amp; ϕ↓y←</ENU>
      <CSY>"n↓y ←= " &amp; n↓y← &amp; "  ϕ↓y← = " &amp; ϕ↓y←</CSY>
    </Item>
    <Item ID="TEXT_INI400_006323">
      <ENU>Description("ρ↓1←")</ENU>
      <CSY>Description("ρ↓1←")</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_006358">
      <ENU>"Reinforcement"</ENU>
      <CSY>"Reinforcement"</CSY>
    </Item>
    <Item ID="TEXT_INI400_006359">
      <ENU>IO.STIRRUPS.EC.Item</ENU>
      <CSY>IO.STIRRUPS.EC.Item</CSY>
    </Item>
    <Item ID="TEXT_INI400_006361">
      <ENU>Description("f↓ywk←")</ENU>
      <CSY>Description("f↓ywk←")</CSY>
    </Item>
    <Item ID="TEXT_INI400_006364">
      <ENU>Description("s↓r←")</ENU>
      <CSY>Description("s↓r←")</CSY>
    </Item>
    <Item ID="TEXT_INI400_006365">
      <ENU>Description("n↓w←")</ENU>
      <CSY>Description("n↓w←")</CSY>
    </Item>
    <Item ID="TEXT_INI400_006366">
      <ENU>"n↓w ←= " &amp; n↓w← &amp; "  ϕ↓w← = " &amp; ϕ↓w←</ENU>
      <CSY>"n↓w ←= " &amp; n↓w← &amp; "  ϕ↓w← = " &amp; ϕ↓w←</CSY>
    </Item>
    <Item ID="TEXT_INI400_006367">
      <ENU>Description("A↓sw←")</ENU>
      <CSY>Description("A↓sw←")</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_006369">
      <ENU>"Longitudinal bends"</ENU>
      <CSY>"Longitudinal bends"</CSY>
    </Item>
    <Item TranslateID="TEXT_INI400_006370">
      <ENU>"Reinforcement"</ENU>
      <CSY>"Reinforcement"</CSY>
    </Item>
    <Item ID="TEXT_INI400_006371">
      <ENU>IO.BENDS.EC.Item</ENU>
      <CSY>IO.BENDS.EC.Item</CSY>
    </Item>
    <Item ID="TEXT_INI400_006372">
      <ENU>Description("f↓ybk←")</ENU>
      <CSY>Description("f↓ybk←")</CSY>
    </Item>
    <Item ID="TEXT_INI400_006375">
      <ENU>Description("n↓b←")</ENU>
      <CSY>Description("n↓b←")</CSY>
    </Item>
    <Item ID="TEXT_INI400_006376">
      <ENU>"n↓b ←= " &amp; n↓b← &amp; "  ϕ↓b← = " &amp; ϕ↓b←</ENU>
      <CSY>"n↓b ←= " &amp; n↓b← &amp; "  ϕ↓b← = " &amp; ϕ↓b←</CSY>
    </Item>
    <Item ID="TEXT_INI400_006377">
      <ENU>Description("A↓sb←")</ENU>
      <CSY>Description("A↓sb←")</CSY>
    </Item>
    <Item ID="TEXT_INI400_006381">
      <ENU>Description("α")</ENU>
      <CSY>Description("α")</CSY>
    </Item>
    <Item ID="TEXT_INI400_006382">
      <ENU>"α = " &amp; α</ENU>
      <CSY>"α = " &amp; α</CSY>
    </Item>
  </Texts>
</Root>