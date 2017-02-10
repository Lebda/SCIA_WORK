<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="9a98c17e-8c28-45cb-aef7-71f9636c7e32">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">void ValidateInput(object Input) { 
    α↓y← →INI400_007974= Input.Get("α↓y←"); 
    α↓z← →INI400_007976= Input.Get("α↓z←"); 
    SectionClass →INI400_007977= Input.Get("SectionClass"); 
    return true; 
} 
object GetOutput() { 
    return null; 
} 

→INI400_006249BLOCK("Cross section parameters (" &amp; IO.CS.SectionName &amp; ")") { 
    →INI400_007972BLOCK { 
        object G →INI400_005868= new Graphics(); 
        G.DefaultDimStyle.Scale →INI400_008008= 1000; 
        object ShapePen →INI400_008006= new Pen(Color.Black, 2); 
        IF(GetLength(IO.CS.Component) &gt; 1) { 
            FOREACH(object Component in IO.CS.Component) { 
                →INI400_007985G.FillPolygon(Component.Shape.Point, Color.Silver); 
                →INI400_008005G.DrawPolyLine(Component.Shape.Point, ShapePen); 
            } 
            object Bounds →INI400_008013= GetBounds(Linq.ToList(Linq.ConcatLists(IO.CS.Component, object Component=&gt;Component.Shape.Point))); 
        } ELSE { 
            →INI400_008004G.FillPolygon(IO.CS.Component.Shape.Point, Color.Silver); 
            →INI400_008010G.DrawPolyLine(IO.CS.Component.Shape.Point, new Pen(Color.Black, 2)); 
            object Bounds →INI400_008014= GetBounds(IO.CS.Component.Shape.Point); 
        } 
        →INI400_008007G.DrawDimX(new PointD(Bounds.Left, Bounds.Top), new PointD(Bounds.Right, Bounds.Top)); 
        →INI400_008009G.DrawDimY(new PointD(Bounds.Right, Bounds.Top), new PointD(Bounds.Right, Bounds.Bottom)); 
        
        →INI400_005870G.Draw(180, 150); 
    } 
    →INI400_007973BLOCK { 
        →INI400_007993TEXT("Section class =" &amp; SectionClass); 
        A →INI400_007978= IO.CS.Geometry.A; 
        I↓y← →INI400_007979= IO.CS.Geometry.Iy; 
        I↓z← →INI400_007988= IO.CS.Geometry.Iz; 
        i↓y← →INI400_007980= IO.CS.Geometry.iy; 
        i↓z← →INI400_007989= IO.CS.Geometry.iz; 
        α↓y← →INI400_007981= α↓y←; 
        α↓z← →INI400_007990= α↓z←; 
    } 
} 
→INI400_008017TEXT(" "); // enlarge whole output
</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="1000" Material="1" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="56" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Steel_check_N_My_Mz.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Check N+My+Mz</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Block headline" X="95" Y="268" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Standard 10px" X="350" Y="0" Hor="4" Ver="2" SpX="50" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Standard 200px" X="220" Y="334" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" />
      <Style Key="Calculation headline" X="0" Y="7.43" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|15.3|5|2" Font2="Tahoma|15.3|5|2" />
      <Style Key="No vertical spacing" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="1" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
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
      <Variable Modifier="Public" Name="A" ESA_ID="" Type="Double" Value="34.7e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="67e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Bounds" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Bounds">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Component" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Component">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Value="26.9e-3" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="G" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="25e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="i↓y←" ESA_ID="" Type="Double" Value="399.567e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="I↓y←" ESA_ID="" Type="Double" Value="5.54e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-12" Dim="mm↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="i↓z←" ESA_ID="" Type="Double" Value="63.5184e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="I↓z←" ESA_ID="" Type="Double" Value="140e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="4" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-12" Dim="mm↑4←" />
      </Variable>
      <Variable Modifier="Public" Name="Pts" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Pts">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SectionClass" ESA_ID="" Type="Double" Value="1" Precision="0">
        <Description TranslateID="VARIABLE_SectionClass">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Shape" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Shape">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ShapePen" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ShapePen">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="α↓y←" ESA_ID="" Type="Double" Value="340e-3" Precision="2">
        <Description TranslateID="VARIABLE_α↓y←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓z←" ESA_ID="" Type="Double" Value="490e-3" Precision="2">
        <Description TranslateID="VARIABLE_α↓z←">
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
      <VC ID="INI400_005867">
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_005868">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_005869">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_005870">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="0" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="0" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="0" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="0" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="0" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="20" Y="0" Hor="0" Ver="4" SpX="10" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005871">
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_005872">
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="5" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_005873">
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_005874">
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_005876">
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="40" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_005877">
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_005878">
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="15" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="15" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="15" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="15" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="15" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="77.5" Y="70.9" Hor="4" Ver="2" SpX="2" SpY="15" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_005879">
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_005880">
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
        <Set Vis="1" Prev="INI400_005870" Style="1" StyleName="" X="27.6" Y="124" Hor="2" Ver="4" SpX="0" SpY="2" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="31" />
      </VC>
      <VC ID="INI400_006249">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007972">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007973">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007974">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007976">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007977">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007978">
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="25" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="25" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
      </VC>
      <VC ID="INI400_007979">
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="50" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="50" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
      </VC>
      <VC ID="INI400_007980">
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="77" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="77" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
      </VC>
      <VC ID="INI400_007981">
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="100" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="100" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
      </VC>
      <VC ID="INI400_007985">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007988">
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="250" Y="0" Hor="1" Ver="4" SpX="120" SpY="50" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="250" Y="0" Hor="1" Ver="4" SpX="120" SpY="50" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
      </VC>
      <VC ID="INI400_007989">
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="250" Y="0" Hor="1" Ver="4" SpX="120" SpY="77" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="250" Y="0" Hor="1" Ver="4" SpX="120" SpY="77" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
      </VC>
      <VC ID="INI400_007990">
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="120" SpY="100" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="120" SpY="100" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="No vertical spacing" EqStyle="20" />
      </VC>
      <VC ID="INI400_007992">
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="220" Y="334" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="220" Y="334" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="334" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="334" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="334" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="220" Y="334" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13.3|0|2" Font2="Tahoma|13.3|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_007993">
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="INI400_007973" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="200" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_007994">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_007995">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_007996">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="45" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="45" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="45" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="45" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="45" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="45" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_007997">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_007998">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_007999">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_008000">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="40" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_008001">
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
        <Set Vis="1" Prev="INI400_005870" Style="0" StyleName="" X="0" Y="0" Hor="2" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="20" />
      </VC>
      <VC ID="INI400_008002">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="20" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="20" />
      </VC>
      <VC ID="INI400_008003">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008004">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008005">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008006">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008007">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008008">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008009">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008010">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008011">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008012">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008013">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008014">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008015">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008016">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="4" SpX="5" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008017">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="4" SpX="15" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="4" SpX="15" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="4" SpX="15" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="4" SpX="15" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="4" SpX="15" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="4" SpX="15" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TSteelSectionLibrary2 Name="" ID="43" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="300|30" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="1" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="CS" Collapsed="False" Type="0" SubType="1" P1="HEA1000" P2="0" P3="4" P4="46" SectionFilter="2147483647" JustImp="False" ImpUnits="False" />
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TPanel Name="" ID="31" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
          <Texts>
            <ENU>
            </ENU>
          </Texts>
          <TCustomLibrary Name="SteelProductLib" ID="42" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="30" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="STEEL.PC" DataFile="EC_Steel_Product_List.xml" Collapsed="True" UseCombo="False" Category="3 mm &lt; t &lt;= 16 mm" Item="S 235 JR (EN 10025-2)">
            <Data>
              <Header>
                <PropertySet Symbol="f↓y←" ESA_ID="fy" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="f↓u←" ESA_ID="fu" Unit="MPa" Type="Numeric" />
                <PropertySet Symbol="E" ESA_ID="E" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="G" ESA_ID="G" Unit="GPa" Type="Numeric" />
                <PropertySet Symbol="ν" ESA_ID="ν" Unit="" Type="Numeric" />
                <PropertySet Symbol="γ" ESA_ID="γ" Unit="kg/m↑3←" Type="Numeric" />
                <PropertySet Symbol="α" ESA_ID="α" Unit="10↑-6←" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>3 mm &lt; t &lt;= 16 mm</P>
                  <P>S 235 JR (EN 10025-2)</P>
                  <P>235</P>
                  <P>360</P>
                  <P>210</P>
                  <P>80.77</P>
                  <P>0.3</P>
                  <P>7850</P>
                  <P>12</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
        </TPanel>
      </TPanel>
    </Main>
    <MemberData Width="500">
      <TGroupBox Name="" ID="34" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000034">
          <ENU>Coefficients</ENU>
        </Texts>
        <TDoubleInput Name="TDoubleInput" ID="18" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Tahoma|11.3|0|2" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10" MinValueWithDim="0" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Tahoma|11.3|0|2" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10" MinValueWithDim="0" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="16" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Tahoma|11.3|0|2" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10" MinValueWithDim="0" DescPos="1" />
      </TGroupBox>
      <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="" BookMarkID="" ForeColor="-16711423" ChbRight="False">
        <Texts TranslateID="DIALOG_000001">
          <ENU>
          </ENU>
        </Texts>
      </TCheckBox>
    </MemberData>
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_INI400_006249">
      <ENU>"Cross section parameters (" &amp; IO.CS.SectionName &amp; ")"</ENU>
    </Item>
    <Item ID="TEXT_INI400_005867">
      <ENU>"h = " &amp; IO.CS.Geometry.h</ENU>
    </Item>
    <Item ID="TEXT_INI400_005871">
      <ENU>"d = " &amp; IO.CS.Geometry.d</ENU>
    </Item>
    <Item ID="TEXT_INI400_005872">
      <ENU>"h = " &amp; h</ENU>
    </Item>
    <Item ID="TEXT_INI400_005873">
      <ENU>"b = " &amp; b</ENU>
    </Item>
    <Item ID="TEXT_INI400_005874">
      <ENU>"d = " &amp; IO.CS.Geometry.d</ENU>
    </Item>
    <Item ID="TEXT_INI400_005876">
      <ENU>"h = " &amp; 0</ENU>
    </Item>
    <Item ID="TEXT_INI400_005877">
      <ENU>"b = " &amp; IO.CS.Geometry.bb</ENU>
    </Item>
    <Item ID="TEXT_INI400_005878">
      <ENU>"h = " &amp; IO.CS.Geometry.h1</ENU>
    </Item>
    <Item ID="TEXT_INI400_005879">
      <ENU>"b = " &amp; IO.CS.Geometry.b1</ENU>
    </Item>
    <Item ID="TEXT_INI400_005880">
      <ENU>"b = " &amp; IO.CS.Geometry.b</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007993">
      <ENU>"Section class =" &amp; SectionClass</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008003">
      <ENU>Shape</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008015">
      <ENU>" "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008016">
      <ENU>" "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008017">
      <ENU>" "</ENU>
    </Item>
  </Texts>
</Root>