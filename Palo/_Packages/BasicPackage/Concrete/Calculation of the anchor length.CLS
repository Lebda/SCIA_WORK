<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="a0e205b3-d3c0-49eb-ad83-825757070394">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">→INI400_006519BLOCK { //IO inputs
    IF(IO.IsStandalone) { 
        f↓ctk← →INI400_006518= IO.CONCRETE.EC.fctk_05; 
    } 
} 
IF(Headline) { 
    →INI400_000044TEXT("Design and check of the anchorage length according to Eurocode 2"); 
    →INI400_000049TEXT(IO.SetupNA.EC_1992_1_1.Name &amp; ", §8.4.3, §8.4.4"); 
} 
IF(PrintCaption) { 
    →INI400_000004TEXT(Captiontext); 
} 
double π →INI400_000056= Math.PI; 
→INI400_000134BLOCK("National Annex parameters") { //National annexes
    →INI400_005838BLOCK { //NA.2.7 Clause 2.4.2.4 Partial factors for materials - Ultimate limit state, Paragraph (1)
        object Clause2_4_2_4_1 →INI400_005839= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_2.4.2.4(1).CLC"); 
        →INI400_005845Clause2_4_2_4_1.Calculate(false); 
        γ↓c← →INI400_005843= Clause2_4_2_4_1.γ↓C←; 
    } 
    →INI400_005847BLOCK { //NA.2.11 Clause 3.1.2 Stength, Paragraph (4)
        object Clause3_1_2 →INI400_005848= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_3.1.2(4).CLC"); 
        →INI400_005849Clause3_1_2.Calculate(false); 
        k↓t← →INI400_005850= Clause3_1_2.k↓t←; 
    } 
    →INI400_005851BLOCK { //NA.2.13 Clause 3.1.6 Design compressive and tensile strength, Paragraph(2)P
        object Clause3_1_6_1P →INI400_005852= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_3.1.6(2)P.CLC"); 
        →INI400_005853Clause3_1_6_1P.Calculate(false); 
        double α↓ct,or← →INI400_005854= Clause3_1_6_1P.α↓ct←; 
    } 
} 
→INI400_005867BLOCK("Concrete material parameters") { 
    →INI400_006355TEXT("Concrete"); 
    →INI400_006356TEXT(IO.CONCRETE.EC.Item); 
    →INI400_006362TEXT(Description("f↓ctk←")); 
    f↓ctk,0,05← →INI400_006400= MIN(f↓ctk←, 3100000); //3.1 MPa is value for C60/75, Clause 8.4.2(2)
    →INI400_006363TEXT("f↓ctk,0,05← = " &amp; f↓ctk,0,05←); 
    IF(IO.CONCRETE.EC.fck &gt; 60000000) { 
        →INI400_006401TEXT("f↓ctk,0,05← is limited to the value for C 60/75"); 
    } 
    →INI400_005856TEXT(Description("t")); 
    →INI400_005855TEXT("t = " &amp; t); 
    →INI400_006357TEXT("days"); 
    →INI400_005857TEXT(Description("k↓t←")); 
    IF(t &lt;= 28) { 
        k↓t← →INI400_005862= 1; 
    } 
    →INI400_005858TEXT("k↓t ←= " &amp; k↓t←); 
    →INI400_005863TEXT("Coefficient taking account of long term effects"); 
    α↓ct← →INI400_005865= α↓ct,or←*k↓t←; 
    →INI400_000010TEXT(Description("f↓ctd←")); 
    f↓ctd← →INI400_000008= α↓ct←*f↓ctk,0,05←/γ↓c←; 
} 
→INI400_005868BLOCK("Reinforcement parameters") { 
    IF(M↓Ed← &gt; 0) { 
        →INI400_000030TEXT(Description("n↓s←")); 
        →INI400_000029TEXT("n↓s← = " &amp; n↓s←); 
        →INI400_000046TEXT(Description("ϕ↓s←")); 
        →INI400_000045TEXT("ϕ↓s← = " &amp; ϕ↓s←); 
        →INI400_000017TEXT(Description("A↓s←")); 
        A↓s← →INI400_000005= n↓s←*π*[(ϕ↓s←/2)]↑2←; 
        →INI400_006484TEXT(Description("n↓st←")); 
        →INI400_006485TEXT("n↓st← = " &amp; n↓st←); 
        →INI400_006486TEXT(Description("ϕ↓st←")); 
        →INI400_006487TEXT("ϕ↓st← = " &amp; ϕ↓st←); 
        →INI400_006488TEXT(Description("A↓st←")); 
        A↓st← →INI400_006489= n↓st←*π*[(ϕ↓st←/2)]↑2←; 
    } 
    →INI400_000012TEXT(Description("η↓1←")); 
    →INI400_000011TEXT("η↓1← = " &amp; η↓1←); 
    →INI400_000009TEXT("Coefficient of the bar diameter"); 
    IF(ϕ↓s← &lt;= 0.032) { 
        →INI400_000013TEXT("ϕ ≤ 32 mm"); 
        η↓2← →INI400_000006= 1; 
    } ELSE { 
        →INI400_000014TEXT(" ϕ &gt; 32 mm"); 
        η↓2← →INI400_000007= (132-ϕ↓s←)/100; 
    } 
    →INI400_000015TEXT("Design value of the ultimate bond stress for ribbed bars"); 
    f↓bd← →INI400_000001= 2.25*η↓1←*η↓2←*f↓ctd←; 
    →INI400_006413PAGEBREAK(); 
} 
→INI400_006412BLOCK("Coefficients") { //Coefficients from Table 8.2
    SWITCH(AnchType) { 
        CASE 0 :  { 
            →INI400_006402TEXT("Straight bars"); 
            →INI400_006410BLOCK { 
                →INI400_006403IMG("StrBar"); 
                →INI400_006404TEXT(Description("a")); 
                →INI400_006405TEXT("a = " &amp; a); 
                →INI400_006406TEXT(Description("c")); 
                →INI400_006407TEXT("c = " &amp; c); 
                →INI400_006408TEXT(Description("c↓1←")); 
                →INI400_006409TEXT("c↓1← = " &amp; c↓1←); 
                c↓d← →INI400_006426= MIN(a/2, c↓1←, c); 
            } 
        } 
        CASE 1 :  { 
            →INI400_006414TEXT("Bent or hooked bars"); 
            →INI400_006415BLOCK { 
                →INI400_006416IMG("BentBar"); 
                →INI400_006417TEXT(Description("a")); 
                →INI400_006418TEXT("a = " &amp; a); 
                →INI400_006421TEXT(Description("c↓1←")); 
                →INI400_006422TEXT("c↓1← = " &amp; c↓1←); 
                c↓d← →INI400_006425= MIN(a/2, c↓1←); 
            } 
        } 
        CASE 2 :  { 
            →INI400_006428TEXT("Looped bars"); 
            →INI400_006429BLOCK { 
                →INI400_006430IMG("LoopBar"); 
                →INI400_006439TEXT(Description("c")); 
                →INI400_006440TEXT("c = " &amp; c); 
                c↓d← →INI400_006435= c; 
            } 
        } 
    } 
    
    →INI400_006458TEXT("Influence of shape of bars"); 
    SWITCH(AnchType) { 
        CASE 0 :  { 
            α↓1,t← →INI400_006459= 1; 
            α↓1,c← →INI400_006460= 1; 
        } 
        DEFAULT :  { 
            IF(c↓d← &gt; 3*ϕ↓s←) { 
                α↓1,t← →INI400_006467= 0.7; 
            } ELSE { 
                α↓1,t← →INI400_006468= 1; 
            } 
            α↓1,c← →INI400_006469= 1; 
        } 
    } 
    
    →INI400_006470TEXT("Influence of concrete cover"); 
    SWITCH(AnchType) { 
        CASE 0 :  { 
            α↓2,t← →INI400_006471= 1-0.15*[c↓d←-ϕ↓s←]/ϕ↓s←; 
            IF(α↓2,t← &lt; 0.7) { 
                →INI400_006472TEXT("&lt; 0.7 =&gt;"); 
                α↓2,t← →INI400_006473= 0.7; 
            } 
            IF(α↓2,t← &gt; 1.0) { 
                →INI400_006474TEXT("&gt; 1.0 =&gt;"); 
                α↓2,t← →INI400_006475= 1; 
            } 
            α↓2,c← →INI400_006476= 1; 
        } 
        DEFAULT :  { 
            α↓2,t← →INI400_006477= 1-0.15*[c↓d←-3*ϕ↓s←]/ϕ↓s←; 
            IF(α↓2,t← &lt; 0.7) { 
                →INI400_006478TEXT("&lt; 0.7 =&gt;"); 
                α↓2,t← →INI400_006479= 0.7; 
            } 
            IF(α↓2,t← &gt; 1.0) { 
                →INI400_006480TEXT("&gt; 1.0 =&gt;"); 
                α↓2,t← →INI400_006481= 1; 
            } 
            α↓2,c← →INI400_006482= 1; 
        } 
    } 
    
    →INI400_006483TEXT("Influence of not welded transverse reinforcement"); 
    SWITCH(Type) { 
        CASE 0 :  { 
            α↓3,t← →INI400_006493= 1-K*([A↓st←-0.25*A↓s←]/A↓s←); 
        } 
        CASE 1 :  { 
            α↓3,t← →INI400_006499= 1-K*(A↓st←/A↓s←); 
        } 
    } 
    
    IF(α↓3,t← &lt; 0.7) { 
        →INI400_006495TEXT("&lt; 0.7 =&gt;"); 
        α↓3,t← →INI400_006496= 0.7; 
    } 
    IF(α↓3,t← &gt; 1.0) { 
        →INI400_006497TEXT("&gt; 1.0 =&gt;"); 
        α↓3,t← →INI400_006498= 1; 
    } 
    α↓3,c← →INI400_006494= 1; 
    
    →INI400_006500TEXT("Influence of welded transverse reinforcement"); 
    IF(WeldTransReinf) { 
        α↓4,t← →INI400_006508= 0.7; 
        α↓4,c← →INI400_006509= 0.7; 
    } ELSE { 
        α↓4,t← →INI400_006510= 1; 
        α↓4,c← →INI400_006511= 1; 
    } 
    
    →INI400_006503TEXT("Influence of transverse pressure"); 
    α↓5,t← →INI400_006516= 1-0.04*CUnit(p, "MPa"); 
    IF(α↓5,t← &lt; 0.7) { 
        →INI400_006512TEXT("&lt; 0.7 =&gt;"); 
        α↓5,t← →INI400_006513= 0.7; 
    } 
    IF(α↓5,t← &gt; 1.0) { 
        →INI400_006514TEXT("&gt; 1.0 =&gt;"); 
        α↓5,t← →INI400_006515= 1; 
    } 
    →INI400_000052PAGEBREAK(); 
} 
→INI400_006388BLOCK("Loading") { 
    →INI400_006389TEXT(Description("M↓Ed←")); 
    →INI400_006390TEXT("M↓Ed← = " &amp; M↓Ed←); 
    →INI400_006392TEXT(Description("z↓b←")); 
    →INI400_006393TEXT("z↓b← = " &amp; z↓b←); 
    →INI400_006391PAGEBREAK(); 
} 


→INI400_005869BLOCK("Design of anchorage length:") { 
    →INI400_000022IMG("Anch_length", 0.7); 
    →INI400_000053PAGEBREAK(); 
    →INI400_000016TEXT("Stress for the calculation of the anchorage length"); 
    σ↓sd← →INI400_000048= M↓Ed←/(z↓b←*A↓s←); 
    →INI400_000018TEXT(Description("l↓brqd←")); 
    l↓b,rqd← →INI400_000002= (ϕ↓s←/4)*(σ↓sd←/f↓bd←); 
    →INI400_000019TEXT("assumption: f↓bd← is constant on the whole bar"); 
    →INI400_000027TEXT("α↓1 ←x α↓2 ←x α↓3← ≥ 0,7"); 
    IF(α↓1,t←*α↓2,t←*α↓3,t← &lt; 0.7) { 
        →INI400_000026TEXT(" =&gt; is INSUFFICIENT!"); 
    } ELSE { 
        →INI400_000028TEXT("=&gt; is SUFFICIENT"); 
    } 
    →INI400_000033TEXT(Description("l↓bd,t←")); 
    l↓bd,t← →INI400_000032= PARMAX(α↓1,t←*α↓2,t←*α↓3,t←*α↓4,t←*α↓5,t←*l↓b,rqd←, 0.3*l↓b,rqd←, 10*ϕ↓s←, 0.1); 
    →INI400_000035TEXT(Description("l↓bd,c←")); 
    l↓bd,c← →INI400_000034= PARMAX(α↓1,c←*α↓2,c←*α↓3,c←*α↓4,c←*l↓b,rqd←, 0.6*l↓b,rqd←, 10*ϕ↓s←, 0.1); 
} 

//NA dependent variables:
//reduction coeff. k↓t ←for α↓ct← and α↓cc ←- NA.2.11

//This form have to be reworked according CODE, clause 8.4.4
//add automatics calculation of coefficients alpha
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="-1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="122" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Concrete_anchor_length.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Calculation of the anchor length</ENU>
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
      <Variable Modifier="Public" Name="a" ESA_ID="" Type="Double" Value="45e-3" Precision="2">
        <Description TranslateID="VARIABLE_a">
          <ENU>Distance of reinforcements</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="A↓s←" ESA_ID="" Type="Double" Value="804.2477e-6" Precision="2">
        <Description TranslateID="VARIABLE_A↓s←">
          <ENU>Area of bars</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓st←" ESA_ID="" Type="Double" Value="339.292e-6" Precision="2">
        <Description TranslateID="VARIABLE_A↓st←">
          <ENU>Area of transverse bars</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="AnchType" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_AnchType">
          <ENU>Type of anchorage</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c" ESA_ID="" Type="Double" Value="30e-3" Precision="2">
        <Description TranslateID="VARIABLE_c">
          <ENU>Vertical cover</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓1←" ESA_ID="" Type="Double" Value="30e-3" Precision="2">
        <Description TranslateID="VARIABLE_c↓1←">
          <ENU>Horizontal cover</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓d←" ESA_ID="Result.05" Type="Double" Value="22.5e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Captiontext" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_Captiontext">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause2_4_2_4_1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause3_1_2" ESA_ID="" Type="Object">
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
      <Variable Modifier="Public" Name="f↓bd←" ESA_ID="" Type="Double" Value="1.9125e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓bd←">
          <ENU>Design value of cohesion of steel and concrete</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctd←" ESA_ID="" Type="Double" Value="850000" Precision="2">
        <Description TranslateID="VARIABLE_f↓ctd←">
          <ENU>Design value of concrete tension strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctk,0,05←" ESA_ID="" Type="Double" Value="1.5e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctk←" ESA_ID="" Type="Double" Value="1.5e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ctk←">
          <ENU>Characteristic axial tensile strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="Headline" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Headline">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="K" ESA_ID="" Type="Double" Value="100e-3" Precision="2">
        <Description TranslateID="VARIABLE_K">
          <ENU>Type of position of transverse reinforcement</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓t←" ESA_ID="" Type="Double" Value="850e-3" Precision="2">
        <Description TranslateID="VARIABLE_k↓t←">
          <ENU>Reduction factor for concrete</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="l↓b,rqd←" ESA_ID="Result.03" Type="Double" Value="520.1142e-3" Precision="2">
        <Description TranslateID="VARIABLE_l↓b,rqd←">
          <ENU>Basic anchorage length</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="l↓bd,c←" ESA_ID="Result.02" Type="Double" Value="520.1142e-3" Precision="2">
        <Description TranslateID="VARIABLE_l↓bd,c←">
          <ENU>Anchorage in compression</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="l↓bd,t←" ESA_ID="Result.01" Type="Double" Value="460.824e-3" Precision="2">
        <Description TranslateID="VARIABLE_l↓bd,t←">
          <ENU>Anchorage in tension</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Ed←" ESA_ID="" Type="Double" Value="50000" Precision="2">
        <Description TranslateID="VARIABLE_M↓Ed←">
          <ENU>Action bending moment</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="n↓s←" ESA_ID="" Type="Double" Value="4" Precision="0">
        <Description TranslateID="VARIABLE_n↓s←">
          <ENU>Number of bars</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓st←" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_n↓st←">
          <ENU>Number of transverse bars</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="p" ESA_ID="" Type="Double" Value="1e6" Precision="2">
        <Description TranslateID="VARIABLE_p">
          <ENU>Transverse pressure</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="t" ESA_ID="" Type="Double" Value="50" Precision="2">
        <Description TranslateID="VARIABLE_t">
          <ENU>Age of the concrete</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Type" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Type">
          <ENU>Type of construction</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="WeldTransReinf" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_WeldTransReinf">
          <ENU>Transverse reinforcement is welded to main reinforcement</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="z↓b←" ESA_ID="" Type="Double" Value="250e-3" Precision="2">
        <Description TranslateID="VARIABLE_z↓b←">
          <ENU>Inner lever arm of forces</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="α↓1,c←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓1,t←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓2,c←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓2,t←" ESA_ID="" Type="Double" Value="939.0625e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓3,c←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓3,t←" ESA_ID="" Type="Double" Value="982.8125e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓4,c←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓4,t←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓5,t←" ESA_ID="" Type="Double" Value="960e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓ct,or←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓ct←" ESA_ID="" Type="Double" Value="850e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓c←" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_γ↓c←">
          <ENU>Partial safety factor for concrete</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="η↓1←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_η↓1←">
          <ENU>Coefficient related to the quality of bond condition</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="η↓2←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_η↓2←">
          <ENU>Coefficient of bar diameter</ENU>
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
      <Variable Modifier="Public" Name="σ↓sd←" ESA_ID="Result.04" Type="Double" Value="248.6796e6" Precision="2">
        <Description TranslateID="VARIABLE_σ↓sd←">
          <ENU>Stress for calculation of anchorage length</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓s←" ESA_ID="" Type="Double" Value="16e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓s←">
          <ENU>Diameter of bars</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓st←" ESA_ID="" Type="Double" Value="12e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓st←">
          <ENU>Diameter of transverse bars</ENU>
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
      <VC ID="INI400_000001">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="350" Y="456" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="397" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="171" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="509" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="509" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="509" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000002">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="520" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="447" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="211" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="595" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="595" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="595" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000005">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="350" Y="115" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="97.6" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="88.1" Hor="0" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="70" Hor="1" Ver="2" SpX="250" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="70" Hor="1" Ver="2" SpX="250" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="70" Hor="1" Ver="2" SpX="250" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000006">
        <Set Vis="1" Prev="INI400_000009" Style="0" StyleName="" X="350" Y="203" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="164" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="87.1" Y="120" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="INI400_000013" Style="0" StyleName="" X="250" Y="179" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="INI400_000013" Style="0" StyleName="" X="250" Y="179" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="INI400_000013" Style="0" StyleName="" X="250" Y="179" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000007">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="201" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="185" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="185" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000008">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="350" Y="419" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="375" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="156" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="INI400_000010" Style="0" StyleName="" X="0" Y="453" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000010" Style="0" StyleName="" X="0" Y="453" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000010" Style="0" StyleName="" X="0" Y="453" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000009">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="188" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="171" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="171" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000012" Style="0" StyleName="" X="0" Y="163" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000012" Style="0" StyleName="" X="0" Y="163" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000012" Style="0" StyleName="" X="0" Y="163" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="419" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="350" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="350" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000021" Style="0" StyleName="" X="0" Y="416" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000021" Style="0" StyleName="" X="0" Y="416" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000021" Style="0" StyleName="" X="0" Y="416" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000011">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="173" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="148" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="120" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="137" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="137" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="137" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000012">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="173" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="154" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="154" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000016" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="35" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000016" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="35" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000016" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="35" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000013">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="203" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="185" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="185" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="179" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="179" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="179" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000014">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="201" Hor="1" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="185" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="185" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000015">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="441" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="375" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="375" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="480" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="480" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="480" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000016">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="129" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="129" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000017" Style="0" StyleName="" X="0" Y="86" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000017" Style="0" StyleName="" X="0" Y="86" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000017" Style="0" StyleName="" X="0" Y="86" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="98" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="98" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000018">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="520" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="430" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="430" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="543" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="543" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="543" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000019">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="545" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="472" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="50" Y="231" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="560" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="560" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="560" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000022">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="316" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="272" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="253" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000013" Style="0" StyleName="" X="0" Y="277" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000013" Style="0" StyleName="" X="0" Y="277" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000013" Style="0" StyleName="" X="0" Y="277" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000026">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="180" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="180" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="180" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000027">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="561" Hor="0" Ver="4" SpX="5" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="488" Hor="0" Ver="4" SpX="5" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="227" Hor="0" Ver="4" SpX="5" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|7|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="690" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="690" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="690" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000028">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="104" Y="561" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="114" Y="488" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="114" Y="227" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="690" Hor="1" Ver="2" SpX="180" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="690" Hor="1" Ver="2" SpX="180" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="690" Hor="1" Ver="2" SpX="180" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000029">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="70.8" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="65.8" Hor="0" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="65.8" Hor="0" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="34" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="34" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="34" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000030">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="55" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="55" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="34" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000032">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="641" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="574" Hor="0" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="297" Hor="0" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="813" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="813" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="813" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000033">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="641" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="531" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="531" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="779" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="779" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="779" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000034">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="716" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="645" Hor="0" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="337" Hor="0" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="922" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="922" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="922" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000035">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="716" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="625" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="625" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="888" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="888" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="888" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000044">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000045">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="85.4" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="80.4" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="89.3" Y="65.8" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000046">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85.4" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="69" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="69" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000048">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="148" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="122" Hor="1" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="104" Hor="1" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000049">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000052">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="236" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="192" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="149" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000053">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="401" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="357" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="154" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000056">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000134">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
      <VC ID="INI400_005847">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="44" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="44" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005848">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005849">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="237" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005850">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="97.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="97.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005851">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005852">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005853">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005854">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005855">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="70.8" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="65.8" Hor="0" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="65.8" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="34" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="34" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="34" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005856">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005857">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005858">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="70.8" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="89.3" Y="65.8" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005862">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="97.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="97.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005863">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="70.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005865">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="70.8" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="89.3" Y="65.8" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005867">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005868">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005869">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006355">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006356">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="350" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006357">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="4" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="4" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="4" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006362">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006363">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="71.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="60" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006388">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006389">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="607" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="570" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="570" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006390">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="607" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="422" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="150" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006391">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="620" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="163" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006392">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="607" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="570" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="570" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006393">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="607" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="422" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="150" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006400">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006401">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006402">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="1" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006405">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006406">
        <Set Vis="1" Prev="INI400_006404" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006407">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006408">
        <Set Vis="1" Prev="INI400_006406" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006409">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006410">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006412">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006413">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006414">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006415">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
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
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="1" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006418">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006421">
        <Set Vis="1" Prev="INI400_006417" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006422">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006425">
        <Set Vis="1" Prev="INI400_006421" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006426">
        <Set Vis="1" Prev="INI400_006408" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006428">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006429">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006430">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006435">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006439">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="1" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006440">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006458">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006459">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006460">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006467">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006468">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006469">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006470">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006471">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006472">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006473">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006474">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006475">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006476">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="0" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006477">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006478">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006479">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006480">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006481">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006482">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="0" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006483">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006484">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006485">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="350" Y="70.8" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="65.8" Hor="0" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="65.8" Hor="0" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="34" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="34" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="34" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006486">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85.4" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="69" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="69" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006487">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="350" Y="85.4" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="80.4" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="89.3" Y="65.8" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006488">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="98" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="98" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006489">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="350" Y="115" Hor="0" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="97.6" Hor="0" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="88.1" Hor="0" Ver="4" SpX="300" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="70" Hor="1" Ver="2" SpX="250" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="70" Hor="1" Ver="2" SpX="250" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="70" Hor="1" Ver="2" SpX="250" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006493">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006494">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="0" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006495">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006496">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006497">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006498">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006499">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006500">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006503">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="115" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006508">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006509">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="0" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006510">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006511">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="0" Hor="4" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006512">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006513">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006514">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006515">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006516">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
      <VC ID="INI400_006519">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="BentBar" Content="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" />
      <Image Name="Anch_length" Content="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" />
      <Image Name="StrBar" Content="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" />
      <Image Name="LoopBar" Content="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" />
      <Image Name="BG" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="630">
      <TPanel Name="" ID="72" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts TranslateID="DIALOG_000072">
          <ENU>Load</ENU>
        </Texts>
        <TGroupBox Name="" ID="78" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000078">
            <ENU>Additional settings</ENU>
          </Texts>
          <TDoubleInput Name="" ID="53" Translate="1" Height="28" AutoWidth="False" AutoHeight="False" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="t" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="z↓b←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="80" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000080">
            <ENU>Load values</ENU>
          </Texts>
          <TDoubleInput Name="" ID="63" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="p" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="M↓Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
      </TPanel>
      <TPanel Name="" ID="68" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
        <Texts TranslateID="DIALOG_000068">
          <ENU>Design settings</ENU>
        </Texts>
        <TGroupBox Name="" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000036">
            <ENU>Coefficients</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="24" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="23" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="22" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TComboBox Name="" ID="39" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="η↓1←" VarNameVisible="True" InputColor="-4128832" DescPos="1" InputWidth="240" Values="1|700e-3" Index="0">
            <Texts TranslateID="DIALOG_000039">
              <ENU>good conditions are obtained|all other cases</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="" ID="61" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Type" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="0|1" Index="0">
            <Texts TranslateID="DIALOG_000061">
              <ENU>Beam|Slab</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
        <TGroupBox Name="" ID="33" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000033">
            <ENU>Reinforcement</ENU>
          </Texts>
          <TDoubleInput Name="" ID="57" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="56" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="55" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="a" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TComboBox Name="" ID="60" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="K" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="126" Values="100e-3|50e-3|0" Index="0">
            <Texts>
              <ENU>A|B|C</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="" ID="59" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ϕ↓st←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="58" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="n↓st←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TCheckBox Name="" ID="62" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="WeldTransReinf" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000062">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TDoubleInput Name="TDoubleInput" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="ϕ↓s←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="n↓s←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TComboBox Name="" ID="54" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="AnchType" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="175" Values="0|1|2" Index="0">
            <Texts TranslateID="DIALOG_000054">
              <ENU>Straight bars|Bent or hooked bars|Looped bars</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
      </TPanel>
      <TPanel Name="" ID="70" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
        <Texts TranslateID="DIALOG_000070">
          <ENU>Materials</ENU>
        </Texts>
        <TCustomLibrary Name="TCustomLibrary" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="CONCRETE.EC" DataFile="EC_Concrete.xml" Collapsed="True" UseCombo="False" Category="Bilinear" Item="C 20/25">
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
                <P>C 20/25</P>
                <P>20</P>
                <P>25</P>
                <P>28</P>
                <P>2.2</P>
                <P>1.5</P>
                <P>2.9</P>
                <P>30</P>
                <P>2</P>
                <P>3.5</P>
                <P>2</P>
                <P>3.5</P>
                <P>1.75</P>
                <P>3.5</P>
                <P>2</P>
                <P>0;0;</P>
                <P>-0.00175;-13333330;</P>
                <P>-0.0035;-13333330;</P>
                <P>true</P>
                <P>32</P>
                <P>0.2</P>
                <P>2500</P>
                <P>12.5</P>
                <P>0.2</P>
                <P>4500</P>
                <P>0.0006</P>
                <P>1.00E-05</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TLabel Name="" ID="76" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000076">
            <ENU>Concrete:</ENU>
          </Texts>
        </TLabel>
      </TPanel>
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts>
          <ENU>General settings</ENU>
        </Texts>
        <TGroupBox Name="" ID="74" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000074">
            <ENU>Headline settings</ENU>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Headline" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000001">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TStringInput Name="TStringInput" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Captiontext" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000001">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="52" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000052">
            <ENU>National annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="49" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="French NF-EN">
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
                  <P>French NF-EN</P>
                  <P>NF</P>
                  <P>7</P>
                  <P>NF EN 1990</P>
                  <P>NF EN 1991-1-1</P>
                  <P>NF EN 1991-1-2</P>
                  <P>NF EN 1991-1-3</P>
                  <P>0</P>
                  <P>NaN</P>
                  <P>False;1;</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1.0</P>
                  <P>NaN</P>
                  <P>True</P>
                  <P>1.6</P>
                  <P>2.0</P>
                  <P>NaN</P>
                  <P>0.8;2.8;5;15;</P>
                  <P>False</P>
                  <P>True</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>NF EN 1991-1-4</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>0.15;0.5;</P>
                  <P>False</P>
                  <P>NaN</P>
                  <P>True;NaN;</P>
                  <P>True</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1.225</P>
                  <P>False</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>NF EN 1991-1-5</P>
                  <P>NF EN 1991-1-6</P>
                  <P>NF EN 1991-1-7</P>
                  <P>NF EN 1991-2</P>
                  <P>NF EN 1991-3</P>
                  <P>NF EN 1991-4</P>
                  <P>NF EN 1992-1-1</P>
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
                  <P>500</P>
                  <P>0.9</P>
                  <P>1.1</P>
                  <P>0.9;0.02;0.9;</P>
                  <P>2;2;</P>
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
                  <P>NaN;NaN;</P>
                  <P>1.05;0.95;1.1;0.9;1;1;</P>
                  <P>NaN;NaN;0.15;</P>
                  <P>NaN</P>
                  <P>0.380482;0.785398;</P>
                  <P>NaN;NaN;</P>
                  <P>26.5;45;38.6;45;</P>
                  <P>NaN</P>
                  <P>1.15;1.4;1.5;</P>
                  <P>NaN;NaN;0.1;</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1;0.85;</P>
                  <P>0.6</P>
                  <P>0.45</P>
                  <P>0.8;1;0.8;</P>
                  <P>0.4;0.3;0.2;0.2;0.2;NaN;</P>
                  <P>NaN;NaN;</P>
                  <P>1;5;</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>40</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>0.15</P>
                  <P>0</P>
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
                  <P>10000;NaN;</P>
                  <P>0.8;0.8;</P>
                  <P>1.5</P>
                  <P>0.25</P>
                  <P>0.5</P>
                  <P>NF EN 1992-1-2</P>
                  <P>NF EN 1992-2</P>
                  <P>NF EN 1992-3</P>
                  <P>NF EN 1993-1-1</P>
                  <P>NaN;NaN;</P>
                  <P>1;1;1.25;</P>
                  <P>NF EN 1993-1-2</P>
                  <P>NF EN 1993-1-3</P>
                  <P>NF EN 1993-1-4</P>
                  <P>NF EN 1993-1-5</P>
                  <P>1.20;1.00;</P>
                  <P>NF EN 1993-1-6</P>
                  <P>NF EN 1993-1-7</P>
                  <P>NF EN 1993-1-8</P>
                  <P>1.25;1.25;1.25;1.0;1.0;1.0;1.1;</P>
                  <P>NF EN 1993-1-9</P>
                  <P>NF EN 1993-1-10</P>
                  <P>NF EN 1993-1-11</P>
                  <P>NF EN 1993-1-12</P>
                  <P>NF EN 1993-2</P>
                  <P>1.0;1.1;1.25;1.25;1.1;1.1;1.1;1.0;1.1;</P>
                  <P>NF EN 1993-3-1</P>
                  <P>NF EN 1993-3-2</P>
                  <P>NF EN 1993-4-1</P>
                  <P>NF EN 1993-4-2</P>
                  <P>NF EN 1993-4-3</P>
                  <P>NF EN 1993-5</P>
                  <P>NF EN 1993-6</P>
                  <P>NF EN 1994-1-1</P>
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
                  <P>NaN</P>
                  <P>0.65</P>
                  <P>180</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>0.5</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>NF EN 1994-1-2</P>
                  <P>NF EN 1994-2</P>
                  <P>NF EN 1995-1-1</P>
                  <P>NaN</P>
                  <P>NaN;NaN;NaN;</P>
                  <P>NF EN 1995-1-2</P>
                  <P>NF EN 1995-2</P>
                  <P>NF EN 1996-1-1</P>
                  <P>NaN</P>
                  <P>1</P>
                  <P>NaN</P>
                  <P>True</P>
                  <P>1000</P>
                  <P>NaN;NaN;NaN;</P>
                  <P>NaN</P>
                  <P>NF EN 1996-1-2</P>
                  <P>NF EN 1996-2</P>
                  <P>NF EN 1996-3</P>
                  <P>NF EN 1997-1</P>
                  <P>1.1;0.9;1.5;0;</P>
                  <P>1.25;1.25;1.4;1.4;1.0;</P>
                  <P>1.35;1;1.5;0;1;1;1.3;0;</P>
                  <P>1;1;1;1;1;1.25;1.25;1.4;1.4;1;</P>
                  <P>1;1;1.4;1.1;1;1;</P>
                  <P>NF EN 1997-2</P>
                  <P>NF EN 1998-1</P>
                  <P>NF EN 1998-2</P>
                  <P>NF EN 1998-3</P>
                  <P>NF EN 1998-4</P>
                  <P>NF EN 1998-5</P>
                  <P>NF EN 1998-6</P>
                  <P>NF EN 1999-1-1</P>
                  <P>NF EN 1999-1-2</P>
                  <P>NF EN 1999-1-3</P>
                  <P>NF EN 1999-1-4</P>
                  <P>NF EN 1999-1-5</P>
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
    </Item>
    <Item TranslateID="BLOCK_INI400_005867">
      <ENU>"Concrete material parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005868">
      <ENU>"Reinforcement parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005869">
      <ENU>"Design of anchorage length:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006388">
      <ENU>"Loading"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006412">
      <ENU>"Coefficients"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000004">
      <ENU>Captiontext</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000009">
      <ENU>"Coefficient of the bar diameter"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000010">
      <ENU>Description("f↓ctd←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000011">
      <ENU>"η↓1← = " &amp; η↓1←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000012">
      <ENU>Description("η↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000013">
      <ENU>"ϕ ≤ 32 mm"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000014">
      <ENU>" ϕ &gt; 32 mm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000015">
      <ENU>"Design value of the ultimate bond stress for ribbed bars"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000016">
      <ENU>"Stress for the calculation of the anchorage length"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000017">
      <ENU>Description("A↓s←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000018">
      <ENU>Description("l↓brqd←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000019">
      <ENU>"assumption: f↓bd← is constant on the whole bar"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000026">
      <ENU>" =&gt; is INSUFFICIENT!"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000027">
      <ENU>"α↓1 ←x α↓2 ←x α↓3← ≥ 0,7"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000028">
      <ENU>"=&gt; is SUFFICIENT"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000029">
      <ENU>"n↓s← = " &amp; n↓s←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000030">
      <ENU>Description("n↓s←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000033">
      <ENU>Description("l↓bd,t←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000035">
      <ENU>Description("l↓bd,c←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000044">
      <ENU>"Design and check of the anchorage length according to Eurocode 2"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000045">
      <ENU>"ϕ↓s← = " &amp; ϕ↓s←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000046">
      <ENU>Description("ϕ↓s←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000049">
      <ENU>IO.SetupNA.EC_1992_1_1.Name &amp; ", §8.4.3, §8.4.4"</ENU>
    </Item>
    <Item ID="TEXT_INI400_005855">
      <ENU>"t = " &amp; t</ENU>
    </Item>
    <Item ID="TEXT_INI400_005856">
      <ENU>Description("t")</ENU>
    </Item>
    <Item ID="TEXT_INI400_005857">
      <ENU>Description("k↓t←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_005858">
      <ENU>"k↓t ←= " &amp; k↓t←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005863">
      <ENU>"Coefficient taking account of long term effects"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006355">
      <ENU>"Concrete"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006356">
      <ENU>IO.CONCRETE.EC.Item</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006357">
      <ENU>"days"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006362">
      <ENU>Description("f↓ctk←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006363">
      <ENU>"f↓ctk,0,05← = " &amp; f↓ctk,0,05←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006389">
      <ENU>Description("M↓Ed←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006390">
      <ENU>"M↓Ed← = " &amp; M↓Ed←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006392">
      <ENU>Description("z↓b←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006393">
      <ENU>"z↓b← = " &amp; z↓b←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006401">
      <ENU>"f↓ctk,0,05← is limited to the value for C 60/75"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006402">
      <ENU>"Straight bars"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006404">
      <ENU>Description("a")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006405">
      <ENU>"a = " &amp; a</ENU>
    </Item>
    <Item ID="TEXT_INI400_006406">
      <ENU>Description("c")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006407">
      <ENU>"c = " &amp; c</ENU>
    </Item>
    <Item ID="TEXT_INI400_006408">
      <ENU>Description("c↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006409">
      <ENU>"c↓1← = " &amp; c↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006414">
      <ENU>"Bent or hooked bars"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006417">
      <ENU>Description("a")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006418">
      <ENU>"a = " &amp; a</ENU>
    </Item>
    <Item ID="TEXT_INI400_006421">
      <ENU>Description("c↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006422">
      <ENU>"c↓1← = " &amp; c↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006428">
      <ENU>"Looped bars"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006439">
      <ENU>Description("c")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006440">
      <ENU>"c = " &amp; c</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006458">
      <ENU>"Influence of shape of bars"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006470">
      <ENU>"Influence of concrete cover"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006472">
      <ENU>"&lt; 0.7 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006474">
      <ENU>"&gt; 1.0 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006478">
      <ENU>"&lt; 0.7 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006480">
      <ENU>"&gt; 1.0 =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006483">
      <ENU>"Influence of not welded transverse reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006484">
      <ENU>Description("n↓st←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006485">
      <ENU>"n↓st← = " &amp; n↓st←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006486">
      <ENU>Description("ϕ↓st←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006487">
      <ENU>"ϕ↓st← = " &amp; ϕ↓st←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006488">
      <ENU>Description("A↓st←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006495">
      <ENU>"&lt; 0.7 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006497">
      <ENU>"&gt; 1.0 =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006500">
      <ENU>"Influence of welded transverse reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006503">
      <ENU>"Influence of transverse pressure"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006512">
      <ENU>"&lt; 0.7 =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006514">
      <ENU>"&gt; 1.0 =&gt;"</ENU>
    </Item>
  </Texts>
</Root>