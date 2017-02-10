<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="61000" GUID="4b158600-3425-4d8d-9c4d-a659e469806c">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">//File with table for composites
//Beam Over Column Moment Connection
object G_NA →011420= new Graphics(); →011421G_NA.DrawText("N/A", new Font("Tahoma", 9, FontStyle.Bold), 0, 0, ContentAlignment.MiddleLeft, Color.Green); 
object G_PASS →000403= new Graphics(); →000445G_PASS.DrawText("PASS", new Font("Tahoma", 10, FontStyle.Bold), 0, 0, ContentAlignment.TopLeft, Color.Green); 
object G_FAIL →000454= new Graphics(); →000455G_FAIL.DrawText("FAIL", new Font("Tahoma", 10, FontStyle.Bold), 0, 0, ContentAlignment.MiddleLeft, Color.Red); 
→011315BLOCK("Limit State Check Summary") { 
    bool TableLimitStates(double OD, double l↓b←, double t↓p←, double t↓pmin←, double t↓f←, double t↓fmin←, double R↓u←, double R↓a←, double ϕR↓n1←, double R↓n1/←Ω, double U↓1←, double ϕR↓n2←, double R↓n2/←Ω, double U↓2←, double ϕR↓n3←, double R↓n3/←Ω, double U↓3←, double ϕR↓n4←, double R↓n4/←Ω, double U↓4←, double ϕR↓n5←, double R↓n5/←Ω, double U↓5←, double TableWidth, object TableCellsFont, object TableHeaderFont, object TableBorderPen, object TableGridPen, object G_FAIL, object G_PASS, object G_NA) { 
        object T →011317= new Table(6); 
        
        T[0][0].Value →011907= TR("Limit State"); 
        T[0][1].Value →011908= TR("Code Section(s)"); 
        T[0][2].Value →011909= TR("Required"); 
        T[0][3].Value →011910= TR("Design"); 
        T[0][4].Value →011911= TR("Unity"); 
        T[0][5].Value →011912= TR("Status"); 
        
        SWITCH(DesignMethod) { 
            CASE 0 :  { //LRFD
                IF(Tension &lt;= 0) { 
                    T[1][0].Value →011989= TR("Minimum Flange Thickness (t↓f←)"); 
                    T[1][1].Value →011990= TR("AISC 360-10 Part 9"); 
                    T[1][2].Value →011991= TR(" - "); 
                    T[1][3].Value →011992= TR(" - "); 
                    T[1][4].Value →011993= TR(" - "); 
                    
                    T[1][5].Value →011994=  { →011995G_NA.Draw(1); } 
                    
                    T[2][0].Value →012007= TR("Minimum Plate Thickness (t↓p←)"); 
                    T[2][1].Value →012008= TR("AISC 360-10 Part 9"); 
                    T[2][2].Value →012009= TR(" - "); 
                    T[2][3].Value →012010= TR(" - "); 
                    T[2][4].Value →012011= TR(" - "); 
                    
                    T[2][5].Value →012012=  { →012013G_NA.Draw(1); } 
                    
                    T[3][0].Value →012023= TR("Bolt Tensile Strength"); 
                    T[3][1].Value →012024= TR("AISC 360-10 Spec. J3.6"); 
                    T[3][2].Value →012025= TR(" - "); 
                    T[3][3].Value →012026= TR(" - "); 
                    T[3][4].Value →012027= TR(" - "); 
                    
                    T[3][5].Value →012028=  { →012029G_NA.Draw(1); } 
                } 
                ELSE { 
                    T[1][0].Value →011998= TR("Minimum Flange Thickness (t↓f←)"); 
                    T[1][1].Value →011999= TR("AISC 360-10 Part 9"); 
                    T[1][2].Value →012000= ROUND(CUnit(t↓fmin←, "in"), 2) &amp; " in"; 
                    T[1][3].Value →012001= ROUND(CUnit(t↓f←, "in"), 2) &amp; " in"; 
                    T[1][4].Value →012002= TR(" - "); 
                    IF(t↓fmin← &gt; t↓f←) { 
                        T[1][5].Value →012003=  { →012004G_FAIL.Draw(1); } 
                    } ELSE { 
                        T[1][5].Value →012005=  { →012006G_PASS.Draw(1); } 
                    } 
                    
                    T[2][0].Value →012014= TR("Minimum Plate Thickness (t↓p←)"); 
                    T[2][1].Value →012015= TR("AISC 360-10 Part 9"); 
                    T[2][2].Value →012016= ROUND(CUnit(t↓pmin←, "in"), 2) &amp; " in"; 
                    T[2][3].Value →012017= ROUND(CUnit(t↓p←, "in"), 2) &amp; " in"; 
                    T[2][4].Value →012018= TR(" - "); 
                    IF(t↓pmin← &gt; t↓p←) { 
                        T[2][5].Value →012019=  { →012020G_FAIL.Draw(1); } 
                    } ELSE { 
                        T[2][5].Value →012021=  { →012022G_PASS.Draw(1); } 
                    } 
                    
                    T[3][0].Value →011494= TR("Bolt Tensile Strength"); 
                    T[3][1].Value →011495= TR("AISC 360-10 Spec. J3.6"); 
                    T[3][2].Value →011496= ROUND(CUnit(R↓u←, "kip"), 2) &amp; " kips"; 
                    T[3][3].Value →011497= ROUND(CUnit(ϕR↓n1←, "kip"), 2) &amp; " kips"; 
                    T[3][4].Value →011498= U↓1←; 
                    IF(R↓u← &gt; ϕR↓n1←) { 
                        T[3][5].Value →011499=  { →011500G_FAIL.Draw(1); } 
                    } ELSE { 
                        T[3][5].Value →011502=  { →011503G_PASS.Draw(1); } 
                    } 
                    
                } 
                
                
                
                T[4][0].Value →011508= TR("Beam Web Local Yielding"); 
                T[4][1].Value →011509= TR("AISC 360-10 Spec. J10.2"); 
                T[4][2].Value →011510= ROUND(CUnit(R↓u←, "kip"), 2) &amp; " kips"; 
                T[4][3].Value →011511= ROUND(CUnit(ϕR↓n2←, "kip"), 2) &amp; " kips"; 
                T[4][4].Value →011512= U↓2←; 
                IF(R↓u← &gt; ϕR↓n2←) { 
                    T[4][5].Value →011536=  { →011537G_FAIL.Draw(1); } 
                } ELSE { 
                    T[4][5].Value →011538=  { →011539G_PASS.Draw(1); } 
                } 
                
                T[5][0].Value →011517= TR("Beam Web Local Crippling"); 
                T[5][1].Value →011518= TR("AISC 360-10 Spec. J10.3"); 
                T[5][2].Value →011519= ROUND(CUnit(R↓u←, "kip"), 2) &amp; " kips"; 
                T[5][3].Value →011520= ROUND(CUnit(ϕR↓n3←, "kip"), 2) &amp; " kips"; 
                T[5][4].Value →011521= U↓3←; 
                IF(R↓u← &gt; ϕR↓n3←) { 
                    T[5][5].Value →011540=  { →011541G_FAIL.Draw(1); } 
                } ELSE { 
                    T[5][5].Value →011542=  { →011543G_PASS.Draw(1); } 
                } 
                
                T[6][0].Value →011526= TR("HSS Wall Local Yielding"); 
                T[6][1].Value →011527= TR("AISC 360-10 Spec. K2"); 
                T[6][2].Value →011528= ROUND(CUnit(R↓u←, "kip"), 2) &amp; " kips"; 
                T[6][3].Value →011529= ROUND(CUnit(ϕR↓n4←, "kip"), 2) &amp; " kips"; 
                T[6][4].Value →011530= U↓4←; 
                IF(R↓u← &gt; ϕR↓n4←) { 
                    T[6][5].Value →011544=  { →011545G_FAIL.Draw(1); } 
                } ELSE { 
                    T[6][5].Value →011546=  { →011547G_PASS.Draw(1); } 
                } 
                
                T[7][0].Value →011548= TR("HSS Wall Local Crippling"); 
                T[7][1].Value →011549= TR("AISC 360-10 Spec. K2"); 
                IF(OD &gt; 0 || ((5*t↓p←+l↓b←) &gt; cf)) { 
                    T[7][2].Value →012114= ROUND(CUnit(R↓u←, "kip"), 2) &amp; " kips"; 
                    T[7][3].Value →012115= " - "; 
                    T[7][4].Value →012116= " - "; 
                    T[7][5].Value →012117=  { →012119G_NA.Draw(1); } 
                } ELSE { 
                    T[7][2].Value →011550= ROUND(CUnit(R↓u←, "kip"), 2) &amp; " kips"; 
                    T[7][3].Value →011551= ROUND(CUnit(ϕR↓n5←, "kip"), 2) &amp; " kips"; 
                    T[7][4].Value →011552= U↓5←; 
                    IF(R↓u← &gt; ϕR↓n5←) { 
                        T[7][5].Value →011553=  { →011554G_FAIL.Draw(1); } 
                    } ELSE { 
                        T[7][5].Value →011555=  { →011556G_PASS.Draw(1); } 
                    } 
                } 
            } 
            
            CASE 1 :  { //ASD
                
                
                
                IF(Tension &lt;= 0) { 
                    T[1][0].Value →012030= TR("Minimum Flange Thickness (t↓f←)"); 
                    T[1][1].Value →012031= TR("AISC 360-10 Part 9"); 
                    T[1][2].Value →012032= TR(" - "); 
                    T[1][3].Value →012033= TR(" - "); 
                    T[1][4].Value →012034= TR(" - "); 
                    
                    T[1][5].Value →012035=  { →012036G_NA.Draw(1); } 
                    
                    T[2][0].Value →012037= TR("Minimum Plate Thickness (t↓p←)"); 
                    T[2][1].Value →012038= TR("AISC 360-10 Part 9"); 
                    T[2][2].Value →012039= TR(" - "); 
                    T[2][3].Value →012040= TR(" - "); 
                    T[2][4].Value →012041= TR(" - "); 
                    
                    T[2][5].Value →012042=  { →012043G_NA.Draw(1); } 
                    
                    T[3][0].Value →012044= TR("Bolt Tensile Strength"); 
                    T[3][1].Value →012045= TR("AISC 360-10 Spec. J3.6"); 
                    T[3][2].Value →012046= TR(" - "); 
                    T[3][3].Value →012047= TR(" - "); 
                    T[3][4].Value →012048= TR(" - "); 
                    
                    T[3][5].Value →012049=  { →012050G_NA.Draw(1); } 
                } 
                ELSE { 
                    T[1][0].Value →012051= TR("Minimum Flange Thickness (t↓f←)"); 
                    T[1][1].Value →012052= TR("AISC 360-10 Part 9"); 
                    T[1][2].Value →012053= ROUND(CUnit(t↓fmin←, "in"), 2) &amp; " in"; 
                    T[1][3].Value →012054= ROUND(CUnit(t↓f←, "in"), 2) &amp; " in"; 
                    T[1][4].Value →012055= TR(" - "); 
                    IF(t↓fmin← &gt; t↓f←) { 
                        T[1][5].Value →012056=  { →012057G_FAIL.Draw(1); } 
                    } ELSE { 
                        T[1][5].Value →012058=  { →012059G_PASS.Draw(1); } 
                    } 
                    
                    T[2][0].Value →012060= TR("Minimum Plate Thickness (t↓p←)"); 
                    T[2][1].Value →012061= TR("AISC 360-10 Part 9"); 
                    T[2][2].Value →012062= ROUND(CUnit(t↓pmin←, "in"), 2) &amp; " in"; 
                    T[2][3].Value →012063= ROUND(CUnit(t↓p←, "in"), 2) &amp; " in"; 
                    T[2][4].Value →012064= TR(" - "); 
                    IF(t↓pmin← &gt; t↓p←) { 
                        T[2][5].Value →012065=  { →012066G_FAIL.Draw(1); } 
                    } ELSE { 
                        T[2][5].Value →012067=  { →012068G_PASS.Draw(1); } 
                    } 
                    
                    T[3][0].Value →012069= TR("Bolt Tensile Strength"); 
                    T[3][1].Value →012070= TR("AISC 360-10 Spec. J3.6"); 
                    T[3][2].Value →012071= ROUND(CUnit(R↓a←, "kip"), 2) &amp; " kips"; 
                    T[3][3].Value →012072= ROUND(CUnit(R↓n1/←Ω, "kip"), 2) &amp; " kips"; 
                    T[3][4].Value →012073= U↓1←; 
                    IF(R↓a← &gt; R↓n1/←Ω) { 
                        T[3][5].Value →012074=  { →012075G_FAIL.Draw(1); } 
                    } ELSE { 
                        T[3][5].Value →012076=  { →012077G_PASS.Draw(1); } 
                    } 
                    
                } 
                
                
                
                T[4][0].Value →012078= TR("Beam Web Local Yielding"); 
                T[4][1].Value →012079= TR("AISC 360-10 Spec. J10.2"); 
                T[4][2].Value →012080= ROUND(CUnit(R↓a←, "kip"), 2) &amp; " kips"; 
                T[4][3].Value →012081= ROUND(CUnit(R↓n2/←Ω, "kip"), 2) &amp; " kips"; 
                T[4][4].Value →012082= U↓2←; 
                IF(R↓a← &gt; R↓n2/←Ω) { 
                    T[4][5].Value →012083=  { →012084G_FAIL.Draw(1); } 
                } ELSE { 
                    T[4][5].Value →012085=  { →012086G_PASS.Draw(1); } 
                } 
                
                T[5][0].Value →012087= TR("Beam Web Local Crippling"); 
                T[5][1].Value →012088= TR("AISC 360-10 Spec. J10.3"); 
                T[5][2].Value →012089= ROUND(CUnit(R↓a←, "kip"), 2) &amp; " kips"; 
                T[5][3].Value →012090= ROUND(CUnit(R↓n3/←Ω, "kip"), 2) &amp; " kips"; 
                T[5][4].Value →012091= U↓3←; 
                IF(R↓a← &gt; R↓n3/←Ω) { 
                    T[5][5].Value →012092=  { →012093G_FAIL.Draw(1); } 
                } ELSE { 
                    T[5][5].Value →012094=  { →012095G_PASS.Draw(1); } 
                } 
                
                T[6][0].Value →012096= TR("HSS Wall Local Yielding"); 
                T[6][1].Value →012097= TR("AISC 360-10 Spec. K2"); 
                T[6][2].Value →012098= ROUND(CUnit(R↓a←, "kip"), 2) &amp; " kips"; 
                T[6][3].Value →012099= ROUND(CUnit(R↓n4/←Ω, "kip"), 2) &amp; " kips"; 
                T[6][4].Value →012100= U↓4←; 
                IF(R↓a← &gt; R↓n4/←Ω) { 
                    T[6][5].Value →012101=  { →012102G_FAIL.Draw(1); } 
                } ELSE { 
                    T[6][5].Value →012103=  { →012104G_PASS.Draw(1); } 
                } 
                
                T[7][0].Value →012105= TR("HSS Wall Local Crippling"); 
                T[7][1].Value →012106= TR("AISC 360-10 Spec. K2"); 
                T[7][2].Value →012107= ROUND(CUnit(R↓a←, "kip"), 2) &amp; " kips"; 
                T[7][3].Value →012108= ROUND(CUnit(R↓n5/←Ω, "kip"), 2) &amp; " kips"; 
                T[7][4].Value →012109= U↓5←; 
                IF(R↓a← &gt; R↓n5/←Ω) { 
                    T[7][5].Value →012110=  { →012111G_FAIL.Draw(1); } 
                } ELSE { 
                    T[7][5].Value →012112=  { →012113G_PASS.Draw(1); } 
                } 
            } 
        } 
        
        T.Columns[0].Width →011334= Convert.ToSingle(0.30*TableWidth); 
        T.Columns[1].Width →011335= Convert.ToSingle(0.35*TableWidth); 
        T.Columns[2].Width →011336= Convert.ToSingle(0.15*TableWidth); 
        T.Columns[3].Width →011347= Convert.ToSingle(0.15*TableWidth); 
        T.Columns[4].Width →011492= Convert.ToSingle(0.10*TableWidth); 
        T.Columns[5].Width →011493= Convert.ToSingle(0.10*TableWidth); 
        
        T.Columns[0].Alignment →011640= ContentAlignment.MiddleCenter; 
        T.Columns[1].Alignment →008066= ContentAlignment.MiddleCenter; 
        T.Columns[2].Alignment →011504= ContentAlignment.MiddleCenter; 
        T.Columns[3].Alignment →011505= ContentAlignment.MiddleCenter; 
        T.Columns[4].Alignment →011506= ContentAlignment.MiddleCenter; 
        T.Columns[5].Alignment →011507= ContentAlignment.MiddleCenter; 
        
        T[0].BackColor →011337= Color.MediumSeaGreen; 
        T[0][0].Alignment →011913= ContentAlignment.MiddleCenter; 
        T[0][1].Alignment →011914= ContentAlignment.MiddleCenter; 
        T.Padding.All →011338= 2; 
        T.Font →011339= TableCellsFont; 
        T[0].Font →011340= TableHeaderFont; 
        T.BorderPen →011341= TableBorderPen; 
        T[0].BorderPen →011342= TableBorderPen; 
        T.GridPen →011343= TableGridPen; 
        →011535PAGEBREAK(); 
        →011344T.Draw(); 
        →011345PAGEBREAK(); 
    } 
} 
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="3" Member="1000" Material="1" CSType="-1" LimitState="0" IFFilter="0" NAD="" LicenceID="50320" Autor="" Autor2="" Version="1" EWNSource="" Icon="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">
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://designforms.net</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Calculation</ENU>
      </CalculationName>
      <ResultGroups TranslateID="ResultGroups">
        <ENU>
        </ENU>
      </ResultGroups>
    </Header>
    <Styles>
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Calibri|11|0|2" Font2="Calibri|11|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Calibri|11|0|2" Font2="Calibri|11|2|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Calibri|11|0|2" Font2="Calibri|11|0|2" />
      <Style Key="Subchapter 2" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Calibri|14|0|2" Font2="Calibri|14|0|2" />
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Calibri|14|0|2" Font2="Calibri|14|1|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Calibri|18|0|2" Font2="Calibri|18|1|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Calibri|11|0|2" Font2="Calibri|11|0|2" />
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Calibri|11|0|2" Font2="Calibri|11|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Calibri|11|0|2" Font2="Calibri|11|0|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Calibri|11|0|2" Font2="Calibri|11|0|2" />
      <Style Key="SummaryTable" X="21" Y="336" Hor="0" Ver="4" SpX="0" SpY="3" Font1="Tahoma|12|0|2" Font2="Tahoma|12|0|2" />
      <Style Key="Pass/Fail" X="0" Y="0" Hor="0" Ver="1" SpX="27" SpY="0" Font1="Tahoma|12|0|2" Font2="Tahoma|12|2|2" />
      <Style Key="Limit State Outcome" X="350" Y="0" Hor="0" Ver="1" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Name="DesignMethod" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_DesignMethod">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="G_FAIL" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_G_FAIL">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="G_NA" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_G_NA">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="G_PASS" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_G_PASS">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="R↓a←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_R↓a←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="R↓n1/←Ω" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_R↓n1/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="R↓n2/←Ω" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_R↓n2/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="R↓n3/←Ω" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_R↓n3/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="R↓n4/←Ω" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_R↓n4/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="R↓n5/←Ω" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_R↓n5/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="R↓u←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_R↓u←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="T" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_T">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="t↓f←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_t↓f←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="t↓fmin←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_t↓fmin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="t↓p←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_t↓p←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="t↓pmin←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_t↓pmin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="TableWidth" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_TableWidth">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="Tension" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Tension">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕR↓n1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ϕR↓n1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕR↓n2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ϕR↓n2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕR↓n3←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ϕR↓n3←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕR↓n4←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ϕR↓n4←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕR↓n5←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ϕR↓n5←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
    </Variables>
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Layout 0</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Layout 1</ENU>
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
      <VC ID="000403">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000445">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000454">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000455">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="506" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="008066">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011315">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011317">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011334">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="562" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="562" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="562" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="562" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="562" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="562" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011335">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="578" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="578" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="578" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="578" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="578" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="578" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011336">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011337">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011338">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="011339">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="477" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="477" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="477" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="477" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="477" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="477" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011340">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="492" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="492" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="492" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="492" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="492" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="492" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011341">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="509" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="509" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="509" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="509" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="509" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="509" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="011342">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="547" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="547" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="547" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="547" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="547" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="547" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011343">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="530" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="530" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="530" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="530" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="530" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="530" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="011344">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Text 1" EqStyle="7" />
      </VC>
      <VC ID="011345">
        <Set Vis="1" Prev="-1" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="None" EqStyle="7" />
      </VC>
      <VC ID="011347">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011420">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011421">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011492">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011493">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011494">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011495">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011496">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011497">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011498">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011500">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="011503">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="011504">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011505">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011506">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011507">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011508">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011509">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011510">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011511">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011512">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011517">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011518">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011519">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011520">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011521">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011526">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011527">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011528">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011529">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011530">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011535">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011537">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="011539">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="011541">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="011543">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="011545">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="011547">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="011548">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011549">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011550">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011551">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011552">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011554">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="011556">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="011640">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011907">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011908">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011909">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011910">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011911">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011912">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011913">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011914">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011989">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011990">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011991">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011992">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011993">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011995">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="011998">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011999">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012000">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012001">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012002">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012004">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012006">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012007">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012008">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012009">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012010">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012011">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012013">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012014">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012015">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012016">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012017">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012018">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012020">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012022">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012023">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012024">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012025">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012026">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012027">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012029">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012030">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012031">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012032">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012033">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012034">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012036">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012037">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012038">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012039">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012040">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012041">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012043">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012044">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012045">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012046">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012047">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012048">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012050">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012051">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012052">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012053">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012054">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012055">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012057">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012059">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012060">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012061">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012062">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012063">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012064">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012066">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012068">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012069">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012070">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012071">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012072">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012073">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012075">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012077">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012078">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012079">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012080">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012081">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012082">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012084">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012086">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012087">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012088">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012089">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012090">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012091">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012093">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012095">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012096">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012097">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012098">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012099">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012100">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012102">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012104">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012105">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012106">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012107">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012108">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012109">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012111">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012113">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
      <VC ID="012114">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012115">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012116">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012119">
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
        <Set Vis="1" Prev="11098" Style="0" StyleName="Pass/Fail" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="500" />
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_011315">
      <ENU>"Limit State Check Summary"</ENU>
    </Item>
    <Item TranslateID="STRING_00E21993">
      <ENU>"HSS Wall Local Crippling"</ENU>
    </Item>
    <Item TranslateID="STRING_0EB94E9C">
      <ENU>"Design"</ENU>
    </Item>
    <Item TranslateID="STRING_1A6CB098">
      <ENU>"AISC 360-10 Spec. J10.2"</ENU>
    </Item>
    <Item TranslateID="STRING_26DC09AF">
      <ENU>"Beam Web Local Yielding"</ENU>
    </Item>
    <Item TranslateID="STRING_2B6B057C">
      <ENU>"Required"</ENU>
    </Item>
    <Item TranslateID="STRING_3ED770C3">
      <ENU>"Code Section(s)"</ENU>
    </Item>
    <Item TranslateID="STRING_467E80D4">
      <ENU>"AISC 360-10 Spec. J3.6"</ENU>
    </Item>
    <Item TranslateID="STRING_4A53DAB5">
      <ENU>"Minimum Plate Thickness (t↓p←)"</ENU>
    </Item>
    <Item TranslateID="STRING_4C733129">
      <ENU>"HSS Wall Local Yielding"</ENU>
    </Item>
    <Item TranslateID="STRING_5228C0A8">
      <ENU>"Unity"</ENU>
    </Item>
    <Item TranslateID="STRING_526A33F0">
      <ENU>"Bolt Tensile Strength"</ENU>
    </Item>
    <Item TranslateID="STRING_617936F7">
      <ENU>" - "</ENU>
    </Item>
    <Item TranslateID="STRING_95BBE657">
      <ENU>"Status"</ENU>
    </Item>
    <Item TranslateID="STRING_9BEB705E">
      <ENU>"Limit State"</ENU>
    </Item>
    <Item TranslateID="STRING_9BFD7D03">
      <ENU>"Beam Web Local Crippling"</ENU>
    </Item>
    <Item TranslateID="STRING_B5909110">
      <ENU>"AISC 360-10 Spec. K2"</ENU>
    </Item>
    <Item TranslateID="STRING_BD142533">
      <ENU>"AISC 360-10 Spec. J10.3"</ENU>
    </Item>
    <Item TranslateID="STRING_DB5AA4DC">
      <ENU>"AISC 360-10 Part 9"</ENU>
    </Item>
    <Item TranslateID="STRING_F79CBC47">
      <ENU>"Minimum Flange Thickness (t↓f←)"</ENU>
    </Item>
  </Texts>
</Root>