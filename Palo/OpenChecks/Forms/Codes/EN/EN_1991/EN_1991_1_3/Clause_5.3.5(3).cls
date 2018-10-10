<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="170001" GUID="28e78044-386e-4be6-81ef-bfab4365896a">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">//External clc for National annexes
//NA.2.19 Clause 5.3.5 Cylindrical roofs, Paragraph (3)
//For change value for some NA - change it in CustomLibrary EC_NA_1991_1_3.xml
//For use formula, uncomment proper code and place formula there. Save and export file after this change.

→INI400_006305BLOCK { //NA.2.18 Clause 5.3.5 Cylindrical roofs, Paragraph (1)
    object Clause5_3_5_1 →INI400_006306= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1991\EN_1991_1_3\Clause_5.3.5(1).CLC"); 
    →INI400_006309Clause5_3_5_1.Calculate(false); 
    double μ↓3,max← →INI400_006308= Clause5_3_5_1.μ↓3,max←; 
} 
→INI400_006538BLOCK("Case (ii) - Drifted snow") { 
    SWITCH(IO.SetupNA.EC_NA.Code) { 
        //    CASE "ONORM": { } 
        //    CASE "NBN": { } 
        CASE "BS" :  { 
            IF(δ &lt; 30) { 
                →INI400_006500IMG("CylindricalRoof_Case_II_BS1"); 
            } ELSE { 
                IF(δ &lt;= 60) { 
                    →INI400_006501IMG("CylindricalRoof_Case_II_BS2"); 
                } ELSE { 
                    →INI400_006502IMG("CylindricalRoof_Case_II_BS3"); 
                } 
            } 
            →INI400_006521PAGEBREAK(); 
            α →INI400_006330= ARCTG(h/(b/2)); 
            IF(α &lt;= 15) { 
                →INI400_006503TEXT("Case ii is not necessary"); 
                Exit(); 
            } ELSE { 
                →INI400_006507BLOCK { 
                    IF(α &lt;= 30) { 
                        →INI400_006497TEXT("Shape coefficient"); 
                        μ↓1← →INI400_006320= 0.4; 
                        →INI400_006504TEXT("Shape coefficient"); 
                        μ↓2← →INI400_006321= 0.8+0.4*[(α-15)/15]; 
                        →INI400_006505TEXT("Shape coefficient"); 
                        μ↓3← →INI400_006322= MIN(μ↓2←*[60-δ]/30, μ↓3,max←); 
                    } ELSE { 
                        IF(α &lt; 60) { 
                            →INI400_006512TEXT("Shape coefficient"); 
                            μ↓1← →INI400_006323= 0.4; 
                            →INI400_006513TEXT("Shape coefficient"); 
                            μ↓2← →INI400_006325= 1.2*[60-α]/30; 
                            →INI400_006514TEXT("Shape coefficient"); 
                            μ↓3← →INI400_006324= MIN(μ↓2←*[60-δ]/30, μ↓3,max←); 
                        } ELSE { 
                            →INI400_006515TEXT("Shape coefficient"); 
                            μ↓1← →INI400_006326= 0; 
                            →INI400_006516TEXT("Shape coefficient"); 
                            μ↓2← →INI400_006327= 0; 
                            →INI400_006517TEXT("Shape coefficient"); 
                            μ↓3← →INI400_006328= 0; 
                        } 
                    } 
                } 
            } 
            IF(δ &lt; 30) { 
                →INI400_006509TEXT("Snow load at unit lenght of the roof"); 
                S →INI400_006329= (μ↓2←+μ↓1←)/2*(b/2)*C↓e←*C↓t←*s↓k←; 
            } ELSE { 
                IF(δ &lt;= 60) { 
                    →INI400_006518TEXT("Distance from the center to μ↓2←"); 
                    x1 →INI400_006331= b/2*(30/δ); 
                    →INI400_006510TEXT("Snow load at unit lenght of the roof"); 
                    S →INI400_006332= (μ↓1←+μ↓2←)/2*x1+(μ↓2←+μ↓3←)/2*[b/2-x1]*C↓e←*C↓t←*s↓k←; 
                } ELSE { 
                    →INI400_006520TEXT("Distance from the center to left 0"); 
                    x1 →INI400_006333= b/2*(60/δ); 
                    →INI400_006519TEXT("Distance from the center to μ↓2←"); 
                    x2 →INI400_006334= b/2*(30/δ); 
                    →INI400_006511TEXT("Snow load at unit lenght of the roof"); 
                    S →INI400_006335= (μ↓1←+μ↓2←)/2*x2+μ↓2←/2*[x1-x2]*C↓e←*C↓t←*s↓k←; 
                } 
            } 
            s↓1← →INI400_006539= 0; 
            s↓2← →INI400_006540= 0; 
        } 
        CASE "CSN" :  { 
            →INI400_006522IMG("CylindricalRoof_Case_II_CSN"); 
            →INI400_006523PAGEBREAK(); 
            →INI400_006525TEXT("Shape coefficient"); 
            IF(h/b &lt;= 1/8) { 
                μ↓3,2← →INI400_006530= 1.45; 
            } ELSE { 
                IF(h/b &lt;= 1/5) { 
                    μ↓3,2← →INI400_006311= LinInterp(h/b, new PointD(1/8, 1.45), new PointD(1/6, 1.8), new PointD(1/5, 2)); 
                } ELSE { 
                    μ↓3,2← →INI400_006312= μ↓3,max←; 
                } 
            } 
            →INI400_006527BLOCK { 
                →INI400_006526TEXT("Snow load at the unit area"); 
                s↓1← →INI400_006313= μ↓3,2←*C↓e←*C↓t←*s↓k←; 
                s↓2← →INI400_006314= 0.5*μ↓3,2←*C↓e←*C↓t←*s↓k←; 
            } 
            IF(UnitLoad) { 
                →INI400_006528TEXT("Snow load at unit lenght of the roof"); 
                S →INI400_006529= 1/2*(s↓1←*(l↓s←/2))+1/2*(s↓2←*(l↓s←/2)); 
            } 
        } 
        //    CASE "NEN": { } 
        CASE "SFS" :  { 
            →INI400_006531IMG("CylindricalRoof_Case_II_SFS"); 
            →INI400_006532PAGEBREAK(); 
            →INI400_006533TEXT("Shape coefficient"); 
            IF(h/b &gt;= 0.18) { 
                μ↓3,2← →INI400_006341= μ↓3,max←; 
            } ELSE { 
                μ↓3,2← →INI400_006342= LinInterp(h/b, new PointD(0, 0.2), new PointD(0.18, μ↓3,max←)); 
            } 
            →INI400_006534TEXT("Snow load at the unit area"); 
            s↓1← →INI400_006535= μ↓3,2←*C↓e←*C↓t←*s↓k←; 
            IF(UnitLoad) { 
                →INI400_006536TEXT("Snow load at unit lenght of the roof"); 
                S →INI400_006537= 1/2*(s↓1←*(l↓s←/2)); 
            } 
            s↓2← →INI400_006541= 0; 
        } 
        //    CASE "NF": { } 
        //    CASE "DIN": { } 
        //    CASE "ELOT": { } 
        //    CASE "IS": { } 
        //    CASE "LU": { } 
        //    CASE "PN": { } 
        //    CASE "SR": { } 
        //    CASE "STN": { } 
        //    CASE "SIST": { } 
        DEFAULT :  { 
            →INI400_006499IMG("CylindricalRoof_Case_II_Def"); 
            →INI400_006524PAGEBREAK(); 
            →INI400_006347TEXT("Shape coefficient"); 
            IF(h/b &gt;= 0.18) { 
                μ↓3,2← →INI400_000194= μ↓3,max←; 
            } ELSE { 
                μ↓3,2← →INI400_000195= LinInterp(h/b, new PointD(0, 0.2), new PointD(0.18, μ↓3,max←)); 
            } 
            →INI400_006508BLOCK { 
                →INI400_000166TEXT("Snow load at the unit area"); 
                s↓1← →INI400_000027= 0.5*μ↓3,2←*C↓e←*C↓t←*s↓k←; 
                s↓2← →INI400_006346= μ↓3,2←*C↓e←*C↓t←*s↓k←; 
            } 
            IF(UnitLoad) { 
                →INI400_000172TEXT("Snow load at unit lenght of the roof"); 
                S →INI400_000170= 1/2*(s↓1←*(l↓s←/2))+1/2*(s↓2←*(l↓s←/2)); 
            } 
        } 
    } 
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="706" Autor="" Autor2="" Version="1" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English " />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://sciadesignforms.com/</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Calculation</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Caption" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Subcaption" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Headline 1" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 2" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 3" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 4" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline 6" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Standard, dY 0" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 5, Understrike" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Standard, dY 10" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dX 10" X="0" Y="0" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, follow, dX 5" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Check, follow dX 5, bold" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Remark, dX 50" X="50" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Remark, dX 50, bold" X="0" Y="0" Hor="1" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" />
      <Style Key="Formula, dX 50" X="0" Y="0" Hor="1" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dY 10" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 100" X="0" Y="0" Hor="1" Ver="2" SpX="100" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 150" X="0" Y="0" Hor="1" Ver="2" SpX="150" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 200" X="0" Y="0" Hor="1" Ver="2" SpX="200" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 300" X="0" Y="0" Hor="1" Ver="2" SpX="300" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, dX 250" X="0" Y="0" Hor="1" Ver="2" SpX="250" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 20" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 30" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, dY 60" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="60" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
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
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>b</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓e←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>C↓e←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓t←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>C↓t←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Clause5_3_5_1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>Clause5_3_5_1</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>h</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="l↓s←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>l↓s←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="S" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>S</ENU>
        </LocalNames>
        <Unit m="0" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m" />
      </Variable>
      <Variable Modifier="Public" Name="s↓1←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>s↓1←</ENU>
        </LocalNames>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓2←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>s↓2←</ENU>
        </LocalNames>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="s↓k←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>s↓k←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UnitLoad" ESA_ID="" Type="Boolean">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>UnitLoad</ENU>
        </LocalNames>
      </Variable>
      <Variable Modifier="Public" Name="x1" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>x1</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="x2" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>x2</ENU>
        </LocalNames>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="α" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>α</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="β" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>β</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="δ" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>δ</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓1←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>μ↓1←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓2←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>μ↓2←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓3,2←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>μ↓3,2←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓3,max←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>μ↓3,max←</ENU>
        </LocalNames>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="μ↓3←" ESA_ID="" Type="Double" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <LocalNames>
          <ENU>μ↓3←</ENU>
        </LocalNames>
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
          <ENU>Brief - Segoe UI</ENU>
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
      <VC ID="INI400_000027">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="886" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="886" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="886" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000166">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000170">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000172">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000191">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000192">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="135" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="135" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000193">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="155" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|2|2" Font2="Arial|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="155" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|2|2" Font2="Arial|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000194">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000195">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000203">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000204">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="135" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="135" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000205">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="155" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|2|2" Font2="Arial|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="155" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|2|2" Font2="Arial|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006305">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="632" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="632" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="632" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006306">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="645" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="645" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="645" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006308">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="666" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="666" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="666" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006309">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="658" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="658" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="658" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006311">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006312">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006313">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006314">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006316">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006317">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006318">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006319">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006320">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006321">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006322">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006323">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006324">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006325">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006326">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006327">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006328">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 200" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006329">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006330">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="10" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006331">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006332">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006333">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006334">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006335">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="15" />
        <Set Vis="1" Prev="INI400_006333" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006336">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006337">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006338">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006339">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="135" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="135" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006340">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="155" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|2|2" Font2="Arial|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="155" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|2|2" Font2="Arial|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006341">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006342">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006343">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="945" Hor="0" Ver="4" SpX="200" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="10" Y="945" Hor="0" Ver="4" SpX="200" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1181" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1181" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1181" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006344">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, dX 50" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006345">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006346">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 100" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="886" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="886" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="886" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006347">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006348">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006497">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006499">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006500">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006501">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006502">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006503">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006504">
        <Set Vis="1" Prev="INI400_006497" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006497" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006507" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006505">
        <Set Vis="1" Prev="INI400_006504" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006504" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006506">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="624" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="624" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006507">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006508">
        <Set Vis="1" Prev="INI400_006347" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006347" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006509">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006510">
        <Set Vis="1" Prev="INI400_006518" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006518" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006518" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006511">
        <Set Vis="1" Prev="INI400_006519" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006519" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006519" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006512">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006513">
        <Set Vis="1" Prev="INI400_006512" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006512" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006512" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006514">
        <Set Vis="1" Prev="INI400_006513" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006513" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006513" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006515">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006516">
        <Set Vis="1" Prev="INI400_006515" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006515" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006515" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006517">
        <Set Vis="1" Prev="INI400_006516" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006516" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006516" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006518">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006519">
        <Set Vis="1" Prev="INI400_006520" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006520" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006520" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006520">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006521">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006522">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006523">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006524">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006525">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006526">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006527">
        <Set Vis="1" Prev="INI400_006525" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006525" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006528">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006529">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006530">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="214" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006531">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006532">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006533">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, dX 10" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006534">
        <Set Vis="1" Prev="INI400_006533" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006533" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006533" Style="0" StyleName="Standard, dY 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006535">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006536">
        <Set Vis="1" Prev="INI400_006534" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="INI400_006534" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="0" Prev="INI400_006534" Style="0" StyleName="Standard, dY 20" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1229" Hor="1" Ver="4" SpX="0" SpY="7" Font1="Arial|13|4|2" Font2="Arial|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006537">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dX 250" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, dY 10" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1261" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006538">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006539">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006540">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006541">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="CylindricalRoof_Case_II_Def" Content="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" />
      <Image Name="CylindricalRoof_Case_II_BS1" Content="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" />
      <Image Name="CylindricalRoof_Case_II_BS2" Content="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" />
      <Image Name="CylindricalRoof_Case_II_BS3" Content="iVBORw0KGgoAAAANSUhEUgAAASEAAAE1CAYAAACoWlaWAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADrwAAA68AZW8ckkAACQvSURBVHhe7Z3ZteS4sUVlSFkgC+pPVrQhZYEsKEfkhP7KAlnQjuhpt+qoovHAKQmAAeLstWIlBxBjxCFA5s37l38bY8yDWISMMY9iETLGPIpFyBjzKBYhY8yjWISMMY9iEXoRf//73//9l7/85f/Z3/72tz/OYWzX+Oc///lzy5ixWIReBAITBUdWE6UI+xw/yz/+8Y8/8h0pXP/6178slC/FIrQIpRghJIJ9zp9Bwqb8zl53l99++21zFrciCDJ9XwrzjEJtEVoIHFQi9Ne//vVPx846L44vAasFQQ+u1vGtqB+2jDHlc9SNoRUWoQVBRL5+/frH7ALH5fMsLIu+fPkyzNEph8D68ePHzyPvIc5Gz8I1W8a4SJBmEiKL0MIowM8uc7gT65nTCEfXs6q3zoBa9yFCRJ6ynstX6t2q7hahl0HAng1anFSBfsZhSae8Sd9ThMg7lvdGaKP6kba2gj7TuMYxQqR0/E6/kke0u1iEXgCOJqcqHW8PpeXaI8ckXXS4K+Vc5Ux93gD9Rzvp1x59qfw1dmyrvAjnZbU+L48rD43TXSxCL0AOps8zaOou5zq6Vk4q4rUtkWOXgfIm6HugP2ln7NdW0I/Kn/7Etp79KS1GulgfHcOExghr4QMWoRcRHQ7nkbPXqL3y5rqt4Cc/BQzXtnC+Eh5679VhZuivOD7qPwV0KzROKgeTkPB5BGliOtVNY98Di9CLwKFlckQ+5fAR3oqVTsW+nK6Gzu+J2x2oE/V9GxIajYVmoYLtuwHO9XpFH8sSqkPNFyLko7povLWt462xCL0InJvZhPj999+rzkM6XufWwJF7icwezK742sAbYAxoD6bxKEWf4FY/l6J0BvIlP8rgWuzbt2+7Y/f9+/c/lRshH4mY6hx9h2NX63gWi9BL0MxHhvPImUpIi9PVkGOPRHV/C+p/TO0qZyLxHOiaIyRYMpVzFvX11oyI8xiUeXNdDyxCL0AOLnAcOVvpoEq7d8fs5Ww1joIiO9RbbQD6W9vqa40B6cqgVruP2q8ysDKfK5R1Kon1L7cp91P26jvO20w3thwEoSmdOzrWFkfnW6HAOgrArKgv1Q4FGtta2nBM7Sv7Pp6rwTnljbG9d/M4i/KsEetI+drmONaDMd5muiInPeMkOCC2BwHUGwXCrAIEsf4xeGnb1pKWNEdCorxk7LfsJ4mL8uSTMjDqzqfQfkzfGovQS5ADRcctKZ1vi97PhFSPWh0zQn3Vt3wK9iPqW0xCrgAu05bEMjAFfy8oQ/nHOpZlqi1d6/Lz07wEnEZOVd5xdfwIRIh8eqA6xGDOjIJTosC2ArLspygcWo4diYnyjOW0WHIdEdvxNBahieEVvJwdK5dRnBd6xXrH7jotwUU+I4JsD8qnLfQXr7UjnMP0ZpE0cWbIOfVz3Ca9BGXrrSRwjjK5jrR8ch15jUTtz4BFaGJwXAkDn5pdKBgitWNb9FiOMWOg/F4zrDOoD2SR8hyGYKjeEfZJr20Z/S+LkAfpOU46gl/9oHOj+0XtzUCOWpiPQITk8DiUAoNj2hYKkiO4rrUIKZDLOo2G8hXs1CcGftln7Gt2UtadbY6JrXNskw/72a3HjecsFqGJ4U6NA8nRBdsxwCQC8dgWrR2SMqkflomtOlFfCYn6oRQdYL9cdkXR0XIL4xj5Ku8MRp3i/ujlYMQi9AJwIjm8nD6iwDhC+bQUIZV9RgBHQn2oVxQSHZNoxD5jm/6pobTR4pIrI3vtGY1FaFIkGHxGZ6851lmHUwC1EqGsAiSoX5wB0EccE/SD+o021Nqha9R3ErDMqL5ZsAhNCk5EAETnrwmN0pxBztlChJRX5oCkbrGt6qsoLLU+5TqOxyVXLV1GqLvqnAWL0IQoWCI6poBQ8BNM2BlIx7Xls46rzCBAotaPW/2gc+rn7EuuGrH+WbAITQjBgBOV/4GCY3ptT4BwnmNnREV53hUg/VzE3XxGwUxo66GsfgqFNLQJ0xJtlvZF5A+yLFiEJkVCgzOxzR0OA+7Oupvr2B6aot+9q3P9bLODmpio/xSs9CP2BmiPfCMLFqGJIYAkNFFE5GQIwhlnk2PegbIVsDNC/ak7bZDN2pYt8Bfale0mYRGaDAXLXoDI0fg8gjStBOhuPk/AUoy6yyTgb4SbUsYxsghNhO7U+tya6XAM4/wWuivilHfvjMpnJugf6kzd1afZZggtoX20MyMWoYko79IxkOJxKNOWaCl3F8rBZgCRUX9hR330FjRTzdpWi9BEbN3Jandw0vb+Kr4COvsMolxyEYwriA9IgDLfKCxCk6CZCw6lZVj8qY4Ir5H3lmJ30U+IYNQrG9QJ4Ymv1umv3qKcDYlvdsG1CE0IdzcJUu0O19vxyDvjnVX1kvCwnX2WZixC00CAyQR3/DLIOE8A9go+Te8zBbfaLIt9ZPJjEZoAgoq7egw2tmtLIc71mqVIgDIEOXWJ/eFZz7xYhCaAIFOASQQIuvK5T0+RUN69BO4sajt1UX0yPpcy57EIJUcPF0F3fkAUePAaUXD2gLyfFKA468F6CK15BotQQhAYzXy4yyvgNAsAPstA7BWcPcVtD7VXwsO2+sW8B4tQQvQKvgRB4hwByWd8Ra/X0S2XJiqvXPb1gvbo1brayTZ9sfV1BDM/FqGEEHxXZzSfXLPH6GdAccZDO1q2xeTGIpQMgi8GZPncpwbXkLblUoU69Bag2FY+JTx8ytQPdy3mGZe75nksQslQwACBomVWDNISnW8F5ZBnD2iT8o8mMXrCqA9mYXoGi1AyakKjIIlBIwic8tgdlF+rgKReEh4957lqEuBPTUJ+xfZE37TFIjQZBEYUCM0gWkFed4Lvk4CXWMhaCeAWEkXsbH2V3rTHIjQ5BEirpViLvM4Gdas6t0RCg9XqHI00/pJkGyxCE6MvMt796/D4Kv5KYJFWr9TLIMXIj3OkkcUlGee2uNumFvDD8Ko3dd1aTqqNFqXPsAhNDM7fYolAIF2ZmRBwWgaWRp2OllOc1/VlubRH57IS618ax1uMyUpYhCaGO/Pd5ycETSkEW+hZSqvAUzDr+pjnLIFMPal/rDvG2MzShqexCE0KAYyz30HBcyRkW4HGca49un4LriMP5XdmFkV6mcrOsHSD2JZoqqupYxGaFByboP0UBcxecJCmJj4x6DWLuUKZL9va36sP55QGUxuyiJCgbrXnR9R3r32rYhGaFDn1J8RgrkFQx+CR1crbOl5DorGVH6KKGNXgoS/XxDqzv5U+A9Q1iq3szs3jjViEJkTB/OnbGAJjSzhKocD27t57eYmYJ+m38pPQ1PKTMEaO6pYJiVEUpaN+WwWL0ITIkT+hdi2BXBOfM0FCflhJmSdpziybtvJj9hDrs5UuO9Q59jH7swhpLyxCk6EZwdXnIMwyeE6Bsc13YAjs8tkF+9+/f/951THUQ3Uh32/fvv0vTwnHlRmbhKuE+pIvZZGv6s4n52aCnyWh3mW/nxH9N2IRmgzdSa+imUOcnZT26R055inh+RTqQD41NLtSPd8wg6iNxxXRfgMWocnASa8GeenkpX0qGmUASeTumuoU7c0gprq5yN7e5ohFaCJwTBz0LCxdonMroLWPfTKbKJcSI2wFGIvYZsbuDbO9IyxCE4FTYkcgNKX4QDyGkFxx8PJuTZ4ck7C1QnmujJ6pyd4uRBahScARFfw1FLzReeXAulZ2RsgE15biE59Z6FgrKGt1EYLY59iVMZsNi9AkSGBKSuHBWSUcnCudmXNniPkqrxqc3zp3FcStZX6zU94A2H7jQ2uL0ATE4GRbr6k5ple7HOMcplfX8dmNrt1C+ZKuzHcPldkCXu9T9lGZq8E4aIn25cuX1/WPRWgCJAxn7orxvLb34G6r/HXdFVEhPde34Ex9VyaOaas+z4BHPDlRII6cLzopxt1zC+6mMT3bZ5dqEa5tERCxnWab2E+fjlk2POIJKWcn2JGzlQKE1WY05BvT3hWQFnkILQHNPi1uHpmwCCWiFAi2mbGwvUe8RteVjlnm3eq5Anm1EA7quzdzM3+mHPOZhcgilACCODpUDOqj2UFNgAQzob28W9AqT/LxA+lrIDxxbFu9IBiNReghcKAoELXZC3Bui1JgogCdybsFLfImD+pprhOFaNaZpEd+ENyluNPz2hxnwWnYRiz4q+oanOeVbA3y4pycj33y0mt5jvHKewSf3oG5jnpis97FM0DfxXGfrS8tQp3hToVj4CAYd33E4gykry1R4t2vNPLuNeupQZlxBnYWteGTa02d6GdnfSwDFqFO4ARyiE+cQteXIlQToCvC1hrK/6Rs6mwBagszIPpUfjHyZnQHi9ANykFmPzrBHXHQ9ZFSgLScexLq8XQdzC9KH5lBiCxCN9AA81lOhe8MvhxJwc1+FDdZbak2mlhPkwP5j+yOL47AInQDgk8DjQi1Ckbli/NEcZMhSJhFyGwxkxBZhC7CYJazktZBGPOuiRBkESH6I7ODr0wUIvwlKxahExDsel3OgLLNsVavQnlFT37lko5jmI5xXmWyz7mnadkPpj2MjfwKv82IRWiD2oynddBThpZemLY1s4p3MizCuQzBH+trcpJ9RmQRKoiioEFrHWTkFwWOOxSOImeJ2zL2M0LdLEL5if6UTYgsQj8pxadHYJXiw34UF85hZwSIdBmCX+0w+eFmJ5/KNGZLixADgWlgWDv3mHHEMvYcgHMSIqWlTjVIk+GZUBYxNMewfJdfYT18/ROWEyEGgqCJgc526wEhvyg+R2WUQiXbeu5DeouQuQo+KN9i7DKwlAiVgd4jeBjkUuDOPECO9YrXbsG5DCJk5iMKUYYbyOtFiE6OotBzyRXLuTK45TQZ2xMgII1nQuZToq/2iIcrvFqE1Mk8kCNQzsxIzkJeiAB5I2x8h4jtT8qIDwwx8jvKh/NbPwEyEuprEZoT/Ez+9iSvFqEeCl9bbt0JQq5VXrIz9SZNS1H9FOprEZoX+dyTY7jcg+lPIeh159Cg3RU5rld+Md8zkI4Z1NN4OTY3jB1+9+RsyCJ0gAZJA9Uq4CRA5azqLFlEiHpbhOZGPnj3pvopFqENovi0DjQJEHnGcq44AddlECEzP/GG+AQWoQDPWMqZSUvxgTjg2v7EAbKIEG24Ip4mJ3o50trfz2AR+g8EURQfBqJHYEl0JDiUozKvlpdFhNRfZm540/upL95lWRHS63V1PNs9v3ejQVbAMutS2aP+K0YPYpvM3OjFy+ib23IiFIWnx3KrhgQnlsW26vHJq3auzxD8ZbvMvESfHDmmS4gQ08uyg0dOObnDlM98VJerz4IEbciyHPu0DSYfjOXoMX21CBGo6lR17Ogv+FFm+R2MKIifimEWERot6KYvjKV8k7EdwStFKD5kG9mZJRLAUvhi3T4liwiZ9xFv3CN4lQgRmLEDnxIf0B2lrAP7qt+dGUQWEaK/n+xn057Rs6HpRYgOi4GN9XzLdQYNIgFaojrWzl2BMp5uJ9AWi9D7GDkbmlKEfvz48Yfj65Wi/pxi9POeGhLEWmDqHHa3rlzvv6I3vYiPNIi3nkwlQjGIMzq/7h61ZVac4t6dBQFtz/J2zCL0ThRvvf1sChEqxSfDMqREd46aAEFsQwssQmYELX12i7QiRFDHdSnbWwGeAS0Jt4jtaEEWETLvZm9234p0IkRjo/gQbJnFB6jvniDE9XWrtmQRIdqTfXzM5+Bn+G2rm2eNNCKkxspmuctLMPceNMe2tYI8saehTRnqYfrR2ndLHhWhctYzm0Or7kczAQR1trad5a3tMr/o7b/DRYgZA43hh+FpGA1kP8Pr9bNQV54BYWfqTTuxlm1kiff9+/efe89hEXo/+Jl8uAdDRQhnVWNmWW6VxNnbmWchanPrNTX5ZuhD2mYRej+K2x5jPXwmNLvDXhEg0OCdTX+WLCJEu1q3zeRDftz6ZgqPPhOaDQL/qqBo8FqTRYTMGsj3e/iyRegCVwVIA8ezo9ZkESHujD3ujiYfEiF8ryUWoZN80vlauvUQC8QwwzfHezilyYlF6EF0t7/6dkuDlkEsemERWgfdVLGWWIR2uPoqPkJgasB6/LU7+fvtmBkJMSCfbvl1E4vQDnT2p887NFifXn9EJhHq1UaTD/l1yxuPRWgDAuvT4IqzoF6zhCwiZNZCvm0R6gziQ0d/+v0XXb+CCNFHn/aTmQ+JENYKi1DBXQECDdLdfPbIIkK0sZfQmpy09m2LUEAqf6dz450Cezu00SK0FvLtVuNuEfoJwkPH3lV3DVDLQapBPVu+ofiU3u00+Wjt3xah/yAButupyqf1INUgby/HzBMw3oz7py9uSpYXofhdoLuQB8KwkgjR5jd/GdP8f+IvhbZgaRHSzKWFouuLXLpLtBqgLbKIkFkT+fjdxxcwpQjFxiMgn3RESwECRIG8VhMhtdmshXy8xdhPKUIKdAKAz6siRHqubSVAgCBQL9UN6wlt8B+wmqeQjy8rQhCF6CoSr5aQn2ZXrQZnBlZqq/mFYmhpEaITPhEiXXN19rQHeerBNnmPCEzyz7AcG9FWkw/FEXaXaUVIxKXVkbBoptJSgICyJQgaGIuQeTNLi1BsfHR+Hd96TqLXiq3/Q4Xy/fHjxx/7tbr1gPwziBDtz/ClSTMWvQ3G7jKVCGnGA5oBxU7gWG2W02sGBGUdNDA9yopkEaGtPjfvR75+9yY0lQjVglsisBUIHOe8xKslyluzHs3GsN5kEaFefWvyI1+/+5Z2KhEqg14QBOUx6ClAINGRAI4UoSzUxsOsgXx9CRHCyRXoW0JUg3Q979Jl/iNFiH64O/gtODsW5n3I118tQhIcmQJeD8X2BEbX9EKCEwNwpAhRlt+OmSeRr79ahBAZCU05A9J+DYJz61wrqFdZhkXIrIR8/dUipL9Kj38cCjR664k8ab58+XL7if0elF8LPokf1pssImTWRb7+ShFiliMR0YxDAa8ZEJ8lSttTgKA2CwKOyXqTRYToi1KMzRrI118nQhIZTEKDo8vZOV5zeglDTZxaovrV6qB6jwhK6nF38Fswqr0mH/L3V4mQAjwKjkRF+zWH3xOG1pT1inB8VD2ysFp7zS/k768SIQW40P6ek48UINCsrIYGZURdKMMPps2TyN9fKUJxliGRqQX+3rkelA/ISzi3d74lFiHzNPL31z0TQlBomB4uS2iwKDajBQjobMrcQvVcSYSoR7xpmHWQv08tQggNgcSreJxZwsP2169f/zgXG6kA5y/W2R4dhKrTFhoU6tgbysggQoyZxs2shfx9ahGiAcxkuJNqBhTvqjGYOa9Zj0RrNNRvDw3KSiI0qr0mH/L3aUUIxy2XUhKi8jhpOQ6c068YjuRM0GtQVgrK1dprfiF/n1aEqHjNgfWsJzYM4YmzpSeo1bWENGfStYD+uDv4LRjVXpMP+fu0IgQSnHLmE5dkQgJUO9cb1fOoszUoI4KSMrwcM08if59OhHDYWPEoRFsC86QAwdkZGGkwi5BZAfn7VCIkAYqfYivQnxYgKOu6BenOpr0LZWQQIbMu8vfUIhQfIGvGIzGpCVEpNLpmRFBvUavnFqQbVV/KyCBCjFE5bmYN5O9pRYgAiUFC0KiybPOdG75fglDV3naRdlRA70Edzr6N06CMqDP90/o/h3xChjEyzyB/TylCWkJtOacqrpkO6SM6/vQd9mo9SIutFJSrtdf8Qv6eToTiMxxmELUAJg3nSFcTIJ1/GrXlLBqUEUFJGX4wbZ5E/p5OhHBICQ+Vo5I1oSFdzXmvBn5PrgaYBmVEUFJGFhEqx9esgfw95XIsguCcdVQJUG32NBqC/GpdNCgriRD1GNFekw/5e3oRgihEW0GdSYBA9b2CBmUlETLrIn+fQoTEltBkEyCJ5lUx0aCsJEKM3VWxNu9A/j6VCEGssH7Kg4Zk+jkIHop/8mB8pAjRX/ykydOMaq/Jh/x9OhESBJFmQJn4dBYEGpQRQUk97w5+C0a11+RD/j6tCOG4NCDLEkzcEUYNyoigpIwsb8csQmsif59ShDTbyCZAcCeoNCgWIbMC8vfpROjOcqc3dCZ1+1QcNSgriZBZF/n7VCIkAcr6NoWgvlO3FUWIMc04ozX9mVKEVOmsTssbsTsCovatJEKj2mvyIX+fQoT2/lo+C3Tkly9ffu59xkgRyoJFaF2mEaHsSzDRYmahQRkRlPSrZ0LmSeTv3UQIx6qZiNtbMAOiktkFCJp05s9BOdM3d6EMi5B5Evl7FxHCqVTAnh2JC0EygwCpvXdRv6wkQtTDD6bXRP7eRYRwqlogcQxRUeF7FSBd5mdAEeraQizVJyuJkFmXIw04y+XbPwIVhagmNHoOdCcYyZc8WojDHi3qKtQnK4lQKwE38yF/Hy5CQrMlKhGdUEF91zEVYOTVE7WhBeSDjRAh+vnu4LdgVHtNPuTvj4mQ4C+5EQxMAb3llDofK811en0fr/v27Vt3B9eD81YzCvLqXeeI/4rePIn8/XEREhKYLYesTds1ayq3R6E6t4K89vqgJZTRSjzvMKq9Jh/y9xQiJAFRUNeWYhwnXYT0MW0tTU+26vop5IdZhMwKyN8fFyEtaeSIfLIfxUTH+JTpuLYBQYj7PaGcsp53Ib/YFz2hjAwiZNZF/v64CPEsp5xNsB+PETASGAU/4qV9Ue73RPVoiQZlRBsoI4MIIeIjZ68mD/L3R0WIQNh7Ra/KkS4GJoLEudrxuN+THmKhQRnRBsrIshyLNxyzDvL3x0SoFJoSHFNBQsDEwGRbIkQegu2Yrhdlua0gz1FtyMJq7TW/kL8/IkISoD3nI41mSaSLd0vNhJQPxO3eUH6PssjzqF9acnfwW0BfWoTWRP4+XIRwuLOBxk9j8OwHmBWp0mz//vvvfxwnH31PaERQ8d2aFh1XQ+0bEZSUkWU5NqK9Jh/y96EidGYGFCFIsjmoHoj3QIMyos2UkUGEqEe2MTZjGC5CVwUIMopQT1YUIbMuQ0VIAhSf65yBQOG6VdCgrCRC+MRVvzDvQP7eXYT0ZcRPHI3Kce0qaFBGiBDcHfwWfOobZn7k791FiAfGKiyrZQkC1WeUCGVgtfaaX8jfu4oQzoUI8fmJsVxAIGrnWhrLxQyMFCHarK9APAnt9UxoTbqLEAJCAXqV/gn8HMeIgMyCZo0j2kwZGZ4JyRHNemjsu4gQdzYyvzvDII+VREiDspIImXWRvzcXoVYCRJCMCsgsaFBWEiH8JMty2IxF/t5UhFoJB06pCq7koGrzCBGiX70cM0+isW8qQq3uahKz1ZxTbR4hQlnQiwezHvL3bg+m76IKroTaPCoo7w5+C2ir346tifw9pQhpJrQao0UoQx+PbK/Jhfw9nQhRoRYVmxENykoixHMpv6VbE/l7KhHSA+lVp+calJVEyKyL/D2NCK0uQKBBWUmE/GB6XeTvKUTIAvRfNCijgjJD8FuE1iWVCOGIqwsQEIwjRSgDtNUitCapRMj8l9EilOEPWC1C62IRSogGZVRQUtbT0FbPgtfEIpSQkX9FDxlECAf0TGhNLEIJYUawmghBiz/1MfNhEUoI4sOg6I1Rb7vzg3OtTC8lyuNRmLTNTwVbsN6DRSghBJ8Gxma7aluCntVUb4tQIuLA2GyrmEUoGQgRd7MRjH5Fz1JKd0Ftz3b33jLaUAsw27FZhJKBQzMwIxhVzh4j22tyobHXv3r/FHtPY1YTIWZEfti8Jq183SLUmNVEiKk4bTbrYRFKykgRyhD8I9trcmERSspqQWkRWheLUFJGBmWG4LcIrYtFKCkWIbMKFqGkrChCo74XZXJhEUrKaiJk1sUilJTVRIhX9Bl+XM2MxyKUlJEilIHV2mt+YRFKysigpKynsQiti0UoKSODMkPwW4TWxSKUFIuQWQWLUFJWEyH/Aeu6WISSspoIgUVoTSxCSRkpQr/99tvPrecY2V6TC4tQUlYLSovQuliEkjIyKDMEfxYR8rOp8ViEkmIRegb9zrUZh0UoKauJELOPDMGfoS9WwyKUlNVEKAP80Dp9Qd/LTH8sQklZTYRo79M/5cEf0dIX0SxE/bEIJWWkCN39f08tGNneLb59+/Yn0aE+Gfrm7ViEkjIyKGPgPUUGEYrfl+IZ1dP1WQWLUFJGBmWGYMsgQrH8DPVZBYtQUixC49FMiFmQX9WPwyKUlDsDczV4MojQ02j5JfPvXY/DIpSUswOj79dg/DyqgugKLRzgLrQDM3PDg/yr42gRSkptYPgeiwSHO7UEp2ZXyPDbzmqTmRuWtPJB+Sq2J0ycv+qzNSxCjdHAMKhxYDNbnIlhX758+V/9OYdpH/v69eufznNNPG/rY/jW9+/f/ycQzF5aGWMafaC0WA9doy+J3sUi1Jjy7hCXXXFQt0zEZU68Gyk/PhEA7T9lzIL0MHh2q7WjNka2/5pm9XexCDVGjrtHFA4NpOwKLRzgLmfaa/LDDCf6YWnyV0w3RT45dxd7T2M+DcpygM/QwgHuIkE1c1OK0Bl/5HwLH7QINabVwJxhVDnm/fCM5+rNxCKUlNVEiPaypDTrYRFKSqt18hmu3rl6MFJ0TS4sQiYFFqF10dizlLuDvWdicAC+q/EkFqF1wffuChDYeyYmQ/BbhMxd7D0TkyX4r3ytwJgSi9DEZBAhBMgiZO5gEZoY/mzjabwcM3ex95hbWITMXew9E4MAPI1FyNzF3jMxGYLfImTuYu+ZmAzBz0PpDDMyMy8WoYnxDMS8AXvxxGRZjvkPWM0dLEIT4wfT5g3Ye8wtLELmLvaeifGXFc0bsPdMTJZnQhYhcwd7z8RkCX7/7Zi5g0VoYjKIkP+A1dzFIjQxfiZk3oC9Z2GYwcTv+LCNqFzBImTuYu+ZmLs/rVmKDmJydWllETJ3sfdMDP+w7urMJYJ46HrE5xMxsQiZu9h7JuaOCP3+++9/Eg/y+SQvZmMZnk2ZebEITcwdEeI6PQ9iG0FiX8sxv/Eyo7AITcwdEYr/e1xLMUyChMWH1sb0wiI0MSyFPp2xbIkXx5UvQmRMb+xlC4LAMBPaAzHSTIj0epOmWRIW97dEzZgjLEITg5B8MhPimqPX+wiL8uZTYrNnCNXT/xHWzIdFaGLuPBPaI86CaiBgNRGSeVZkrmARmpheIrT3yr2cFWm2RD3icURM54zZwyI0MT1EiFkO+coiUWhiuSzBEC7Sf/v27U9ixPGjpZ9ZG4vQxBD0I2YblMHMpiZAmhnFepTpZRYjU8MiZHaRyMjisyKd23p+VBOj1jM3Mz8WoYnpPbOIyy+snO2cFZUyH4Qp5mXWxiI0MSzHes0s9gSIZ0ASkyNIo3Q8H4p5WowMWIQmppcI7QkQnC0XkeH6SJk3ZjFaG4vQxPQQIcQgikMJ58/81bwEqCYuHNP5aH5wvSYWoYlpKUIsseIspZYvxxAgfgZkC86R5oxQUX+lVbkcsxithUVoYgjWFsuYOPvBaiLAzKU2MypBUM4IY5lfFEBZi7aZ/FiEFqcUoJqAnBUg0pyZAW3lx2yM47E+7FuM3o1FaGJYutwJ0FKAanltCUaJ0h39AeuZ/GqzojOzKzMnFqGJufNMqAz0FgJ0JIiUeSY/iWNZxzNlmPmwCE3MpyKkIJeNECDOn1mqqW7Kj0/yj/U9U94eXK9+4/kXeZrncO9PzCciVM4uapCGQD1C4nAkCBKWo6WavgRZy6+sN3a17SJey+en+Zg2WIQm5ooIEeDlq/Aa5Ld1TsTX8EfCQn5n0nH+69evh+mom9oQ27JlZf+UMx/SHJVp+mIRWgDNRGRbwqWZzRkhODtTOpPu7ExJ6fiMbULkaFPNSBehPhwXXB+J58wYLEIvJwYrVgalIPgI0K3zgnQE/RFXBeioXASqTEddOIYonoX0EiK1RfXkk/NmLO7xF6Olh+yuAEkwjmYs5KXA3kP5HZULiEWZ7qoIcb2ERu1lm3x0jm0zFovQS1GAycoAFkq3dV6cTSdBO+JsfrAlDldF6IzIWITGYxF6IQpwTHf8GmeF4Eq6M0u1s/kB9d8StasiRFqLUD4sQi9DAY7tCULtGUuNs4KhdFceLh+xJ0BwVYTOCIxFaDwWoRdBMBKUGAK09dfuCMWZ1+EEJPm0SsczqjPpOE+6I0Hg/BUROkPLvMw5LEIvQLML2V7wnp2xHM1CxNl0lIuwHM2AVL+jdEC5pG0pHGfKNW2xCE2OZgOyvSA6G+Dk2VqAKPfMDOhM/UAChHn2MjcWoYnpIUCcZ8ZyxFUBOioXzsyUQGX3WI6Z8ViEJqUUIPb37EwaTEFdOxftTH5RgMrjEAVHolJSilIUP9KrvmZeLEKTQvDZ/msWobmxCE1KLRhXNYvQ3FiEzMdomQVaaj1hRw+8TW4sQsaYR7EIGWMe5N///j9EaV/pUjZpnAAAAABJRU5ErkJggg==" />
      <Image Name="CylindricalRoof_Case_II_CSN" Content="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" />
      <Image Name="CylindricalRoof_Case_II_SFS" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="500" />
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_INI400_006538">
      <ENU>"Case (ii) - Drifted snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000166">
      <ENU>"Snow load at the unit area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000172">
      <ENU>"Snow load at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000191">
      <ENU>"Case (ii) - Drifted snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000193">
      <ENU>"Roof slope is bigger than 60°."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000203">
      <ENU>"Case (ii) - Drifted snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000205">
      <ENU>"Roof slope is bigger than 60°."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006316">
      <ENU>"s↓1← and s↓2← are areas of shape coefficients according drifted load arrangement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006336">
      <ENU>"s↓1← is area of shape coefficients according drifted load arrangement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006337">
      <ENU>"Case (ii) - Drifted snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006338">
      <ENU>"Case (ii) - Drifted snow"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006340">
      <ENU>"Roof slope is bigger than 60°."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006344">
      <ENU>"s↓1← is area of shape coefficients according drifted load arrangement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006347">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006348">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006497">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006503">
      <ENU>"Case ii is not necessary"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006504">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006505">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006506">
      <ENU>"Snow load at unit the unit area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006509">
      <ENU>"Snow load at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006510">
      <ENU>"Snow load at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006511">
      <ENU>"Snow load at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006512">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006513">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006514">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006515">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006516">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006517">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006518">
      <ENU>"Distance from the center to μ↓2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006519">
      <ENU>"Distance from the center to μ↓2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006520">
      <ENU>"Distance from the center to left 0"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006525">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006526">
      <ENU>"Snow load at the unit area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006528">
      <ENU>"Snow load at unit lenght of the roof"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006533">
      <ENU>"Shape coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006534">
      <ENU>"Snow load at the unit area"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006536">
      <ENU>"Snow load at unit lenght of the roof"</ENU>
    </Item>
  </Texts>
</Root>