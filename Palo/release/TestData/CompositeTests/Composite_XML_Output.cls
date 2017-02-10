<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="c193ec41-4eb4-4136-af10-f463ae05b129">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">double π →SLE001_000093= Math.PI; 
→SLE001_000134BLOCK("National Annex parameters") { //National annexes
    →SLE001_005838BLOCK { //NA.2.73 Clause 7.3.4 Calculation of crack width, paragrahp (3)
        object Clause7_3_4 →SLE001_005839= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_7.3.4(3).CLC"); 
        →SLE001_005847Clause7_3_4.Calculate(false); 
        k↓3← →SLE001_005843= Clause7_3_4.k↓3←; 
        k↓4← →SLE001_005841= Clause7_3_4.k↓4←; 
    } 
} 

IF(H1) { 
    →SLE001_000067TEXT("Calculation of crack width according to Eurocode 2"); 
    →SLE001_000112TEXT(IO.SetupNA.EC_1991_1_1.Name &amp; ", §7.3.4"); 
} 
IF(PrintCaption) { 
    →SLE001_000028TEXT(Caption); 
} 
α↓e← →SLE001_000094= E↓s←/E↓cm←; 
A↓s1← →SLE001_000084= n↓1←*π*[ϕ↓s1←/2]↑2←; 
A↓s2← →SLE001_000085= n↓2←*π*[ϕ↓s2←/2]↑2←; 
d↓1← →SLE001_006292= h-c↓1←-ϕ↓s1←/2; 
d↓2← →SLE001_006293= c↓2←+ϕ↓s2←/2; 
x →SLE001_000086= (α↓e←/b)*[A↓s1←+A↓s2←]*[-1+SQRT(1+(2*b/α↓e←)*(A↓s1←*d↓1←+A↓s2←*d↓2←)/[A↓s1←+A↓s2←]↑2←)]; 
IF(CSS) { 
    →SLE001_006297BLOCK("Geometry") { 
        →SLE001_000061TEXT(Description("b")); 
        →SLE001_000060TEXT("b = " &amp; b); 
        →SLE001_000059TEXT(Description("h")); 
        →SLE001_000058TEXT("h = " &amp; h); 
        →SLE001_006364TEXT(Description("c↓1←")); 
        →SLE001_006365TEXT("c↓1← = " &amp; c↓1←); 
        →SLE001_006366TEXT(Description("c↓2←")); 
        →SLE001_006367TEXT("c↓2← = " &amp; c↓2←); 
        →SLE001_000053TEXT(Description("d↓1←")); 
        d↓1← →SLE001_000051= h-c↓1←-ϕ↓s1←/2; 
        →SLE001_000054TEXT(Description("d↓2←")); 
        d↓2← →SLE001_000052= c↓2←+ϕ↓s2←/2; 
        →SLE001_000088PAGEBREAK(); 
        →SLE001_000064IMG("crack"); 
        →SLE001_000089PAGEBREAK(); 
    } 
} 
IF(mat) { 
    →SLE001_006353BLOCK("Concrete material parameters") { 
        →SLE001_006355TEXT("Concrete"); 
        →SLE001_006356TEXT(IO.CONCRETE.EC.Item); 
        →SLE001_006362TEXT(Description("f↓ct,eff←")); 
        →SLE001_006363TEXT("f↓ct,eff← = " &amp; f↓ct,eff←); 
        →SLE001_006376TEXT("Note: Cracks are expected after 28 days"); 
        →SLE001_006377TEXT(Description("E↓cm←")); 
        →SLE001_006378TEXT("E↓cm← = " &amp; E↓cm←); 
        →SLE001_006354PAGEBREAK(); 
    } 
    →SLE001_005851BLOCK("Reinforcement parameters") { 
        →SLE001_006358TEXT("Reinforcement"); 
        →SLE001_006359TEXT(IO.REINF.EC.Item); 
        →SLE001_006360TEXT(Description("E↓s←")); 
        →SLE001_006361TEXT("E↓s← = " &amp; E↓s←); 
        →SLE001_000074TEXT("Tension reinforcement (number and diameter)"); 
        →SLE001_000072TEXT("n↓1 ←= " &amp; n↓1← &amp; "  ϕ↓s1← = " &amp; ϕ↓s1←); 
        →SLE001_000071TEXT("Compression reinforcement (number and diameter)"); 
        →SLE001_000083TEXT("n↓2 ←= " &amp; n↓2← &amp; "  ϕ↓s2← = " &amp; ϕ↓s2←); 
        →SLE001_000066TEXT(Description("A↓s1←")); 
        A↓s1← →SLE001_000017= n↓1←*π*[ϕ↓s1←/2]↑2←; 
        →SLE001_000065TEXT(Description("A↓s2←")); 
        A↓s2← →SLE001_000018= n↓2←*π*[ϕ↓s2←/2]↑2←; 
        →SLE001_000079TEXT("Prestressed reinf. diameter (subst. diameter and area)"); 
        →SLE001_000077TEXT("ϕ↓p← = " &amp; ϕ↓p← &amp; "  A↓p1← = " &amp; A↓p1←); 
        →SLE001_006379TEXT(Description("ξ")); 
        →SLE001_006380TEXT("ξ = " &amp; ξ); 
        →SLE001_006381TEXT(Description("k↓1←")); 
        →SLE001_006382TEXT("k↓1← = " &amp; k↓1←); 
        →SLE001_006383TEXT(Description("k↓2←")); 
        →SLE001_006384TEXT("k↓2← = " &amp; k↓2←); 
        →SLE001_006385TEXT(Description("k↓3←")); 
        →SLE001_006386TEXT("k↓3← = " &amp; k↓3←); 
        →SLE001_006387TEXT("k↓4← = " &amp; k↓4←); 
        →SLE001_006296PAGEBREAK(); 
    } 
} 
IF(load) { 
    →SLE001_006388BLOCK("Loading") { 
        →SLE001_006389TEXT(Description("M↓Ed←")); 
        →SLE001_006390TEXT("M↓Ed← = " &amp; M↓Ed←); 
        →SLE001_006391PAGEBREAK(); 
    } 
} 
→SLE001_005853BLOCK("Cross section parameters") { 
    →SLE001_000024TEXT(Description("x")); 
    →SLE001_000097TEXT("x = " &amp; '(α↓e←/b)*[A↓s1←+A↓s2←]*[-1+SQRT(1+(2*b/α↓e←)*(A↓s1←*d↓1←+A↓s2←*d↓2←)/[A↓s1←+A↓s2←]↑2←)]' &amp; " = "); 
    →SLE001_000098TEXT("= " &amp; (α↓e←/b)*[A↓s1←+A↓s2←]*[-1+SQRT(1+(2*b/α↓e←)*(A↓s1←*d↓1←+A↓s2←*d↓2←)/[A↓s1←+A↓s2←]↑2←)] &amp; " = " &amp; Val(x*10↑3←, 2) &amp; " mm"); 
    →SLE001_000099TEXT("x = " &amp; x); 
    →SLE001_000025TEXT("Eff. height of conc. cross section"); 
    h↓ceff← →SLE001_000008= MIN(2.5*[h-d↓1←], (h-x)/3, h/2); 
    →SLE001_000026TEXT("Effective area of concrete cross section"); 
    A↓ceff← →SLE001_000012= b*h↓ceff←; 
} 
→SLE001_000090PAGEBREAK(); 
→SLE001_005854BLOCK("The ration of reinforcement:") { 
    →SLE001_000029TEXT("Ration of bond strength"); 
    IF(ϕ↓p← &gt; 0) { 
        ξ↓1← →SLE001_000009= SQRT(ξ*ϕ↓s1←/ϕ↓p←); 
    } ELSE { 
        ξ↓1← →SLE001_000011= 0; 
    } 
    →SLE001_000030TEXT("Coefficient of materials"); 
    →SLE001_000095TEXT("α↓e← = " &amp; 'E↓s←/E↓cm←' &amp; " = " &amp; E↓s←/E↓cm← &amp; " = " &amp; α↓e←); 
    →SLE001_000096TEXT("α↓e← = " &amp; α↓e←); 
    →SLE001_000031TEXT("Prestressed reinforcement ration"); 
    ρ↓peff← →SLE001_000004= [A↓s1←+ξ↓1←↑2←*A↓p1←]/A↓ceff←; 
} 
→SLE001_000091PAGEBREAK(); 
→SLE001_006408IMG("Cracks"); 
→SLE001_006407PAGEBREAK(); 
→SLE001_005855BLOCK("Stress calculation:") { 
    →SLE001_000041TEXT("Coefficient of load duration"); 
    IF(B0) { 
        →SLE001_000057TEXT("Loading is short-term"); 
        k↓t← →SLE001_000039= 0.6; 
    } ELSE { 
        →SLE001_000056TEXT("Loading is long-term"); 
        k↓t← →SLE001_000040= 0.4; 
    } 
    IF(COMPARE(M↓Ed←, 0, 6) == 1) { 
        →SLE001_000047TEXT("Calculation of stress:"); 
        ε↓1← →SLE001_000082= A↓s1←*E↓s←*[x-d↓1←]↑2←/x; 
        ε↓2← →SLE001_000081= A↓s2←*E↓s←*[x-d↓2←]↑2←/x; 
        ε↓c← →SLE001_000045= M↓Ed←/(ε↓1←+ε↓2←+0.5*b*x*E↓cm←*(2/3)*x); 
        σ↓s1← →SLE001_000046= E↓s←*ε↓c←*((d↓1←-x)/x); 
    } ELSE { 
        →SLE001_006294TEXT("M↓Ed← = 0 kNm --&gt;"); 
        →SLE001_006295TEXT("Calculation stopped!"); 
        Exit(); 
    } 
    →SLE001_006392PAGEBREAK(); 
    →SLE001_000044BLOCK { 
        →SLE001_000032TEXT("Difference between stress of steel and concrete"); 
        →SLE001_000055TEXT("remark: σs1 - stress in tension reinf. on section with crack."); 
        →SLE001_000075TEXT("It can be substitued for prestressed members by Δσp"); 
        →SLE001_000080TEXT("in prestressed reinf. from zero status of compressive strain of concrete on the same level."); 
        Δε↓sc← →SLE001_000001= (σ↓s1←-k↓t←*(f↓ct,eff←/ρ↓peff←)*[1+α↓e←*ρ↓peff←])/E↓s←; 
        IF(Δε↓sc← &lt; 0.6*σ↓s1←/E↓s←) { 
            →SLE001_000068TEXT("Condition Δε↓sc←≥0.6 * σ↓s1← / E↓s← is not fulfilled, the value of strain difference between is:"); 
            Δε↓sc← →SLE001_000019= 0.6*σ↓s1←/E↓s←; 
        } 
    } 
} 

→SLE001_000092PAGEBREAK(); 
→SLE001_005856BLOCK("Calculation crack width:") { 
    →SLE001_000034TEXT("Maximum crack distance"); 
    s↓rmax← →SLE001_000007= k↓3←*c↓1←+k↓1←*k↓2←*k↓4←*ϕ↓s1←/ρ↓peff←; 
    →SLE001_000035TEXT("Crack width"); 
    w↓k← →SLE001_000002= s↓rmax←*Δε↓sc←; 
} 


→SLE001_006405PAGEBREAK(); 
object T →SLE001_006393= new Table(4); 
T[0][0].Value →SLE001_006394= "Column one"; 
T[0][1].Value →SLE001_006395= "Second column"; 
T[0][2].Value =  { →SLE001_000048TEXT("Column with text"); →SLE001_000049TEXT("and formula"); } 
T[0][3].Value →SLE001_000050= "Image"; 

FOR(i, 1, 5) { 
    T[i][0].Value →SLE001_006396= 1*i; T[i][0].Alignment →SLE001_006397= ContentAlignment.MiddleCenter; 
    T[i][1].Value →SLE001_006398= 10*i; T[i][1].Alignment →SLE001_006399= ContentAlignment.MiddleCenter; 
    T[i][2].Value =  { →SLE001_000043TEXT("Hello world!"); X →SLE001_006401= X+1; } 
    T[i][3].Value =  { IF(i == 2) { →SLE001_006402IMG("SDF"); } } 
} 

T.Columns[2].Alignment →SLE001_006403= ContentAlignment.MiddleCenter; 

T.BorderPen →SLE001_000022= new Pen(Color.DarkRed, 3); 
T.GridPen →SLE001_000023= new Pen(Color.DarkRed, 1); 
T[0].Font →SLE001_006404= new Font("Arial Black", 12); 
T[0].BorderPen →SLE001_000042= T.BorderPen; 
→SLE001_000006T.Draw(); 
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="1000" Material="2" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="UserHEK" Autor2="JBR" Version="171" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia-online.com/forms/en/Concrete_crack_width.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Calculation of crack width on rectangle CSS</ENU>
      </CalculationName>
    </Header>
    <Styles />
    <NormRef>
      <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="A↓ceff←" ESA_ID="Result.4" Type="Double" Value="32.25e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="69" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="10e-3" DrawLimitMin="1e-6" />
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓p1←" ESA_ID="MemberData.A↓p1←" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_A↓p1←">
          <ENU>Cross-sectional area of the tendon which can be calculated</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓s1←" ESA_ID="Result.5" Type="Double" Value="603.1858e-6" Precision="2">
        <Description TranslateID="VARIABLE_A↓s1←">
          <ENU>Tension reinforcement area</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="10e-3" DrawLimitMin="1e-6" />
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓s2←" ESA_ID="Result.6" Type="Double" Value="628.3185e-6" Precision="2">
        <Description TranslateID="VARIABLE_A↓s2←">
          <ENU>Compression reinforcement area</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="10e-3" DrawLimitMin="1e-6" />
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="300e-3" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>Cross section width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="B0" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_B0">
          <ENU>The applied load is short term</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="c↓1←" ESA_ID="" Type="Double" Value="35e-3" Precision="2">
        <Description TranslateID="VARIABLE_c↓1←">
          <ENU>Tensile reinforcement cover</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="c↓2←" ESA_ID="" Type="Double" Value="35e-3" Precision="2">
        <Description TranslateID="VARIABLE_c↓2←">
          <ENU>Compression reinforcement cover</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause7_3_4" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CSS" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_CSS">
          <ENU>Print cross section dimensions</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d↓1←" ESA_ID="" Type="Double" Value="457e-3" Precision="2">
        <Description TranslateID="VARIABLE_d↓1←">
          <ENU>Effective cross section height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="d↓2←" ESA_ID="" Type="Double" Value="45e-3" Precision="2">
        <Description TranslateID="VARIABLE_d↓2←">
          <ENU>Eff. distance for compression reinforcement</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="E↓cm←" ESA_ID="" Type="Double" Value="30e9" Precision="2">
        <Description TranslateID="VARIABLE_E↓cm←">
          <ENU>Modulus of elasticity</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e9" Dim="GPa" />
      </Variable>
      <Variable Modifier="Public" Name="E↓s←" ESA_ID="" Type="Double" Value="200e9" Precision="2">
        <Description TranslateID="VARIABLE_E↓s←">
          <ENU>Modulus of elasticity</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e9" Dim="GPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ct,eff←" ESA_ID="Result.1" Type="Double" Value="2.2e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ct,eff←">
          <ENU>Average axial tensile strength</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="79" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="500e-3" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Cross section height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="h↓ceff←" ESA_ID="" Type="Double" Value="107.5e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="H1" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_H1">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Value="6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓1←" ESA_ID="MemberData.k↓1←" Type="Double" Value="1.6" Precision="2">
        <Description TranslateID="VARIABLE_k↓1←">
          <ENU>Coefficient of bonded reinforcement</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓2←" ESA_ID="MemberData.k↓2←" Type="Double" Value="500e-3" Precision="2">
        <Description TranslateID="VARIABLE_k↓2←">
          <ENU>Coefficient of strain distribution</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓3←" ESA_ID="" Type="Double" Value="3.4" Precision="2">
        <Description TranslateID="VARIABLE_k↓3←">
          <ENU>Coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓4←" ESA_ID="" Type="Double" Value="425e-3" Precision="2">
        <Description TranslateID="VARIABLE_k↓4←">
          <ENU>Coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓t←" ESA_ID="" Type="Double" Value="400e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="load" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_load">
          <ENU>Print loading</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="M↓Ed←" ESA_ID="" Type="Double" Value="45000" Precision="2">
        <Description TranslateID="VARIABLE_M↓Ed←">
          <ENU>Characteristic bending moment</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="mat" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_mat">
          <ENU>Print material characteristics</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="n↓1←" ESA_ID="" Type="Double" Value="3" Precision="0">
        <Description TranslateID="VARIABLE_n↓1←">
          <ENU>Number of reinforcement bars</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓2←" ESA_ID="" Type="Double" Value="2" Precision="0">
        <Description TranslateID="VARIABLE_n↓2←">
          <ENU>Number of compression reinforcement bars</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="s↓rmax←" ESA_ID="Result.2" Type="Double" Value="409.8557e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="48" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="500e-3" DrawLimitMin="50e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="T" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_T">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="w↓k←" ESA_ID="Result.0" Type="Double" Value="251.7955e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="48" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="300e-6" DrawLimitMin="1e-6" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="x" ESA_ID="Result.3" Type="Double" Value="92.03571e-3" Precision="2">
        <Description TranslateID="VARIABLE_x">
          <ENU>Distance of the neutral axis</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="48" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="500e-3" DrawLimitMin="50e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="X" ESA_ID="" Type="Double" Value="80" Precision="2">
        <Description TranslateID="VARIABLE_X">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Y1" ESA_ID="" Type="Double" Value="-199e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Y2" ESA_ID="" Type="Double" Value="197e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓e←" ESA_ID="" Type="Double" Value="6.666667" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Δε↓sc←" ESA_ID="" Type="Double" Value="614.3518e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓1←" ESA_ID="" Type="Double" Value="174.5925e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓2←" ESA_ID="" Type="Double" Value="3.020709e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓c←" ESA_ID="" Type="Double" Value="221.6477e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="‰" />
      </Variable>
      <Variable Modifier="Public" Name="ξ" ESA_ID="MemberData.ξ" Type="Double" Value="800e-3" Precision="2">
        <Description TranslateID="VARIABLE_ξ">
          <ENU>Ratio of bond strength of prestressing steel</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ξ↓1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
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
      <Variable Modifier="Public" Name="ρ↓peff←" ESA_ID="" Type="Double" Value="18.70344e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="σ↓s1←" ESA_ID="Result.7" Type="Double" Value="175.7872e6" Precision="2">
        <Description TranslateID="VARIABLE_σ↓s1←">
          <ENU>Characteristic reinforcement stress</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="99" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1e9" DrawLimitMin="1" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓p←" ESA_ID="MemberData.ϕ↓p←" Type="Double" Value="0" Precision="0">
        <Description TranslateID="VARIABLE_ϕ↓p←">
          <ENU>The compensatory diameter for prestressing steel</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓s1←" ESA_ID="" Type="Double" Value="16e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓s1←">
          <ENU>Diameter of tension reinforcement bar</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓s2←" ESA_ID="" Type="Double" Value="20e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓s2←">
          <ENU>Diameter of compession reinforcement bar</ENU>
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
      <VC ID="">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="SLE001_000001">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="100" Y="1381" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="10" Y="935" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="402" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="100" Y="917" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|4|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="856" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="856" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000002">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="220" Y="1549" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="10" Y="1028" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="468" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="1003" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="919" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="919" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000004">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="250" Y="925" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="730" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="304" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="717" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="638" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="638" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000006">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="24.5" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000007">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="220" Y="1492" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="10" Y="1003" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="452" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="975" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="890" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="890" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000008">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="300" Y="158" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="10" Y="134" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="96.6" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="141" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="480" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="480" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000009">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="220" Y="852" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="653" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="268" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="643" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="560" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="560" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000011">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="250" Y="862" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="291" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="291" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="291" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="291" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="291" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="SLE001_000012">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="220" Y="802" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="10" Y="594" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="10" Y="218" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="588" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="514" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="514" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000017">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="220" Y="538" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="421" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_000072" Style="0" StyleName="" X="150" Y="147" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="449" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|4|2" EqStyle="4" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="88" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="88" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000018">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="220" Y="576" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="439" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="150" Y="165" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="467" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|4|2" EqStyle="4" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="130" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="130" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000019">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="100" Y="956" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="956" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="956" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="100" Y="956" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="240" Y="586" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="240" Y="586" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000022">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="38.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000023">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="54.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000024">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="614" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="564" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="564" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="564" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="436" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="436" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000025">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="158" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="165" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="165" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="165" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="480" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="480" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000026">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="785" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="701" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="701" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="701" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="514" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="514" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000028">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="36.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="21" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000029">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="852" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="633" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="633" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="633" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="560" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="560" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000030">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="885" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="666" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="666" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="666" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="589" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="589" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000031">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="925" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="705" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="705" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="705" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="638" Hor="0" Ver="4" SpX="0" SpY="35" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="638" Hor="0" Ver="4" SpX="0" SpY="35" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000032">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="1294" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="831" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="831" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="831" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="768" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="768" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000034">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="1492" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="999" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="437" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="975" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|4|2" Font2="Tahoma|11.7|4|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="890" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="890" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000035">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="1549" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="1050" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="472" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="1003" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|4|2" Font2="Tahoma|11.7|4|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="919" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="919" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000039">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="250" Y="435" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="435" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="435" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="435" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="435" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="435" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="SLE001_000040">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="250" Y="996" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="787" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="12" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="354" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="764" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="704" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="704" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="SLE001_000041">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="982" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="769" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="769" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="769" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="691" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="691" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000042">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="85.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000043">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="319" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000044">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="1282" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="903" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="392" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="819" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="736" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="736" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000045">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="180" Y="1179" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="10" Y="844" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="369" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="12" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="780" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="12" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="499" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="499" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="SLE001_000046">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="180" Y="1267" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="10" Y="889" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="384" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="805" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="726" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="726" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="SLE001_000047">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="1017" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="804" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="804" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="804" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="726" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="726" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000048">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="13.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial Black|19|0|2" Font2="Arial Black|19|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000049">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="40.2" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial Black|19|0|2" Font2="Arial Black|19|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000050">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="36.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000051">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="300" Y="105" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="94.9" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_000060" Style="0" StyleName="" X="150" Y="65.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="82" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="374" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="374" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000052">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="300" Y="132" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="110" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="150" Y="81.2" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="112" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="400" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="400" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000053">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="105" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="88" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="88" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="88" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="374" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="374" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000054">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="132" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="114" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="114" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="114" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="400" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="400" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000055">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="1314" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="850" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="850" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="850" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.1|2|2" Font2="Tahoma|13.1|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|9.1|0|2" Font2="Tahoma|9.1|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|9.1|0|2" Font2="Tahoma|9.1|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000056">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="996" Hor="0" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="783" Hor="0" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="783" Hor="0" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="783" Hor="0" Ver="4" SpX="50" SpY="0" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="704" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="704" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000057">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="435" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="435" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="435" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="435" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000058">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="80.4" Hor="0" Ver="2" SpX="220" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="80.4" Hor="0" Ver="4" SpX="220" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="80.4" Hor="0" Ver="4" SpX="220" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="59" Hor="0" Ver="4" SpX="220" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="78" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="78" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000059">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="80.4" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="64" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="64" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="64" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="78" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="78" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000060">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="65.8" Hor="0" Ver="2" SpX="220" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="65.8" Hor="0" Ver="4" SpX="220" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="65.8" Hor="0" Ver="4" SpX="220" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="45" Hor="0" Ver="4" SpX="220" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="54" Hor="1" Ver="2" SpX="220" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="54" Hor="1" Ver="2" SpX="220" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000061">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="65.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="50" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="54" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="54" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000064">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="297" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="241" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="220" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="262" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="186" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="186" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000065">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="576" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="527" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="527" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="527" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000066">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="538" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000067">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000068">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12.7|2|2" Font2="Tahoma|12.7|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000071">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="455" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="388" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="157" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000072">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="220" Y="435" Hor="1" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="364" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="147" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="399" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000074">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="420" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="399" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|4|2" Font2="Tahoma|11.7|4|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000075">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="1328" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="864" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="864" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="864" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.1|2|2" Font2="Tahoma|13.1|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000077">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="220" Y="507" Hor="1" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="403" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="185" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="431" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000079">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="490" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="464" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="464" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="464" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|11.7|4|2" Font2="Tahoma|11.7|4|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000080">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="1343" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="878" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="878" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="878" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.1|2|2" Font2="Tahoma|13.1|2|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000081">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="180" Y="1115" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="821" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="12" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="358" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="12" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000082">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="180" Y="1045" Hor="0" Ver="1" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="805" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="12" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="340" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="12" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000083">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="220" Y="470" Hor="1" Ver="4" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="385" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_000000" Style="2" StyleName="" X="10" Y="162" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="399" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000084">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="5" Y="102" Hor="1" Ver="4" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="5" Y="34.5" Hor="1" Ver="4" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="5" Y="34.5" Hor="1" Ver="4" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000085">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="5" Y="138" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="5" Y="70.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="5" Y="70.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000086">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="5" Y="194" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="5" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="5" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000088">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="211" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="110" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000089">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="383" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="327" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="115" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000090">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="816" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="607" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="231" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000091">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="945" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="750" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="317" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000092">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="1451" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="958" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="416" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000093">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000094">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="64.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="661" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="273" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="676" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="589" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="589" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000095">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="250" Y="885" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="691" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="298" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000096">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="905" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="710" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="288" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000097">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="666" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="492" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="150" Y="217" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000098">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="10" Y="733" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="10" Y="558" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="150" Y="216" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000099">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="770" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="596" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="201" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000112">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_000134">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_005838">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="211" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="44" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="44" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_005839">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="224" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_005841">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="265" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="59.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="59.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_005843">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="245" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="97.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="97.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_005847">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_005851">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_005853">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_005854">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_005855">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_005856">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006265">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006266">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006267">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006268">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006269">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006270">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006271">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006277">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006278">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006283">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006284">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006285">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006286">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006287">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006288">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006290">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006291">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006292">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="105" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="94.9" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="0" Prev="SLE001_000060" Style="0" StyleName="" X="150" Y="65.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="82" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="374" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="374" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006293">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="132" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="110" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="150" Y="81.2" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="112" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="400" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="400" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006294">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006295">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006296">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="383" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="327" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="115" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006297">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006353">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006354">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006355">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006356">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006358">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006359">
        <Set Vis="1" Prev="SLE001_-000001" Style="1" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006360">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006361">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="71.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="60" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006362">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006363">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="71.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="60" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006364">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="71.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="50" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="50" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="50" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006365">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="71.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="66.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="60" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006366">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="71.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="50" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="50" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="50" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006367">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="71.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="450" Y="66.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="60" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006376">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006377">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006378">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="71.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="150" Y="66.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="60" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006379">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006380">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="400" Y="71.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="66.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="60" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006381">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006382">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="71.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="100" Y="66.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="100" Y="66.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="60" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006383">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006384">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="71.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="200" Y="66.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="200" Y="66.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="60" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006385">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="33" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|1|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006386">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="71.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="60" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006387">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="400" Y="71.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="400" Y="66.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="400" Y="66.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="60" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006388">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006389">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="607" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="570" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="570" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006390">
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="300" Y="607" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="422" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="2" StyleName="" X="10" Y="150" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006391">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="200" Y="620" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="435" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="163" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006392">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="945" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="750" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="317" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006393">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006394">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006395">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006396">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="168" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006397">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="123" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006398">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="168" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006399">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="138" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006400">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="168" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006401">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="334" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006402">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="183" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006403">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006404">
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="70.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006405">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="945" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="750" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="317" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006406">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="64.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="661" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="273" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="676" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="589" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="589" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|11.7|0|2" Font2="Tahoma|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006407">
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="220" Y="945" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="750" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="10" Y="317" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="SLE001_-000001" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="SLE001_006408">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="Cracks" Content="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" />
      <Image Name="SDF" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TGroupBox Name="" ID="48" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="33" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000048">
            <ENU>Coefficients</ENU>
          </Texts>
          <TComboBox Name="" ID="51" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="k↓2←" VarNameVisible="True" InputColor="-4128832" DescPos="1" InputWidth="250" Values="500e-3|1" Index="0">
            <Texts TranslateID="DIALOG_000051">
              <ENU>for bending|for pure tension</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="" ID="50" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="k↓1←" VarNameVisible="True" InputColor="-4128832" DescPos="1" InputWidth="250" Values="800e-3|1.6" Index="1">
            <Texts TranslateID="DIALOG_000050">
              <ENU>for high bond bars|for bars with an effectively plain surface</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="TDoubleInput" ID="29" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="ξ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="32" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000047">
            <ENU>Prestressed reinforcement</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="26" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="A↓p1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="25" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="ϕ↓p←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="31" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000046">
            <ENU>Reinforcement</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="22" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="c↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="21" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="ϕ↓s2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="20" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="n↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="c↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="18" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="ϕ↓s1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="n↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="45" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="30" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000045">
            <ENU>Geometry</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="b" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="44" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="29" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000044">
            <ENU>Loading</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="M↓Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TPanel Name="" ID="43" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="28" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
          <Texts>
            <ENU>
            </ENU>
          </Texts>
          <TCheckBox Name="TCheckBox" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="B0" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000002">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="" ID="56" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="29" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="load" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000056">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="" ID="55" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="28" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="mat" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000055">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="" ID="53" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="CSS" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000053">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TStringInput Name="TStringInput" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000001">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="38" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="H1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000038">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TPanel>
        <TCustomLibrary Name="" ID="54" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="34" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="REINF.EC" DataFile="EC_Reinf.xml" Collapsed="True" UseCombo="False" Category="Inclined top branch" Item="B 500 A">
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
                <P>B 500 A</P>
                <P>500</P>
                <P>1.05</P>
                <P>525</P>
                <P>434.78</P>
                <P>0.025</P>
                <P>0.0225</P>
                <P>0.002173913</P>
                <P>200000</P>
                <P>A</P>
                <P>true</P>
                <P>-0.025;-457.04;</P>
                <P>-0.0022;-434.78;</P>
                <P>0;0;</P>
                <P>0.0022;434.78;</P>
                <P>0.025;457.04;</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TCustomLibrary Name="TCustomLibrary" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="27" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="CONCRETE.EC" DataFile="EC_Concrete.xml" Collapsed="True" UseCombo="False" Category="Bilinear" Item="C 20/25">
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
        <TGroupBox Name="" ID="52" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000052">
            <ENU>National annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="49" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="34" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Standard EN">
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
    <MemberData Width="500">
      <TGroupBox Name="" ID="48" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="33" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000048">
          <ENU>Coefficients</ENU>
        </Texts>
        <TComboBox Name="" ID="51" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="k↓2←" VarNameVisible="True" InputColor="-1" DescPos="1" InputWidth="250" Values="500e-3|1" Index="0">
          <Texts TranslateID="DIALOG_000051">
            <ENU>for bending|for pure tension</ENU>
          </Texts>
        </TComboBox>
        <TComboBox Name="" ID="50" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="k↓1←" VarNameVisible="True" InputColor="-1" DescPos="1" InputWidth="250" Values="800e-3|1.6" Index="1">
          <Texts TranslateID="DIALOG_000050">
            <ENU>for high bond bars|for bars with an effectively plain surface</ENU>
          </Texts>
        </TComboBox>
        <TDoubleInput Name="TDoubleInput" ID="29" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="ξ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
      </TGroupBox>
      <TGroupBox Name="" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="32" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000047">
          <ENU>Prestressed reinforcement</ENU>
        </Texts>
        <TDoubleInput Name="TDoubleInput" ID="26" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="A↓p1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="25" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="ϕ↓p←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
      </TGroupBox>
    </MemberData>
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_SLE001_000134">
      <ENU>"National Annex parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_000134">
      <ENU>"National Annex parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_005851">
      <ENU>"Reinforcement parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_005851">
      <ENU>"Reinforcement parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_005853">
      <ENU>"Cross section parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_005853">
      <ENU>"Cross section parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_005854">
      <ENU>"The ration of reinforcement:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_005854">
      <ENU>"The ration of reinforcement:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_005855">
      <ENU>"Stress calculation:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_005855">
      <ENU>"Stress calculation:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_005856">
      <ENU>"Calculation crack width:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_005856">
      <ENU>"Calculation crack width:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_006297">
      <ENU>"Geometry"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_006297">
      <ENU>"Geometry"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_006353">
      <ENU>"Concrete material parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_006353">
      <ENU>"Concrete material parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_006388">
      <ENU>"Loading"</ENU>
    </Item>
    <Item TranslateID="BLOCK_SLE001_006388">
      <ENU>"Loading"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000024">
      <ENU>Description("x")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000024">
      <ENU>DESCRIPTION("x")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000025">
      <ENU>"Eff. height of conc. cross section"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000025">
      <ENU>"Eff. height of conc. cross section"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000026">
      <ENU>"Effective area of concrete cross section"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000026">
      <ENU>"Effective area of concrete cross section"</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000028">
      <ENU>Caption</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000029">
      <ENU>"Ration of bond strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000029">
      <ENU>"Ration of bond strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000030">
      <ENU>"Coefficient of materials"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000031">
      <ENU>"Prestressed reinforcement ration"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000032">
      <ENU>"Difference between stress of steel and concrete"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000034">
      <ENU>"Maximum crack distance"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000035">
      <ENU>"Crack width"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000041">
      <ENU>"Coefficient of load duration"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000041">
      <ENU>"Coefficient of load duration"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000043">
      <ENU>"Hello world!"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000043">
      <ENU>"Hello world!"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000047">
      <ENU>"Calculation of stress:"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000047">
      <ENU>"Calculation of stress:"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000048">
      <ENU>"Column with text"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000048">
      <ENU>"Column with text"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000049">
      <ENU>"and formula"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000049">
      <ENU>"and formula"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000053">
      <ENU>Description("d↓1←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000053">
      <ENU>DESCRIPTION("d↓1←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000054">
      <ENU>DESCRIPTION("d↓2←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000054">
      <ENU>Description("d↓2←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000055">
      <ENU>"remark: σs1 - stress in tension reinf. on section with crack."</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000055">
      <ENU>"remark: σs1 - stress in tension reinf. on section with crack."</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000056">
      <ENU>"Loading is long-term"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000056">
      <ENU>"Loading is long-term"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000057">
      <ENU>"Loading is short-term"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000057">
      <ENU>"Loading is short-term"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000058">
      <ENU>"h = " &amp; h</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000058">
      <ENU>"h = " &amp; h</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000059">
      <ENU>DESCRIPTION("h")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000059">
      <ENU>Description("h")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000060">
      <ENU>"b = " &amp; b</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000060">
      <ENU>"b = " &amp; b</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000061">
      <ENU>DESCRIPTION("b")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000061">
      <ENU>Description("b")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000065">
      <ENU>Description("A↓s2←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000065">
      <ENU>DESCRIPTION("A↓s2←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000066">
      <ENU>DESCRIPTION("A↓s1←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000066">
      <ENU>Description("A↓s1←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000067">
      <ENU>"Calculation of crack width according to Eurocode 2"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000067">
      <ENU>"Calculation of crack width according to Eurocode 2"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000068">
      <ENU>"Condition Δε↓sc←≥0.6 * σ↓s1← / E↓s← is not fulfilled, the value of strain difference between is:"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000068">
      <ENU>"Condition Δε↓sc←≥0.6 * σ↓s1← / E↓s← is not fulfilled, the value of strain difference between is:"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000071">
      <ENU>"Compression reinforcement (number and diameter)"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000071">
      <ENU>"Compression reinforcement (number and diameter)"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000072">
      <ENU>"n↓1 ←= " &amp; n↓1← &amp; "  ϕ↓s1← = " &amp; ϕ↓s1←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000072">
      <ENU>"n↓1 ←= " &amp; n↓1← &amp; "  ϕ↓s1← = " &amp; ϕ↓s1←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000074">
      <ENU>"Tension reinforcement (number and diameter)"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000074">
      <ENU>"Tension reinforcement (number and diameter)"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000075">
      <ENU>"It can be substitued for prestressed members by Δσp"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000075">
      <ENU>"It can be substitued for prestressed members by Δσp"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000077">
      <ENU>"ϕ↓p← = " &amp; ϕ↓p← &amp; "  A↓p1← = " &amp; A↓p1←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000077">
      <ENU>"ϕ↓p← = " &amp; ϕ↓p← &amp; "  A↓p1← = " &amp; A↓p1←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000079">
      <ENU>"Prestressed reinf. diameter (subst. diameter and area)"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000079">
      <ENU>"Prestressed reinf. diameter (subst. diameter and area)"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000080">
      <ENU>"in prestressed reinf. from zero status of compressive strain of concrete on the same level."</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000080">
      <ENU>"in prestressed reinf. from zero status of compressive strain of concrete on the same level."</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000083">
      <ENU>"n↓2 ←= " &amp; n↓2← &amp; "  ϕ↓s2← = " &amp; ϕ↓s2←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000083">
      <ENU>"n↓2 ←= " &amp; n↓2← &amp; "  ϕ↓s2← = " &amp; ϕ↓s2←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000095">
      <ENU>"α↓e← = " &amp; 'E↓s←/E↓cm←' &amp; " = " &amp; E↓s←/E↓cm← &amp; " = " &amp; α↓e←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000095">
      <ENU>"α↓e← = " &amp; 'E↓s←/E↓cm←' &amp; " = " &amp; E↓s←/E↓cm← &amp; " = " &amp; α↓e←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000096">
      <ENU>"α↓e← = " &amp; α↓e←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000096">
      <ENU>"α↓e← = " &amp; α↓e←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000097">
      <ENU>"x = " &amp; '(α↓e←/b)*[A↓s1←+A↓s2←]*[-1+SQRT(1+(2*b/α↓e←)*(A↓s1←*d↓1←+A↓s2←*d↓2←)/[A↓s1←+A↓s2←]↑2←)]' &amp; " = "</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000097">
      <ENU>→000016"x = " &amp; '(α↓e←/b)*[A↓s1←+A↓s2←]*[-1+SQRT(1+(2*b/α↓e←)*(A↓s1←*d↓1←+A↓s2←*d↓2←)/[A↓s1←+A↓s2←]↑2←)]' &amp; " = "</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000098">
      <ENU>"= " &amp; (α↓e←/b)*[A↓s1←+A↓s2←]*[-1+SQRT(1+(2*b/α↓e←)*(A↓s1←*d↓1←+A↓s2←*d↓2←)/[A↓s1←+A↓s2←]↑2←)] &amp; " = " &amp; VAL(x*10↑3←, 2) &amp; " mm"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000098">
      <ENU>"= " &amp; (α↓e←/b)*[A↓s1←+A↓s2←]*[-1+SQRT(1+(2*b/α↓e←)*(A↓s1←*d↓1←+A↓s2←*d↓2←)/[A↓s1←+A↓s2←]↑2←)] &amp; " = " &amp; Val(x*10↑3←, 2) &amp; " mm"</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000099">
      <ENU>"x = " &amp; x</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000099">
      <ENU>"x = " &amp; x</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_000112">
      <ENU>IO.SetupNA.EC_1991_1_1.Name &amp; ", §7.3.4"</ENU>
    </Item>
    <Item ID="TEXT_SLE001_000112">
      <ENU>IO.SetupNA.EC_1991_1_1.Name &amp; ", §7.3.4"</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006294">
      <ENU>"M↓Ed← = 0 kNm --&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006294">
      <ENU>"M↓Ed← = 0 kNm --&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006295">
      <ENU>"Calculation stopped!"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006295">
      <ENU>"Calculation stopped!"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006355">
      <ENU>"Concrete"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006355">
      <ENU>"Concrete"</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006356">
      <ENU>IO.CONCRETE.EC.Item</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006358">
      <ENU>"Reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006358">
      <ENU>"Reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006359">
      <ENU>IO.REINF.EC.Item</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006360">
      <ENU>DESCRIPTION("E↓s←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006360">
      <ENU>Description("E↓s←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006361">
      <ENU>"E↓s← = " &amp; E↓s←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006361">
      <ENU>"E↓s← = " &amp; E↓s←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006362">
      <ENU>DESCRIPTION("f↓ct,eff←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006362">
      <ENU>Description("f↓ct,eff←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006363">
      <ENU>"f↓ct,eff← = " &amp; f↓ct,eff←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006363">
      <ENU>"f↓ct,eff← = " &amp; f↓ct,eff←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006364">
      <ENU>Description("c↓1←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006364">
      <ENU>DESCRIPTION("c↓1←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006365">
      <ENU>"c↓1← = " &amp; c↓1←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006365">
      <ENU>"c↓1← = " &amp; c↓1←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006366">
      <ENU>DESCRIPTION("c↓2←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006366">
      <ENU>Description("c↓2←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006367">
      <ENU>"c↓2← = " &amp; c↓2←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006367">
      <ENU>"c↓2← = " &amp; c↓2←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006376">
      <ENU>"Note: Cracks are expected after 28 days"</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006376">
      <ENU>"Note: Cracks are expected after 28 days"</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006377">
      <ENU>DESCRIPTION("E↓cm←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006377">
      <ENU>Description("E↓cm←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006378">
      <ENU>"E↓cm← = " &amp; E↓cm←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006378">
      <ENU>"E↓cm← = " &amp; E↓cm←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006379">
      <ENU>Description("ξ")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006379">
      <ENU>DESCRIPTION("ξ")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006380">
      <ENU>"ξ = " &amp; ξ</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006380">
      <ENU>"ξ = " &amp; ξ</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006381">
      <ENU>Description("k↓1←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006381">
      <ENU>DESCRIPTION("k↓1←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006382">
      <ENU>"k↓1← = " &amp; k↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006382">
      <ENU>"k↓1← = " &amp; k↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006383">
      <ENU>Description("k↓2←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006383">
      <ENU>DESCRIPTION("k↓2←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006384">
      <ENU>"k↓2← = " &amp; k↓2←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006384">
      <ENU>"k↓2← = " &amp; k↓2←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006385">
      <ENU>DESCRIPTION("k↓3←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006385">
      <ENU>Description("k↓3←")</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006386">
      <ENU>"k↓3← = " &amp; k↓3←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006386">
      <ENU>"k↓3← = " &amp; k↓3←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006387">
      <ENU>"k↓4← = " &amp; k↓4←</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006387">
      <ENU>"k↓4← = " &amp; k↓4←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006389">
      <ENU>DESCRIPTION("M↓Ed←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006389">
      <ENU>Description("M↓Ed←")</ENU>
    </Item>
    <Item TranslateID="TEXT_SLE001_006390">
      <ENU>"M↓Ed← = " &amp; M↓Ed←</ENU>
    </Item>
    <Item ID="TEXT_SLE001_006390">
      <ENU>"M↓Ed← = " &amp; M↓Ed←</ENU>
    </Item>
  </Texts>
</Root>