﻿<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="2d156fb5-46f3-432b-9220-9d785fd7f000">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">//This file contains the definition of parameters for calculation of Composite beam according to EN 1994-1-1 &amp; EN 1994-1-2 in the final stage.

bool construction →INI400_008268= false; 
bool fire →INI400_008269= true; 

//Calculation

object Extern_Calculate →INI400_003295= LoadExternCLC("Composite_beam_acc_EN 1994-1-1 &amp; EN 1994-1-2_MAIN.clc"); 

Extern_Calculate.construction →INI400_008265= construction; 
Extern_Calculate.fire →INI400_008266= fire; 
Extern_Calculate.C↓4← →INI400_008267= C↓4←; 
Extern_Calculate.θ →INI400_008272= θ; 
Extern_Calculate.Pressure →INI400_008273= Pressure; 
Extern_Calculate.protection →INI400_008276= protection; 
Extern_Calculate.α↓c← →INI400_008277= α↓c←; 
Extern_Calculate.ε↓f← →INI400_008278= ε↓f←; 
Extern_Calculate.ε↓m← →INI400_008279= ε↓m←; 
Extern_Calculate.γ↓M,fi,a← →INI400_008280= γ↓M,fi,a←; 
Extern_Calculate.γ↓M,fi,c← →INI400_008283= γ↓M,fi,c←; 
Extern_Calculate.γ↓M,fi,s← →INI400_008284= γ↓M,fi,s←; 
Extern_Calculate.γ↓M,fi,v← →INI400_008285= γ↓M,fi,v←; 
Extern_Calculate.ρ↓p← →INI400_008278= ρ↓p←; 
Extern_Calculate.c↓p← →INI400_008279= c↓p←; 
Extern_Calculate.λ↓p← →INI400_008280= λ↓p←; 
Extern_Calculate.d↓p← →INI400_008281= d↓p←; 
Extern_Calculate.R →INI400_008282= R; 

→INI400_004243Extern_Calculate.Draw(); 


double UC →INI400_008270= Extern_Calculate.UC; 
double b↓eff← →POR106_000001= Extern_Calculate.b↓eff←; </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="1001" Material="1" CSType="-1" LimitState="2" IFFilter="12" LicenceID="10400" Autor="" Autor2="" Version="43" EWNSource="Composite.xml" Icon="Qk3uAAAAAAAAAHYAAAAoAAAAEAAAAA8AAAABAAQAAAAAAAAAAAAAAAAAAAAAABAAAAAQAAAAAAAA/wAAgP8AgAD/AICA/4AAAP+AAID/gIAA/8DAwP+AgID/AAD//wD/AP8A/////wAA//8A/////wD//////3d3d3d3d3d3AAAAAAAAAABmZmZmZmZmZmZ3ZmZmZplmZ3d2ZmZpmWZnd3ZmZmmZlnd3d2ZomZl2AAAABmmZmXcP//8HmZmZdw9ETwd5mZl3D///B3eZl3cPTwAHd5l3dw9PDgd5l3d3D/8Ad3d3d3cAAAd3d3d3dw==">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English " />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://help.scia.net/15.0/en/#sr/composite_analysis_model/04_01-composite_en_checks.htm%3FTocPath%3DDesign%2520of%2520composite%2520members%7CComposite%2520Checks%7CComposite%2520Checks%2520EN%25201994%7C_____0</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Composite Beam check - EN 1994-1-2 - Final stage</ENU>
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
      <Variable Modifier="Public" Name="b↓eff←" ESA_ID="Result.2" Type="Double" Value="1.7675" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="2" ESAStyle="0" ESAUnit="11" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1000" DrawLimitMin="100e-6" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="C↓4←" ESA_ID="MemberData.C4" Type="Double" Value="25" Precision="2">
        <Description TranslateID="VARIABLE_C↓4←">
          <ENU>Load factor (Designers’ guide to EN 1994-1-1, Appendix A)</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓p←" ESA_ID="MemberData.protection_heat" Type="Double" Value="1100" Precision="2">
        <Description TranslateID="VARIABLE_c↓p←">
          <ENU>Specific heat of protection material (EN 1994-1-2 3.3.4 (1)P)</ENU>
        </Description>
        <Unit m="2" kg="0" s="-2" A="0" K="-1" cd="0" mol="0" Coef="1" Dim="J/kg∙K" />
      </Variable>
      <Variable Modifier="Public" Name="construction" ESA_ID="" Type="Boolean" Value="0">
        <Description>
          <ENU>Construction check </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d↓p←" ESA_ID="MemberData.protection_thickness" Type="Double" Value="20e-3" Precision="2">
        <Description TranslateID="VARIABLE_d↓p←">
          <ENU>Thickness of protection material</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
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
      <Variable Modifier="Public" Name="fire" ESA_ID="" Type="Boolean" Value="1">
        <Description>
          <ENU>Fire check</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Pressure" ESA_ID="MemberData.NA_3_1_6_(1).Pressure" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Pressure">
          <ENU>Compression in flexure and axial loading or other cases</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="protection" ESA_ID="MemberData.fire" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_protection">
          <ENU>Fire protection</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="R" ESA_ID="MemberData.Resistance" Type="Double" Value="1800" Precision="2">
        <Description TranslateID="VARIABLE_R">
          <ENU>Fire resistance</ENU>
        </Description>
        <Unit m="0" kg="0" s="1" A="0" K="0" cd="0" mol="0" Coef="60" Dim="min" />
      </Variable>
      <Variable Modifier="Public" Name="UC" ESA_ID="Result.1" Type="Double" Value="NaN" Precision="-2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="66" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓c←" ESA_ID="MemberData.alpha_c" Type="Double" Value="25" Precision="2">
        <Description TranslateID="VARIABLE_α↓c←">
          <ENU>Convective heat transfer coefficient ( EN 1991-1-2 Annex B)</ENU>
        </Description>
        <Unit m="0" kg="1" s="-3" A="0" K="1" cd="0" mol="0" Coef="1" Dim="W/m↑2←∙K" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓M,fi,a←" ESA_ID="MemberData.gamma_a" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_γ↓M,fi,a←">
          <ENU>Steel section (EN 1994-1-2 2.3)</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓M,fi,c←" ESA_ID="MemberData.gamma_c" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_γ↓M,fi,c←">
          <ENU>Concrete (EN 1994-1-2 2.3)</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓M,fi,s←" ESA_ID="MemberData.gamma_s" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_γ↓M,fi,s←">
          <ENU>Reinforcement (EN 1994-1-2 2.3)</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓M,fi,v←" ESA_ID="MemberData.gamma_v" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_γ↓M,fi,v←">
          <ENU>Shear connectors (EN 1994-1-2 2.3)</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓f←" ESA_ID="MemberData.emissivity_fire" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_ε↓f←">
          <ENU>Emissivity coefficient of the fire (EN 1991-1-2 3.1 (6))</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓m←" ESA_ID="MemberData.emissivity_steel" Type="Double" Value="700e-3" Precision="2">
        <Description TranslateID="VARIABLE_ε↓m←">
          <ENU>Emissivity coefficient for steel and concrete (EN 1994-1-2 2.2 (2))</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="θ" ESA_ID="MemberData.Slab_theta" Type="Double" Value="26.5" Precision="2">
        <Description TranslateID="VARIABLE_θ">
          <ENU>Angle of concrete strut (EN 1992-1-1 6.2.4 (4))</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="deg" />
      </Variable>
      <Variable Modifier="Public" Name="λ↓p←" ESA_ID="MemberData.protection_lambda" Type="Double" Value="120e-3" Precision="2">
        <Description TranslateID="VARIABLE_λ↓p←">
          <ENU>Thermal conductivity of protection material (EN 1994-1-2 3.3.4 (1)P)</ENU>
        </Description>
        <Unit m="1" kg="1" s="-3" A="0" K="-1" cd="0" mol="0" Coef="1" Dim="W/m∙K" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓p←" ESA_ID="MemberData.protection_density" Type="Double" Value="550" Precision="2">
        <Description TranslateID="VARIABLE_ρ↓p←">
          <ENU>Density of protection material</ENU>
        </Description>
        <Unit m="-3" kg="1" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="kg/m↑3←" />
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
      <VC ID="INI400_008276">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008277">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008278">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008279">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008280">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008281">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008282">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008283">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008284">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008285">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="POR106_000001">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
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
      <TEMDLoader Name="" ID="230" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="350|4" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="2" Font="Microsoft Sans Serif|8.25|0|3" Active="1" PreDef="0" MemberDirectory="" MemberID="Beam.22" SectionID="-1" CombiID="-1" />
    </Main>
    <MemberData Width="545">
      <TTabControl Name="" ID="121" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="5" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" Index="1" TabBG="-2894893" SelTab="-1" Alignment="0">
        <Texts TranslateID="DIALOG_000121">
          <ENU>National Annex|Design|Fire Design</ENU>
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
            <TGroupBox Name="" ID="146" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
              <Texts TranslateID="DIALOG_000146">
                <ENU>Concrete slab</ENU>
              </Texts>
              <TDoubleInput Name="TDoubleInput" ID="77" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="θ" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="45" MinValueWithDim="26.5" DescPos="1" />
            </TGroupBox>
          </Tab>
          <Tab Text="Fire Design">
            <TGroupBox Name="" ID="207" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
              <Texts TranslateID="DIALOG_000207">
                <ENU>Protected steel</ENU>
              </Texts>
              <TDoubleInput Name="" ID="213" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="ρ↓p←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="" ID="212" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="c↓p←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="" ID="211" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="d↓p←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="" ID="210" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="λ↓p←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TCheckBox Name="" ID="208" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="protection" BookMarkID="" ForeColor="-16711423" ChbRight="False">
                <Texts TranslateID="DIALOG_000208">
                  <ENU>
                  </ENU>
                </Texts>
              </TCheckBox>
            </TGroupBox>
            <TGroupBox Name="" ID="204" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
              <Texts TranslateID="DIALOG_000204">
                <ENU>Unprotected steel</ENU>
              </Texts>
              <TDoubleInput Name="" ID="228" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="α↓c←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="" ID="227" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="ε↓f←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="10" MinValueWithDim="0" DescPos="1" />
              <TDoubleInput Name="" ID="226" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="ε↓m←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="10" MinValueWithDim="0" DescPos="1" />
            </TGroupBox>
            <TGroupBox Name="" ID="218" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
              <Texts TranslateID="DIALOG_000218">
                <ENU>Partial factors</ENU>
              </Texts>
              <TDoubleInput Name="" ID="222" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="γ↓M,fi,s←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="" ID="221" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="γ↓M,fi,v←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="" ID="220" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="γ↓M,fi,c←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
              <TDoubleInput Name="" ID="219" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="γ↓M,fi,a←" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
            </TGroupBox>
            <TGroupBox Name="" ID="225" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
              <Texts TranslateID="DIALOG_000225">
                <ENU>Resistance</ENU>
              </Texts>
              <TDoubleInput Name="" ID="229" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|7.8|0|3" VarName="R" VarNameVisible="True" UnitsVisible="True" InputColor="-2302756" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
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