<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="552f72e9-e290-4ef6-ad30-c9c1ef60be62">
  <CodeEditor>
    <SourceCode Collapsed="0" BreakPoints="">→INI400_006265BLOCK { //IO inputs 
    f↓ck← →INI400_006283= IO.CONCRETE.EC.fck; 
    IF(IO.IsStandalone) { //Standalone IO inputs
        
    } ELSE { //SEN IO inputs
        b →INI400_006287= IO.CS.Geometry.B; 
        h →INI400_006288= IO.CS.Geometry.H; 
        c →INI400_006289= IO.Beam.ReinfLayers.Lower.Cover; 
        n →INI400_006269= 0; 
        Y →INI400_006270= IO.REINF.Bar[0].Y; 
        FOR(i, 0, IO.REINF.Bar.Count-1) { 
            IF(Y == IO.REINF.Bar[i].Y) { 
                n →INI400_006271= n+1; 
            } 
        } 
        Φ →INI400_006278= IO.REINF.Bar[0].D; 
        N↓Ed← →INI400_006293= ABS(IO.Section.InternalForces.N); 
        T↓Ed← →INI400_006295= ABS(IO.Section.InternalForces.Mx); 
        V↓Ed← →INI400_006294= ABS(IO.Section.InternalForces.Vz); 
    } 
} 
double π →INI400_000275= Math.PI; 

IF(H1) { 
    →INI400_000045TEXT("Bearing capacity of rectangular cross section (without reinforcement on torsion)"); 
    →INI400_000169TEXT("according to Eurocode 2"); 
    →INI400_000170TEXT(IO.SetupNA.EC_1992_1_1.Name &amp; ", §6.3"); 
} 
IF(H2) { 
    →INI400_000001TEXT(Caption); 
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
    →INI400_005854BLOCK { //NA.2.45 Clause 6.2.2 Elements which doesnt require design of shear reinf., Paragraph(1)P
        object Clause6_2_2_1P →INI400_005855= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_6.2.2(1).CLC"); 
        →INI400_005856Clause6_2_2_1P.Calculate(false); 
        k↓1← →INI400_005857= Clause6_2_2_1P.k↓1←; 
        C↓Rdc← →INI400_005870= Clause6_2_2_1P.C↓Rdc←; 
        v↓min← →INI400_005871= Clause6_2_2_1P.v↓min←; 
    } 
} 
IF(geom) { 
    →INI400_005865BLOCK("Geometry") { 
        →INI400_000003TEXT(Description("b")); 
        →INI400_000002TEXT("b = " &amp; b); 
        →INI400_000006TEXT(Description("h")); 
        →INI400_000005TEXT("h = " &amp; h); 
        →INI400_005874TEXT(Description("A")); 
        A →INI400_000146= b*h; 
        →INI400_000017TEXT(Description("c")); 
        →INI400_000016TEXT("c = " &amp; c); 
        →INI400_000019TEXT(Description("d")); 
        d →INI400_000018= h-c-Φ/2; 
        IF(d == 0) { 
            →INI400_005863TEXT("Define non-zero values!"); 
            Exit(); 
        } 
        →INI400_000010TEXT(Description("u")); 
        u →INI400_000009= 2*[b+h]; 
        →INI400_000068TEXT(Description("k")); 
        k →INI400_000156= MIN(1+SQRT(200/CUnit(d, "mm")), 2); 
        →INI400_000175PAGEBREAK(); 
        →INI400_000049BLOCK { 
            →INI400_000046IMG("torsion", 0.6); 
            →INI400_000047TEXT("1 - center line"); 
            →INI400_000048TEXT("2 - outer cross section circuit "); 
        } 
        →INI400_000176PAGEBREAK(); 
    } 
} ELSE { 
    A →INI400_006296= b*h; 
    d →INI400_006297= h-c-Φ/2; 
    u →INI400_006298= 2*[b+h]; 
    k →INI400_006299= MIN(1+SQRT(200/CUnit(d, "mm")), 2); 
} 
→INI400_005875BLOCK { 
    object mat_char →INI400_005846= LoadExternCLC("Concrete material characteristics.CLC"); 
    IF(mat) { 
        →INI400_005847mat_char.Draw(true); 
    } ELSE { 
        →INI400_005849mat_char.Calculate(true); 
    } 
} 
→INI400_000174PAGEBREAK(); 
IF(mat) { 
    →INI400_005866BLOCK("Reinforcement parameters") { 
        →INI400_006358TEXT("Reinforcement"); 
        →INI400_006359TEXT(IO.REINF.Item); 
        →INI400_000014TEXT(Description("Φ")); 
        →INI400_000013TEXT("Φ = " &amp; Φ); 
        →INI400_000158TEXT(Description("n")); 
        →INI400_000159TEXT("n = " &amp; n); 
        →INI400_000160TEXT(Description("A↓s←")); 
        A↓s← →INI400_000161= n*π*[Φ/2]↑2←; 
        →INI400_000021TEXT(Description("t↓ef←")); 
        t↓ef← →INI400_000020= PARMIN(A/u, 2*d); 
        →INI400_000023TEXT(Description("A↓k←")); 
        A↓k← →INI400_000022= [b-t↓ef←]*[h-t↓ef←]; 
        →INI400_000069TEXT(Description("ρ↓1←")); 
        ρ↓1← →INI400_000064= A↓s←/(b*d); 
        →INI400_000177PAGEBREAK(); 
    } 
} ELSE { 
    A↓s← →INI400_006300= n*π*[Φ/2]↑2←; 
    t↓ef← →INI400_006301= PARMIN(A/u, 2*d); 
    A↓k← →INI400_006302= [b-t↓ef←]*[h-t↓ef←]; 
    ρ↓1← →INI400_006303= A↓s←/(b*d); 
} 

IF(force) { 
    →INI400_005867BLOCK("Loading") { 
        →INI400_000162TEXT(Description("N↓Ed←")); 
        →INI400_000163TEXT("N↓Ed← = " &amp; N↓Ed←); 
        →INI400_000025TEXT(Description("V↓Ed←")); 
        →INI400_000024TEXT("V↓Ed← = " &amp; V↓Ed←); 
        →INI400_000027TEXT(Description("T↓Ed←")); 
        →INI400_000026TEXT("T↓Ed← = " &amp; T↓Ed←); 
        →INI400_005876TEXT(Description("σ↓cp←")); 
        σ↓cp← →INI400_000105= N↓Ed←/A; 
        →INI400_000178PAGEBREAK(); 
    } 
} ELSE { 
    σ↓cp← →INI400_006360= N↓Ed←/A; 
} 

→INI400_005878BLOCK("Coefficient of shear bearing capacity") { 
    →INI400_005887Clause6_2_2_1P.Draw(true); 
} 
→INI400_000182PAGEBREAK(); 
→INI400_005868BLOCK("Cross section bearing capacity") { 
    →INI400_000086TEXT(Description("V↓Rd,cc←")); 
    V↓Rd,cc← →INI400_000050= (C↓Rdc←*k*[100*ρ↓1←*CUnit(f↓ck←, "MPa")]↑1/3←)*[b*d]*10↑6←; 
    →INI400_000087TEXT(Description("V↓Rd,c,min←")); 
    V↓Rd,c,min← →INI400_000051= [v↓min←+k↓1←*CUnit(σ↓cp←, "MPa")]*[b*d]*10↑6←; 
    V↓Rd,c← →INI400_000098= MAX(V↓Rd,cc←, V↓Rd,c,min←); 
    
    →INI400_000031TEXT(Description("T↓Rd←")); 
    T↓Rd← →INI400_000033= 2*A↓k←*t↓ef←*f↓ctd←; 
} 
→INI400_005869BLOCK("Cross section check") { 
    s↓T← →INI400_000039= T↓Ed←/T↓Rd←; 
    s↓V← →INI400_000038= V↓Ed←/V↓Rd,c←; 
    s →INI400_000037= s↓T←+s↓V←; 
    
    IF(s &lt;= 1) { 
        →INI400_000056TEXT(" &lt; 1"); 
        →INI400_000059TEXT(" =&gt; Is SUFFICIENT in torsion"); 
    } ELSE { 
        →INI400_000057TEXT(" &gt; 1"); 
        →INI400_000060TEXT(" =&gt; Is INSUFFICIENT in torsion!"); 
        →INI400_000040TEXT("Additional reinforcement on torsion is required!"); 
    } 
} 

// NA dependent variables:
//γ↓c← - NA.2.8
//α↓cc← - NA.2.12
// C↓Rd,c←, v↓min← a k↓1← - NA.2.45</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="1000" Material="2" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="15" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Concrete_Check_of_torsion.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Check of torsion-Rectangle, no tors.reinforcement</ENU>
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
      <Variable Modifier="Public" Name="A" ESA_ID="" Type="Double" Value="210e-3" Precision="2">
        <Description TranslateID="VARIABLE_A">
          <ENU>Cross section area</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓k←" ESA_ID="" Type="Double" Value="117.2161e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓k←">
          <ENU>Area limited by center line</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓s←" ESA_ID="" Type="Double" Value="1.206372e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓s←">
          <ENU>Reinforcement area</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="350e-3" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>Cross section width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c" ESA_ID="" Type="Double" Value="35e-3" Precision="2">
        <Description TranslateID="VARIABLE_c">
          <ENU>Concrete cover</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="C↓Rdc←" ESA_ID="" Type="Double" Value="120e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="---">
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
      <Variable Modifier="Public" Name="Clause6_2_2_1P" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Value="557e-3" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>Effective height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ck←" ESA_ID="" Type="Double" Value="40e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctd←" ESA_ID="" Type="Double" Value="1.666667e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ctd←">
          <ENU>Concrete tensile strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="force" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_force">
          <ENU>Print loading</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="geom" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_geom">
          <ENU>Print cross section dimensions</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="600e-3" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Cross section height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
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
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k" ESA_ID="" Type="Double" Value="1.599222" Precision="2">
        <Description TranslateID="VARIABLE_k">
          <ENU>Coefficient of cross section height</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓1←" ESA_ID="" Type="Double" Value="150e-3" Precision="2">
        <Description TranslateID="VARIABLE_k↓1←">
          <ENU>Coefficient of shear strength</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="mat" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_mat">
          <ENU>Print material characteristics</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="mat_char" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="n" ESA_ID="" Type="Double" Value="6" Precision="2">
        <Description TranslateID="VARIABLE_n">
          <ENU>Number of bars</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓Ed←" ESA_ID="" Type="Double" Value="150000" Precision="2">
        <Description TranslateID="VARIABLE_N↓Ed←">
          <ENU>Axial force</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="s" ESA_ID="Result.1" Type="Double" Value="1.037489" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="66" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="s↓T←" ESA_ID="Result.2" Type="Double" Value="578.9064e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="66" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="s↓V←" ESA_ID="Result.3" Type="Double" Value="458.5826e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="66" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="T↓Ed←" ESA_ID="" Type="Double" Value="25000" Precision="2">
        <Description TranslateID="VARIABLE_T↓Ed←">
          <ENU>Torsional moment</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="t↓ef←" ESA_ID="" Type="Double" Value="110.5263e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓ef←">
          <ENU>Equivalent width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="T↓Rd←" ESA_ID="Result.4" Type="Double" Value="43184.88" Precision="2">
        <Description TranslateID="VARIABLE_T↓Rd←">
          <ENU>Ultimate torsional moment</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="13" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1e6" DrawLimitMin="10000" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="u" ESA_ID="" Type="Double" Value="1.9" Precision="2">
        <Description TranslateID="VARIABLE_u">
          <ENU>Cross section circuit</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Ed←" ESA_ID="" Type="Double" Value="50000" Precision="2">
        <Description TranslateID="VARIABLE_V↓Ed←">
          <ENU>Shear force</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="v↓min←" ESA_ID="" Type="Double" Value="447.6731e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Rd,c,min←" ESA_ID="" Type="Double" Value="108161.4" Precision="2">
        <Description TranslateID="VARIABLE_V↓Rd,c,min←">
          <ENU>Minimum bearing capacity</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Rd,c←" ESA_ID="" Type="Double" Value="109031.6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Rd,cc←" ESA_ID="Result.5" Type="Double" Value="109031.6" Precision="2">
        <Description TranslateID="VARIABLE_V↓Rd,cc←">
          <ENU>Cross section bearing capacity without shear reinforcement</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="12" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1e6" DrawLimitMin="10000" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="Y" ESA_ID="" Type="Double" Value="-197e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓cc←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_α↓cc←">
          <ENU>Coefficient of the concrete strength</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓c←" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_γ↓c←">
          <ENU>Partial safety factor for concrete</ENU>
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
      <Variable Modifier="Public" Name="ρ↓1←" ESA_ID="" Type="Double" Value="6.188108e-3" Precision="2">
        <Description TranslateID="VARIABLE_ρ↓1←">
          <ENU>Geometrical reinforcement ratio</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="σ↓cp←" ESA_ID="" Type="Double" Value="714285.7" Precision="2">
        <Description TranslateID="VARIABLE_σ↓cp←">
          <ENU>Cross section axial stress</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="Φ" ESA_ID="" Type="Double" Value="16e-3" Precision="2">
        <Description TranslateID="VARIABLE_Φ">
          <ENU>Longitudinal reinforcement diameter</ENU>
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
      <VC ID="">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000002">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="303" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="296" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="196" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="303" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="287" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="287" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000005">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="322" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="310" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="196" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="322" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="307" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="307" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000009">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="377" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="233" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="383" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="368" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="368" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000013">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="980" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="954" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="282" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000014">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="980" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="920" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="920" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000016">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="1048" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="1018" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="450" Y="314" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1048" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="987" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="987" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000018">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="342" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="332" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="196" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000019">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="342" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="327" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="327" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000020">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1077" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1047" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="314" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000021">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1077" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1016" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1016" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000022">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="1111" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1079" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="333" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000023">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1111" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1050" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1050" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000024">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="1214" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="1177" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000025">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1214" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1148" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000026">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="1194" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="1162" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000027">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1128" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1128" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000031">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1560" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1489" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1489" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000033">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1577" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1507" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="448" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000037">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1699" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1628" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="498" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000038">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1666" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="1596" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="498" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000039">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="1635" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="1565" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="498" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000040">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="1736" Hor="0" Ver="4" SpX="5" SpY="5" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="1736" Hor="0" Ver="4" SpX="5" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="100" Y="1736" Hor="0" Ver="4" SpX="5" SpY="0" Font1="Tahoma|13|3|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000045">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000046">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="674" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="648" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="494" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000047">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="917" Hor="4" Ver="2" SpX="50" SpY="-100" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="890" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="736" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000048">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="931" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="905" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="750" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000049">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="454" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="428" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="274" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000050">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1386" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1335" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="432" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="592" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="592" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="592" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000051">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1472" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1422" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="448" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="621" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="621" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="621" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000056">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="519" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="519" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="519" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="622" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="861" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="861" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000057">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1175" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1175" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1175" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1175" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="837" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="837" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000059">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="221" Y="1278" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="247" Y="1171" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="247" Y="519" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="253" Y="622" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="234" Y="861" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="234" Y="861" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000060">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="253" Y="1175" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="253" Y="1175" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="253" Y="1175" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="253" Y="1175" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="234" Y="837" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="234" Y="837" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000064">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1137" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1105" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="333" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="220" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="220" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="220" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000068">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="433" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="418" Hor="0" Ver="4" SpX="0" SpY="35" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="418" Hor="0" Ver="4" SpX="0" SpY="35" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="186" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="186" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="186" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000069">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1137" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1077" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1077" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="220" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="220" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="220" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000086">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1354" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1283" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1283" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="592" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="592" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="592" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000087">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1472" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1402" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1402" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="621" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="621" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="621" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000098">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="1539" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="1488" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="448" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="649" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="649" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="649" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000105">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="247" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="239" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="450" Y="196" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000134">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000145">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000146">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="322" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="198" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000156">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="433" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="407" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="233" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="186" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="186" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="186" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
      </VC>
      <VC ID="INI400_000158">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1000" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="939" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="939" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000159">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="1000" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="969" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="282" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000160">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1019" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="959" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="959" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000161">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="250" Y="1019" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="995" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="299" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000162">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1234" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1169" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1169" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000163">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="1234" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="1192" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="383" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000169">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000170">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="36.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="36.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="36.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000174">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="266" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="259" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="159" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000175">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="454" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="428" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="245" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000176">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="943" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="917" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="250" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000177">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1157" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1125" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000178">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1248" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1206" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="396" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000182">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="995" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000275">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="55.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
      <VC ID="INI400_005846">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005847">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005849">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005854">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005855">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005863">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005865">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
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
      <VC ID="INI400_005870">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005871">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005874">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="322" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="307" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="307" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005875">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005876">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="303" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="287" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="287" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005878">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005887">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
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
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006270">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006271">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006278">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006283">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006287">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006288">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006289">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006293">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006294">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006295">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006296">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="322" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="322" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="322" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006297">
        <Set Vis="0" Prev="" Style="1" StyleName="" X="250" Y="342" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="1" StyleName="" X="250" Y="342" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="1" StyleName="" X="250" Y="342" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006298">
        <Set Vis="0" Prev="" Style="1" StyleName="" X="250" Y="383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="1" StyleName="" X="250" Y="383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="1" StyleName="" X="250" Y="383" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006299">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="433" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="433" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="433" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="186" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="186" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="186" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="5" />
      </VC>
      <VC ID="INI400_006300">
        <Set Vis="0" Prev="" Style="1" StyleName="" X="250" Y="1019" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="1" StyleName="" X="250" Y="1019" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="1" StyleName="" X="250" Y="1019" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006301">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="1077" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="1077" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="1077" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006302">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="1111" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="1111" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="1111" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006303">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="1137" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="1137" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="1137" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="220" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="220" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="400" Y="220" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
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
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="247" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="247" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="247" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="396" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="torsion" Content="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" />
      <Image Name="BG" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="" ID="116" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts TranslateID="DIALOG_000116">
          <ENU>Load</ENU>
        </Texts>
        <TGroupBox Name="" ID="120" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000120">
            <ENU>Load values</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="T↓Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="V↓Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="23" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="N↓Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
      </TPanel>
      <TPanel Name="" ID="114" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
        <Texts TranslateID="DIALOG_000114">
          <ENU>Design settings</ENU>
        </Texts>
        <TGroupBox Name="" ID="28" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000028">
            <ENU>Reinforcement parameters</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Φ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="20" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="n" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
      </TPanel>
      <TPanel Name="" ID="112" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
        <Texts TranslateID="DIALOG_000112">
          <ENU>Cross section</ENU>
        </Texts>
        <TGroupBox Name="" ID="26" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000026">
            <ENU>Geometry</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="b" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
      </TPanel>
      <TPanel Name="" ID="106" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts TranslateID="DIALOG_000106">
          <ENU>Material</ENU>
        </Texts>
        <TCustomLibrary Name="" ID="33" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="REINF" DataFile="EC_Reinf.xml" Collapsed="True" UseCombo="False" Category="Inclined top branch" Item="B 500 B">
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
                <P>B 500 B</P>
                <P>500</P>
                <P>1.08</P>
                <P>540</P>
                <P>434.78</P>
                <P>0.05</P>
                <P>0.045</P>
                <P>0.002173913</P>
                <P>200000</P>
                <P>B</P>
                <P>true</P>
                <P>-0.05;-470.60;</P>
                <P>-0.0022;-434.78;</P>
                <P>0;0;</P>
                <P>0.0022;434.78;</P>
                <P>0.05;470.60;</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TLabel Name="" ID="118" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000118">
            <ENU>Reinforcement:</ENU>
          </Texts>
        </TLabel>
        <TCustomLibrary Name="TCustomLibrary" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="CONCRETE.EC" DataFile="EC_Concrete.xml" Collapsed="True" UseCombo="False" Category="Bilinear" Item="C 40/50">
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
                <P>C 40/50</P>
                <P>40</P>
                <P>50</P>
                <P>48</P>
                <P>3.5</P>
                <P>2.5</P>
                <P>4.6</P>
                <P>35</P>
                <P>2.3</P>
                <P>3.5</P>
                <P>2</P>
                <P>3.5</P>
                <P>1.75</P>
                <P>3.5</P>
                <P>2</P>
                <P>0;0;</P>
                <P>-0.00175;-26666670;</P>
                <P>-0.0035;-26666670;</P>
                <P>true</P>
                <P>32</P>
                <P>0.2</P>
                <P>2500</P>
                <P>14.7</P>
                <P>0.2</P>
                <P>4500</P>
                <P>0.0006</P>
                <P>1.00E-05</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TLabel Name="" ID="117" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000117">
            <ENU>Concrete:</ENU>
          </Texts>
        </TLabel>
      </TPanel>
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="True">
        <Texts>
          <ENU>General settings</ENU>
        </Texts>
        <TGroupBox Name="" ID="110" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000110">
            <ENU>Layout blocks</ENU>
          </Texts>
          <TCheckBox Name="" ID="60" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="mat" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000060">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="" ID="61" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="geom" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000061">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="" ID="62" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="force" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000062">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="108" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000108">
            <ENU>Headline settings</ENU>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="H1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000004">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TStringInput Name="TStringInput" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="H2" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000005">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="59" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000059">
            <ENU>National annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="49" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="British BS-EN">
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
                  <P>British BS-EN</P>
                  <P>BS</P>
                  <P>3</P>
                  <P>BS EN 1990</P>
                  <P>BS EN 1991-1-1</P>
                  <P>BS EN 1991-1-2</P>
                  <P>BS EN 1991-1-3</P>
                  <P>0</P>
                  <P>NaN</P>
                  <P>True;2;</P>
                  <P>NaN</P>
                  <P>1.0</P>
                  <P>1.0</P>
                  <P>NaN</P>
                  <P>True</P>
                  <P>2.0</P>
                  <P>2.0</P>
                  <P>NaN</P>
                  <P>NaN;NaN;5;15;</P>
                  <P>True</P>
                  <P>True</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>BS EN 1991-1-4</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>0.2;0.5;</P>
                  <P>False</P>
                  <P>NaN</P>
                  <P>False;1;</P>
                  <P>True</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1.226</P>
                  <P>True</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>BS EN 1991-1-5</P>
                  <P>BS EN 1991-1-6</P>
                  <P>BS EN 1991-1-7</P>
                  <P>BS EN 1991-2</P>
                  <P>BS EN 1991-3</P>
                  <P>BS EN 1991-4</P>
                  <P>BS EN 1992-1-1</P>
                  <P>1</P>
                  <P>0.9</P>
                  <P>1.1</P>
                  <P>1.2</P>
                  <P>1.5;1.15;1.15;1.2;1.0;1.0;</P>
                  <P>1;1;</P>
                  <P>90</P>
                  <P>1</P>
                  <P>NaN</P>
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
                  <P>40;65;5;</P>
                  <P>0.005</P>
                  <P>0.4;NaN;0.4;NaN;0.7;0.8;</P>
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
                  <P>0.3;0.3;0.3;0.2;0.2;0.2;</P>
                  <P>3.4;0.425;</P>
                  <P>1;5;</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>40</P>
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
                  <P>12</P>
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
                  <P>BS EN 1992-1-2</P>
                  <P>BS EN 1992-2</P>
                  <P>BS EN 1992-3</P>
                  <P>BS EN 1993-1-1</P>
                  <P>NaN;NaN;</P>
                  <P>1;1;1.10;</P>
                  <P>BS EN 1993-1-2</P>
                  <P>BS EN 1993-1-3</P>
                  <P>BS EN 1993-1-4</P>
                  <P>BS EN 1993-1-5</P>
                  <P>1.00;1.00;</P>
                  <P>BS EN 1993-1-6</P>
                  <P>BS EN 1993-1-7</P>
                  <P>BS EN 1993-1-8</P>
                  <P>1.25;1.25;1.1;1.0;1.0;1.0;1.1;</P>
                  <P>BS EN 1993-1-9</P>
                  <P>BS EN 1993-1-10</P>
                  <P>BS EN 1993-1-11</P>
                  <P>BS EN 1993-1-12</P>
                  <P>BS EN 1993-2</P>
                  <P>1.0;1.1;1.25;1.25;1.1;1.1;1.1;1.0;1.1;</P>
                  <P>BS EN 1993-3-1</P>
                  <P>BS EN 1993-3-2</P>
                  <P>BS EN 1993-4-1</P>
                  <P>BS EN 1993-4-2</P>
                  <P>BS EN 1993-4-3</P>
                  <P>BS EN 1993-5</P>
                  <P>BS EN 1993-6</P>
                  <P>BS EN 1994-1-1</P>
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
                  <P>BS EN 1994-1-2</P>
                  <P>BS EN 1994-2</P>
                  <P>BS EN 1995-1-1</P>
                  <P>NaN</P>
                  <P>0.67;0.67;1.0;</P>
                  <P>BS EN 1995-1-2</P>
                  <P>BS EN 1995-2</P>
                  <P>BS EN 1996-1-1</P>
                  <P>NaN</P>
                  <P>1</P>
                  <P>NaN</P>
                  <P>True</P>
                  <P>1000</P>
                  <P>NaN;NaN;NaN;</P>
                  <P>NaN</P>
                  <P>BS EN 1996-1-2</P>
                  <P>BS EN 1996-2</P>
                  <P>BS EN 1996-3</P>
                  <P>BS EN 1997-1</P>
                  <P>1.1;0.9;1.5;0;</P>
                  <P>1.25;1.25;1.4;1.4;1.0;</P>
                  <P>1.35;1;1.5;0;1;1;1.3;0;</P>
                  <P>1;1;1;1;1;1.25;1.25;1.4;1.4;1;</P>
                  <P>1;1;1.4;1.1;1;1;</P>
                  <P>BS EN 1997-2</P>
                  <P>BS EN 1998-1</P>
                  <P>BS EN 1998-2</P>
                  <P>BS EN 1998-3</P>
                  <P>BS EN 1998-4</P>
                  <P>BS EN 1998-5</P>
                  <P>BS EN 1998-6</P>
                  <P>BS EN 1999-1-1</P>
                  <P>BS EN 1999-1-2</P>
                  <P>BS EN 1999-1-3</P>
                  <P>BS EN 1999-1-4</P>
                  <P>BS EN 1999-1-5</P>
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
    <Item TranslateID="BLOCK_INI400_005865">
      <ENU>"Geometry"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005866">
      <ENU>"Reinforcement parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005867">
      <ENU>"Loading"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005868">
      <ENU>"Cross section bearing capacity"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005869">
      <ENU>"Cross section check"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005878">
      <ENU>"Coefficient of shear bearing capacity"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000001">
      <ENU>Caption</ENU>
    </Item>
    <Item ID="TEXT_INI400_000002">
      <ENU>"b = " &amp; b</ENU>
    </Item>
    <Item ID="TEXT_INI400_000003">
      <ENU>Description("b")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000005">
      <ENU>"h = " &amp; h</ENU>
    </Item>
    <Item ID="TEXT_INI400_000006">
      <ENU>Description("h")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000010">
      <ENU>Description("u")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000013">
      <ENU>"Φ = " &amp; Φ</ENU>
    </Item>
    <Item ID="TEXT_INI400_000014">
      <ENU>Description("Φ")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000016">
      <ENU>"c = " &amp; c</ENU>
    </Item>
    <Item ID="TEXT_INI400_000017">
      <ENU>Description("c")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000019">
      <ENU>Description("d")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000021">
      <ENU>Description("t↓ef←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000023">
      <ENU>Description("A↓k←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000024">
      <ENU>"V↓Ed← = " &amp; V↓Ed←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000025">
      <ENU>Description("V↓Ed←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000026">
      <ENU>"T↓Ed← = " &amp; T↓Ed←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000027">
      <ENU>Description("T↓Ed←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000031">
      <ENU>Description("T↓Rd←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000040">
      <ENU>"Additional reinforcement on torsion is required!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000045">
      <ENU>"Bearing capacity of rectangular cross section (without reinforcement on torsion)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000047">
      <ENU>"1 - center line"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000048">
      <ENU>"2 - outer cross section circuit "</ENU>
    </Item>
    <Item ID="TEXT_INI400_000056">
      <ENU>" &lt; 1"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000057">
      <ENU>" &gt; 1"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000059">
      <ENU>" =&gt; Is SUFFICIENT in torsion"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000060">
      <ENU>" =&gt; Is INSUFFICIENT in torsion!"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000068">
      <ENU>Description("k")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000069">
      <ENU>Description("ρ↓1←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000086">
      <ENU>Description("V↓Rd,cc←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000087">
      <ENU>Description("V↓Rd,c,min←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000158">
      <ENU>Description("n")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000159">
      <ENU>"n = " &amp; n</ENU>
    </Item>
    <Item ID="TEXT_INI400_000160">
      <ENU>Description("A↓s←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000162">
      <ENU>Description("N↓Ed←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000163">
      <ENU>"N↓Ed← = " &amp; N↓Ed←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000169">
      <ENU>"according to Eurocode 2"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000170">
      <ENU>IO.SetupNA.EC_1992_1_1.Name &amp; ", §6.3"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005863">
      <ENU>"Define non-zero values!"</ENU>
    </Item>
    <Item ID="TEXT_INI400_005874">
      <ENU>Description("A")</ENU>
    </Item>
    <Item ID="TEXT_INI400_005876">
      <ENU>Description("σ↓cp←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006358">
      <ENU>"Reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006359">
      <ENU>IO.REINF.Item</ENU>
    </Item>
  </Texts>
</Root>