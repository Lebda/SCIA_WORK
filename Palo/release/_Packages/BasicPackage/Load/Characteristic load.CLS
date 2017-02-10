<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="329d67ee-de67-46b4-a75c-9417663c8afc">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">IF(H1) { 
    →INI400_000002TEXT("Calculation of characteristics load"); 
} 
IF(H2) { 
    →INI400_000001TEXT(string Caption); 
} 
→INI400_000031TEXT("The calculation shows semi-results for each layer and total sum of all inserted materials"); 
W →INI400_000020= 0; 
i →INI400_000030= 0; 
→INI400_000016object[] Mater; 
IF(Mater.Count == 0) { 
    →INI400_000032TEXT("No material is defined. Please define at least one material layer."); 
    W →INI400_000033= 0; 
} ELSE { 
    object Tab_mater →INI400_000004= new Table(4); 
    Tab_mater.BorderPen →INI400_000006= new Pen(Color.DarkBlue, 2); 
    Tab_mater.GridPen →INI400_000011= new Pen(Color.Silver, 1); 
    Tab_mater[0].BorderPen →INI400_000007= Tab_mater.BorderPen; 
    Tab_mater[0][0].Value →INI400_000008= TR("Material name"); 
    Tab_mater[0][1].Value →INI400_000009= TR("Density (kg/m↑3←)"); 
    Tab_mater[0][2].Value →INI400_000010= TR("Thickness (m)"); 
    Tab_mater[0][3].Value →INI400_000024= TR("Load (kN/m↑2←)"); 
    FOR(i, 0, Mater.Count-1) { 
        Tab_mater[i+1][0].Value →INI400_000014= Mater[i].N; 
        Tab_mater[i+1][1].Value →INI400_000017= Mater[i].ρ; 
        Tab_mater[i+1][2].Value →INI400_000018= Mater[i].t; 
        W →INI400_000021= W+Mater[i].ρ*g*Mater[i].t; 
        Tab_mater[i+1][3].Value →INI400_000025= (Mater[i].ρ*g*Mater[i].t)/10↑3←; 
    } 
    Tab_mater[Mater.Count+1].BorderPen →INI400_000028= Tab_mater.BorderPen; 
    Tab_mater[Mater.Count+1][0].Value →INI400_000027= TR("Total load"); 
    Tab_mater[Mater.Count+1][3].Value →INI400_000026= W/10↑3←; 
    →INI400_000005Tab_mater.Draw(); 
    →INI400_000022TEXT("Total load of all materials:"); 
    →INI400_000023TEXT("W = " &amp; W); 
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="-1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="1" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://www.scia.net/</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Calculation</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Formula B, N 150, F 5" X="150" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Standard, N 10, F 30" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 20" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, AL 0, F 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Check, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|1|2" />
      <Style Key="Standard, N 10, F 0" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 20" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Headline, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Remark, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Standard, N 10, F 10" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, AL 0, F 0" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Remark, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Standard, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Underline, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Formula B, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula B, N 100, F 5" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 200, F 5" X="200" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 250, F 5" X="250" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 300, F 5" X="300" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Headline, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Standard, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Caption, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Caption, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Caption, N 0, F 20" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|18|0|2" Font2="Tahoma|18|5|2" />
      <Style Key="Headline, N 0, F 20" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Remark, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Remark, AL 0, F 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Standard, N 0, F 30" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 40" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="40" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 50" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Underline, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Underline, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Underline, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Underline, AL 0, F 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Standard, N 10, F 40" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="40" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 50" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Remark B, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" />
      <Style Key="Formula, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 100, F 5" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 150, F 5" X="150" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 250, F 5" X="250" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 200, F 5" X="200" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 300, F 5" X="300" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 350, F 5" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 400, F 5" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 450, F 5" X="450" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 500, F 5" X="500" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula B, N 350, F 5" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 400, F 5" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 450, F 5" X="450" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 500, F 5" X="500" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula BU, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 100, F 5" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 150, F 5" X="150" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 200, F 5" X="200" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 250, F 5" X="250" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 300, F 5" X="300" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 350, F 5" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 400, F 5" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 450, F 5" X="450" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 500, F 5" X="500" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Other, F 5, AT 0" X="500" Y="0" Hor="4" Ver="1" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Headline, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula, N 0, OTL 0" X="0" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 50, OTL 0" X="50" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 100, OTL 0" X="100" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 150, OTL 0" X="150" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 200, OTL 0" X="200" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 250, OTL 0" X="250" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 300, OTL 0" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 350, OTL 0" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 400, OTL 0" X="400" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 450, OTL 0" X="450" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 500, OTL 0" X="500" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula B, N 0, OTL 0" X="0" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 50, OTL 0" X="50" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 100, OTL 0" X="100" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 150, OTL 0" X="150" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 200, OTL 0" X="200" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 250, OTL 0" X="250" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 300, OTL 0" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 350, OTL 0" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 400, OTL 0" X="400" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 450, OTL 0" X="450" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 500, OTL 0" X="500" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula BU, N 0, OTL 0" X="0" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 50, OTL 0" X="50" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 100, OTL 0" X="100" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 150, OTL 0" X="150" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 200, OTL 0" X="200" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 250, OTL 0" X="250" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 300, OTL 0" X="300" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 350, OTL 0" X="350" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 400, OTL 0" X="400" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 450, OTL 0" X="450" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Formula BU, N 500, OTL 0" X="500" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Remark, N 50, OTL 0" X="50" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Formula, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula B, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula BU, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
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
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="---">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="g" ESA_ID="" Type="Double" Value="9.81" Precision="2">
        <Description TranslateID="VARIABLE_g">
          <ENU>Acceleration of gravity</ENU>
        </Description>
        <Unit m="1" kg="0" s="-2" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m/s↑2←" />
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
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Value="6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Mater" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Tab_mater" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="W" ESA_ID="Result.01" Type="Double" Value="4718.61" Precision="2">
        <Description TranslateID="VARIABLE_W">
          <ENU>Total weight</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
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
      <VC ID="INI400_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|5|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_000004">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000005">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000006">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000007">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000008">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000009">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000010">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000011">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000014">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000016">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000017">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000018">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000020">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000021">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000022">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="15" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000023">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="10" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000024">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000025">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000026">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000027">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000028">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000030">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000031">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000032">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 10" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000033">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="400">
      <TGroupBox Name="" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000008">
          <ENU>Coefficients</ENU>
        </Texts>
        <TDoubleInput Name="" ID="7" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="g" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
      </TGroupBox>
      <TGroupBox Name="" ID="6" Translate="1" Height="310" AutoWidth="False" AutoHeight="False" TabIndex="4" Dock="1" Anchor="5" Padding="5|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.25|1|3" BorderColor="-5192482">
        <Texts TranslateID="DIALOG_000006">
          <ENU>Materials</ENU>
        </Texts>
        <TTableInput Name="" ID="4" Translate="1" Height="290" AutoWidth="False" AutoHeight="False" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|0|3" VarName="Mater" Value="Paving|2200|0,015║Cement paste|2400|0,005║Plain concrete|2300|0,05║Polystyrene|20|0,15║Concrete ceiling|2400|0,12║Plaster|2000|0,015" CellBG="-1" HeaderBG="-4144960" FixedRows="-1">
          <Texts TranslateID="DIALOG_000004">
            <ENU>Name|Density (kg/m^3)|Thickness (m)</ENU>
          </Texts>
          <Columns>
            <Column Sort="True" Name="N" Description="Name" Type="String" />
            <Column Sort="True" Name="ρ" Description="Density (kg/m^3)" Type="Numeric">
              <Unit m="-3" kg="1" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="kg/m↑3←" />
            </Column>
            <Column Sort="True" Name="t" Description="Thickness (m)" Type="Numeric">
              <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
            </Column>
          </Columns>
        </TTableInput>
      </TGroupBox>
      <TStringInput Name="TStringInput" ID="3" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="5|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
      <TCheckBox Name="" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="5|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="H2" BookMarkID="" ForeColor="-16711423" ChbRight="False">
        <Texts TranslateID="DIALOG_000005">
          <ENU>
          </ENU>
        </Texts>
      </TCheckBox>
      <TCheckBox Name="TCheckBox" ID="1" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|11.3|0|2" VarName="H1" BookMarkID="" ForeColor="-16711423" ChbRight="False">
        <Texts TranslateID="DIALOG_000001">
          <ENU>
          </ENU>
        </Texts>
      </TCheckBox>
    </Main>
    <MemberData Width="400" />
    <Setup Width="400" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="STRING_05E4B7C0">
      <ENU>"Density"</ENU>
    </Item>
    <Item TranslateID="STRING_1398CF5C">
      <ENU>"Density (kg/m↑3←)"</ENU>
    </Item>
    <Item TranslateID="STRING_1B127156">
      <ENU>"Density (kg/m↑3←)"</ENU>
    </Item>
    <Item TranslateID="STRING_6DB30760">
      <ENU>"Thickness (m)"</ENU>
    </Item>
    <Item TranslateID="STRING_6F8FBEB8">
      <ENU>"Thickness (m)"</ENU>
    </Item>
    <Item TranslateID="STRING_8C486DBA">
      <ENU>"Material name"</ENU>
    </Item>
    <Item TranslateID="STRING_ACE1C05A">
      <ENU>"Load (kN/m↑2←)"</ENU>
    </Item>
    <Item TranslateID="STRING_BE30655B">
      <ENU>"Material name"</ENU>
    </Item>
    <Item TranslateID="STRING_CB9C9472">
      <ENU>"Total load"</ENU>
    </Item>
    <Item TranslateID="STRING_E91E1844">
      <ENU>"Thickness"</ENU>
    </Item>
    <Item TranslateID="STRING_EA27C2F4">
      <ENU>"Total load"</ENU>
    </Item>
    <Item TranslateID="STRING_F70DB4D9">
      <ENU>"Load (kN/m↑2←)"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000001">
      <ENU>string Caption</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000002">
      <ENU>"Calculation of characteristics load"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000015">
      <ENU>Mater[0].N</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000022">
      <ENU>"Total load of all materials:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000023">
      <ENU>"W = " &amp; W</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000031">
      <ENU>"The calculation shows semi-results for each layer and total sum of all inserted materials"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000032">
      <ENU>"No material is defined. Please define at least one material layer."</ENU>
    </Item>
  </Texts>
</Root>