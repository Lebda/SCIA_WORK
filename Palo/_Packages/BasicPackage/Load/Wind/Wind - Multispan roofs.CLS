<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="8c69ecf2-b2ca-4e9f-8e3d-4454bfe05528">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">void UpdateDialog() { 
    Dialog.GetComponentByName("RoofParameters").Visible →INI400_007669= Horizontal; 
    Dialog.GetComponentByName("CoeffMono").Visible →INI400_007670= Type == 0; 
    Dialog.GetComponentByName("CoeffDuoHigher").Visible →INI400_007671= Type == 1 &amp;&amp; WindDir == 0; 
    Dialog.GetComponentByName("CoeffDuoLower").Visible →INI400_007672= Type == 1 &amp;&amp; WindDir == 1; 
} 

→INI400_006607BLOCK { //Set of Result on 0
    w↓F,1← →INI400_006608= 0; w↓F,2← →INI400_006609= 0; w↓F,3← →INI400_006610= 0; w↓F,4← →INI400_006611= 0; 
    w↓G,1← →INI400_006613= 0; w↓G,2← →INI400_006614= 0; w↓G,3← →INI400_006615= 0; w↓G,4← →INI400_007864= 0; 
    w↓H,1← →INI400_007866= 0; w↓H,2← →INI400_007867= 0; w↓H,3← →INI400_007868= 0; w↓H,4← →INI400_007869= 0; 
    w↓I,1← →INI400_007871= 0; w↓I,2← →INI400_007872= 0; w↓I,3← →INI400_007873= 0; 
    w↓J,1← →INI400_007876= 0; w↓J,2← →INI400_007877= 0; w↓J,3← →INI400_007878= 0; 
    H →INI400_007881= 0; F↓w,1← →INI400_007882= 0; F↓w,2← →INI400_007883= 0; F↓w,3← →INI400_007887= 0; F↓w,4← →INI400_007888= 0; 
    F↓w,downwind,1← →INI400_007884= 0; F↓w,downwind,2← →INI400_007885= 0; F↓w,downwind,3← →INI400_007886= 0; 
    F↓w,upwind,1← →INI400_007889= 0; F↓w,upwind,2← →INI400_007890= 0; F↓w,upwind,3← →INI400_007891= 0; 
} 

→INI400_007673BLOCK { 
    IF(Headline) { 
        →INI400_007674TEXT("Wind load on the multispan roofs according to Eurocode 1"); 
        →INI400_007675TEXT(IO.SetupNA.EC_1991_1_4.Name); 
    } 
    IF(PrintCaption) { 
        →INI400_007676TEXT(Caption); 
    } 
} 

object TableHeaderFont →INI400_007677= new Font("Tahoma", 10, FontStyle.Bold); 
object TableCellFont →INI400_007678= new Font("Tahoma", 10, FontStyle.Regular); 

→INI400_007679BLOCK("Wind parameters") { 
    →INI400_007680TEXT(Description("q↓p←")); 
    →INI400_007681TEXT("q↓p← = " &amp; q↓p← &amp; " Pa"); 
    →INI400_007683TEXT(Description("c↓s←c↓d←")); 
    →INI400_007684TEXT("c↓s←c↓d← = " &amp; c↓s←c↓d←); 
    →INI400_007686PAGEBREAK(); 
} 
SWITCH(Type) { 
    CASE 0 :  { 
        →INI400_007687BLOCK("External pressure coefficients for monopitch roofs") { 
            →INI400_007688TEXT("The coefficients and areas for each roof region are gained from monopitch calculation"); 
            →INI400_007689TEXT("In F area"); 
            →INI400_007690TEXT("C↓pe,F← = " &amp; C↓pe,F←); 
            →INI400_007691TEXT("A↓F← = " &amp; A↓F← &amp; " m↑2←"); 
            →INI400_007692TEXT("In G area"); 
            →INI400_007693TEXT("C↓pe,G← = " &amp; C↓pe,G←); 
            →INI400_007694TEXT("A↓G← = " &amp; A↓G← &amp; " m↑2←"); 
            →INI400_007695TEXT("In H area"); 
            →INI400_007696TEXT("C↓pe,H← = " &amp; C↓pe,H←); 
            →INI400_007697TEXT("A↓H← = " &amp; A↓H← &amp; " m↑2←"); 
            →INI400_007698BLOCK { 
                object T1 →INI400_007699= new Table(4); 
                T1[0][0].Value →INI400_007700= TR("Region"); 
                T1[0][1].Value →INI400_007701= "F"; 
                T1[0][2].Value →INI400_007702= "G"; 
                T1[0][3].Value →INI400_007703= "H"; 
                T1[1][0].Value →INI400_007704= TR("Coefficient [-]"); 
                T1[1][1].Value →INI400_007705= C↓pe,F←; 
                T1[1][2].Value →INI400_007706= C↓pe,G←; 
                T1[1][3].Value →INI400_007707= C↓pe,H←; 
                T1[2][0].Value →INI400_007708= TR("Area [m↑2←]"); 
                T1[2][1].Value →INI400_007709= A↓F←; 
                T1[2][2].Value →INI400_007710= A↓G←; 
                T1[2][3].Value →INI400_007711= A↓H←; 
                T1[0].Font →INI400_007712= TableHeaderFont; 
                T1[1].Font →INI400_007713= TableCellFont; 
                T1[2].Font →INI400_007714= TableCellFont; 
                T1[1][0].Font →INI400_007715= TableHeaderFont; 
                T1[2][0].Font →INI400_007716= TableHeaderFont; 
                T1.Padding.All →INI400_007717= 5; 
            } 
            →INI400_007718T1.Draw(); 
            →INI400_007719PAGEBREAK(); 
        } 
        →INI400_007720BLOCK("Reduction coefficients") { 
            SWITCH(WindDir) { 
                CASE 0 :  { 
                    r↓1← →INI400_007721= 1; 
                    r↓2← →INI400_007722= 0.8; 
                    r↓3← →INI400_007723= 0.6; 
                } 
                CASE 1 :  { 
                    IF(C↓pe,F← &gt; 0) { 
                        r↓1← →INI400_007724= 1; 
                        r↓2← →INI400_007725= -0.4; 
                        r↓3← →INI400_007726= -0.4; 
                    } ELSE { 
                        r↓1← →INI400_007727= 1; 
                        r↓2← →INI400_007728= 0.8; 
                        r↓3← →INI400_007729= 0.6; 
                    } 
                } 
            } 
            →INI400_007730PAGEBREAK(); 
        } 
        SWITCH(WindDir) { 
            CASE 0 :  { 
                →INI400_007731IMG("PultV"); 
            } 
            CASE 1 :  { 
                IF(C↓pe,F← &gt; 0) { 
                    →INI400_007732IMG("PultN1"); 
                } ELSE { 
                    →INI400_007733IMG("PultN2"); 
                } 
            } 
        } 
        →INI400_007734PAGEBREAK(); 
        →INI400_007735BLOCK("Wind load values in each spans") { 
            →INI400_007736TEXT("Wind load on first span"); 
            →INI400_007737TEXT("Wind load in areas"); 
            w↓F,1← →INI400_007738= C↓pe,F←*q↓p←*r↓1←; 
            w↓G,1← →INI400_007739= C↓pe,G←*q↓p←*r↓1←; 
            w↓H,1← →INI400_007740= C↓pe,H←*q↓p←*r↓1←; 
            →INI400_007741TEXT("Total wind force"); 
            F↓w,1← →INI400_007742= c↓s←c↓d←*SUM(2*w↓F,1←*A↓F←, w↓G,1←*A↓G←, w↓H,1←*A↓H←); 
            →INI400_007743TEXT("Wind load on second span"); 
            →INI400_007744PAGEBREAK(); 
            →INI400_007745TEXT("Wind load in areas"); 
            w↓F,2← →INI400_007746= C↓pe,F←*q↓p←*r↓2←; 
            w↓G,2← →INI400_007747= C↓pe,G←*q↓p←*r↓2←; 
            w↓H,2← →INI400_007748= C↓pe,H←*q↓p←*r↓2←; 
            →INI400_007749TEXT("Total wind force"); 
            F↓w,2← →INI400_007750= c↓s←c↓d←*SUM(2*w↓F,2←*A↓F←, w↓G,2←*A↓G←, w↓H,2←*A↓H←); 
            →INI400_007751PAGEBREAK(); 
            →INI400_007752TEXT("Wind load on third and more spans"); 
            →INI400_007753TEXT("Wind load in areas"); 
            w↓F,3← →INI400_007754= C↓pe,F←*q↓p←*r↓3←; 
            w↓G,3← →INI400_007755= C↓pe,G←*q↓p←*r↓3←; 
            w↓H,3← →INI400_007756= C↓pe,H←*q↓p←*r↓3←; 
            →INI400_007757TEXT("Total wind force"); 
            F↓w,3← →INI400_007758= c↓s←c↓d←*SUM(2*w↓F,3←*A↓F←, w↓G,3←*A↓G←, w↓H,3←*A↓H←); 
            →INI400_007759BLOCK { 
                object T2 →INI400_007760= new Table(5); 
                T2[0][0].Value →INI400_007761= TR("Span"); 
                T2[0][1].Value →INI400_007762= "w↓F←&lt;BR&gt;[kN/m↑2←]"; 
                T2[0][2].Value →INI400_007763= "w↓G←&lt;BR&gt;[kN/m↑2←]"; 
                T2[0][3].Value →INI400_007764= "w↓H←&lt;BR&gt;[kN/m↑2←]"; 
                T2[0][4].Value →INI400_007765= "F↓w←&lt;BR&gt;[kN]"; 
                T2[1][0].Value →INI400_007766= TR("First"); 
                T2[1][1].Value →INI400_007767= Val(w↓F,1←/10↑3←, 3); 
                T2[1][2].Value →INI400_007768= Val(w↓G,1←/10↑3←, 3); 
                T2[1][3].Value →INI400_007769= Val(w↓H,1←/10↑3←, 3); 
                T2[1][4].Value →INI400_007770= Val(F↓w,1←/10↑3←, 3); 
                T2[2][0].Value →INI400_007771= TR("Second"); 
                T2[2][1].Value →INI400_007772= Val(w↓F,2←/10↑3←, 3); 
                T2[2][2].Value →INI400_007773= Val(w↓G,2←/10↑3←, 3); 
                T2[2][3].Value →INI400_007774= Val(w↓H,2←/10↑3←, 3); 
                T2[2][4].Value →INI400_007775= Val(F↓w,2←/10↑3←, 3); 
                T2[3][0].Value →INI400_007776= TR("All others"); 
                T2[3][1].Value →INI400_007777= Val(w↓F,3←/10↑3←, 3); 
                T2[3][2].Value →INI400_007778= Val(w↓G,3←/10↑3←, 3); 
                T2[3][3].Value →INI400_007779= Val(w↓H,3←/10↑3←, 3); 
                T2[3][4].Value →INI400_007780= Val(F↓w,3←/10↑3←, 3); 
                T2[0].Font →INI400_007781= TableHeaderFont; 
                T2[1].Font →INI400_007782= TableCellFont; 
                T2[2].Font →INI400_007783= TableCellFont; 
                T2[3].Font →INI400_007784= TableCellFont; 
                T2[1][0].Font →INI400_007785= TableHeaderFont; 
                T2[2][0].Font →INI400_007786= TableHeaderFont; 
                T2[3][0].Font →INI400_007787= TableHeaderFont; 
                T2.Padding.All →INI400_007788= 5; 
            } 
            →INI400_007789T2.Draw(); 
        } 
    } 
    CASE 1 :  { 
        →INI400_007790BLOCK("External pressure coefficients for duopitch roofs") { 
            SWITCH(WindDir) { 
                CASE 1 :  { 
                    →INI400_007791TEXT("The coefficients and areas for first span are gained from monopitch calculation,&lt;BR&gt;second and all following are gained from duopitch calculation with α &lt; 0 °.&lt;BR&gt;Coefficients and areas for last span are gained from monopitch calculation."); 
                    →INI400_007792TEXT("First span"); 
                    →INI400_007793TEXT("In F area"); 
                    →INI400_007794TEXT("C↓pe,F,1← = " &amp; C↓pe,F,1←); 
                    →INI400_007795TEXT("A↓F,1← = " &amp; A↓F,1← &amp; " m↑2←"); 
                    →INI400_007796TEXT("In G area"); 
                    →INI400_007797TEXT("C↓pe,G,1← = " &amp; C↓pe,G,1←); 
                    →INI400_007798TEXT("A↓G,1← = " &amp; A↓G,1← &amp; " m↑2←"); 
                    →INI400_007799TEXT("In H area"); 
                    →INI400_007800TEXT("C↓pe,H,1← = " &amp; C↓pe,H,1←); 
                    →INI400_007801TEXT("A↓H,1← = " &amp; A↓H,1← &amp; " m↑2←"); 
                    →INI400_007802BLOCK { 
                        object T3 →INI400_007803= new Table(4); 
                        T3[0][0].Value →INI400_007804= TR("Region"); 
                        T3[0][1].Value →INI400_007805= "F"; 
                        T3[0][2].Value →INI400_007806= "G"; 
                        T3[0][3].Value →INI400_007807= "H"; 
                        T3[1][0].Value →INI400_007808= TR("Coefficient [-]"); 
                        T3[1][1].Value →INI400_007809= C↓pe,F,1←; 
                        T3[1][2].Value →INI400_007810= C↓pe,G,1←; 
                        T3[1][3].Value →INI400_007811= C↓pe,H,1←; 
                        T3[2][0].Value →INI400_007812= TR("Area [m↑2←]"); 
                        T3[2][1].Value →INI400_007813= A↓F,1←; 
                        T3[2][2].Value →INI400_007814= A↓G,1←; 
                        T3[2][3].Value →INI400_007815= A↓H,1←; 
                        T3[0].Font →INI400_007816= TableHeaderFont; 
                        T3[1].Font →INI400_007817= TableCellFont; 
                        T3[2].Font →INI400_007818= TableCellFont; 
                        T3[1][0].Font →INI400_007819= TableHeaderFont; 
                        T3[2][0].Font →INI400_007820= TableHeaderFont; 
                        T3.Padding.All →INI400_007821= 5; 
                    } 
                    →INI400_007822T3.Draw(); 
                    →INI400_007823PAGEBREAK(); 
                    →INI400_007824TEXT("Following spans"); 
                } 
            } 
            →INI400_007825TEXT("In F area"); 
            →INI400_007826TEXT("C↓pe,F← = " &amp; C↓pe,F←); 
            →INI400_007827TEXT("A↓F← = " &amp; A↓F← &amp; " m↑2←"); 
            →INI400_007828TEXT("In G area"); 
            →INI400_007829TEXT("C↓pe,G← = " &amp; C↓pe,G←); 
            →INI400_007830TEXT("A↓G← = " &amp; A↓G← &amp; " m↑2←"); 
            →INI400_007831TEXT("In H area"); 
            →INI400_007832TEXT("C↓pe,H← = " &amp; C↓pe,H←); 
            →INI400_007833TEXT("A↓H← = " &amp; A↓H← &amp; " m↑2←"); 
            →INI400_007834TEXT("In I area"); 
            →INI400_007835TEXT("C↓pe,I← = " &amp; C↓pe,I←); 
            →INI400_007836TEXT("A↓I← = " &amp; A↓I← &amp; " m↑2←"); 
            →INI400_007837TEXT("In J area"); 
            →INI400_007838TEXT("C↓pe,J← = " &amp; C↓pe,J←); 
            →INI400_007839TEXT("A↓J← = " &amp; A↓J← &amp; " m↑2←"); 
            →INI400_007840BLOCK { 
                object T4 →INI400_007841= new Table(6); 
                T4[0][0].Value →INI400_007842= TR("Region"); 
                T4[0][1].Value →INI400_007843= "F"; 
                T4[0][2].Value →INI400_007844= "G"; 
                T4[0][3].Value →INI400_007845= "H"; 
                T4[0][4].Value →INI400_007846= "I"; 
                T4[0][5].Value →INI400_007847= "J"; 
                T4[1][0].Value →INI400_007848= TR("Coefficient [-]"); 
                T4[1][1].Value →INI400_007849= C↓pe,F←; 
                T4[1][2].Value →INI400_007850= C↓pe,G←; 
                T4[1][3].Value →INI400_007851= C↓pe,H←; 
                T4[1][4].Value →INI400_007852= C↓pe,I←; 
                T4[1][5].Value →INI400_007853= C↓pe,J←; 
                T4[2][0].Value →INI400_007854= TR("Area [m↑2←]"); 
                T4[2][1].Value →INI400_007855= A↓F←; 
                T4[2][2].Value →INI400_007856= A↓G←; 
                T4[2][3].Value →INI400_007857= A↓H←; 
                T4[2][4].Value →INI400_007858= A↓I←; 
                T4[2][5].Value →INI400_007859= A↓J←; 
                T4[0].Font →INI400_007860= TableHeaderFont; 
                T4[1].Font →INI400_007861= TableCellFont; 
                T4[2].Font →INI400_007862= TableCellFont; 
                T4[1][0].Font →INI400_007863= TableHeaderFont; 
                T4[2][0].Font →INI400_007864= TableHeaderFont; 
                T4.Padding.All →INI400_007865= 5; 
            } 
            →INI400_007866T4.Draw(); 
            
            →INI400_007867PAGEBREAK(); 
            SWITCH(WindDir) { 
                CASE 1 :  { 
                    →INI400_007868TEXT("Last span"); 
                    →INI400_007869TEXT("In F area"); 
                    →INI400_007870TEXT("C↓pe,F,2← = " &amp; C↓pe,F,2←); 
                    →INI400_007871TEXT("A↓F,2← = " &amp; A↓F,2← &amp; " m↑2←"); 
                    →INI400_007872TEXT("In G area"); 
                    →INI400_007873TEXT("C↓pe,G,2← = " &amp; C↓pe,G,2←); 
                    →INI400_007874TEXT("A↓G,2← = " &amp; A↓G,2← &amp; " m↑2←"); 
                    →INI400_007875TEXT("In H area"); 
                    →INI400_007876TEXT("C↓pe,H,2← = " &amp; C↓pe,H,2←); 
                    →INI400_007877TEXT("A↓H,2← = " &amp; A↓H,2← &amp; " m↑2←"); 
                    →INI400_007878BLOCK { 
                        object T5 →INI400_007879= new Table(4); 
                        T5[0][0].Value →INI400_007880= TR("Region"); 
                        T5[0][1].Value →INI400_007881= "F"; 
                        T5[0][2].Value →INI400_007882= "G"; 
                        T5[0][3].Value →INI400_007883= "H"; 
                        T5[1][0].Value →INI400_007884= TR("Coefficient [-]"); 
                        T5[1][1].Value →INI400_007885= C↓pe,F,2←; 
                        T5[1][2].Value →INI400_007886= C↓pe,G,2←; 
                        T5[1][3].Value →INI400_007887= C↓pe,H,2←; 
                        T5[2][0].Value →INI400_007888= TR("Area [m↑2←]"); 
                        T5[2][1].Value →INI400_007889= A↓F,2←; 
                        T5[2][2].Value →INI400_007890= A↓G,2←; 
                        T5[2][3].Value →INI400_007891= A↓H,2←; 
                        T5[0].Font →INI400_007892= TableHeaderFont; 
                        T5[1].Font →INI400_007893= TableCellFont; 
                        T5[2].Font →INI400_007894= TableCellFont; 
                        T5[1][0].Font →INI400_007895= TableHeaderFont; 
                        T5[2][0].Font →INI400_007896= TableHeaderFont; 
                        T5.Padding.All →INI400_007897= 5; 
                    } 
                    →INI400_007898T5.Draw(); 
                    →INI400_007899PAGEBREAK(); 
                } 
            } 
        } 
        →INI400_007900BLOCK("Reduction coefficients") { 
            SWITCH(WindDir) { 
                CASE 0 :  { 
                    r↓1← →INI400_007901= 1; 
                    r↓2← →INI400_007902= 0.8; 
                    r↓3← →INI400_007903= 0.6; 
                } 
                CASE 1 :  { 
                    r↓1← →INI400_007904= 1; 
                    r↓2← →INI400_007905= 0.6; 
                    r↓3← →INI400_007906= 0.6; 
                } 
            } 
            →INI400_007907PAGEBREAK(); 
        } 
        SWITCH(WindDir) { 
            CASE 0 :  { 
                →INI400_007908IMG("SedloV"); 
            } 
            CASE 1 :  { 
                →INI400_007909IMG("SedloN"); 
            } 
        } 
        →INI400_007910PAGEBREAK(); 
        →INI400_007911BLOCK("Wind load values in each spans") { 
            SWITCH(WindDir) { 
                CASE 0 :  { 
                    →INI400_007912TEXT("Wind load on first span"); 
                    →INI400_007913TEXT("Wind load in areas"); 
                    w↓F,1← →INI400_007914= C↓pe,F←*q↓p←*r↓1←; 
                    w↓G,1← →INI400_007915= C↓pe,G←*q↓p←*r↓1←; 
                    w↓H,1← →INI400_007916= C↓pe,H←*q↓p←*r↓1←; 
                    w↓I,1← →INI400_007917= C↓pe,I←*q↓p←*r↓1←; 
                    w↓J,1← →INI400_007918= C↓pe,J←*q↓p←*r↓1←; 
                    →INI400_007919TEXT("Total wind force"); 
                    F↓w,upwind,1← →INI400_007920= c↓s←c↓d←*SUM(2*w↓F,1←*A↓F←, w↓G,1←*A↓G←, w↓H,1←*A↓H←); 
                    F↓w,downwind,1← →INI400_007921= c↓s←c↓d←*SUM(w↓I,1←*A↓I←, w↓J,1←*A↓J←); 
                    →INI400_007922PAGEBREAK(); 
                    →INI400_007923TEXT("Wind load on second span"); 
                    →INI400_007924TEXT("Wind load in areas"); 
                    w↓F,2← →INI400_007925= C↓pe,F←*q↓p←*r↓2←; 
                    w↓G,2← →INI400_007926= C↓pe,G←*q↓p←*r↓2←; 
                    w↓H,2← →INI400_007927= C↓pe,H←*q↓p←*r↓2←; 
                    w↓I,2← →INI400_007928= C↓pe,I←*q↓p←*r↓2←; 
                    w↓J,2← →INI400_007929= C↓pe,J←*q↓p←*r↓2←; 
                    →INI400_007930TEXT("Total wind force"); 
                    F↓w,upwind,2← →INI400_007931= c↓s←c↓d←*SUM(2*w↓F,2←*A↓F←, w↓G,2←*A↓G←, w↓H,2←*A↓H←); 
                    F↓w,downwind,2← →INI400_007932= c↓s←c↓d←*SUM(w↓I,2←*A↓I←, w↓J,2←*A↓J←); 
                    →INI400_007933PAGEBREAK(); 
                    →INI400_007934TEXT("Wind load on third and following spans"); 
                    →INI400_007935TEXT("Wind load in areas"); 
                    w↓F,3← →INI400_007936= C↓pe,F←*q↓p←*r↓3←; 
                    w↓G,3← →INI400_007937= C↓pe,G←*q↓p←*r↓3←; 
                    w↓H,3← →INI400_007938= C↓pe,H←*q↓p←*r↓3←; 
                    w↓I,3← →INI400_007939= C↓pe,I←*q↓p←*r↓3←; 
                    w↓J,3← →INI400_007940= C↓pe,J←*q↓p←*r↓3←; 
                    →INI400_007941TEXT("Total wind force"); 
                    F↓w,upwind,3← →INI400_007942= c↓s←c↓d←*SUM(2*w↓F,3←*A↓F←, w↓G,3←*A↓G←, w↓H,3←*A↓H←); 
                    F↓w,downwind,3← →INI400_007943= c↓s←c↓d←*SUM(w↓I,3←*A↓I←, w↓J,3←*A↓J←); 
                    →INI400_007944BLOCK { 
                        object T6 →INI400_007945= new Table(8); 
                        T6[0][0].Value →INI400_007946= TR("Span"); 
                        T6[0][1].Value →INI400_007947= "w↓F←&lt;BR&gt;[kN/m↑2←]"; 
                        T6[0][2].Value →INI400_007948= "w↓G←&lt;BR&gt;[kN/m↑2←]"; 
                        T6[0][3].Value →INI400_007949= "w↓H←&lt;BR&gt;[kN/m↑2←]"; 
                        T6[0][4].Value →INI400_007950= "w↓I←&lt;BR&gt;[kN/m↑2←]"; 
                        T6[0][5].Value →INI400_007951= "w↓J←&lt;BR&gt;[kN/m↑2←]"; 
                        T6[0][6].Value →INI400_007952= "F↓w,upwind←&lt;BR&gt;[kN]"; 
                        T6[0][7].Value →INI400_007953= "F↓w,downwind←&lt;BR&gt;[kN]"; 
                        T6[1][0].Value →INI400_007954= TR("First"); 
                        T6[1][1].Value →INI400_007955= Val(w↓F,1←/10↑3←, 3); 
                        T6[1][2].Value →INI400_007956= Val(w↓G,1←/10↑3←, 3); 
                        T6[1][3].Value →INI400_007957= Val(w↓H,1←/10↑3←, 3); 
                        T6[1][4].Value →INI400_007958= Val(w↓I,1←/10↑3←, 3); 
                        T6[1][5].Value →INI400_007959= Val(w↓J,1←/10↑3←, 3); 
                        T6[1][6].Value →INI400_007960= Val(F↓w,upwind,1←/10↑3←, 3); 
                        T6[1][7].Value →INI400_007961= Val(F↓w,downwind,1←/10↑3←, 3); 
                        T6[2][0].Value →INI400_007962= TR("Second"); 
                        T6[2][1].Value →INI400_007963= Val(w↓F,2←/10↑3←, 3); 
                        T6[2][2].Value →INI400_007964= Val(w↓G,2←/10↑3←, 3); 
                        T6[2][3].Value →INI400_007965= Val(w↓H,2←/10↑3←, 3); 
                        T6[2][4].Value →INI400_007966= Val(w↓I,2←/10↑3←, 3); 
                        T6[2][5].Value →INI400_007967= Val(w↓J,2←/10↑3←, 3); 
                        T6[2][6].Value →INI400_007968= Val(F↓w,upwind,2←/10↑3←, 3); 
                        T6[2][7].Value →INI400_007969= Val(F↓w,downwind,2←/10↑3←, 3); 
                        T6[3][0].Value →INI400_007970= TR("All others"); 
                        T6[3][1].Value →INI400_007971= Val(w↓F,3←/10↑3←, 3); 
                        T6[3][2].Value →INI400_007972= Val(w↓G,3←/10↑3←, 3); 
                        T6[3][3].Value →INI400_007973= Val(w↓H,3←/10↑3←, 3); 
                        T6[3][4].Value →INI400_007974= Val(w↓I,3←/10↑3←, 3); 
                        T6[3][5].Value →INI400_007975= Val(w↓J,3←/10↑3←, 3); 
                        T6[3][6].Value →INI400_007976= Val(F↓w,upwind,3←/10↑3←, 3); 
                        T6[3][7].Value →INI400_007977= Val(F↓w,downwind,3←/10↑3←, 3); 
                        T6[0].Font →INI400_007978= TableHeaderFont; 
                        T6[1].Font →INI400_007979= TableCellFont; 
                        T6[2].Font →INI400_007980= TableCellFont; 
                        T6[3].Font →INI400_007981= TableCellFont; 
                        T6[1][0].Font →INI400_007982= TableHeaderFont; 
                        T6[2][0].Font →INI400_007983= TableHeaderFont; 
                        T6[3][0].Font →INI400_007984= TableHeaderFont; 
                        T6.Padding.All →INI400_007985= 5; 
                    } 
                    →INI400_007986T6.Draw(); 
                } 
                CASE 1 :  { 
                    →INI400_007987TEXT("Wind load on first span"); 
                    →INI400_007988TEXT("Wind load in areas"); 
                    w↓F,1← →INI400_007989= C↓pe,F,1←*q↓p←*r↓1←; 
                    w↓G,1← →INI400_007990= C↓pe,G,1←*q↓p←*r↓1←; 
                    w↓H,1← →INI400_007991= C↓pe,H,1←*q↓p←*r↓1←; 
                    →INI400_007992TEXT("Total wind force"); 
                    F↓w,1← →INI400_007993= c↓s←c↓d←*SUM(2*w↓F,1←*A↓F,1←, w↓G,1←*A↓G,1←, w↓H,1←*A↓H,1←); 
                    →INI400_007994PAGEBREAK(); 
                    →INI400_007995TEXT("Wind load on second span"); 
                    →INI400_007996TEXT("Wind load in areas"); 
                    w↓F,2← →INI400_007997= C↓pe,F←*q↓p←*r↓1←; 
                    w↓G,2← →INI400_007998= C↓pe,G←*q↓p←*r↓1←; 
                    w↓H,2← →INI400_007999= C↓pe,H←*q↓p←*r↓1←; 
                    w↓I,2← →INI400_008000= C↓pe,I←*q↓p←*r↓1←; 
                    w↓J,2← →INI400_008001= C↓pe,J←*q↓p←*r↓1←; 
                    →INI400_008002TEXT("Total wind force"); 
                    F↓w,upwind,2← →INI400_008003= c↓s←c↓d←*SUM(2*w↓F,2←*A↓F←, w↓G,2←*A↓G←, w↓H,2←*A↓H←); 
                    F↓w,downwind,2← →INI400_008004= c↓s←c↓d←*SUM(w↓I,2←*A↓I←, w↓J,2←*A↓J←); 
                    →INI400_008005PAGEBREAK(); 
                    →INI400_008006TEXT("Wind load on third and following spans"); 
                    →INI400_008007TEXT("Wind load in areas"); 
                    w↓F,3← →INI400_008008= C↓pe,F←*q↓p←*r↓2←; 
                    w↓G,3← →INI400_008009= C↓pe,G←*q↓p←*r↓2←; 
                    w↓H,3← →INI400_008010= C↓pe,H←*q↓p←*r↓2←; 
                    w↓I,3← →INI400_008011= C↓pe,I←*q↓p←*r↓2←; 
                    w↓J,3← →INI400_008012= C↓pe,J←*q↓p←*r↓2←; 
                    →INI400_008013TEXT("Total wind force"); 
                    F↓w,upwind,3← →INI400_008014= c↓s←c↓d←*SUM(2*w↓F,3←*A↓F←, w↓G,3←*A↓G←, w↓H,3←*A↓H←); 
                    F↓w,downwind,3← →INI400_008015= c↓s←c↓d←*SUM(w↓I,3←*A↓I←, w↓J,3←*A↓J←); 
                    →INI400_008016PAGEBREAK(); 
                    →INI400_008017TEXT("Wind load on last span"); 
                    →INI400_008018TEXT("Wind load in areas"); 
                    w↓F,4← →INI400_008019= C↓pe,F,2←*q↓p←*r↓3←; 
                    w↓G,4← →INI400_008020= C↓pe,G,2←*q↓p←*r↓3←; 
                    w↓H,4← →INI400_008021= C↓pe,H,2←*q↓p←*r↓3←; 
                    →INI400_008022TEXT("Total wind force"); 
                    F↓w,4← →INI400_008023= c↓s←c↓d←*SUM(2*w↓F,4←*A↓F,2←, w↓G,4←*A↓G,2←, w↓H,4←*A↓H,2←); 
                    →INI400_008024BLOCK { 
                        object T7 →INI400_008025= new Table(8); 
                        T7[0][0].Value →INI400_008026= TR("Span"); 
                        T7[0][1].Value →INI400_008027= "w↓F←&lt;BR&gt;[kN/m↑2←]"; 
                        T7[0][2].Value →INI400_008028= "w↓G←&lt;BR&gt;[kN/m↑2←]"; 
                        T7[0][3].Value →INI400_008029= "w↓H←&lt;BR&gt;[kN/m↑2←]"; 
                        T7[0][4].Value →INI400_008030= "w↓I←&lt;BR&gt;[kN/m↑2←]"; 
                        T7[0][5].Value →INI400_008031= "w↓J←&lt;BR&gt;[kN/m↑2←]"; 
                        T7[0][6].Value →INI400_008032= "F↓w,upwind←&lt;BR&gt;[kN]"; 
                        T7[0][7].Value →INI400_008033= "F↓w,downwind←&lt;BR&gt;[kN]"; 
                        T7[1][0].Value →INI400_008034= TR("First"); 
                        T7[1][1].Value →INI400_008035= Val(w↓F,1←/10↑3←, 3); 
                        T7[1][2].Value →INI400_008036= Val(w↓G,1←/10↑3←, 3); 
                        T7[1][3].Value →INI400_008037= Val(w↓H,1←/10↑3←, 3); 
                        T7[1][6].Value →INI400_008038= Val(F↓w,1←/10↑3←, 3); 
                        T7[2][0].Value →INI400_008039= TR("Second"); 
                        T7[2][1].Value →INI400_008040= Val(w↓F,2←/10↑3←, 3); 
                        T7[2][2].Value →INI400_008041= Val(w↓G,2←/10↑3←, 3); 
                        T7[2][3].Value →INI400_008042= Val(w↓H,2←/10↑3←, 3); 
                        T7[2][4].Value →INI400_008043= Val(w↓I,2←/10↑3←, 3); 
                        T7[2][5].Value →INI400_008044= Val(w↓J,2←/10↑3←, 3); 
                        T7[2][6].Value →INI400_008045= Val(F↓w,upwind,2←/10↑3←, 3); 
                        T7[2][7].Value →INI400_008046= Val(F↓w,downwind,2←/10↑3←, 3); 
                        T7[3][0].Value →INI400_008047= TR("Third and more"); 
                        T7[3][1].Value →INI400_008048= Val(w↓F,3←/10↑3←, 3); 
                        T7[3][2].Value →INI400_008049= Val(w↓G,3←/10↑3←, 3); 
                        T7[3][3].Value →INI400_008050= Val(w↓H,3←/10↑3←, 3); 
                        T7[3][4].Value →INI400_008051= Val(w↓I,3←/10↑3←, 3); 
                        T7[3][5].Value →INI400_008052= Val(w↓J,3←/10↑3←, 3); 
                        T7[3][6].Value →INI400_008053= Val(F↓w,upwind,3←/10↑3←, 3); 
                        T7[3][7].Value →INI400_008054= Val(F↓w,downwind,3←/10↑3←, 3); 
                        T7[4][0].Value →INI400_008055= TR("Last"); 
                        T7[4][1].Value →INI400_008056= Val(w↓F,4←/10↑3←, 3); 
                        T7[4][2].Value →INI400_008057= Val(w↓G,4←/10↑3←, 3); 
                        T7[4][3].Value →INI400_008058= Val(w↓H,4←/10↑3←, 3); 
                        T7[4][7].Value →INI400_008059= Val(F↓w,4←/10↑3←, 3); 
                        T7[0].Font →INI400_008060= TableHeaderFont; 
                        T7[1].Font →INI400_008061= TableCellFont; 
                        T7[2].Font →INI400_008062= TableCellFont; 
                        T7[3].Font →INI400_008063= TableCellFont; 
                        T7[4].Font →INI400_008064= TableCellFont; 
                        T7[1][0].Font →INI400_008065= TableHeaderFont; 
                        T7[2][0].Font →INI400_008066= TableHeaderFont; 
                        T7[3][0].Font →INI400_008067= TableHeaderFont; 
                        T7[4][0].Font →INI400_008068= TableHeaderFont; 
                        T7.Padding.All →INI400_008069= 5; 
                    } 
                    →INI400_008070T7.Draw(); 
                } 
            } 
        } 
    } 
} 
IF(Horizontal) { 
    →INI400_008071PAGEBREAK(); 
    →INI400_008072BLOCK("Minimal horizontal force acting on each multispan span") { 
        A↓Shed← →INI400_008073= b*d; 
        H →INI400_008074= 0.05*q↓p←*A↓Shed←; 
    } 
} 

//NA dependent variables:
//v↓m←, q↓p← - NA.2.3</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="-1" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="User" Autor2="" Version="301" EWNSource="" Icon="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">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia.net/forms/en/Wind/Wind_load.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Wind - Multispan roofs</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="Standard, N 10, F 30" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, AL 0, F 0" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Headline, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Headline, N 0, F 10" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" />
      <Style Key="Remark, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="50" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Standard, N 10, F 20" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 10" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 5" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Remark, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Standard, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 10, F 0" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Underline, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Check, F 5, OTL 0" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Standard, AL 0, F 5" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 0, F 0" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Standard, N 0, F 20" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="20" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Formula B, N 50, F 5" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 0, F 5" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 300, F 5" X="300" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 250, F 5" X="250" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 200, F 5" X="200" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 100, F 5" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Formula B, N 150, F 5" X="150" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
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
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
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
      <Variable Modifier="Public" Name="A↓F,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓F,2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓F←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓G,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓G,2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓G←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓H,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓H,2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓H←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓I←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓J←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓Shed←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>Width of the roof perpendicular to wind direction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="C↓pe,F,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓pe,F,2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓pe,F←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓pe,G,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓pe,G,2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓pe,G←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓pe,H,1←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓pe,H,2←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓pe,H←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓pe,I←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="C↓pe,J←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c↓s←c↓d←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_c↓s←c↓d←">
          <ENU>Structural factor</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Caption" ESA_ID="" Type="String" Value="">
        <Description TranslateID="VARIABLE_Caption">
          <ENU>Userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>Width of the roof span parallel to the wind direction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="F↓w,1←" ESA_ID="Result.20" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓w,2←" ESA_ID="Result.21" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓w,3←" ESA_ID="Result.22" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓w,4←" ESA_ID="Result.23" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓w,downwind,1←" ESA_ID="Result.24" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓w,downwind,2←" ESA_ID="Result.25" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓w,downwind,3←" ESA_ID="Result.26" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓w,upwind,1←" ESA_ID="Result.27" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓w,upwind,2←" ESA_ID="Result.28" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="F↓w,upwind,3←" ESA_ID="Result.29" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="H" ESA_ID="Result.19" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="Headline" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Headline">
          <ENU>Print headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Horizontal" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Horizontal">
          <ENU>Calculate minimal horizontal force</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print userdefined headline</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="q↓p←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_q↓p←">
          <ENU>Wind peak velocity pressure on the roof</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1" Dim="Pa" />
      </Variable>
      <Variable Modifier="Public" Name="r↓1←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="r↓2←" ESA_ID="" Type="Double" Value="800e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="r↓3←" ESA_ID="" Type="Double" Value="600e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="T1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T3" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T4" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T5" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T6" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T7" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableCellFont" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableHeaderFont" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Type" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_Type">
          <ENU>Roof type</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="w↓F,1←" ESA_ID="Result.01" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓F,2←" ESA_ID="Result.02" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓F,3←" ESA_ID="Result.03" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓F,4←" ESA_ID="Result.04" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓G,1←" ESA_ID="Result.05" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓G,2←" ESA_ID="Result.06" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓G,3←" ESA_ID="Result.07" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓G,4←" ESA_ID="Result.08" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓H,1←" ESA_ID="Result.09" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓H,2←" ESA_ID="Result.10" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓H,3←" ESA_ID="Result.11" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓H,4←" ESA_ID="Result.12" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓I,1←" ESA_ID="Result.13" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓I,2←" ESA_ID="Result.14" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓I,3←" ESA_ID="Result.15" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓J,1←" ESA_ID="Result.16" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓J,2←" ESA_ID="Result.17" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="w↓J,3←" ESA_ID="Result.18" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN/m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="WindDir" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_WindDir">
          <ENU>Wind direction</ENU>
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
      <VC ID="INI400_006607">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006608">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006609">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006610">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006611">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006613">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006614">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006615">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007669">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007670">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007671">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007672">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007673">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007674">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007675">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, F 5, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, F 5, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, F 5, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007676">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="14" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14.3|1|2" Font2="Tahoma|14.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="14" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14.3|1|2" Font2="Tahoma|14.3|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="14" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14.3|1|2" Font2="Tahoma|14.3|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007677">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007678">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007679">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007680">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="73" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007681">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007683">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007684">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 250, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007686">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007687">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007688">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="71.1" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="71.1" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007689">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="91.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007690">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula, N 10, F 5" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007691">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007692">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007693">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="INI400_007233" Style="2" StyleName="Formula, N 150, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007694">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="INI400_007268" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007695">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="122" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007696">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="INI400_007233" Style="2" StyleName="Formula, N 300, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007697">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="INI400_007268" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007698">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007699">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007700">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007701">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007702">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007703">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007704">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007705">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007706">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007707">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007708">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007709">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007710">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007711">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007712">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007713">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007714">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007715">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007716">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007717">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007718">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007719">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007720">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007721">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="188" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="188" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="188" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007722">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="207" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="207" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="207" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007723">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="226" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="226" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="226" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007724">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007725">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007726">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007727">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007728">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007729">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007730">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007731">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="292" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="233" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="292" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="292" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="292" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007732">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="293" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="293" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="311" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="311" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="311" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007733">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="303" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="303" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="307" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="307" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="307" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007734">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007735">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007736">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007737">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007738">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007739">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007740">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007741">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007742">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007743">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007744">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007745">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007746">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007747">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007748">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007749">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007750">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007751">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007752">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007753">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007754">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007755">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007756">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007757">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007758">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007759">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007760">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007761">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007762">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007763">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007764">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007765">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007766">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007767">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007768">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007769">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007770">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007771">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007772">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007773">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007774">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007775">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007776">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007777">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007778">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007779">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007780">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007781">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007782">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007783">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007784">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007785">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007786">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007787">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007788">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007789">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007790">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007791">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark, N 50, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="71.1" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="71.1" Hor="1" Ver="4" SpX="10" SpY="10" Font1="Tahoma|13.4|2|2" Font2="Tahoma|13.4|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="66" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|10.4|0|2" Font2="Tahoma|10.4|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007792">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007793">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="91.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007794">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007795">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007796">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007797">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="150" Y="104" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007798">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007799">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="122" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007800">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="300" Y="104" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007801">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007802">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007803">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007804">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007805">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007806">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007807">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007808">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007809">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007810">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007811">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007812">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007813">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007814">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007815">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007816">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007817">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007818">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007819">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007820">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007821">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007822">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007823">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007824">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007825">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="91.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007826">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula, N 10, F 5" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007827">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007828">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007829">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula, N 150, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007830">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007831">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="122" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007832">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula, N 300, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007833">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007834">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="122" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007835">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula, N 150, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula, N 150, OTL 0" EqStyle="15" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula, N 450, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007836">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007837">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="122" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007838">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula, N 150, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula, N 150, OTL 0" EqStyle="15" />
        <Set Vis="0" Prev="" Style="2" StyleName="Formula, N 500, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007839">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007840">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007841">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007842">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007843">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007844">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007845">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007846">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007847">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007848">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007849">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007850">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007851">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007852">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007853">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007854">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007855">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007856">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007857">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007858">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007859">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007860">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007861">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007862">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007863">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007864">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007865">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007866">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007867">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007868">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007869">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="91.3" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007870">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007871">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007872">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007873">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="150" Y="104" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007874">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007875">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="122" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|4|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="85" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|1|2" Font2="Tahoma|13|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007876">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 150, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="300" Y="104" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007877">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 300, OTL 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="2" StyleName="" X="10" Y="104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="104" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007878">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007879">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007880">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007881">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007882">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007883">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007884">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007885">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007886">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007887">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007888">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007889">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007890">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007891">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007892">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007893">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007894">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007895">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007896">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007897">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007898">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007899">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007900">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007901">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="188" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="188" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="188" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007902">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="207" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="207" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="207" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007903">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="226" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="226" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="226" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007904">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007905">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007906">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 0, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula B, N 300, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="247" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_007907">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007908">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="321" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="331" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="331" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="331" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007909">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="320" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 0" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="279" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="331" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="331" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="331" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007910">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007911">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007912">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007913">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007914">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="330" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007915">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007916">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007917">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007918">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007919">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007920">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007921">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007922">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007923">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007924">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007925">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="330" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007926">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007927">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007928">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007929">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007930">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007931">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007932">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007933">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007934">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007935">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007936">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="330" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007937">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007938">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007939">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007940">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007941">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007942">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007943">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007944">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007945">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007946">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007947">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007948">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007949">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007950">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007951">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007952">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007953">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007954">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007955">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
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
      <VC ID="INI400_007960">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007961">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007962">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007963">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007964">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007965">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007966">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007967">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007968">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007969">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007970">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
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
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007973">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007974">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007975">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007976">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
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
      <VC ID="INI400_007978">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007979">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007980">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007981">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007982">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007983">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007984">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007985">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007986">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007987">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="245" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="331" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="331" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="331" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007988">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007989">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="330" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007990">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007991">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007992">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007993">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007994">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007995">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007996">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007997">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="330" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007998">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007999">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008000">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008001">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008002">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008003">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008004">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008005">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008006">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008007">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008008">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="330" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008009">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008010">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008011">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008012">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008013">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008014">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008015">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008016">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008017">
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Underline, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008018">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="394" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|4|2" Font2="Tahoma|13|4|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008019">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="330" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008020">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="150" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008021">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="300" Y="330" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="449" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008022">
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Standard, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008023">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, OTL 0" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="12" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008024">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008025">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008026">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008027">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008028">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008029">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008030">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008031">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008032">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008033">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008034">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008035">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008036">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008037">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008038">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008039">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008040">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008041">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008042">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008043">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008044">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008045">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008046">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008047">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008048">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008049">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008050">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008051">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008052">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008053">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008054">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008055">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008056">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008057">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008058">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008059">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008060">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008061">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008062">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008063">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008064">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008065">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008066">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008067">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008068">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008069">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008070">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Standard, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008071">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008072">
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Headline, N 0, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008073">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula, N 10, F 5" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008074">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 200, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 10, F 5" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula BU, N 150, OTL 0" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images>
      <Image Name="PultN1" Content="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" />
      <Image Name="PultN2" Content="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" />
      <Image Name="PultV" Content="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" />
      <Image Name="SedloN" Content="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" />
      <Image Name="SedloV" Content="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" />
      <Image Name="BG" Content="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" />
    </Images>
  </Calculation>
  <Dialog>
    <Main Width="591">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
        <Texts>
          <ENU>General settings</ENU>
        </Texts>
        <TPanel Name="" ID="65" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="5|5|5|0" MinSize="0|0" MaxSize="0|0" BGImage="BG" BackColor="16777215" BorderStyle="0" Font="Segoe UI|11|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777088" Collapsed="False">
          <Texts TranslateID="DIALOG_000065">
            <ENU>Design settings</ENU>
          </Texts>
          <TGroupBox Name="CoeffDuoLower" ID="56" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000056">
              <ENU>External pressure coefficients</ENU>
            </Texts>
            <TPanel Name="" ID="60" Translate="1" AutoWidth="True" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777216" Collapsed="False">
              <Texts TranslateID="DIALOG_000060">
                <ENU>Last span</ENU>
              </Texts>
              <TSplitContainer Name="" ID="58" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="289" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
                <Panel1>
                  <TSplitContainer Name="" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="255" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
                    <Panel1>
                      <TLabel Name="" ID="44" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>H</ENU>
                        </Texts>
                      </TLabel>
                      <TLabel Name="" ID="43" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>G</ENU>
                        </Texts>
                      </TLabel>
                      <TLabel Name="" ID="40" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>F</ENU>
                        </Texts>
                      </TLabel>
                      <TLabel Name="" ID="37" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts TranslateID="DIALOG_000037">
                          <ENU>Region</ENU>
                        </Texts>
                      </TLabel>
                    </Panel1>
                    <Panel2>
                      <TDoubleInput Name="" ID="48" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,H,2←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                      <TDoubleInput Name="" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,G,2←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                      <TDoubleInput Name="" ID="41" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,F,2←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                      <TLabel Name="" ID="38" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="64" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>Cpe</ENU>
                        </Texts>
                      </TLabel>
                    </Panel2>
                  </TSplitContainer>
                </Panel1>
                <Panel2>
                  <TDoubleInput Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓H,2←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                  <TDoubleInput Name="" ID="45" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓G,2←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                  <TDoubleInput Name="" ID="42" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓F,2←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                  <TLabel Name="" ID="39" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="64" ForeColor="-16711423" BookMarkID="">
                    <Texts TranslateID="DIALOG_000039">
                      <ENU>Area [m2]</ENU>
                    </Texts>
                  </TLabel>
                </Panel2>
              </TSplitContainer>
            </TPanel>
            <TPanel Name="" ID="59" Translate="1" AutoWidth="True" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777216" Collapsed="False">
              <Texts TranslateID="DIALOG_000059">
                <ENU>Following spans</ENU>
              </Texts>
              <TSplitContainer Name="" ID="35" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="289" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
                <Panel1>
                  <TSplitContainer Name="" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="255" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
                    <Panel1>
                      <TLabel Name="" ID="51" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>J</ENU>
                        </Texts>
                      </TLabel>
                      <TLabel Name="" ID="50" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>I</ENU>
                        </Texts>
                      </TLabel>
                      <TLabel Name="" ID="44" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>H</ENU>
                        </Texts>
                      </TLabel>
                      <TLabel Name="" ID="43" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>G</ENU>
                        </Texts>
                      </TLabel>
                      <TLabel Name="" ID="40" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>F</ENU>
                        </Texts>
                      </TLabel>
                      <TLabel Name="" ID="37" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts TranslateID="DIALOG_000037">
                          <ENU>Region</ENU>
                        </Texts>
                      </TLabel>
                    </Panel1>
                    <Panel2>
                      <TDoubleInput Name="" ID="53" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,J←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                      <TDoubleInput Name="" ID="52" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,I←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                      <TDoubleInput Name="" ID="48" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,H←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                      <TDoubleInput Name="" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,G←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                      <TDoubleInput Name="" ID="41" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,F←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                      <TLabel Name="" ID="38" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="64" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>Cpe</ENU>
                        </Texts>
                      </TLabel>
                    </Panel2>
                  </TSplitContainer>
                </Panel1>
                <Panel2>
                  <TDoubleInput Name="" ID="55" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓J←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                  <TDoubleInput Name="" ID="54" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓I←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                  <TDoubleInput Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓H←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                  <TDoubleInput Name="" ID="45" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓G←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                  <TDoubleInput Name="" ID="42" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓F←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                  <TLabel Name="" ID="39" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="64" ForeColor="-16711423" BookMarkID="">
                    <Texts TranslateID="DIALOG_000039">
                      <ENU>Area [m2]</ENU>
                    </Texts>
                  </TLabel>
                </Panel2>
              </TSplitContainer>
            </TPanel>
            <TPanel Name="" ID="57" Translate="1" AutoWidth="True" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Collapsible="True" CaptionBGColor="-4531972" CaptionColor="-16777216" Collapsed="False">
              <Texts TranslateID="DIALOG_000057">
                <ENU>First span</ENU>
              </Texts>
              <TSplitContainer Name="" ID="58" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="289" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
                <Panel1>
                  <TSplitContainer Name="" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="255" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
                    <Panel1>
                      <TLabel Name="" ID="44" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>H</ENU>
                        </Texts>
                      </TLabel>
                      <TLabel Name="" ID="43" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>G</ENU>
                        </Texts>
                      </TLabel>
                      <TLabel Name="" ID="40" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>F</ENU>
                        </Texts>
                      </TLabel>
                      <TLabel Name="" ID="37" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                        <Texts TranslateID="DIALOG_000037">
                          <ENU>Region</ENU>
                        </Texts>
                      </TLabel>
                    </Panel1>
                    <Panel2>
                      <TDoubleInput Name="" ID="48" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,H,1←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                      <TDoubleInput Name="" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,G,1←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                      <TDoubleInput Name="" ID="41" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,F,1←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                      <TLabel Name="" ID="38" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="64" ForeColor="-16711423" BookMarkID="">
                        <Texts>
                          <ENU>Cpe</ENU>
                        </Texts>
                      </TLabel>
                    </Panel2>
                  </TSplitContainer>
                </Panel1>
                <Panel2>
                  <TDoubleInput Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓H,1←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                  <TDoubleInput Name="" ID="45" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓G,1←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                  <TDoubleInput Name="" ID="42" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓F,1←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                  <TLabel Name="" ID="39" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="64" ForeColor="-16711423" BookMarkID="">
                    <Texts TranslateID="DIALOG_000039">
                      <ENU>Area [m2]</ENU>
                    </Texts>
                  </TLabel>
                </Panel2>
              </TSplitContainer>
            </TPanel>
          </TGroupBox>
          <TGroupBox Name="CoeffMono" ID="33" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000033">
              <ENU>External pressure coefficients</ENU>
            </Texts>
            <TSplitContainer Name="" ID="35" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="301" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
              <Panel1>
                <TSplitContainer Name="" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="266" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
                  <Panel1>
                    <TLabel Name="" ID="44" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                      <Texts>
                        <ENU>H</ENU>
                      </Texts>
                    </TLabel>
                    <TLabel Name="" ID="43" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                      <Texts>
                        <ENU>G</ENU>
                      </Texts>
                    </TLabel>
                    <TLabel Name="" ID="40" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                      <Texts>
                        <ENU>F</ENU>
                      </Texts>
                    </TLabel>
                    <TLabel Name="" ID="37" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                      <Texts TranslateID="DIALOG_000037">
                        <ENU>Region</ENU>
                      </Texts>
                    </TLabel>
                  </Panel1>
                  <Panel2>
                    <TDoubleInput Name="" ID="48" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,H←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                    <TDoubleInput Name="" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,G←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                    <TDoubleInput Name="" ID="41" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,F←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                    <TLabel Name="" ID="38" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="64" ForeColor="-16711423" BookMarkID="">
                      <Texts>
                        <ENU>Cpe</ENU>
                      </Texts>
                    </TLabel>
                  </Panel2>
                </TSplitContainer>
              </Panel1>
              <Panel2>
                <TDoubleInput Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓H←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                <TDoubleInput Name="" ID="45" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓G←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                <TDoubleInput Name="" ID="42" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓F←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                <TLabel Name="" ID="39" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="64" ForeColor="-16711423" BookMarkID="">
                  <Texts TranslateID="DIALOG_000039">
                    <ENU>Area [m2]</ENU>
                  </Texts>
                </TLabel>
              </Panel2>
            </TSplitContainer>
          </TGroupBox>
          <TGroupBox Name="CoeffDuoHigher" ID="49" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000049">
              <ENU>External pressure coefficients</ENU>
            </Texts>
            <TSplitContainer Name="" ID="35" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="286" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
              <Panel1>
                <TSplitContainer Name="" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" SplitterDistance="252" Panel1Collapsed="False" Panel2Collapsed="False" Orientation="1">
                  <Panel1>
                    <TLabel Name="" ID="51" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                      <Texts>
                        <ENU>J</ENU>
                      </Texts>
                    </TLabel>
                    <TLabel Name="" ID="50" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                      <Texts>
                        <ENU>I</ENU>
                      </Texts>
                    </TLabel>
                    <TLabel Name="" ID="44" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                      <Texts>
                        <ENU>H</ENU>
                      </Texts>
                    </TLabel>
                    <TLabel Name="" ID="43" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                      <Texts>
                        <ENU>G</ENU>
                      </Texts>
                    </TLabel>
                    <TLabel Name="" ID="40" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|7|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                      <Texts>
                        <ENU>F</ENU>
                      </Texts>
                    </TLabel>
                    <TLabel Name="" ID="37" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="16" ForeColor="-16711423" BookMarkID="">
                      <Texts TranslateID="DIALOG_000037">
                        <ENU>Region</ENU>
                      </Texts>
                    </TLabel>
                  </Panel1>
                  <Panel2>
                    <TDoubleInput Name="" ID="53" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,J←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                    <TDoubleInput Name="" ID="52" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,I←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                    <TDoubleInput Name="" ID="48" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,H←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                    <TDoubleInput Name="" ID="47" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,G←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                    <TDoubleInput Name="" ID="41" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="C↓pe,F←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                    <TLabel Name="" ID="38" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="64" ForeColor="-16711423" BookMarkID="">
                      <Texts>
                        <ENU>Cpe</ENU>
                      </Texts>
                    </TLabel>
                  </Panel2>
                </TSplitContainer>
              </Panel1>
              <Panel2>
                <TDoubleInput Name="" ID="55" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓J←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                <TDoubleInput Name="" ID="54" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓I←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                <TDoubleInput Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓H←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                <TDoubleInput Name="" ID="45" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓G←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                <TDoubleInput Name="" ID="42" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="A↓F←" VarNameVisible="False" UnitsVisible="False" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
                <TLabel Name="" ID="39" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" Alignment="64" ForeColor="-16711423" BookMarkID="">
                  <Texts TranslateID="DIALOG_000039">
                    <ENU>Area [m2]</ENU>
                  </Texts>
                </TLabel>
              </Panel2>
            </TSplitContainer>
          </TGroupBox>
          <TGroupBox Name="" ID="30" Translate="1" AutoWidth="True" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000030">
              <ENU>Wind parameters</ENU>
            </Texts>
            <TDoubleInput Name="" ID="32" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="c↓s←c↓d←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
            <TDoubleInput Name="" ID="31" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="q↓p←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          </TGroupBox>
          <TGroupBox Name="RoofParameters" ID="64" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000064">
              <ENU>Parameters of the roof</ENU>
            </Texts>
            <TDoubleInput Name="" ID="61" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="b" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
            <TDoubleInput Name="" ID="62" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="d" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          </TGroupBox>
          <TGroupBox Name="" ID="69" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
            <Texts TranslateID="DIALOG_000069">
              <ENU>Calculation settings</ENU>
            </Texts>
            <TCheckBox Name="" ID="63" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Horizontal" BookMarkID="" ForeColor="-16711423" ChbRight="False">
              <Texts TranslateID="DIALOG_000063">
                <ENU>
                </ENU>
              </Texts>
            </TCheckBox>
            <TComboBox Name="TComboBox" ID="4" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="WindDir" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="190" Values="0|1" Index="0">
              <Texts TranslateID="DIALOG_000004">
                <ENU>Wind from higher edge|Wind from lower edge</ENU>
              </Texts>
            </TComboBox>
            <TComboBox Name="TComboBox" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Type" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="190" Values="0|1" Index="0">
              <Texts TranslateID="DIALOG_000002">
                <ENU>Monopitch|Duopitch</ENU>
              </Texts>
            </TComboBox>
          </TGroupBox>
        </TPanel>
        <TGroupBox Name="" ID="67" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000067">
            <ENU>Headline settings</ENU>
          </Texts>
          <TStringInput Name="TStringInput" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Caption" VarNameVisible="False" DescPos="1" InputColor="-4128832" InputWidth="125" />
          <TCheckBox Name="TCheckBox" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="PrintCaption" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000002">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="TCheckBox" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|0|3" VarName="Headline" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000014">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="29" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Segoe UI|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000029">
            <ENU>National Annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="267|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Austrian ÖNORM-EN">
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
                  <P>Austrian ÖNORM-EN</P>
                  <P>ONORM</P>
                  <P>1</P>
                  <P>ÖNORM EN 1990</P>
                  <P>ÖNORM EN 1991-1-1</P>
                  <P>ÖNORM EN 1991-1-2</P>
                  <P>ÖNORM EN 1991-1-3</P>
                  <P>0</P>
                  <P>NaN</P>
                  <P>False;1;</P>
                  <P>NaN</P>
                  <P>1.0</P>
                  <P>1.0</P>
                  <P>NaN</P>
                  <P>False</P>
                  <P>1.6</P>
                  <P>1.8</P>
                  <P>NaN</P>
                  <P>0.8;2;5;15;</P>
                  <P>False</P>
                  <P>False</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>ÖNORM EN 1991-1-4</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1</P>
                  <P>1</P>
                  <P>0.2;0.5;</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>True;1;</P>
                  <P>True</P>
                  <P>False</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1.25</P>
                  <P>False</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>ÖNORM EN 1991-1-5</P>
                  <P>ÖNORM EN 1991-1-6</P>
                  <P>ÖNORM EN 1991-1-7</P>
                  <P>ÖNORM EN 1991-2</P>
                  <P>ÖNORM EN 1991-3</P>
                  <P>ÖNORM EN 1991-4</P>
                  <P>ÖNORM EN 1992-1-1</P>
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
                  <P>10;10;10;</P>
                  <P>40;75;5;</P>
                  <P>0.005</P>
                  <P>0.44;NaN;0.54;NaN;0.7;0.8;</P>
                  <P>NaN</P>
                  <P>1.2</P>
                  <P>0.8;0.9;</P>
                  <P>0.92</P>
                  <P>50;30;</P>
                  <P>0.7</P>
                  <P>0.7;0.8;</P>
                  <P>1;1;1.05;0.95;1;1;</P>
                  <P>NaN;NaN;0.15;</P>
                  <P>NaN</P>
                  <P>NaN;0.785398;</P>
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
                  <P>NaN;NaN;</P>
                  <P>1.4;NaN;</P>
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
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>12</P>
                  <P>NaN</P>
                  <P>12</P>
                  <P>10</P>
                  <P>5;8;</P>
                  <P>600;NaN;</P>
                  <P>0.8;0.8;</P>
                  <P>1.5</P>
                  <P>0.25</P>
                  <P>0.5</P>
                  <P>ÖNORM EN 1992-1-2</P>
                  <P>ÖNORM EN 1992-2</P>
                  <P>ÖNORM EN 1992-3</P>
                  <P>ÖNORM EN 1993-1-1</P>
                  <P>NaN;NaN;</P>
                  <P>1;1;1.25;</P>
                  <P>ÖNORM EN 1993-1-2</P>
                  <P>ÖNORM EN 1993-1-3</P>
                  <P>ÖNORM EN 1993-1-4</P>
                  <P>ÖNORM EN 1993-1-5</P>
                  <P>1.20;1.00;</P>
                  <P>ÖNORM EN 1993-1-6</P>
                  <P>ÖNORM EN 1993-1-7</P>
                  <P>ÖNORM EN 1993-1-8</P>
                  <P>1.25;1.25;1.1;1.0;1.0;1.0;1.1;</P>
                  <P>ÖNORM EN 1993-1-9</P>
                  <P>ÖNORM EN 1993-1-10</P>
                  <P>ÖNORM EN 1993-1-11</P>
                  <P>ÖNORM EN 1993-1-12</P>
                  <P>ÖNORM EN 1993-2</P>
                  <P>1.0;1.1;1.25;1.25;1.1;1.1;1.1;1.0;1.1;</P>
                  <P>ÖNORM EN 1993-3-1</P>
                  <P>ÖNORM EN 1993-3-2</P>
                  <P>ÖNORM EN 1993-4-1</P>
                  <P>ÖNORM EN 1993-4-2</P>
                  <P>ÖNORM EN 1993-4-3</P>
                  <P>ÖNORM EN 1993-5</P>
                  <P>ÖNORM EN 1993-6</P>
                  <P>ÖNORM EN 1994-1-1</P>
                  <P>1;1;</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>0.000325;0.000500;0.000200;0.000300;</P>
                  <P>0.70</P>
                  <P>NaN</P>
                  <P>1.25;1.5;</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1.0</P>
                  <P>1.0</P>
                  <P>0.6</P>
                  <P>180</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>NaN</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>ÖNORM EN 1994-1-2</P>
                  <P>ÖNORM EN 1994-2</P>
                  <P>ÖNORM EN 1995-1-1</P>
                  <P>NaN</P>
                  <P>NaN;NaN;NaN;</P>
                  <P>ÖNORM EN 1995-1-2</P>
                  <P>ÖNORM EN 1995-2</P>
                  <P>ÖNORM EN 1996-1-1</P>
                  <P>NaN</P>
                  <P>1</P>
                  <P>NaN</P>
                  <P>True</P>
                  <P>1000</P>
                  <P>NaN;NaN;NaN;</P>
                  <P>NaN</P>
                  <P>ÖNORM EN 1996-1-2</P>
                  <P>ÖNORM EN 1996-2</P>
                  <P>ÖNORM EN 1996-3</P>
                  <P>ÖNORM EN 1997-1</P>
                  <P>1.1;0.9;1.5;0;</P>
                  <P>1.25;1.25;1.4;1.4;1.0;</P>
                  <P>1.35;1;1.5;0;1;1;1.3;0;</P>
                  <P>1;1;1;1;1;1.25;1.25;1.4;1.4;1;</P>
                  <P>1;1;1.4;1.1;1;1;</P>
                  <P>ÖNORM EN 1997-2</P>
                  <P>ÖNORM EN 1998-1</P>
                  <P>ÖNORM EN 1998-2</P>
                  <P>ÖNORM EN 1998-3</P>
                  <P>ÖNORM EN 1998-4</P>
                  <P>ÖNORM EN 1998-5</P>
                  <P>ÖNORM EN 1998-6</P>
                  <P>ÖNORM EN 1999-1-1</P>
                  <P>ÖNORM EN 1999-1-2</P>
                  <P>ÖNORM EN 1999-1-3</P>
                  <P>ÖNORM EN 1999-1-4</P>
                  <P>ÖNORM EN 1999-1-5</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
        </TGroupBox>
      </TPanel>
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="BLOCK_INI400_007679">
      <ENU>"Wind parameters"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007687">
      <ENU>"External pressure coefficients for monopitch roofs"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007720">
      <ENU>"Reduction coefficients"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007735">
      <ENU>"Wind load values in each spans"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007790">
      <ENU>"External pressure coefficients for duopitch roofs"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007900">
      <ENU>"Reduction coefficients"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007911">
      <ENU>"Wind load values in each spans"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_008072">
      <ENU>"Minimal horizontal force acting on each multispan span"</ENU>
    </Item>
    <Item TranslateID="STRING_0A15C7DE">
      <ENU>"Span"</ENU>
    </Item>
    <Item TranslateID="STRING_266C923F">
      <ENU>"Last"</ENU>
    </Item>
    <Item TranslateID="STRING_3BC63984">
      <ENU>"Second"</ENU>
    </Item>
    <Item TranslateID="STRING_4D7C1667">
      <ENU>"Coefficient [-]"</ENU>
    </Item>
    <Item TranslateID="STRING_575633D9">
      <ENU>"First"</ENU>
    </Item>
    <Item TranslateID="STRING_65C615B8">
      <ENU>"Area [m↑2←]"</ENU>
    </Item>
    <Item TranslateID="STRING_8B4F9451">
      <ENU>"Coefficient [-]"</ENU>
    </Item>
    <Item TranslateID="STRING_91D0061B">
      <ENU>"First"</ENU>
    </Item>
    <Item TranslateID="STRING_A17A60D8">
      <ENU>"Third and more"</ENU>
    </Item>
    <Item TranslateID="STRING_AF28AE25">
      <ENU>"Last"</ENU>
    </Item>
    <Item TranslateID="STRING_BC94C982">
      <ENU>"Region"</ENU>
    </Item>
    <Item TranslateID="STRING_BE865F6C">
      <ENU>"Span"</ENU>
    </Item>
    <Item TranslateID="STRING_CC3317B2">
      <ENU>"Area [m↑2←]"</ENU>
    </Item>
    <Item TranslateID="STRING_EE2CA8B6">
      <ENU>"Second"</ENU>
    </Item>
    <Item TranslateID="STRING_F1253588">
      <ENU>"All others"</ENU>
    </Item>
    <Item TranslateID="STRING_F55AA040">
      <ENU>"Third and more"</ENU>
    </Item>
    <Item TranslateID="STRING_F776963A">
      <ENU>"All others"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007674">
      <ENU>"Wind load on the multispan roofs according to Eurocode 1"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007675">
      <ENU>IO.SetupNA.EC_1991_1_4.Name</ENU>
    </Item>
    <Item ID="TEXT_INI400_007676">
      <ENU>Caption</ENU>
    </Item>
    <Item ID="TEXT_INI400_007680">
      <ENU>Description("q↓p←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_007681">
      <ENU>"q↓p← = " &amp; q↓p← &amp; " Pa"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007683">
      <ENU>Description("c↓s←c↓d←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_007684">
      <ENU>"c↓s←c↓d← = " &amp; c↓s←c↓d←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007688">
      <ENU>"The coefficients and areas for each roof region are gained from monopitch calculation"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007689">
      <ENU>"In F area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007690">
      <ENU>"C↓pe,F← = " &amp; C↓pe,F←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007691">
      <ENU>"A↓F← = " &amp; A↓F← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007692">
      <ENU>"In G area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007693">
      <ENU>"C↓pe,G← = " &amp; C↓pe,G←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007694">
      <ENU>"A↓G← = " &amp; A↓G← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007695">
      <ENU>"In H area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007696">
      <ENU>"C↓pe,H← = " &amp; C↓pe,H←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007697">
      <ENU>"A↓H← = " &amp; A↓H← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007736">
      <ENU>"Wind load on first span"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007737">
      <ENU>"Wind load in areas"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007741">
      <ENU>"Total wind force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007743">
      <ENU>"Wind load on second span"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007745">
      <ENU>"Wind load in areas"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007749">
      <ENU>"Total wind force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007752">
      <ENU>"Wind load on third and more spans"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007753">
      <ENU>"Wind load in areas"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007757">
      <ENU>"Total wind force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007791">
      <ENU>"The coefficients and areas for first span are gained from monopitch calculation,&lt;BR&gt;second and all following are gained from duopitch calculation with α &lt; 0 °.&lt;BR&gt;Coefficients and areas for last span are gained from monopitch calculation."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007792">
      <ENU>"First span"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007793">
      <ENU>"In F area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007794">
      <ENU>"C↓pe,F,1← = " &amp; C↓pe,F,1←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007795">
      <ENU>"A↓F,1← = " &amp; A↓F,1← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007796">
      <ENU>"In G area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007797">
      <ENU>"C↓pe,G,1← = " &amp; C↓pe,G,1←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007798">
      <ENU>"A↓G,1← = " &amp; A↓G,1← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007799">
      <ENU>"In H area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007800">
      <ENU>"C↓pe,H,1← = " &amp; C↓pe,H,1←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007801">
      <ENU>"A↓H,1← = " &amp; A↓H,1← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007824">
      <ENU>"Following spans"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007825">
      <ENU>"In F area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007826">
      <ENU>"C↓pe,F← = " &amp; C↓pe,F←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007827">
      <ENU>"A↓F← = " &amp; A↓F← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007828">
      <ENU>"In G area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007829">
      <ENU>"C↓pe,G← = " &amp; C↓pe,G←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007830">
      <ENU>"A↓G← = " &amp; A↓G← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007831">
      <ENU>"In H area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007832">
      <ENU>"C↓pe,H← = " &amp; C↓pe,H←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007833">
      <ENU>"A↓H← = " &amp; A↓H← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007834">
      <ENU>"In I area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007835">
      <ENU>"C↓pe,I← = " &amp; C↓pe,I←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007836">
      <ENU>"A↓I← = " &amp; A↓I← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007837">
      <ENU>"In J area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007838">
      <ENU>"C↓pe,J← = " &amp; C↓pe,J←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007839">
      <ENU>"A↓J← = " &amp; A↓J← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007868">
      <ENU>"Last span"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007869">
      <ENU>"In F area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007870">
      <ENU>"C↓pe,F,2← = " &amp; C↓pe,F,2←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007871">
      <ENU>"A↓F,2← = " &amp; A↓F,2← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007872">
      <ENU>"In G area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007873">
      <ENU>"C↓pe,G,2← = " &amp; C↓pe,G,2←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007874">
      <ENU>"A↓G,2← = " &amp; A↓G,2← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007875">
      <ENU>"In H area"</ENU>
    </Item>
    <Item ID="TEXT_INI400_007876">
      <ENU>"C↓pe,H,2← = " &amp; C↓pe,H,2←</ENU>
    </Item>
    <Item ID="TEXT_INI400_007877">
      <ENU>"A↓H,2← = " &amp; A↓H,2← &amp; " m↑2←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007912">
      <ENU>"Wind load on first span"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007913">
      <ENU>"Wind load in areas"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007919">
      <ENU>"Total wind force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007923">
      <ENU>"Wind load on second span"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007924">
      <ENU>"Wind load in areas"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007930">
      <ENU>"Total wind force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007934">
      <ENU>"Wind load on third and following spans"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007935">
      <ENU>"Wind load in areas"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007941">
      <ENU>"Total wind force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007987">
      <ENU>"Wind load on first span"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007988">
      <ENU>"Wind load in areas"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007992">
      <ENU>"Total wind force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007995">
      <ENU>"Wind load on second span"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_007996">
      <ENU>"Wind load in areas"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008002">
      <ENU>"Total wind force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008006">
      <ENU>"Wind load on third and following spans"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008007">
      <ENU>"Wind load in areas"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008013">
      <ENU>"Total wind force"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008017">
      <ENU>"Wind load on last span"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008018">
      <ENU>"Wind load in areas"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008022">
      <ENU>"Total wind force"</ENU>
    </Item>
  </Texts>
</Root>