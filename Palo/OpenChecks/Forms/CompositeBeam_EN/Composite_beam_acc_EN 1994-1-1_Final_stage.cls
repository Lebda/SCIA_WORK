<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="05ce698f-128a-4d8b-a9fb-4f30da94d984">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">//This file contains the definition of parameters for calculation of Composite beam according to EN 1994-1-1 in the final stage.

bool construction →INI400_008268= false; 
bool fire →INI400_008269= false; 

//Calculation

object Extern_Calculate →INI400_003295= LoadExternCLC("Composite_beam_acc_EN 1994-1-1 &amp; EN 1994-1-2_MAIN.clc"); 

Extern_Calculate.construction →INI400_008265= construction; 
Extern_Calculate.fire →INI400_008266= fire; 
Extern_Calculate.C↓4← →INI400_008267= C↓4←; 
Extern_Calculate.θ →INI400_008272= θ; 
Extern_Calculate.Pressure →INI400_008273= Pressure; 
Extern_Calculate.simpl_method →INI400_008274= simpl_method; 
Extern_Calculate.plastic_theory →INI400_008275= plastic_theory; 

→INI400_004243Extern_Calculate.Draw(); 


double Unity_check →INI400_008270= Extern_Calculate.Unity_check; </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="1001" Material="1" CSType="-1" LimitState="2" IFFilter="12" LicenceID="10400" Autor="" Autor2="" Version="40" EWNSource="Composite.xml" Icon="Qk3uAAAAAAAAAHYAAAAoAAAAEAAAAA8AAAABAAQAAAAAAAAAAAAAAAAAAAAAABAAAAAQAAAAAAAA/wAAgP8AgAD/AICA/4AAAP+AAID/gIAA/8DAwP+AgID/AAD//wD/AP8A/////wAA//8A/////wD//////3d3d3d3d3d3AAAAAAAAAABmZmZmZmZmZmZ3ZmZmZndmZ3d2ZmZnd2Znd3ZmZmd3dnd3d2Zmd3d2AAAABmd3d3cP//8Hd3d3dw9ETwd3d3d3D///B3d3d3cPTwAHd3d3dw9PDgd3d3d3D/8Ad3d3d3cAAAd3d3d3dw==">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://help.scia.net/15.0/en/#por/composite_en1994/general_input.htm%3FTocPath%3DDesign%2520of%2520composite%2520members%7CComposite%2520Checks%7CComposite%2520Checks%2520EN%25201994%7C_____1</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Composite Beam - Final stage</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="2" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="C↓4←" ESA_ID="MemberData.C4" Type="Double" Value="25" Precision="2">
        <Description TranslateID="VARIABLE_C↓4←">
          <ENU>Load factor (Designers’ guide to EN 1994-1-1, Appendix A)</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="construction" ESA_ID="" Type="Boolean" Value="0">
        <Description>
          <ENU>Construction check </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Extern_Calculate" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Extern_DrawCSS" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="fire" ESA_ID="" Type="Boolean" Value="0">
        <Description>
          <ENU>Fire check</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="plastic_theory" ESA_ID="MemberData.Use_pl" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_plastic_theory">
          <ENU>Use plastic theory calculation (EN 1994-1-1 6.2.1.3 (3))</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Pressure" ESA_ID="MemberData.NA_3_1_6_(1).Pressure" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Pressure">
          <ENU>Compression in flexure and axial loading or other cases</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="simpl_method" ESA_ID="MemberData.Use_alt" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_simpl_method">
          <ENU>Use alternative method for degree of shear connection (EN 1994-1-1 6.6.1.2 (3))</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Unity_check" ESA_ID="Result.1" Type="Double" Value="999" Precision="-2">
        <Description TranslateID="VARIABLE_Unity_check">
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="66" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="θ" ESA_ID="MemberData.Slab_theta" Type="Double" Value="26.5" Precision="2">
        <Description TranslateID="VARIABLE_θ">
          <ENU>Angle of concrete strut (EN 1992-1-1 6.2.4 (4))</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="deg" />
      </Variable>
    </Variables>
    <DrawingGroups />
    <ResultTables />
    <ResultGroups />
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Table</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Detailed</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_2">
          <ENU>Standard</ENU>
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
      <VC ID="INI400_003295">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="370" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="179" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="370" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="370" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="370" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="370" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_004243">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="157" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="157" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="157" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="627" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="627" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="627" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_008265">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008266">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008267">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008268">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008269">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008270">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008271">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008272">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008273">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008274">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008275">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
      <TEMDLoader Name="" ID="203" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="350|4" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="2" Font="Microsoft Sans Serif|8.25|0|3" Active="1" PreDef="0" MemberDirectory="" MemberID="Beam.22" SectionID="-1" CombiID="-1" />
    </Main>
    <MemberData Width="545">
      <TTabControl Name="" ID="121" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="5" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" Index="1" TabBG="-2894893" SelTab="-1" Alignment="0">
        <Texts TranslateID="DIALOG_000121">
          <ENU>National Annex|Design</ENU>
        </Texts>
        <Tabs>
          <Tab Text="National Annex">
            <TGroupBox Name="NA_3_1_6_(1)" ID="192" Translate="1" Height="64" AutoWidth="False" AutoHeight="False" TabIndex="2" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
              <Texts TranslateID="DIALOG_000192">
                <ENU>NA EN 1992-1-1: 3.1.6 (1)</ENU>
              </Texts>
              <TCheckBox Name="" ID="193" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="Pressure" BookMarkID="" ForeColor="-16711423" ChbRight="False">
                <Texts TranslateID="DIALOG_000193">
                  <ENU>
                  </ENU>
                </Texts>
              </TCheckBox>
            </TGroupBox>
          </Tab>
          <Tab Text="Design">
            <TGroupBox Name="" ID="200" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
              <Texts TranslateID="DIALOG_000200">
                <ENU>LTB</ENU>
              </Texts>
              <TDoubleInput Name="" ID="202" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="C↓4←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="45" MinValueWithDim="5" DescPos="1" />
            </TGroupBox>
            <TGroupBox Name="" ID="143" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
              <Texts TranslateID="DIALOG_000143">
                <ENU>Shear connectors</ENU>
              </Texts>
              <TCheckBox Name="" ID="197" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="32" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="plastic_theory" BookMarkID="" ForeColor="-16711423" ChbRight="False">
                <Texts TranslateID="DIALOG_000197">
                  <ENU>
                  </ENU>
                </Texts>
              </TCheckBox>
              <TCheckBox Name="TCheckBox" ID="198" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="33" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="simpl_method" BookMarkID="" ForeColor="-16711423" ChbRight="False">
                <Texts TranslateID="DIALOG_000198">
                  <ENU>
                  </ENU>
                </Texts>
              </TCheckBox>
            </TGroupBox>
            <TGroupBox Name="" ID="146" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
              <Texts TranslateID="DIALOG_000146">
                <ENU>Concrete slab</ENU>
              </Texts>
              <TDoubleInput Name="TDoubleInput" ID="77" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="θ" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="45" MinValueWithDim="26.5" DescPos="1" />
            </TGroupBox>
          </Tab>
        </Tabs>
      </TTabControl>
    </MemberData>
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts />
</Root>