<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="eb23a2fa-95a4-407b-b8f0-e505f2900d0f">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">IF(H1) { 
    →INI400_000067TEXT("Geostatic stress according to Eurocode 7"); 
} 
IF(PrintCaption) { 
    →INI400_000028TEXT(string H2); 
} 
→INI400_000095PAGEBREAK(); 
→INI400_000096BLOCK("Input parameters") { 
    →INI400_000089TEXT("Depth"); 
    h →INI400_000004= h↓1←+h↓2←+h↓3←+h↓4←+h↓5←; 
    →INI400_000092TEXT(Description("γ↓w←")); 
    →INI400_000093TEXT("γ↓w ←=" &amp; γ↓w←); 
    →INI400_000114PAGEBREAK(); 
    →INI400_000099TEXT("Soil layers:"); 
    object T →INI400_000001= new Table(3); 
    T[0][0].Value →INI400_000102= TR("Layer number"); 
    T[0][1].Value →INI400_000101= TR("Layer depth") &amp; " [m]"; 
    T[0][2].Value →INI400_000047= TR("Layer density") &amp; " [kN/m↑3←]"; 
    FOR(i, 1, 5) { 
        T[i][0].Value →INI400_000100= i; 
    } 
    T[1][1].Value →INI400_000103= h↓1←; 
    T[1][2].Value →INI400_000104= Val(γ↓1←/1000, 2); 
    T[2][1].Value →INI400_000106= h↓2←; 
    T[2][2].Value →INI400_000107= Val(γ↓2←/1000, 2); 
    T[3][1].Value →INI400_000108= h↓3←; 
    T[3][2].Value →INI400_000109= Val(γ↓3←/1000, 2); 
    T[4][1].Value →INI400_000110= h↓4←; 
    T[4][2].Value →INI400_000111= Val(γ↓4←/1000, 2); 
    T[5][1].Value →INI400_000112= h↓5←; 
    T[5][2].Value →INI400_000113= Val(γ↓5←/1000, 2); 
    T.Padding.All →INI400_000115= 5; 
    →INI400_000006T.Draw(); 
    
} 
→INI400_000098BLOCK("Effective stress") { 
    →INI400_000088TEXT("Axial stress of layers"); 
    σ↓u← →INI400_000003= γ↓1←*h↓1←+γ↓2←*h↓2←+γ↓3←*h↓3←+γ↓4←*h↓4←+γ↓5←*h↓5←; 
    →INI400_000090TEXT("Pore pressure"); 
    u →INI400_000005= [h-h↓hpv←]*γ↓w←; 
    →INI400_000091TEXT("Effective stress"); 
    σ↓ef← →INI400_000007= σ↓u←-u; 
} 
→INI400_000094PAGEBREAK(); 
IF(pic) { 
    →INI400_000008IMG("geo1"); 
} 

//annex variables are none, annex independent calculation
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="-1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="HONZA\Trainer1" Autor2="" Version="5" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Geostatic-stress.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Geostatic stress</ENU>
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
      <Variable Modifier="Public" Name="h" ESA_ID="Result.04" Type="Double" Value="12" Precision="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓1←" ESA_ID="" Type="Double" Value="3" Precision="0">
        <Description TranslateID="VARIABLE_h↓1←">
          <ENU>Depth of layer 1</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓2←" ESA_ID="" Type="Double" Value="3" Precision="0">
        <Description TranslateID="VARIABLE_h↓2←">
          <ENU>Depth of layer 2</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓3←" ESA_ID="" Type="Double" Value="4" Precision="0">
        <Description TranslateID="VARIABLE_h↓3←">
          <ENU>Depth of layer 3</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓4←" ESA_ID="" Type="Double" Value="2" Precision="0">
        <Description TranslateID="VARIABLE_h↓4←">
          <ENU>Depth of layer 4</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓5←" ESA_ID="" Type="Double" Value="0" Precision="0">
        <Description TranslateID="VARIABLE_h↓5←">
          <ENU>Depth of layer 5</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="h↓hpv←" ESA_ID="" Type="Double" Value="7" Precision="0">
        <Description TranslateID="VARIABLE_h↓hpv←">
          <ENU>Ground water level</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="H1" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_H1">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="H2" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_H2">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Value="6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NA" ESA_ID="" Type="String" Value="">
        <Description TranslateID="VARIABLE_NA">
          <ENU>National code</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="pic" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_pic">
          <ENU>Print picture</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="u" ESA_ID="Result.03" Type="Double" Value="50000" Precision="0">
        <Description TranslateID="VARIABLE_u">
          <ENU>Pore pressure</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kPa" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓1←" ESA_ID="" Type="Double" Value="18000" Precision="0">
        <Description TranslateID="VARIABLE_γ↓1←">
          <ENU>Density of layer 1</ENU>
        </Description>
        <Unit m="-2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓2←" ESA_ID="" Type="Double" Value="22000" Precision="0">
        <Description TranslateID="VARIABLE_γ↓2←">
          <ENU>Density of layer 2</ENU>
        </Description>
        <Unit m="-2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓3←" ESA_ID="" Type="Double" Value="20000" Precision="0">
        <Description TranslateID="VARIABLE_γ↓3←">
          <ENU>Density of layer 3</ENU>
        </Description>
        <Unit m="-2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓4←" ESA_ID="" Type="Double" Value="21000" Precision="0">
        <Description TranslateID="VARIABLE_γ↓4←">
          <ENU>Density of layer 4</ENU>
        </Description>
        <Unit m="-2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓5←" ESA_ID="" Type="Double" Value="0" Precision="0">
        <Description TranslateID="VARIABLE_γ↓5←">
          <ENU>Density of layer 5</ENU>
        </Description>
        <Unit m="-2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓w←" ESA_ID="" Type="Double" Value="10000" Precision="0">
        <Description TranslateID="VARIABLE_γ↓w←">
          <ENU>Water density</ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m" />
      </Variable>
      <Variable Modifier="Public" Name="σ↓ef←" ESA_ID="Result.02" Type="Double" Value="192000" Precision="0">
        <Description TranslateID="VARIABLE_σ↓ef←">
          <ENU>Effective strain</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kPa" />
      </Variable>
      <Variable Modifier="Public" Name="σ↓u←" ESA_ID="Result.01" Type="Double" Value="242000" Precision="0">
        <Description TranslateID="VARIABLE_σ↓u←">
          <ENU>Geostatic stress</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kPa" />
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
          <ENU>Brief</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_2">
          <ENU>Layout 2</ENU>
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
      <VC ID="INI400_000001">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000003">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="26.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="36.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="61.7" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="51.7" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000005">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="82.1" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="67.1" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="53.6" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000007">
        <Set Vis="1" Prev="" Style="1" StyleName="" X="200" Y="123" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="" X="10" Y="101" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000008">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="280" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="250" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000028">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="36.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000047">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000067">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000088">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26.8" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="36.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000089">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="61.7" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="66.2" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000090">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="82.1" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="96.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000091">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="123" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="156" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000092">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="102" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000093">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="102" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="85.4" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000094">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000095">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000096">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000098">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000099">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000100">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000101">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000102">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000103">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000104">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000106">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000107">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000108">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000109">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000110">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000111">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000112">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000113">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000114">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000115">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="geo1" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TGroupBox Name="" ID="28" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000028">
            <ENU>Layers</ENU>
          </Texts>
          <TSplitContainer Name="" ID="30" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="238" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
            <Panel1>
              <TDoubleInput Name="TDoubleInput" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h↓5←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="25" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="TDoubleInput" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h↓4←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="25" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="TDoubleInput" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h↓3←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="25" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="TDoubleInput" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="25" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="TDoubleInput" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="25" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
            </Panel1>
            <Panel2>
              <TDoubleInput Name="TDoubleInput" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="γ↓5←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="TDoubleInput" ID="7" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="γ↓4←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="TDoubleInput" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="γ↓3←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="TDoubleInput" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="γ↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="TDoubleInput" ID="1" Translate="1" AutoWidth="True" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="γ↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
            </Panel2>
          </TSplitContainer>
        </TGroupBox>
        <TGroupBox Name="" ID="27" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="19" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000027">
            <ENU>Water parameters</ENU>
          </Texts>
          <TDoubleInput Name="TDoubleInput" ID="22" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="γ↓w←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="TDoubleInput" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h↓hpv←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TPanel Name="" ID="26" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
          <Texts>
            <ENU>
            </ENU>
          </Texts>
          <TCheckBox Name="" ID="31" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="pic" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000031">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TStringInput Name="TStringInput" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H2" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000013">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000012">
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
    <Item TranslateID="BLOCK_INI400_000096">
      <ENU>"Input parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_000098">
      <ENU>"Effective stress"</ENU>
    </Item>
    <Item TranslateID="STRING_3A4267C6">
      <ENU>"Layer depth"</ENU>
    </Item>
    <Item TranslateID="STRING_4D3A823C">
      <ENU>"Layer number"</ENU>
    </Item>
    <Item TranslateID="STRING_74FDCDCC">
      <ENU>"Layer density"</ENU>
    </Item>
    <Item TranslateID="STRING_86C95D4F">
      <ENU>"Layer depth"</ENU>
    </Item>
    <Item TranslateID="STRING_A3614C35">
      <ENU>"Layer number"</ENU>
    </Item>
    <Item TranslateID="STRING_CE625363">
      <ENU>"Layer density"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000028">
      <ENU>string H2</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000067">
      <ENU>"Geostatic stress according to Eurocode 7"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000087">
      <ENU>string NA</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000088">
      <ENU>"Axial stress of layers"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000089">
      <ENU>"Depth"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000090">
      <ENU>"Pore pressure"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000091">
      <ENU>"Effective stress"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000092">
      <ENU>Description("γ↓w←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000093">
      <ENU>"γ↓w ←=" &amp; γ↓w←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000099">
      <ENU>"Soil layers:"</ENU>
    </Item>
  </Texts>
</Root>