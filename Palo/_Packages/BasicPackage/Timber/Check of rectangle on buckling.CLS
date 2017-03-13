<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="5a799d5c-3c8f-48e3-8c4d-cad788214df1">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">void UpdateDialog() { 
    Dialog.GetComponentByName("Type").Visible →INI400_006273= Combination == 0 &amp;&amp; IO.SetupNA.EC_NA.Code != "BS" &amp;&amp; IO.SetupNA.EC_NA.Code != "SFS" &amp;&amp; IO.SetupNA.EC_NA.Code != "NF" &amp;&amp; IO.SetupNA.EC_NA.Code != "DIN" &amp;&amp; IO.SetupNA.EC_NA.Code != "IS"; 
    Dialog.GetComponentByName("TypeBS").Visible →INI400_006289= Combination == 0 &amp;&amp; IO.SetupNA.EC_NA.Code == "BS"; 
    Dialog.GetComponentByName("TypeSFS").Visible →INI400_006290= Combination == 0 &amp;&amp; IO.SetupNA.EC_NA.Code == "SFS"; 
    Dialog.GetComponentByName("TypeNF").Visible →INI400_006291= Combination == 0 &amp;&amp; IO.SetupNA.EC_NA.Code == "NF"; 
    Dialog.GetComponentByName("TypeDIN").Visible →INI400_006292= Combination == 0 &amp;&amp; IO.SetupNA.EC_NA.Code == "DIN"; 
    Dialog.GetComponentByName("TypeIS").Visible →INI400_006293= Combination == 0 &amp;&amp; IO.SetupNA.EC_NA.Code == "IS"; 
} 

→INI400_006281BLOCK { //IO inputs 
    π →INI400_000056= Math.PI; 
    IF(IO.IsStandalone) { //Standalone IO inputs
        Name →INI400_006323= IO.TIMBER.EC.Item; 
        BeamName →INI400_007983= ""; 
        f↓c,0,k← →INI400_007974= IO.TIMBER.EC.fc0k; 
        E↓0,05← →INI400_007975= IO.TIMBER.EC.E005; 
    } ELSE { //SEN IO inputs
        Name →INI400_006324= IO.Material.Name; 
        BeamName →INI400_007981= IO.Beam.Member.Name; 
        b →INI400_006282= IO.CS.Geometry.B; 
        h →INI400_006283= IO.CS.Geometry.H; 
        N↓Ed← →INI400_006284= ABS(IO.InternalForces.N); 
        FormCode →INI400_006322= IO.CS.Geometry.FormCode; 
        L↓y← →INI400_006285= IO.Section.BucklingData.beta_y*IO.Section.BucklingData.Ly; 
        L↓z← →INI400_006286= IO.Section.BucklingData.beta_z*IO.Section.BucklingData.Lz; 
        E↓0,05← →INI400_006287= IO.Material.EC.E005; 
        f↓c,0,k← →INI400_006288= IO.Material.EC.Fc0k; 
        β↓c← →INI400_007976= 0.2; 
        IF(IO.InternalForces.N &gt; 0) { 
            Tens →INI400_007967= True; 
        } ELSE { 
            Tens →INI400_007968= False; 
        } 
    } 
} 

→INI400_006266BLOCK { //National annexes
    →INI400_006267BLOCK { //NA.2.2 Clause 2.4.1 Design value of material property - Partial factors, Paragraph (1)P
        object Clause2_4_1_1P →INI400_006268= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1995\EN_1995_1_1\Clause_2.4.1(1)P.CLC"); 
        Clause2_4_1_1P.Type →INI400_006270= double Type; 
        Clause2_4_1_1P.Combination →INI400_006274= double Combination; 
        →INI400_006271Clause2_4_1_1P.Calculate(false); 
        double γ↓M← →INI400_006272= Clause2_4_1_1P.γ↓M←; 
    } 
} 

→INI400_006263BLOCK { 
    IF(H1) { 
        →INI400_006260TEXT("Check of rectangle cross section on buckling"); 
        →INI400_007982TEXT(BeamName); 
        →INI400_000103TEXT(IO.SetupNA.EC_1995_1_1.Name); 
    } 
    IF(PrintCaption) { 
        →INI400_006265TEXT(Caption); 
    } 
} 

IF(!IO.IsStandalone &amp;&amp; FormCode != 2003) { 
    →INI400_007955TEXT("Error: Cross-section is not rectangular."); 
    s →INI400_007956= 3; //Unit check 3.0
    N↓Rd← →INI400_007957= 0; //Setting other results on 0
    k↓c,min← →INI400_007958= 0; 
    Exit(); 
} 
IF(!IO.IsStandalone &amp;&amp; Tens) { 
    →INI400_007970TEXT("Warning: Cross-section is in tension. Normal force is not used in check."); 
    N↓Ed← →INI400_007971= 0; 
} 

IF(PrintInput) { 
    →INI400_006252BLOCK("Input parameters") { 
        →INI400_006318TEXT("Timber"); 
        →INI400_006319TEXT(Name); 
        →INI400_007972TEXT(Description("f↓c,0,k←")); 
        →INI400_007973TEXT("f↓c,0,k← = " &amp; f↓c,0,k←); 
        →INI400_007952TEXT(Description("E↓0,05←")); 
        →INI400_007953TEXT("E↓0,05← = " &amp; E↓0,05←); 
        →INI400_000071TEXT(Description("h")); 
        →INI400_000070TEXT("h = " &amp; h); 
        →INI400_000069TEXT(Description("b")); 
        →INI400_000075TEXT("b = " &amp; b); 
        →INI400_000083TEXT(Description("N↓Ed←")); 
        →INI400_000082TEXT("N↓Ed← = " &amp; N↓Ed←); 
        →INI400_006312TEXT(Description("L↓y←")); 
        →INI400_006313TEXT("L↓y← = " &amp; L↓y←); 
        →INI400_006314TEXT(Description("L↓z←")); 
        →INI400_006315TEXT("L↓z← = " &amp; L↓z←); 
        →INI400_006316TEXT(Description("β↓c←")); 
        →INI400_006317TEXT("β↓c← = " &amp; β↓c←); 
    } 
    →INI400_000104PAGEBREAK(); 
} 
IF(param) { 
    →INI400_006254BLOCK("Cross section parameters") { 
        →INI400_000042IMG("IMG_0"); 
        →INI400_000040TEXT("h = " &amp; h); 
        →INI400_000041TEXT("b = " &amp; b); 
        A →INI400_000001= b*h; 
        I↓y← →INI400_000002= (1/12)*b*h↑3←; 
        I↓z← →INI400_000003= (1/12)*h*b↑3←; 
        i↓y← →INI400_000045= ODM(I↓y←/A); 
        i↓z← →INI400_000046= ODM(I↓z←/A); 
    } 
    →INI400_000105PAGEBREAK(); 
} ELSE { 
    A →INI400_006275= b*h; 
    I↓y← →INI400_006276= (1/12)*b*h↑3←; 
    I↓z← →INI400_000108= (1/12)*h*b↑3←; 
    i↓y← →INI400_000109= ODM(I↓y←/A); 
    i↓z← →INI400_000110= ODM(I↓z←/A); 
} 

→INI400_006255BLOCK("Buckling coefficient y") { 
    IF(L↓y← != 0) { 
        →INI400_000085TEXT("Ration of slenderness - y"); 
        λ↓y← →INI400_000004= L↓y←/i↓y←; 
        λ↓rel,y← →INI400_000005= (λ↓y←/π)*ODM(f↓c,0,k←/E↓0,05←); 
        →INI400_000088TEXT("Coefficients"); 
        k↓y← →INI400_000006= 0.5*[1+β↓c←*[λ↓rel,y←-0.3]+λ↓rel,y←↑2←]; 
        k↓c,y← →INI400_000007= 1/(k↓y←+ODM(k↓y←↑2←-λ↓rel,y←↑2←)); 
        IF(k↓c,y← &gt; 1) { 
            →INI400_000028TEXT("=&gt;"); 
            k↓c,y← →INI400_000008= 1; 
        } 
    } ELSE { 
        →INI400_000030TEXT("Structure is stabile in y axis =&gt;"); 
        k↓c,y← →INI400_000009= 1; 
    } 
} 
→INI400_000106PAGEBREAK(); 
→INI400_006256BLOCK("Buckling coefficient z") { 
    IF(L↓z← != 0) { 
        →INI400_000086TEXT("Ration of slenderness - z"); 
        λ↓z← →INI400_000010= L↓z←/i↓z←; 
        λ↓rel,z← →INI400_000011= (λ↓z←/π)*ODM(f↓c,0,k←/E↓0,05←); 
        →INI400_000087TEXT("Coefficients"); 
        k↓z← →INI400_000012= 0.5*[1+β↓c←*[λ↓rel,z←-0.3]+λ↓rel,z←↑2←]; 
        k↓c,z← →INI400_000013= 1/(k↓z←+ODM(k↓z←↑2←-λ↓rel,z←↑2←)); 
        IF(k↓c,z← &gt; 1) { 
            →INI400_000032TEXT("=&gt;"); 
            k↓c,z← →INI400_000014= 1; 
        } 
    } ELSE { 
        →INI400_000034TEXT("Structure is stabile in z axis =&gt;"); 
        k↓c,z← →INI400_000015= 1; 
    } 
} 
→INI400_000107PAGEBREAK(); 

object k_mod →INI400_006278= LoadExternCLC("Modification factor kmod for timber.CLC"); 
k_mod.SC →INI400_007977= SC; 
k_mod.LDC →INI400_006279= LDC; 
→INI400_006280k_mod.Draw(false); 
k↓mod← →INI400_006261= k_mod.k↓mod←; 
→INI400_006294PAGEBREAK(); 
→INI400_006257BLOCK("Bearing capacity in buckling") { 
    →INI400_006321TEXT(Description("f↓c,0,k←")); 
    →INI400_006320TEXT("f↓c,0,k← = " &amp; f↓c,0,k←); 
    →INI400_000084TEXT("Design compression strength parallel to grains"); 
    f↓c,0,d← →INI400_000053= (k↓mod←*f↓c,0,k←)/γ↓M←; 
    →INI400_000089TEXT("Final coeff. of buckling"); 
    k↓c,min← →INI400_000054= MIN(k↓c,y←, k↓c,z←); 
    →INI400_000090TEXT("Bearing capacity"); 
    N↓Rd← →INI400_000055= k↓c,min←*A*f↓c,0,d←; 
} 
→INI400_006277BLOCK("Check") { 
    s →INI400_000052= N↓Ed←/N↓Rd←; 
    IF(s &lt; 1) { 
        →INI400_006310TEXT("&lt; 1"); 
        →INI400_000037TEXT("=&gt; Cross section is SUFFICIENT"); 
    } ELSE { 
        →INI400_006311TEXT("&gt; 1"); 
        →INI400_000038TEXT("=&gt; Cross section is INSUFFICIENT!"); 
    } 
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="1000" Material="4" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="16" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Timber_check_compression.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Check of rectagle on buckling</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
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
      <Variable Modifier="Public" Name="A" ESA_ID="" Type="Double" Value="37.5e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="150e-3" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>Cross section width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="BeamName" ESA_ID="" Type="String" Value="">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause2_4_1_1P" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Combination" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Combination">
          <ENU>Type of combination</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="E↓0,05←" ESA_ID="" Type="Double" Value="6.7e9" Precision="2">
        <Description TranslateID="VARIABLE_E↓0,05←">
          <ENU>5% fractile of Youngs modulus</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e9" Dim="GPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓c,0,d←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓c,0,k←" ESA_ID="" Type="Double" Value="20e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓c,0,k←">
          <ENU>Compression strength parallel to grains</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="FormCode" ESA_ID="" Type="Double" Value="2003" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="250e-3" Precision="2">
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
      <Variable Modifier="Public" Name="i↓y←" ESA_ID="" Type="Double" Value="72.16878e-3" Precision="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="I↓y←" ESA_ID="" Type="Double" Value="195.3125e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="i↓z←" ESA_ID="" Type="Double" Value="43.30127e-3" Precision="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="I↓z←" ESA_ID="" Type="Double" Value="70.3125e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="k_mod" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="k↓c,min←" ESA_ID="Result.3" Type="Double" Value="541.5555e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="124" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓c,y←" ESA_ID="" Type="Double" Value="866.1408e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓c,z←" ESA_ID="" Type="Double" Value="541.5555e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓mod←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description TranslateID="VARIABLE_k↓mod←">
          <ENU>Modification coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓y←" ESA_ID="" Type="Double" Value="803.6115e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓z←" ESA_ID="" Type="Double" Value="1.316372" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="L↓y←" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_L↓y←">
          <ENU>Effective length y-y</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="L↓z←" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_L↓z←">
          <ENU>Effective length z-z</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="LDC" ESA_ID="MemberData.LDC" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_LDC">
          <ENU>Load duration class</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓Ed←" ESA_ID="" Type="Double" Value="200000" Precision="2">
        <Description TranslateID="VARIABLE_N↓Ed←">
          <ENU>Axial force</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="N↓Rd←" ESA_ID="Result.2" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="12" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="Name" ESA_ID="" Type="String" Value="C 22 (EN 338)">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="param" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_param">
          <ENU>Print cross section parameters</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintInput" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintInput">
          <ENU>Print input parameters</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="s" ESA_ID="Result.1" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="66" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="SC" ESA_ID="MemberData.SC" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_SC">
          <ENU>Service Class</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Tens" ESA_ID="" Type="Boolean" Value="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Type" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Type">
          <ENU>Type of timber</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="β↓c←" ESA_ID="" Type="Double" Value="200e-3" Precision="2">
        <Description TranslateID="VARIABLE_β↓c←">
          <ENU>Coefficient of geometrical imprefection</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓M←" ESA_ID="" Type="Double" Value="1.3" Precision="2">
        <Description TranslateID="VARIABLE_γ↓M←">
          <ENU>Partial safety factor</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓rel,y←" ESA_ID="" Type="Double" Value="722.9356e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓rel,z←" ESA_ID="" Type="Double" Value="1.204893" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓y←" ESA_ID="" Type="Double" Value="41.56922" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓z←" ESA_ID="" Type="Double" Value="69.28203" Precision="2">
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
      <Variable Modifier="Public" Name="σ↓m,crit←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="σ↓m,y,d←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="σ↓m,z,d←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
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
      <VC ID="INI400_000001">
        <Set Vis="1" Prev="INI400_000042" Style="0" StyleName="" X="180" Y="203" Hor="0" Ver="1" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000042" Style="0" StyleName="" X="180" Y="193" Hor="0" Ver="1" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="120" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="41" Hor="0" Ver="1" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="41" Hor="0" Ver="1" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="41" Hor="0" Ver="1" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="231" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="221" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="125" Y="120" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="67" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="67" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="67" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="265" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="255" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="120" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="100" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="100" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="100" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="322" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="326" Hor="0" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="171" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="202" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="202" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="202" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="362" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="230" Y="326" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="125" Y="120" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="230" Y="202" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="230" Y="202" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="230" Y="202" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="392" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="20" Y="311" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="20" Y="133" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="245" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="245" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="245" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000007">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="439" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="364" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="120" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="281" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="281" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="281" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000008">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="432" Y="348" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="442" Y="348" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="442" Y="170" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="432" Y="348" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="432" Y="348" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="432" Y="348" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000009">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="230" Y="318" Hor="4" Ver="2" SpX="2" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="240" Y="322" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="240" Y="166" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="197" Y="183" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="197" Y="183" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="197" Y="183" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="508" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="446" Hor="0" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="171" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="375" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="375" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="375" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000011">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="547" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="230" Y="446" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="125" Y="120" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="230" Y="375" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="230" Y="375" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="230" Y="375" Hor="0" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000012">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="577" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="20" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="20" Y="286" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="418" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="418" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="418" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000013">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="624" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="483" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="120" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="454" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000014">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="432" Y="525" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="442" Y="525" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="442" Y="357" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="432" Y="525" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="432" Y="525" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="432" Y="525" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000015">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="214" Y="498" Hor="4" Ver="2" SpX="2" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="224" Y="437" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="382" Y="166" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="197" Y="244" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="197" Y="244" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="197" Y="244" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000028">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="348" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="348" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="170" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="348" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="348" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="348" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000030">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="318" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="322" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="166" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="183" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="183" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="183" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000032">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="525" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="525" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="357" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="525" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="525" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="406" Y="525" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000034">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="498" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="437" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="167" Y="166" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="244" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="244" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="244" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000037">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="181" Y="821" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="191" Y="670" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="191" Y="363" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="189" Y="439" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="189" Y="439" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="189" Y="439" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000038">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="199" Y="780" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="219" Y="665" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="187" Y="348" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="213" Y="417" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="213" Y="417" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="213" Y="417" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000040">
        <Set Vis="1" Prev="INI400_000042" Style="1" StyleName="" X="92" Y="196" Hor="4" Ver="2" SpX="0" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="INI400_000042" Style="1" StyleName="" X="92" Y="186" Hor="4" Ver="2" SpX="0" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="92" Y="219" Hor="4" Ver="2" SpX="0" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="92" Y="67" Hor="4" Ver="2" SpX="0" SpY="-10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="92" Y="67" Hor="4" Ver="2" SpX="0" SpY="-10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="92" Y="67" Hor="4" Ver="2" SpX="0" SpY="-10" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000041">
        <Set Vis="1" Prev="INI400_000042" Style="1" StyleName="" X="16.6" Y="264" Hor="2" Ver="4" SpX="-12" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="INI400_000042" Style="1" StyleName="" X="16.6" Y="254" Hor="2" Ver="4" SpX="-12" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="17.5" Y="287" Hor="2" Ver="4" SpX="-12" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="17.5" Y="135" Hor="2" Ver="4" SpX="-12" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="17.5" Y="135" Hor="2" Ver="4" SpX="-12" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="17.5" Y="135" Hor="2" Ver="4" SpX="-12" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000042">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="206" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="196" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="77" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="77" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="77" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|14|0|2" Font2="Arial|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000045">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="265" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="414" Y="308" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="424" Y="188" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="414" Y="67" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="414" Y="67" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="414" Y="67" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000046">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="265" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="525" Y="308" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="535" Y="188" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="414" Y="100" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="414" Y="100" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="414" Y="100" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_000052">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="821" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="670" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="363" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="417" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="417" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="417" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000053">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="180" Y="718" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="562" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="263" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="300" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="300" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="300" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000054">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="180" Y="746" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="591" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="284" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="330" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="330" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="330" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="5" />
      </VC>
      <VC ID="INI400_000055">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="767" Hor="0" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="616" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="309" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="356" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="356" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="356" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|11.7|0|2" Font2="Arial|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000056">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000069">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="86.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="72" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="72" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000070">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="67" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000071">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="52.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="52.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000075">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="86.9" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="81.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="125" Y="67" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000082">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="107" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="96.7" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="67" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000083">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="91.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="91.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000084">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="693" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="535" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="248" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000085">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="322" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="306" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="161" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000086">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="508" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="161" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000087">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="577" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="230" Y="478" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="258" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000088">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="392" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="230" Y="364" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="258" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000089">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="746" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="588" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="301" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000090">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="767" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="316" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|5|2" Font2="Arial|11.7|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000103">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000104">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="180" Y="120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="110" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="80.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000105">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="285" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="275" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="134" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000106">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="471" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="395" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="226" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000107">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="656" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="515" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="226" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000108">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="268" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="268" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="268" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="268" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="268" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="268" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000109">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="307" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="307" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="307" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="307" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="307" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="307" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000110">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006252">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006254">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006255">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006256">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006257">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006260">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.43" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006261">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006263">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006264">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006265">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|14.3|5|2" Font2="Arial|14.3|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006266">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006267">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006268">
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
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006272">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="82.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="82.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006273">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006274">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006275">
        <Set Vis="0" Prev="INI400_000042" Style="0" StyleName="" X="180" Y="206" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="206" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="206" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="206" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="206" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="206" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006276">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="234" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="234" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="234" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="234" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="234" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="180" Y="234" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13.3|0|2" Font2="Arial|13.3|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006277">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006278">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006279">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006280">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006281">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006282">
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
      <VC ID="INI400_006284">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006285">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006286">
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
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006290">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006291">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006292">
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
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="656" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="515" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="226" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006295">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="656" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="515" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="150" Y="226" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006310">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006311">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006312">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="91.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="91.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006313">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="107" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="96.7" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="250" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006314">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="91.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="91.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006315">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="107" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="96.7" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="125" Y="67" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006316">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="91.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="91.9" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006317">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="107" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="96.7" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="250" Y="67" Hor="0" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006318">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="693" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006319">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="67" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006320">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="180" Y="718" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006321">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="693" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006322">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006323">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006324">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007950">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="67" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="81.9" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007951">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="52.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="52.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007952">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="52.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="52.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007953">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="67" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="450" Y="81.9" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007955">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="693" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="693" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="693" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007956">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007957">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007958">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007959">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007967">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007968">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007970">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="693" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="693" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="693" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007971">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007972">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="52.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="52.2" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007973">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="67" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="67" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="67" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="6" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007974">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007975">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007976">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007977">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007981">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007982">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="22.3" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13.3|5|2" Font2="Tahoma|13.3|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007983">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007984">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="IMG_0" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TGroupBox Name="" ID="27" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000027">
            <ENU>Coefficients</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Arial|11.3|0|2" VarName="β↓c←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="26" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000026">
            <ENU>Buckling lengths</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Arial|11.3|0|2" VarName="L↓z←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Arial|11.3|0|2" VarName="L↓y←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="25" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000025">
            <ENU>Cross section dimensions</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Arial|11.3|0|2" VarName="b" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Arial|11.3|0|2" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="24" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000024">
            <ENU>Loading</ENU>
          </Texts>
          <TComboBox Name="" ID="40" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="LDC" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2|3|4" Index="1">
            <Texts TranslateID="DIALOG_000040">
              <ENU>Permanent action|Long-term action|Medium-term action|Short-term action|Instantaneous action</ENU>
            </Texts>
          </TComboBox>
          <TDoubleInput Name="TDoubleInput" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="N↓Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
        </TGroupBox>
        <TPanel Name="" ID="23" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="19" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
          <Texts>
            <ENU>
            </ENU>
          </Texts>
          <TStringInput Name="TStringInput" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintInput" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000019">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000001">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="21" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000021">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCustomLibrary Name="" ID="29" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="Timber_kmod" DataFile="EC_Timber_kmod.xml" Collapsed="True" UseCombo="False" Category="Service class 2" Item="Solid timber">
            <Data>
              <Header>
                <PropertySet Symbol="kmod,pa" ESA_ID="Timber_kmod.pa" Unit="" Type="Numeric" />
                <PropertySet Symbol="kmod,la" ESA_ID="Timber_kmod.la" Unit="" Type="Numeric" />
                <PropertySet Symbol="kmod,ma" ESA_ID="Timber_kmod.ma" Unit="" Type="Numeric" />
                <PropertySet Symbol="kmod,sa" ESA_ID="Timber_kmod.sa" Unit="" Type="Numeric" />
                <PropertySet Symbol="kmod,ia" ESA_ID="Timber_kmod.ia" Unit="" Type="Numeric" />
                <PropertySet Symbol="kdef" ESA_ID="Timber_kdef" Unit="" Type="Numeric" />
                <PropertySet Symbol="Type" ESA_ID="Type" Unit="" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>Service class 2</P>
                  <P>Solid timber</P>
                  <P>0.6</P>
                  <P>0.7</P>
                  <P>0.8</P>
                  <P>0.9</P>
                  <P>1.1</P>
                  <P>0.8</P>
                  <P>0</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
          <TCustomLibrary Name="TCustomLibrary" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="TIMBER.EC" DataFile="EC_Timber.xml" Collapsed="True" UseCombo="False" Category="Timber EC 1995" Item="C 22 (EN 338)">
            <Data>
              <Header>
                <PropertySet Symbol="f↓mk←" ESA_ID="fmk" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓t,0,k←" ESA_ID="ft0k" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓t,90,k←" ESA_ID="ft90k" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓c,0,k←" ESA_ID="fc0k" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓c,90,k←" ESA_ID="fc90k" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓v,k←" ESA_ID="fvk" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="E↓0,mean←" ESA_ID="E0" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="E↓0,05←" ESA_ID="E005" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="E↓90,mean←" ESA_ID="E90" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="G↓mean←" ESA_ID="G" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="ρ↓k←" ESA_ID="ρ" Unit="kg/m↑3←" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>Timber EC 1995</P>
                  <P>C 22 (EN 338)</P>
                  <P>22</P>
                  <P>13</P>
                  <P>0.3</P>
                  <P>20</P>
                  <P>5.1</P>
                  <P>2.4</P>
                  <P>10</P>
                  <P>6.7</P>
                  <P>0.33</P>
                  <P>0.63</P>
                  <P>340</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
        </TPanel>
        <TGroupBox Name="" ID="50" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000050">
            <ENU>National Annex</ENU>
          </Texts>
          <TComboBox Name="TypeDIN" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Type" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2|3|4" Index="0">
            <Texts TranslateID="DIALOG_000013">
              <ENU>Solid wood, chipboard, hard fiber boards, medium hard fibreboard, MDF fiberboard, soft fiberboard, laminated veneer lumber, plywood, OSB, glulam|Steel connections subjected to bending dowel type fasteners|Steel connections to shear stress parts in the detection against the yield strength in net section|Steel connections - Plate detection is stable for nail plates|Glued laminated timber, laminated timber, solid wood panels, fiber reinforced gypsum boards, gypsum boards, cement bonded particle boards</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="TypeNF" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Type" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2|3|4|5|6|7|8|9|10" Index="0">
            <Texts TranslateID="DIALOG_000012">
              <ENU>Solid timber|Glued laminated timber|LVL, plywood, OSB|Particleboards|Fibreboards, hard|Fibreboards, medium|Fibreboards, MDF|Fibreboards, soft|Connections|Punched metal plate fasteners|Other materials based on timber</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Type" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Type" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2|3|4|5|6|7|8|9" Index="0">
            <Texts TranslateID="DIALOG_000008">
              <ENU>Solid timber|Glued laminated timber|LVL, plywood, OSB|Particleboards|Fibreboards, hard|Fibreboards, medium|Fibreboards, MDF|Fibreboards, soft|Connections|Punched metal plate fasteners</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="TypeSFS" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Type" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2|3|4|5|6" Index="0">
            <Texts TranslateID="DIALOG_000011">
              <ENU>Solid timber and round timber generally|Coniferous sawn timber in strength class ≥ C35|Glued laminated timber, LVL|Wood-based panels|Connections|Punched metal plate fasteners - anchorage strength|Punched metal plate fasteners - plate (steel) strength</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="TypeBS" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Type" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2|3|4|5|6|7|8|9|10|11" Index="0">
            <Texts TranslateID="DIALOG_000010">
              <ENU>Solid timber, untreated|Solid timber, preservative-treated|Glued laminated timber|LVL, plywood, OSB|Particleboard|Fibreboards, hard|Fibreboards, medium|Fibreboards, MDF|Fibreboards, soft|Connections (except for punched metal plate faseners)|Punched metal plate fasteners, anchorage strength|Punched metal plate fasteners, plate (steel) strength</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="TypeIS" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Type" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2|3|4|5|6|7|8|9|10|11" Index="0">
            <Texts TranslateID="DIALOG_000014">
              <ENU>Solid timber|Glued laminated timber|LVL, plywood, OSB|Particleboards|Fibreboards, hard|Fibreboards, medium|Fibreboards, MDF|Fibreboards, soft|Connections - All except axial loads|Connections - bolts and screws subjected to axial load|Punched metal plate fasteners - timber strength|Punched metal plate fasteners - steel strength</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Combination" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1" Index="0">
            <Texts TranslateID="DIALOG_000009">
              <ENU>Fundamental|Accidental</ENU>
            </Texts>
          </TComboBox>
          <TCustomLibrary Name="" ID="49" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Standard EN">
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
      <TGroupBox Name="" ID="45" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000045">
          <ENU>Parameters</ENU>
        </Texts>
        <TComboBox Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="LDC" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="0|1|2|3|4" Index="1">
          <Texts TranslateID="DIALOG_000046">
            <ENU>Permanent action|Long-term action|Medium-term action|Short-term action|Instantaneous action</ENU>
          </Texts>
        </TComboBox>
        <TComboBox Name="" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="SC" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="1|2|3" Index="1">
          <Texts TranslateID="DIALOG_000047">
            <ENU>Service class 1|Service class 2|Service class 3</ENU>
          </Texts>
        </TComboBox>
      </TGroupBox>
    </MemberData>
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_INI400_006252">
      <ENU>"Input parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006254">
      <ENU>"Cross section parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006255">
      <ENU>"Buckling coefficient y"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006256">
      <ENU>"Buckling coefficient z"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006257">
      <ENU>"Bearing capacity in buckling"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006277">
      <ENU>"Check"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000028">
      <ENU>"=&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000030">
      <ENU>"Structure is stabile in y axis =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000032">
      <ENU>"=&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000034">
      <ENU>"Structure is stabile in z axis =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000037">
      <ENU>"=&gt; Cross section is SUFFICIENT"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000038">
      <ENU>"=&gt; Cross section is INSUFFICIENT!"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000040">
      <ENU>"h = " &amp; h</ENU>
    </Item>
    <Item ID="TEXT_INI400_000041">
      <ENU>"b = " &amp; b</ENU>
    </Item>
    <Item ID="TEXT_INI400_000069">
      <ENU>Description("b")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000070">
      <ENU>"h = " &amp; h</ENU>
    </Item>
    <Item ID="TEXT_INI400_000071">
      <ENU>Description("h")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000075">
      <ENU>"b = " &amp; b</ENU>
    </Item>
    <Item ID="TEXT_INI400_000082">
      <ENU>"N↓Ed← = " &amp; N↓Ed←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000083">
      <ENU>Description("N↓Ed←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000084">
      <ENU>"Design compression strength parallel to grains"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000085">
      <ENU>"Ration of slenderness - y"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000086">
      <ENU>"Ration of slenderness - z"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000087">
      <ENU>"Coefficients"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000088">
      <ENU>"Coefficients"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000089">
      <ENU>"Final coeff. of buckling"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000090">
      <ENU>"Bearing capacity"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000103">
      <ENU>IO.SetupNA.EC_1995_1_1.Name</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006260">
      <ENU>"Check of rectangle cross section on buckling"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006264">
      <ENU>IO.SetupNA.EC_1995_1_1.Name</ENU>
    </Item>
    <Item ID="TEXT_INI400_006265">
      <ENU>Caption</ENU>
    </Item>
    <Item ID="TEXT_INI400_006310">
      <ENU>"&lt; 1"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006311">
      <ENU>"&gt; 1"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006312">
      <ENU>Description("L↓y←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006313">
      <ENU>"L↓y← = " &amp; L↓y←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006314">
      <ENU>Description("L↓z←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006315">
      <ENU>"L↓z← = " &amp; L↓z←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006316">
      <ENU>Description("β↓c←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006317">
      <ENU>"β↓c← = " &amp; β↓c←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006318">
      <ENU>"Timber"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006319">
      <ENU>Name</ENU>
    </Item>
    <Item ID="TEXT_INI400_006320">
      <ENU>"f↓c,0,k← = " &amp; f↓c,0,k←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006321">
      <ENU>Description("f↓c,0,k←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_007952">
      <ENU>Description("E↓0,05←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_007953">
      <ENU>"E↓0,05← = " &amp; E↓0,05←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007955">
      <ENU>"Error: Cross-section is not rectangular."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007970">
      <ENU>"Warning: Cross-section is in tension. Normal force is not used in check."</ENU>
    </Item>
    <Item ID="TEXT_INI400_007972">
      <ENU>Description("f↓c,0,k←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_007973">
      <ENU>"f↓c,0,k← = " &amp; f↓c,0,k←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007982">
      <ENU>BeamName</ENU>
    </Item>
  </Texts>
</Root>