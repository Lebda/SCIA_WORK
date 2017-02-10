<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="6d32b1dd-82a0-49af-b266-f1f40d599032">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">IF(H1) { →INI400_000088TEXT("Cranked beam (post and beam) loaded by continuous load and supported in two points"); } 
IF(H2) { →INI400_000028TEXT(Caption); } 

→INI400_000124BLOCK("Beam parameters") { 
    →INI400_000090TEXT("Height"); →INI400_000091TEXT("h = " &amp; h); 
    →INI400_000092TEXT("Length"); →INI400_000093TEXT("l = " &amp; l); 
    →INI400_000111TEXT("Moment of inertia (post)"); →INI400_000112TEXT("I↓1← = " &amp; I↓1←); 
    →INI400_000113TEXT("Moment of inertia (beam)"); →INI400_000114TEXT("I↓2← = " &amp; I↓2←); 
    →INI400_000115TEXT("Supports are in point a and b, the middle point is c"); 
    →INI400_000116TEXT("Reactions are marked H-horizontal, V-vertical"); 
} 
→INI400_000125BLOCK("Loads") { 
    →INI400_000095TEXT("Continuous load"); →INI400_000096TEXT("f = " &amp; f); 
} 
→INI400_000117PAGEBREAK(); 
→INI400_000001IMG("Lomeny nosnik_"); 
→INI400_000118PAGEBREAK(); 
→INI400_000126BLOCK("Calculation of moments") { 
    →INI400_000109TEXT("Post"); 
    k↓1← →INI400_000005= I↓1←/h; 
    →INI400_000110TEXT("Beam"); 
    k↓2← →INI400_000004= I↓2←/l; 
    K↓c← →INI400_000003= 2*[k↓1←+k↓2←]; 
    →INI400_000100TEXT("Moment on beam"); 
    M↓s← →INI400_000002= f*l↑2←/8; 
    →INI400_000099TEXT("Moment in point c"); 
    M↓ca← →INI400_000006= [f*l↑2←/4]*k↓1←/K↓c←; 
    M↓cb← →INI400_000007= -[M↓ca←]; 
    →INI400_000101TEXT("Distance s for M↓max← from point b"); 
    x↓m← →INI400_000008= (l/4)*[(3*k↓1←+4*k↓2←)/K↓c←]; 
    →INI400_000102TEXT("Moment M↓max← in point s"); 
    M↓max← →INI400_000009= [f*l↑2←/32]*[(3*k↓1←+4*k↓2←)/K↓c←]↑2←; 
    →INI400_000119PAGEBREAK(); 
    →INI400_000010IMG("M"); 
} 
→INI400_000120PAGEBREAK(); 
→INI400_000127BLOCK("Calculation of internal forces and reactions") { 
    →INI400_000103TEXT("Shear force in point c"); 
    Q↓ac← →INI400_000011= -[f*l↑2←/4*h]*k↓1←/K↓c←; 
    Q↓cb← →INI400_000012= [f*l/4]*[(5*k↓1←+4*k↓2←)/K↓c←]; 
    →INI400_000104TEXT("Shear force in point b"); 
    Q↓bc← →INI400_000013= -[f*l/4]*[(3*k↓1←+4*k↓2←)/K↓c←]; 
    →INI400_000121PAGEBREAK(); 
    →INI400_000020IMG("Q"); 
    →INI400_000122PAGEBREAK(); 
    →INI400_000105TEXT("Axial force in point a"); 
    N↓ac← →INI400_000015= -[Q↓cb←]; 
    →INI400_000106TEXT("Axial force in point b"); 
    N↓bc← →INI400_000014= Q↓ac←; 
    →INI400_000107TEXT("Reactions in point a"); 
    A↓V← →INI400_000019= Q↓cb←; 
    A↓H← →INI400_000017= -[Q↓ac←]; 
    →INI400_000108TEXT("Reactions in point b"); 
    B↓V← →INI400_000018= -[Q↓bc←]; 
    B↓H← →INI400_000016= A↓H←; 
    →INI400_000123PAGEBREAK(); 
    →INI400_000021IMG("N"); 
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="-1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="TRX" Autor2="" Version="1" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Cranked_beam.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Cranked beam - continuous load</ENU>
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
      <Variable Modifier="Public" Name="A↓H←" ESA_ID="Result.01" Type="Double" Value="68600" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="A↓V←" ESA_ID="Result.02" Type="Double" Value="23450" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="B↓H←" ESA_ID="Result.03" Type="Double" Value="68600" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="B↓V←" ESA_ID="Result.04" Type="Double" Value="18550" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="f" ESA_ID="" Type="Double" Value="6000" Precision="3">
        <Description TranslateID="VARIABLE_f">
          <ENU>Continuous load</ENU>
        </Description>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m" />
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="4" Precision="3">
        <Description TranslateID="VARIABLE_h">
          <ENU>Height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
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
      <Variable Modifier="Public" Name="I↓1←" ESA_ID="" Type="Double" Value="4e-3" Precision="3">
        <Description TranslateID="VARIABLE_I↓1←">
          <ENU>Moment of inertia (post)</ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="I↓2←" ESA_ID="" Type="Double" Value="8e-3" Precision="3">
        <Description TranslateID="VARIABLE_I↓2←">
          <ENU>Moment of inertia (beam)</ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="k↓1←" ESA_ID="Result.15" Type="Double" Value="1e-3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="k↓2←" ESA_ID="Result.16" Type="Double" Value="1.142857e-3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="K↓c←" ESA_ID="Result.17" Type="Double" Value="4.285714e-3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="l" ESA_ID="" Type="Double" Value="7" Precision="2">
        <Description TranslateID="VARIABLE_l">
          <ENU>Length</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="M↓ca←" ESA_ID="Result.11" Type="Double" Value="17150" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓cb←" ESA_ID="Result.12" Type="Double" Value="-17150" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓max←" ESA_ID="Result.13" Type="Double" Value="28675.21" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓s←" ESA_ID="Result.10" Type="Double" Value="36750" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="N↓ac←" ESA_ID="Result.05" Type="Double" Value="-23450" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="N↓bc←" ESA_ID="Result.06" Type="Double" Value="-68600" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="Q↓ac←" ESA_ID="Result.07" Type="Double" Value="-68600" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="Q↓bc←" ESA_ID="Result.08" Type="Double" Value="-18550" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="Q↓cb←" ESA_ID="Result.09" Type="Double" Value="23450" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="x↓m←" ESA_ID="Result.14" Type="Double" Value="3.091667" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
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
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="324" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="276" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="243" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="621" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="561" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="435" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000003">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="590" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="523" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="420" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000004">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="555" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="487" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="420" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="508" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="455" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="420" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000006">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="668" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="619" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="435" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000007">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="693" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="644" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="435" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000008">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="733" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="681" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="451" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000009">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="785" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="731" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="451" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="988" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="929" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="312" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000011">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1195" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1132" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="496" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000012">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1229" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1166" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="496" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000013">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1317" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1238" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="496" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000014">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1724" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1601" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="511" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000015">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1699" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1586" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="511" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000016">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1836" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1663" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="526" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000017">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1780" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1632" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="526" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000018">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1821" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1648" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="526" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000019">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1765" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="1617" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="300" Y="511" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|9|0|2" Font2="Tahoma|9|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000020">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1522" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1439" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="542" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000021">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1979" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="619" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000028">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.6|1|2" Font2="Tahoma|15.6|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000088">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000090">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="46.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000091">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="46.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="51.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000092">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="60.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="60.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000093">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="60.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="65.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="51.3" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000095">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="170" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="99.9" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="99.9" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000096">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="170" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="127" Hor="0" Ver="2" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="INI400_000125" Style="2" StyleName="" X="150" Y="94.1" Hor="0" Ver="2" SpX="0" SpY="7" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000099">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="668" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="588" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="588" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000100">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="621" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="542" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="542" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000101">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="733" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="653" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="653" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000102">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="785" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="705" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="705" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000103">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1195" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1105" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1105" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000104">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1317" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1227" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1227" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000105">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1699" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1599" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1599" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000106">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1724" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1625" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1625" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000107">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1765" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1665" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1665" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000108">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1821" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1721" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1721" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000109">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="508" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="428" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="428" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000110">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="555" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="475" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="475" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000111">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="75.4" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="60.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="60.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000112">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="75.4" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="83.3" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="68.7" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000113">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="90.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="60.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="60.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000114">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="200" Y="90.8" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="102" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="150" Y="68.7" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000115">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="111" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000116">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="131" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|2|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000117">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="182" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000118">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="466" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000119">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="848" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000120">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1133" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000121">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1377" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000122">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1667" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000123">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="1849" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000124">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000125">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000126">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000127">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="Lomeny nosnik_" Content="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vkA7muf+H2n3On6J4fubWPdp+oaPavdLuA8qdYUAcDvvX5Tjuinua7uuf8Cf8k88Nf8AYKtf/RS0AdBRUV1dW9layXN3PFBbxLukllcIiD1JPAFSKyugdGDKwyCDkEUALRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFc/4E/wCSeeGv+wVa/wDopa6Cuf8AAn/JPPDX/YKtf/RS0AYXi6aTxFqTaFDo95qumWg3agtq8ADTFcxxN5siZAyJDjPOzPU03TNcu7bwx4SvfneWa1Ni1uWwJLjYNoPvuiYZ5wCfeu/ooWit3Drcq6dbS2enwwT3D3E6rmWVySXc8seegyTgdAMAdKtUUUMAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKyfC2nz6T4R0XTboKLi0sIIJQpyA6Rqpwe/IrWooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA//2Q==" />
      <Image Name="M" Content="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etaijkQfWJLZL7l+tzJ/sIy/8ferance3niEf+QglWLTRdNsZPNt7KFZu8xXdIfq55P51eooUIroKWIqtW5tOy0X3LQKKKKoxCiiigAooooAKKKKAKEWmLFr95qvmktc2sFsY8cKImlbOffzj/3z71foooAKKKKACiiigAooooAKKKKACiiigAooooAo6zaNfaLe20fEskLCM+j4+U/gcGprC7W/062vE+5PEso+jAH+tWKyfD37qyuLI9bO6lhA9FzvQf8AfDrU7SN171Frs7/fv+SNauf8d/8AJPPEv/YKuv8A0U1dBXP+O/8AknniX/sFXX/opqowDwJ/yTzw1/2CrX/0UtdBXP8AgT/knnhr/sFWv/opa6CgAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKybb/R/FF7F0W6gjuF92UlH/Ty61qydU/cavpF52817Zz6LIuR/wCPog/Gpl0ZvQ1cod0/w1/NGtXP+O/+SeeJf+wVdf8Aopq6Cuf8d/8AJPPEv/YKuv8A0U1UYB4E/wCSeeGv+wVa/wDopa6Cuf8AAn/JPPDX/YKtf/RS10FABRRRQAUUUUAFFFFABRRRQAUUUUAFFFYfjG8ksPB2rTwjM32Z0iH+2w2r+pFJ7aDW+puUV5po08uh6Tc+CdLlaPUI76W2t36/ZrdlWVpj7KsmB6sVH03/AIb2MFj4JtDbKVhupJbqMHOdkkjMmc9TtK81XmtidTrKKKKQwooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACsvxHGz6DdSRgtLbgXMYHUtGwcD81xWpSModSrAFSMEHvSkrqxdKfJNT7O4kciyxJIjBkcBlI7g1g+O/+SeeJf+wVdf8Aopqt+G2I0KC3YkvalrViep8timfxCg/jVTx3/wAk88S/9gq6/wDRTURd0mOrDkqSh2YeBP8Aknnhr/sFWv8A6KWugrn/AAJ/yTzw1/2CrX/0UtdBTMwooooAKKKKACiiigAooooAKKKKACq19YW2pW6wXcZkiWWOULuK/MjB1PBGcMoOOhxzVmigDPTQ9Nj1K91FLVVvL2NY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" />
      <Image Name="Q" Content="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QAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHP8AgT/knnhr/sFWv/opa5bxbZa4+pXMzpJbaXHf2l2ZkktIrUxRtGWkmZ/3vmDaemFwqjPUHqfAn/JPPDX/AGCrX/0UtYXi6aTxFqTaFDo95qumWg3agtq8ADTFcxxN5siZAyJDjPOzPU0ruLut1/w412Z3isroHRgysMgg5BFLXAaZrl3beGPCV787yzWpsWty2BJcbBtB990TDPOAT712unW0tnp8ME9w9xOq5llckl3PLHnoMk4HQDAHSqaSbsSm7K5aooopDCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAOf8Cf8AJPPDX/YKtf8A0UtdBWT4W0+fSfCOi6bdBRcWlhBBKFOQHSNVOD35Fa1ABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQB//2Q==" />
      <Image Name="N" Content="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OPQdKsY7W9M5tZJJjZXwt0hvHYMWkYSKzqu58BdwPcdCOj02zvP+EnvZ76DU8RnFrP8AbP8ARTFtUBfKWTl87iWdM56NgAU0un9af19wNnRUUUUgCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigDn/AAJ/yTzw1/2CrX/0UtdBXP8AgT/knnhr/sFWv/opa6CgAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigDn/An/JPPDX/AGCrX/0UtTar4o0/R9Z0zSrgTPc6jJsj8pNyx+jOc/KCcKPUn60nhG1uNP8AA+hWlzC8dzb6bbxyxH7yusagr9cjFcneeGfFV7DPq7yWIvLi8trs2JtszxJDIGSET+ds4G4n5cEs3rmhbrsD2fc9Be7to0nd7iJUg/1zM4Aj4B+b04IPPY1NXNTaPd3HiiffHjSpfJupH3D95NHkBMZzjiNicY+UDnJx0tHQAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/9k=" />
      <Image Name="lomen1" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TGroupBox Name="" ID="18" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000018">
          <ENU>Loading</ENU>
        </Texts>
        <TDoubleInput Name="TDoubleInput" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="f" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
      </TGroupBox>
      <TGroupBox Name="" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000017">
          <ENU>Geometry</ENU>
        </Texts>
        <TSplitContainer Name="" ID="19" Translate="1" Left="1" Top="2" Width="482" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="0" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="190" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
          <Panel1>
            <TPictureBox Name="" ID="20" Translate="1" Left="3" Top="2" Width="165" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="0" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" ImageName="lomen1" SizeMode="1" />
          </Panel1>
          <Panel2>
            <TDoubleInput Name="TDoubleInput" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="I↓2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="50" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
            <TDoubleInput Name="TDoubleInput" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="I↓1←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="50" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
            <TDoubleInput Name="TDoubleInput" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="l" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="50" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
            <TDoubleInput Name="TDoubleInput" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="50" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          </Panel2>
        </TSplitContainer>
      </TGroupBox>
      <TPanel Name="" ID="16" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TStringInput Name="" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
        <TCheckBox Name="TCheckBox" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H2" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000010">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TCheckBox Name="TCheckBox" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000009">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
      </TPanel>
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_INI400_000124">
      <ENU>"Beam parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_000125">
      <ENU>"Loads"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_000126">
      <ENU>"Calculation of moments"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_000127">
      <ENU>"Calculation of internal forces and reactions"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000028">
      <ENU>Caption</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000088">
      <ENU>"Cranked beam (post and beam) loaded by continuous load and supported in two points"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000089">
      <ENU>"Beam parameters"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000090">
      <ENU>"Height"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000091">
      <ENU>"h = " &amp; h</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000092">
      <ENU>"Length"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000093">
      <ENU>"l = " &amp; l</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000094">
      <ENU>"Loads"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000095">
      <ENU>"Continuous load"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000096">
      <ENU>"f = " &amp; f</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000097">
      <ENU>"Calculation of moments"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000098">
      <ENU>"Calculation of internal forces and reactions"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000099">
      <ENU>"Moment in point c"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000100">
      <ENU>"Moment on beam"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000101">
      <ENU>"Distance s for M↓max← from point b"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000102">
      <ENU>"Moment M↓max← in point s"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000103">
      <ENU>"Shear force in point c"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000104">
      <ENU>"Shear force in point b"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000105">
      <ENU>"Axial force in point a"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000106">
      <ENU>"Axial force in point b"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000107">
      <ENU>"Reactions in point a"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000108">
      <ENU>"Reactions in point b"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000109">
      <ENU>"Post"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000110">
      <ENU>"Beam"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000111">
      <ENU>"Moment of inertia (post)"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000112">
      <ENU>"I↓1← = " &amp; I↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000113">
      <ENU>"Moment of inertia (beam)"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000114">
      <ENU>"I↓2← = " &amp; I↓2←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000115">
      <ENU>"Supports are in point a and b, the middle point is c"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000116">
      <ENU>"Reactions are marked H-horizontal, V-vertical"</ENU>
    </Item>
  </Texts>
</Root>