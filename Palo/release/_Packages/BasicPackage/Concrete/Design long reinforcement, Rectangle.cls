<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="bbf2345c-1f0c-4ba2-a451-5583ab52c85a">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">bool ValidateInput(object Input) { 
    N↓Ed← →INI400_006507= Input.Get("N"); 
    M↓Edy← →INI400_006508= Input.Get("My"); 
    
    h →INI400_006416= Input.Get("h"); 
    b →INI400_006417= Input.Get("b"); 
    c↓1← →INI400_006418= Input.Get("c1"); 
    c↓2← →INI400_006419= Input.Get("c2"); 
    Φ↓1← →INI400_006420= Input.Get("ϕ1"); 
    Φ↓2← →INI400_006421= Input.Get("ϕ2"); 
    DesignMinimumAs →INI400_006514= Input.Get("DesignMinimumAs"); 
    
    f↓yd← →INI400_006429= Input.Get("fyd"); 
    ε↓yd← →INI400_006428= Input.Get("εyd"); 
    E↓s← →INI400_006430= Input.Get("Es"); 
    
    ε↓c2← →INI400_006431= Input.Get("εc2"); 
    ε↓cu3← →INI400_006432= Input.Get("εcu3"); 
    
    return true; 
} 
object GetOutput() { 
    return new Structure("UC", UC, "A↓sy1←", A↓sy1←, "A↓sy2←", A↓sy2←); 
} 

//N↓Ed← →INI400_006512= 0000; 
//M↓Edy← →INI400_006513= 350000; 


π →INI400_006433= Math.PI; 
z↓1← →INI400_006434= (h/2)-d↓1←; 
z↓2← →INI400_006435= (h/2)-d↓2←; 
d↓1← →INI400_006436= c↓1←+Φ↓1←/2; 
d↓2← →INI400_006437= c↓2←+Φ↓2←/2; 
d →INI400_006438= h-d↓1←; 

void CheckAs1Req() { 
    IF(A↓sy1req← &lt; 0) { 
        →INI400_006473TEXT("A↓sy1req← &lt; 0 =&gt; reinforcement is not needed"); 
        IF(DesignMinimumAs) { 
            →INI400_006487TEXT("The tension reinforcement will be designed to the minimum required reinforcement"); 
            A↓sy1req← →INI400_006488= PARMAX(0.0013*b*d, (0.26*f↓ctm←*b*d)/f↓yk←); 
        } ELSE { 
            A↓sy1req← →INI400_006489= 0; 
        } 
    } 
} 
void CheckAs2Req() { 
    IF(A↓sy2req← &lt; 0) { 
        →INI400_006475TEXT("A↓sy2req← &lt; 0 =&gt; reinforcement is not needed"); 
        IF(DesignMinimumAs) { 
            →INI400_006490TEXT("The compression reinforcement will be designed to the minimum required reinforcement"); 
            A↓sy2req← →INI400_006491= PARMAX(0.05*N↓Ed←/f↓yd←, 0.001*b*h); 
        } ELSE { 
            A↓sy2req← →INI400_006476= 0; 
        } 
    } 
} 
void Terminate() { 
    UC →INI400_006515= 999999; A↓sy1← →INI400_006516= 999999; A↓sy2← →INI400_006517= 999999; 
    Exit(); 
} 

IF(Draw_LoadRecalc) { 
    →INI400_005856BLOCK("Load recalculation") { 
        →INI400_006509TEXT("Normal force"); 
        →INI400_006510TEXT("N↓Ed← = " &amp; N↓Ed←); 
        →INI400_006511TEXT("Remark: Positive value is tension, negative value is compression"); 
        →INI400_000378TEXT("Bending moment"); 
        →INI400_000468TEXT("M↓Edy← = " &amp; M↓Edy←); 
        →INI400_006441TEXT("Remark: Bending moment is considered always as positive value, tension on bottom edge"); 
        →INI400_006443TEXT("Recalculated bending moments"); 
        M↓Edy1← →INI400_000382= M↓Edy←-N↓Ed←*z↓1←; 
        M↓Edy2← →INI400_000381= M↓Edy←+N↓Ed←*z↓2←; 
        
        →INI400_000608PAGEBREAK(); 
    } 
} ELSE { 
    M↓Edy1← →INI400_000601= M↓Edy←-N↓Ed←*z↓1←; 
    M↓Edy2← →INI400_000602= M↓Edy←+N↓Ed←*z↓2←; 
} 


//check if axial force is compression
→INI400_006446BLOCK("Check the kind of breach - tensile or compressive") { 
    IF(N↓Ed← &lt; 0) { 
        ξ↓bal1← →INI400_000428= ABS(ε↓cu3←)/(ABS(ε↓cu3←)+ε↓yd←); 
        N↓c,bal← →INI400_000427= λ*ξ↓bal1←*b*d*η*f↓cd←; 
        bool IsCompression →INI400_006444= ABS(N↓Ed←) &gt; N↓c,bal←; 
    } ELSE { 
        IsCompression →INI400_006445= false; 
    } 
    IF(IsCompression) { 
        →INI400_000457TEXT("|N↓Ed←| = " &amp; N↓Ed← &amp; "  &gt; N↓c,bal← =" &amp; N↓c,bal←); 
        →INI400_000456TEXT("=&gt; The case with prevailing compression"); 
    } ELSE { 
        IF(N↓Ed← &gt; 0) { 
            →INI400_000486TEXT("Axial force is positive =&gt; The case with prevailing tension"); 
        } ELSE { 
            →INI400_000430TEXT("|N↓Ed←|  = " &amp; N↓Ed← &amp; "  ≤ N↓c,bal← = " &amp; N↓c,bal←); 
            →INI400_000383TEXT("=&gt; The case with prevailing tension"); 
        } 
    } 
} 
→INI400_005890BLOCK("Distance of the neutral axis") { 
    →INI400_006456TEXT("Height of compressed area"); 
    IF(IsCompression) { 
        x →INI400_000157= (d↓2←/λ)*[1+SQRT(1-[(2*M↓Edy2←)/(b*d↓2←↑2←*η*f↓cd←)])]; 
        D →INI400_000516= 1-[(2*M↓Edy2←)/(b*d↓2←↑2←*η*f↓cd←)]; //checkifxisarealnumberforcompression
        EqulibriumFound →INI400_006447= (D &gt;= 0); 
    } ELSE { 
        x →INI400_000455= (d/λ)*[1-SQRT(1-[(2*M↓Edy1←)/(b*d↑2←*η*f↓cd←)])]; 
        D →INI400_000462= 1-[(2*M↓Edy1←)/(b*d↑2←*η*f↓cd←)]; //checkifxisarealnumberforcompression
        EqulibriumFound →INI400_006448= (D &gt;= 0); 
    } 
    →INI400_006457TEXT("Effective height of compressed area"); 
    IF(EqulibriumFound) { 
        x↓c← →INI400_006449= 0.8*x; 
    } ELSE { 
        →INI400_006452TEXT("Equilibrium not found!"); 
        →INI400_006464TEXT("Calculation terminates."); 
        →INI400_006518Terminate(); 
    } 
    →INI400_006459TEXT("Concrete area"); 
    A↓cc← →INI400_006460= x↓c←*b; 
    →INI400_000609PAGEBREAK(); 
    →INI400_006461BLOCK("Limit distances and comparison") { 
        ξ↓bal1← →INI400_000402= ABS(ε↓cu3←)/(ABS(ε↓cu3←)+ε↓yd←); 
        ξ↓bal2← →INI400_000472= ABS(ε↓cu3←)/(ABS(ε↓cu3←)-ε↓yd←); 
        x↓bal1← →INI400_000062= (ABS(ε↓cu3←)/(ABS(ε↓cu3←)+ε↓yd←))*d; 
        x↓bal2← →INI400_000450= (ABS(ε↓cu3←)/(ABS(ε↓cu3←)-ε↓yd←))*d↓2←; 
    } 
} 
→INI400_005897PAGEBREAK(); 
→INI400_005891BLOCK("Reinforcement design:") { 
    IF(IsCompression) { 
        IF(x↓bal1← &lt; x &amp;&amp; x &lt; h/λ &amp;&amp; x &gt; x↓bal2←) { //layout checked
            →INI400_000408TEXT("x↓bal1← = " &amp; x↓bal1← &amp; "  &lt;  x = " &amp; x &amp; "  &lt;  h/λ = " &amp; h/λ); 
            →INI400_000407TEXT("Area II, tension reinforcement is not needed"); 
            →INI400_000406TEXT("Compression area:"); 
            →INI400_000405TEXT("Required compression reinforcement"); 
            A↓sy2req← →INI400_000404= (-N↓Ed←-(λ*b*x*η*f↓cd←))/f↓yd←; →INI400_006478CheckAs2Req(); 
            A↓sy1req← →INI400_000487= 0; 
        } 
        IF(x &gt;= h/λ) { //layout checked
            →INI400_000445TEXT("x = " &amp; x &amp; "  &gt;=  h/λ = " &amp; h/λ &amp; " =&gt; Whole cross section is compressed"); 
            →INI400_006471TEXT("Compression stress in reinforcement"); 
            IF(f↓yd← &lt;= ε↓c2←*E↓s←) { 
                σ↓s← →INI400_000416= f↓yd←; 
            } ELSE { 
                σ↓s← →INI400_000415= ε↓c2←*E↓s←; 
            } 
            →INI400_006472TEXT("Minimum value for M↓Ed2← based on excentricity"); 
            e↓0← →INI400_000489= MIN(h/30, 0.02); 
            M↓Edmin← →INI400_000414= N↓Ed←*e↓0←; 
            M↓Edy2← →INI400_000413= MAX(M↓Edy2←, M↓Edmin←); 
            →INI400_000420TEXT("Required tension reinforcement"); 
            A↓sy1req← →INI400_000412= (-M↓Edy2←-[b*h*η*f↓cd←*z↓2←])/(σ↓s←*(z↓1←+z↓2←)); →INI400_006477CheckAs1Req(); 
            →INI400_000418TEXT("Required compression reinforcement"); 
            A↓sy2req← →INI400_000411= (M↓Edy1←-[b*h*η*f↓cd←*z↓1←])/(σ↓s←*(z↓1←+z↓2←)); →INI400_006479CheckAs2Req(); 
            →INI400_000460TEXT("It is recommended to design symetric reinforcement in the IV area."); 
            →INI400_000459TEXT("Required reinforcement area on both sides"); 
            A↓syreq← →INI400_000458= MAX(A↓sy1req←, A↓sy2req←); 
        } 
        IF(x &gt;= x↓bal2← &amp;&amp; x &lt;= x↓bal1← || !EqulibriumFound) { //layout checked
            →INI400_000441TEXT("x  ≤ x↓bal1 ←,↓    ←x ≥ x↓bal2← =&gt;" &amp; x &amp; " ≤  " &amp; x↓bal1← &amp; " , " &amp; x &amp; " ≥ " &amp; x↓bal2←); 
            →INI400_000444TEXT("Area I"); 
            →INI400_000466TEXT("Compression area:"); 
            →INI400_000465TEXT("Required compression reinf. area"); 
            A↓sy2req← →INI400_000443= (M↓Edy1←-(λ*b*ξ↓bal1←*d*η*f↓cd←*0.5*(h-(ξ↓bal1←*d))))/(f↓yd←*(z↓1←+z↓2←)); →INI400_006481CheckAs2Req(); 
            →INI400_000464TEXT("Tension area:"); 
            →INI400_000463TEXT("Required tension reinf. area"); 
            A↓sy1req← →INI400_000442= ((N↓Ed←+(λ*b*x*η*f↓cd←))/f↓yd←)+A↓sy2req←; →INI400_006480CheckAs1Req(); 
        } 
        IF(x &lt; x↓bal2←) { 
            →INI400_000518TEXT("Equilibrium is not found!"); 
            →INI400_006519Terminate(); 
        } //layout checked
    } ELSE { 
        IF(0 &lt; x &amp;&amp; x &lt; x↓bal1←) { //layout checked
            →INI400_006467TEXT("0  &lt;  x = " &amp; x &amp; "  &lt; x↓bal1← = " &amp; x↓bal1←); 
            →INI400_006463TEXT("Required compression reinforcement"); 
            →INI400_000440TEXT("Compression reinforcement is not needed"); 
            →INI400_000052TEXT("Required tension reinforcement"); 
            A↓sy1req← →INI400_000049= (N↓Ed←+(λ*b*x*η*f↓cd←))/f↓yd←; →INI400_006482CheckAs1Req(); 
            A↓sy2req← →INI400_000488= 0; 
        } 
        IF(x &gt;= x↓bal1←) { //layout checked
            →INI400_006468TEXT("x = " &amp; x &amp; "  ≥ x↓bal1 ←= " &amp; x↓bal1←); 
            →INI400_006465TEXT("Required compression reinforcement"); 
            A↓sy2req← →INI400_000384= (M↓Edy1←-[λ*b*ξ↓bal1←*d*η*f↓cd←*0.5*[h-(ξ↓bal1←*d)]])/(f↓yd←*[z↓1←+z↓2←]); →INI400_006483CheckAs2Req(); 
            →INI400_000386TEXT("Required tension reinforcement"); 
            A↓sy1req← →INI400_000387= [(N↓Ed←+λ*b*x*η*f↓cd←)/f↓yd←]+A↓sy2req←; →INI400_006484CheckAs1Req(); 
        } 
        IF(x &lt;= 0) { //layout checked
            →INI400_000393TEXT("x = " &amp; x &amp; "  ≤ 0 =&gt; Assumption : Concrete doesn't act. Whole section is in tension"); 
            →INI400_006469TEXT("Required tension reinforcement"); 
            A↓sy1req← →INI400_000389= (M↓Edy2←/(f↓yd←*(z↓1←+z↓2←))); →INI400_006485CheckAs1Req(); 
            →INI400_006470TEXT("Required compression reinforcement"); 
            A↓sy2req← →INI400_000388= (-M↓Edy1←/(f↓yd←*(z↓1←+z↓2←))); →INI400_006486CheckAs2Req(); 
        } 
    } 
    x1 →INI400_000471= ABS(N↓Ed←)/(λ*b*η*f↓cd←); 
    IF(symetric) { 
        IF(N↓Ed← &lt; 0 &amp;&amp; ξ↓bal2←*d↓2← &lt;= x1 &amp;&amp; x1 &lt;= ξ↓bal1←*d) { 
            →INI400_000473TEXT("Symetric reinforcement:"); 
            →INI400_000566TEXT("The member is compressed, the simplified method is used for symetric reinforcement design"); 
            →INI400_000477TEXT("Lever arm of internal forces (compr. reinf.)"); 
            x →INI400_000543= ABS(N↓Ed←)/(λ*b*η*f↓cd←); 
            z↓s← →INI400_000159= d-d↓2←; 
            A↓syreq← →INI400_000475= (M↓Edy←+N↓Ed←*0.5*[h-λ*x])/(z↓s←*f↓yd←); 
            A↓sy1req← →INI400_000541= A↓syreq←; 
            A↓sy2req← →INI400_000540= A↓syreq←; 
        } ELSE { 
            →INI400_000476TEXT("Symetric reinforcement:"); 
            →INI400_000567TEXT("The symetric reinforcement is designed according to the bigger value of A↓sy1req ←and  A↓sy2req←"); 
            A↓syreq← →INI400_000474= MAX(A↓sy1req←, A↓sy2req←); 
            A↓sy1req← →INI400_000538= A↓syreq←; 
            A↓sy2req← →INI400_000539= A↓syreq←; 
        } 
    } 
    
    →INI400_000614PAGEBREAK(); 
} 
→INI400_006496BLOCK("Practical tension reinforcement") { 
    →INI400_006499TEXT("Tension reinforcement"); 
    n↓1← →INI400_000494= CEILING(A↓sy1req←/((π*Φ↓1←↑2←)/4)); 
    →INI400_006369TEXT("Designed " &amp; n↓1← &amp; " x ϕ" &amp; Φ↓1←); 
    A↓sy1← →INI400_000500= n↓1←*((π*Φ↓1←↑2←)/4); 
    →INI400_006503BLOCK("Check of maximum and minimum reinforcement") { 
        →INI400_006501LoadExternCLC("Check minimum reinforcement area.CLC").Draw(true); 
        →INI400_006502LoadExternCLC("Check maximum reinforcement area.CLC").Draw(true); 
    } 
} 
→INI400_000615PAGEBREAK(); 
→INI400_006498BLOCK("Practical compression reinforcement") { 
    →INI400_006497TEXT("Compression reinforcement"); 
    n↓2← →INI400_000507= CEILING(A↓sy2req←/((π*Φ↓2←↑2←)/4)); 
    →INI400_006372TEXT("Designed " &amp; n↓2← &amp; " x ϕ" &amp; Φ↓2←); 
    A↓sy2← →INI400_000505= n↓2←*((π*Φ↓2←↑2←)/4); 
} 

UC →INI400_006504= A↓sy1←+A↓sy2←; 
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="1000" Material="2" CSType="7" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="2087" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Concrete_reinf_design2.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Design - long. reinf., both side, NMy , CSS rectangle (var 3)</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Block headline" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Standard 10px" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" />
      <Style Key="Standard 200px" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Calculation headline" X="0" Y="7.43" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.3|5|2" Font2="Tahoma|15.3|5|2" />
      <Style Key="Remark" X="20" Y="852" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" />
      <Style Key="Formula 40px" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" />
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
      <Variable Modifier="Public" Name="A↓cc←" ESA_ID="" Type="Double" Value="39.78799e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓cc←">
          <ENU>Compression concrete area</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sy1←" ESA_ID="Result.1" Type="Double" Value="3.809181e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="1e-3" />
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sy1req←" ESA_ID="Result.2" Type="Double" Value="3.80889e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓sy1req←">
          <ENU>Required tension reinforcement area</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="1e-3" />
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sy2←" ESA_ID="Result.5" Type="Double" Value="1.407434e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="1e-3" />
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sy2req←" ESA_ID="Result.6" Type="Double" Value="1.368559e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓sy2req←">
          <ENU>Required compression reinforcement area</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="1e-3" />
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓syreq←" ESA_ID="" Type="Double" Value="5.239079e-3" Precision="2">
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
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Value="462.5e-3" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>Effective cross section height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="D" ESA_ID="" Type="Double" Value="181.8847e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="d↓1←" ESA_ID="" Type="Double" Value="37.5e-3" Precision="2">
        <Description TranslateID="VARIABLE_d↓1←">
          <ENU>Eff. distance for tension reinforcement</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="d↓2←" ESA_ID="" Type="Double" Value="39e-3" Precision="2">
        <Description TranslateID="VARIABLE_d↓2←">
          <ENU>Eff. distance for compression reinforcement</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="DesignMinimumAs" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_DesignMinimumAs">
          <ENU>Calculate min. reinforcement</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Draw_LoadRecalc" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Draw_LoadRecalc">
          <ENU>Print loading</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="e↓0←" ESA_ID="" Type="Double" Value="16.66667e-3" Precision="2">
        <Description TranslateID="VARIABLE_e↓0←">
          <ENU>Eccentricity of loading</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="E↓s←" ESA_ID="" Type="Double" Value="200e9" Precision="2">
        <Description TranslateID="VARIABLE_E↓s←">
          <ENU>Deformation module of steel</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e9" Dim="GPa" />
      </Variable>
      <Variable Modifier="Public" Name="EqulibriumFound" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_EqulibriumFound">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="f↓cd←" ESA_ID="" Type="Double" Value="26.66667e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓cd←">
          <ENU>Design value of concrete compressive strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctm←" ESA_ID="" Type="Double" Value="3.5e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ctm←">
          <ENU>The flexural tensile strength of the concrete</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yd←" ESA_ID="" Type="Double" Value="434.7826e6" Precision="1">
        <Description TranslateID="VARIABLE_f↓yd←">
          <ENU>Design tensile strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yk←" ESA_ID="" Type="Double" Value="500e6" Precision="1">
        <Description TranslateID="VARIABLE_f↓yk←">
          <ENU>Characteristic tensile strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="500e-3" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Cross section height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="IsCompression" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_IsCompression">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="M↓Edmin←" ESA_ID="" Type="Double" Value="-83333.33" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Edy←" ESA_ID="" Type="Double" Value="350000" Precision="2">
        <Description TranslateID="VARIABLE_M↓Edy←">
          <ENU>Bending moment</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Edy1←" ESA_ID="" Type="Double" Value="350000" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓Edy2←" ESA_ID="" Type="Double" Value="350000" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="n↓1←" ESA_ID="Result.3" Type="Double" Value="194" Precision="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="66" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="10" DrawLimitMin="1" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓2←" ESA_ID="Result.7" Type="Double" Value="28" Precision="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="66" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="10" DrawLimitMin="1" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="N↓c,bal←" ESA_ID="" Type="Double" Value="912950.3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="N↓Ed←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_N↓Ed←">
          <ENU>Axial force</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="symetric" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_symetric">
          <ENU>Design the symetric reinforcement</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="UC" ESA_ID="" Type="Double" Value="5.216615e-3" Precision="2">
        <Description TranslateID="VARIABLE_UC">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="x" ESA_ID="" Type="Double" Value="331.5666e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="x↓bal1←" ESA_ID="" Type="Double" Value="285.2969e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="x↓bal2←" ESA_ID="" Type="Double" Value="102.9344e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="x↓c←" ESA_ID="" Type="Double" Value="265.2533e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="x1" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="z↓1←" ESA_ID="" Type="Double" Value="212.5e-3" Precision="2">
        <Description TranslateID="VARIABLE_z↓1←">
          <ENU>For tension reinforcement</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="z↓2←" ESA_ID="" Type="Double" Value="211e-3" Precision="2">
        <Description TranslateID="VARIABLE_z↓2←">
          <ENU>For compression reinforcement</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="z↓s←" ESA_ID="" Type="Double" Value="413e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓c2←" ESA_ID="" Type="Double" Value="2e-3" Precision="2">
        <Description TranslateID="VARIABLE_ε↓c2←">
          <ENU>Concrete strain</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="‰" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓cu3←" ESA_ID="" Type="Double" Value="3.5e-3" Precision="2">
        <Description TranslateID="VARIABLE_ε↓cu3←">
          <ENU>Ultimate concrete strain</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="‰" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓yd←" ESA_ID="" Type="Double" Value="2.173913e-3" Precision="3">
        <Description TranslateID="VARIABLE_ε↓yd←">
          <ENU>Compressive strain</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="‰" />
      </Variable>
      <Variable Modifier="Public" Name="η" ESA_ID="" Type="Double" Value="1" Precision="1">
        <Description TranslateID="VARIABLE_η">
          <ENU>Coefficient of material strength</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ" ESA_ID="" Type="Double" Value="800e-3" Precision="1">
        <Description TranslateID="VARIABLE_λ">
          <ENU>Coefficient of stress distribution</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ξ↓bal1←" ESA_ID="" Type="Double" Value="616.8582e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ξ↓bal2←" ESA_ID="" Type="Double" Value="2.639344" Precision="2">
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
      <Variable Modifier="Public" Name="σ↓s←" ESA_ID="" Type="Double" Value="400e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="Φ↓1←" ESA_ID="Result.4" Type="Double" Value="5e-3" Precision="2">
        <Description TranslateID="VARIABLE_Φ↓1←">
          <ENU>Tensile reinforcement profile</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="84" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Φ↓2←" ESA_ID="Result.8" Type="Double" Value="8e-3" Precision="2">
        <Description TranslateID="VARIABLE_Φ↓2←">
          <ENU>Compression reinforcement profile</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="84" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
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
      <Layout Active="True">
        <Names TranslateID="LAYOUT_3">
          <ENU>Page</ENU>
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
      <VC ID="INI400_000049">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000052">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000062">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000157">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000159">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000378">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000381">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000382">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000383">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="210" Y="960" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000384">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="30" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="30" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="31" />
      </VC>
      <VC ID="INI400_000386">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000387">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="30" />
        <Set Vis="1" Prev="INI400_000384" Style="0" StyleName="Standard 10px" EqStyle="30" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="31" />
      </VC>
      <VC ID="INI400_000388">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000389">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000393">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_000402">
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000404">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1517" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000405">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1517" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000406">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1498" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000407">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1479" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000408">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="1440" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000411">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000412">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000413">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1563" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="21" />
      </VC>
      <VC ID="INI400_000414">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000415">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000416">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="0" Ver="4" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000418">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000420">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000427">
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000428">
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000430">
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="20" />
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000440">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000441">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1205" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000442">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="30" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="30" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1289" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000443">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="30" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="30" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_000444">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000445">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_000450">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000455">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 40px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000456">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1023" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|7|2" Font2="Tahoma|13|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000457">
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000458">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
      </VC>
      <VC ID="INI400_000459">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000460">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="0" Ver="4" SpX="20" SpY="20" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000462">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000463">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000464">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000465">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000466">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000468">
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 200px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="837" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="300" Y="837" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Standard 200px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000471">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1153" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000472">
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000473">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1541" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000474">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1665" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000475">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1655" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000476">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1624" Hor="0" Ver="4" SpX="20" SpY="10" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000477">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1569" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000486">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000487">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000488">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000489">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
      </VC>
      <VC ID="INI400_000494">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1457" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000500">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="1727" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_000505">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1817" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_000507">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1518" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000516">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1113" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000518">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000538">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1687" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
      </VC>
      <VC ID="INI400_000539">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1708" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="21" />
      </VC>
      <VC ID="INI400_000540">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1648" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000541">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000543">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1596" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000566">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1555" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000567">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1638" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000601">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000602">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="928" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000608">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="930" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000609">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1110" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000614">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1656" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000615">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1746" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005856">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005890">
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
      </VC>
      <VC ID="INI400_005891">
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
      </VC>
      <VC ID="INI400_005897">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006369">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_006372">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="300" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_006416">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006417">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006418">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006419">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006420">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006421">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006428">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006429">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006430">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006431">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006432">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006433">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006434">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006435">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006436">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006437">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006438">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006441">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006443">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006444">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006445">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006446">
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
      </VC>
      <VC ID="INI400_006447">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006448">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006449">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006452">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|15|0|2" Font2="Tahoma|15|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|15|0|2" Font2="Tahoma|15|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|15|0|2" Font2="Tahoma|15|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|15|0|2" Font2="Tahoma|15|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|15|0|2" Font2="Tahoma|15|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="250" Y="837" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|15|0|2" Font2="Tahoma|15|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006456">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006457">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006458">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006459">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006460">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006461">
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
      </VC>
      <VC ID="INI400_006463">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006464">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|15.3|0|2" Font2="Tahoma|15.3|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|15.3|0|2" Font2="Tahoma|15.3|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|15.3|0|2" Font2="Tahoma|15.3|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|15.3|0|2" Font2="Tahoma|15.3|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|15.3|0|2" Font2="Tahoma|15.3|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="334" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|15.3|0|2" Font2="Tahoma|15.3|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006465">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006467">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="852" Hor="0" Ver="4" SpX="200" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="852" Hor="0" Ver="4" SpX="200" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006468">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006469">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006470">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006471">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006472">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006473">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006475">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006476">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="852" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="852" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="20" />
      </VC>
      <VC ID="INI400_006477">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006478">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006479">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006480">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006481">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006482">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="30" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="30" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006483">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006484">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006485">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006486">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="4" Ver="2" SpX="20" SpY="-10" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="40" Y="334" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006487">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006488">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="852" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="852" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006489">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="852" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="852" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006490">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006491">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="852" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="852" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006496">
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
      </VC>
      <VC ID="INI400_006497">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006498">
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="22" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Block headline" EqStyle="23" />
      </VC>
      <VC ID="INI400_006499">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006501">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006502">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006503">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006504">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006507">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006508">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006509">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006510">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 10px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard 200px" EqStyle="23" />
      </VC>
      <VC ID="INI400_006511">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006514">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006515">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006516">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006517">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006518">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006519">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="Rect_both" Content="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" />
      <Image Name="BG" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500" />
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_INI400_005856">
      <ENU>"Load recalculation"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005890">
      <ENU>"Distance of the neutral axis"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_005891">
      <ENU>"Reinforcement design:"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006446">
      <ENU>"Check the kind of breach - tensile or compressive"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006461">
      <ENU>"Limit distances and comparison"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006496">
      <ENU>"Practical tension reinforcement"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006498">
      <ENU>"Practical compression reinforcement"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_006503">
      <ENU>"Check of maximum and minimum reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000052">
      <ENU>"Required tension reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000378">
      <ENU>"Bending moment"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000383">
      <ENU>"=&gt; The case with prevailing tension"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000386">
      <ENU>"Required tension reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000393">
      <ENU>"x = " &amp; x &amp; "  ≤ 0 =&gt; Assumption : Concrete doesn't act. Whole section is in tension"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000405">
      <ENU>"Required compression reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000406">
      <ENU>"Compression area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000407">
      <ENU>"Area II, tension reinforcement is not needed"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000408">
      <ENU>"x↓bal1← = " &amp; x↓bal1← &amp; "  &lt;  x = " &amp; x &amp; "  &lt;  h/λ = " &amp; h/λ</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000418">
      <ENU>"Required compression reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000420">
      <ENU>"Required tension reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000430">
      <ENU>"|N↓Ed←|  = " &amp; N↓Ed← &amp; "  ≤ N↓c,bal← = " &amp; N↓c,bal←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000440">
      <ENU>"Compression reinforcement is not needed"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000441">
      <ENU>"x  ≤ x↓bal1 ←,↓    ←x ≥ x↓bal2← =&gt;" &amp; x &amp; " ≤  " &amp; x↓bal1← &amp; " , " &amp; x &amp; " ≥ " &amp; x↓bal2←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000444">
      <ENU>"Area I"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000445">
      <ENU>"x = " &amp; x &amp; "  &gt;=  h/λ = " &amp; h/λ &amp; " =&gt; Whole cross section is compressed"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000456">
      <ENU>"=&gt; The case with prevailing compression"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000457">
      <ENU>"|N↓Ed←| = " &amp; N↓Ed← &amp; "  &gt; N↓c,bal← =" &amp; N↓c,bal←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000459">
      <ENU>"Required reinforcement area on both sides"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000460">
      <ENU>"It is recommended to design symetric reinforcement in the IV area."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000463">
      <ENU>"Required tension reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000464">
      <ENU>"Tension area:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000465">
      <ENU>"Required compression reinf. area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000466">
      <ENU>"Compression area:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000468">
      <ENU>"M↓Edy← = " &amp; M↓Edy←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000473">
      <ENU>"Symetric reinforcement:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000476">
      <ENU>"Symetric reinforcement:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000477">
      <ENU>"Lever arm of internal forces (compr. reinf.)"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000486">
      <ENU>"Axial force is positive =&gt; The case with prevailing tension"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000518">
      <ENU>"Equilibrium is not found!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000566">
      <ENU>"The member is compressed, the simplified method is used for symetric reinforcement design"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000567">
      <ENU>"The symetric reinforcement is designed according to the bigger value of A↓sy1req ←and  A↓sy2req←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006369">
      <ENU>"Designed " &amp; n↓1← &amp; " x ϕ" &amp; Φ↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006372">
      <ENU>"Designed " &amp; n↓2← &amp; " x ϕ" &amp; Φ↓2←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006441">
      <ENU>"Remark: Bending moment is considered always as positive value, tension on bottom edge"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006443">
      <ENU>"Recalculated bending moments"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006452">
      <ENU>"Equilibrium not found!"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006456">
      <ENU>"Height of compressed area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006457">
      <ENU>"Effective height of compressed area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006459">
      <ENU>"Concrete area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006463">
      <ENU>"Required compression reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006464">
      <ENU>"Calculation terminates."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006465">
      <ENU>"Required compression reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006467">
      <ENU>"0  &lt;  x = " &amp; x &amp; "  &lt; x↓bal1← = " &amp; x↓bal1←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006468">
      <ENU>"x = " &amp; x &amp; "  ≥ x↓bal1 ←= " &amp; x↓bal1←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006469">
      <ENU>"Required tension reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006470">
      <ENU>"Required compression reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006471">
      <ENU>"Compression stress in reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006472">
      <ENU>"Minimum value for M↓Ed2← based on excentricity"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006473">
      <ENU>"A↓sy1req← &lt; 0 =&gt; reinforcement is not needed"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006475">
      <ENU>"A↓sy2req← &lt; 0 =&gt; reinforcement is not needed"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006487">
      <ENU>"The tension reinforcement will be designed to the minimum required reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006490">
      <ENU>"The compression reinforcement will be designed to the minimum required reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006497">
      <ENU>"Compression reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006499">
      <ENU>"Tension reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006509">
      <ENU>"Normal force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006510">
      <ENU>"N↓Ed← = " &amp; N↓Ed←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006511">
      <ENU>"Remark: Positive value is tension, negative value is compression"</ENU>
    </Item>
  </Texts>
</Root>