<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="61000" GUID="0d5ac442-ddaa-4b48-9871-8d85a6e4d073">
  <CodeEditor>
    <SourceCode Collapsed="428|431|434|437|443|451|1325|1368" BreakPoints="">object G_PASS →000780= new Graphics(); →000781G_PASS.DrawText("PASS", new Font("Tahoma", 10, FontStyle.Bold), 0, 0, ContentAlignment.MiddleLeft, Color.Green); 
object G_FAIL →000782= new Graphics(); →000783G_FAIL.DrawText("FAIL", new Font("Tahoma", 10, FontStyle.Bold), 0, 0, ContentAlignment.MiddleLeft, Color.Red); 
object G_CHECK →010737= new Graphics(); →010738G_CHECK.DrawText("R", new Font("Wingdings 2", 14, FontStyle.Bold), 0, 0, ContentAlignment.MiddleLeft, Color.Green); 
object G_X →010739= new Graphics(); →010740G_X.DrawText("T", new Font("Wingdings 2", 14, FontStyle.Bold), 0, 0, ContentAlignment.MiddleLeft, Color.Red); 
object G_NA →011420= new Graphics(); →011421G_NA.DrawText("N/A", new Font("Tahoma", 10, FontStyle.Bold), 0, 0, ContentAlignment.MiddleLeft, Color.Green); 
→004454TEXT("Simple Shear Connection - Shear Tab (WF Beam to HSS Column)"); 

//Bolt Switch
SWITCH(Bolt) { 
    CASE 0 :  { //A325N
        BoltType →005777= "A325N"; 
        F↓nv← →005778= PhysConst(54, "ksi"); 
    } 
    CASE 1 :  { //A325X
        BoltType →005779= "A325X"; 
        F↓nv← →005780= PhysConst(68, "ksi"); 
    } 
    CASE 2 :  { //A325SC
        BoltType →005785= "A325SC"; 
        //F↓nv← calculated from values in Table 7-3
        //Group A Bolts                    
        IF(HoleTyp == "STD" || HoleTyp == "SSLT") { 
            ϕ →005873= 1.0; 
            IF(d↓b← == PhysConst(0.625, "in")) { 
                F↓nv← →005874= PhysConst(6.44, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.75, "in")) { 
                F↓nv← →005875= PhysConst(9.49, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.875, "in")) { 
                F↓nv← →005876= PhysConst(13.2, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1, "in")) { 
                F↓nv← →005877= PhysConst(17.3, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.125, "in")) { 
                F↓nv← →005878= PhysConst(19, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.25, "in")) { 
                F↓nv← →005879= PhysConst(24.1, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.375, "in")) { 
                F↓nv← →005880= PhysConst(28.8, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.5, "in")) { 
                F↓nv← →005881= PhysConst(34.9, "kip")/ϕ/A↓b←; 
            } 
        } 
        IF(HoleTyp == "SSLP") { 
            ϕ →005882= 0.85; 
            IF(d↓b← == PhysConst(0.625, "in")) { 
                F↓nv← →005883= PhysConst(5.47, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.75, "in")) { 
                F↓nv← →005884= PhysConst(8.07, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.875, "in")) { 
                F↓nv← →005885= PhysConst(11.2, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1, "in")) { 
                F↓nv← →005886= PhysConst(14.7, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.125, "in")) { 
                F↓nv← →005887= PhysConst(16.1, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.25, "in")) { 
                F↓nv← →005888= PhysConst(20.5, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.375, "in")) { 
                F↓nv← →005889= PhysConst(24.5, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.5, "in")) { 
                F↓nv← →005890= PhysConst(29.7, "kip")/ϕ/A↓b←; 
            } 
        } 
        IF(HoleTyp == "LSLT" || HoleTyp == "LSLP") { 
            ϕ →005891= 0.7; 
            IF(d↓b← == PhysConst(0.625, "in")) { 
                F↓nv← →005892= PhysConst(4.51, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.75, "in")) { 
                F↓nv← →005893= PhysConst(6.64, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.875, "in")) { 
                F↓nv← →005894= PhysConst(9.25, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1, "in")) { 
                F↓nv← →005895= PhysConst(12.1, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.125, "in")) { 
                F↓nv← →005896= PhysConst(13.3, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.25, "in")) { 
                F↓nv← →005897= PhysConst(16.8, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.375, "in")) { 
                F↓nv← →005898= PhysConst(20.2, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.5, "in")) { 
                F↓nv← →005899= PhysConst(24.4, "kip")/ϕ/A↓b←; 
            } 
        } 
    } 
    CASE 3 :  { //A490N
        BoltType →005781= "A490N"; 
        F↓nv← →005782= PhysConst(68, "ksi"); 
    } 
    CASE 4 :  { //A490X
        BoltType →005783= "A490X"; 
        F↓nv← →005784= PhysConst(84, "ksi"); 
    } 
    CASE 5 :  { //A490SC
        BoltType →005786= "A490SC"; 
        //F↓nv← calculated from values in Table 7-3 (continued)
        //Group B Bolts                    
        IF(HoleTyp == "STD" || HoleTyp == "SSLT") { 
            ϕ →005846= 1.0; 
            IF(d↓b← == PhysConst(0.625, "in")) { 
                F↓nv← →005847= PhysConst(8.14, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.75, "in")) { 
                F↓nv← →005848= PhysConst(11.9, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.875, "in")) { 
                F↓nv← →005849= PhysConst(16.6, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1, "in")) { 
                F↓nv← →005850= PhysConst(21.7, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.125, "in")) { 
                F↓nv← →005851= PhysConst(27.1, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.25, "in")) { 
                F↓nv← →005852= PhysConst(34.6, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.375, "in")) { 
                F↓nv← →005853= PhysConst(41, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.5, "in")) { 
                F↓nv← →005854= PhysConst(50.2, "kip")/ϕ/A↓b←; 
            } 
            
        } 
        IF(HoleTyp == "SSLP") { 
            ϕ →005855= 0.85; 
            IF(d↓b← == PhysConst(0.625, "in")) { 
                F↓nv← →005856= PhysConst(6.92, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.75, "in")) { 
                F↓nv← →005857= PhysConst(10.1, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.875, "in")) { 
                F↓nv← →005858= PhysConst(14.1, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1, "in")) { 
                F↓nv← →005859= PhysConst(18.4, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.125, "in")) { 
                F↓nv← →005860= PhysConst(23.1, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.25, "in")) { 
                F↓nv← →005861= PhysConst(29.4, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.375, "in")) { 
                F↓nv← →005862= PhysConst(34.9, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.5, "in")) { 
                F↓nv← →005863= PhysConst(42.6, "kip")/ϕ/A↓b←; 
            } 
        } 
        IF(HoleTyp == "LSLT" || HoleTyp == "LSLP") { 
            ϕ →005864= 0.7; 
            IF(d↓b← == PhysConst(0.625, "in")) { 
                F↓nv← →005865= PhysConst(5.7, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.75, "in")) { 
                F↓nv← →005866= PhysConst(8.31, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(0.875, "in")) { 
                F↓nv← →005867= PhysConst(11.6, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1, "in")) { 
                F↓nv← →005868= PhysConst(15.2, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.125, "in")) { 
                F↓nv← →005869= PhysConst(19, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.25, "in")) { 
                F↓nv← →005870= PhysConst(24.2, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.375, "in")) { 
                F↓nv← →005871= PhysConst(28.7, "kip")/ϕ/A↓b←; 
            } 
            IF(d↓b← == PhysConst(1.5, "in")) { 
                F↓nv← →005872= PhysConst(35.1, "kip")/ϕ/A↓b←; 
            } 
        } 
    } 
} 
LimitExc →004258= 0; 
DimLim →005727= 0; 

→010102TEXT("Input Information"); 
→000787BLOCK { 
    →010103TEXT("HSS Column Details"); 
    →012001TEXT("_____________________________________________________________"); 
    →000958BLOCK { 
        →000786TEXT("Member Properties"); 
        →000800TEXT("CSS"); 
        →004770TEXT("="); 
        →004771TEXT(IO.Column.Item); 
        →000803TEXT("Specified Cross Section"); 
        
        
        IF(OD &gt; 0) { //Section Description and Dimensions
            
            of →010099= OD; 
            cf →010100= OD; 
            
            →000929TEXT("OD"); 
            →004773TEXT("="); 
            →004774TEXT(OD); 
            →000945TEXT("Outside Diameter"); 
            →012020TEXT("t↓HSS←"); 
            →012021TEXT("="); 
            →012022TEXT(t↓HSS←); 
            →012023TEXT("HSS Wall Thickness"); 
        } 
        ELSE { 
            IF(b↓c← == h↓c←) { 
                
                cf →004647= b↓c←; 
                of →004648= h↓c←; 
            } 
            ELSE { 
                
                
                IF(ConnFace == "N/A") { 
                    →004449TEXT("Error - Specify the Connection Face"); } 
                IF(ConnFace == "Narrow") { 
                    cf →004649= MIN(b↓c←, h↓c←); 
                    of →004650= MAX(b↓c←, h↓c←); 
                } 
                IF(ConnFace == "Wide") { 
                    of →004652= MIN(b↓c←, h↓c←); 
                    cf →004653= MAX(b↓c←, h↓c←); 
                } 
            } 
            →004792TEXT("Connection Width"); 
            →004793TEXT("="); 
            →004794TEXT(cf); 
            →004795TEXT("b↓c←"); 
            →004796TEXT("="); 
            →004797TEXT(b↓c←); 
            →004798TEXT("Overall Width"); 
            →004799TEXT("h↓c←"); 
            →004800TEXT("="); 
            →004801TEXT(h↓c←); 
            →004802TEXT("Overall Height"); 
            →012009TEXT("t↓HSS←"); 
            →012010TEXT("="); 
            →012011TEXT(t↓HSS←); 
            →012012TEXT("HSS Wall Thickness"); 
            
            
            
        } 
    } 
    
    →000789BLOCK { 
        →000788TEXT("Material"); 
        →000798TEXT("Mat."); 
        →000799TEXT("="); 
        →000874TEXT(IO.ColumnMat.Item); 
        →000791TEXT("Column Material"); 
        →000792TEXT("F↓yc←"); 
        →000793TEXT("="); 
        →000875TEXT(F↓yc←); 
        →000794TEXT("Minimum Yield Stress"); 
        →000795TEXT("F↓uc←"); 
        →000796TEXT("="); 
        →000876TEXT(F↓uc←); 
        →000797TEXT("Minimum Tensile Stress"); 
    } 
} 
→000812BLOCK { 
    →010104TEXT("Wide Flange Beam Details"); 
    →010106TEXT("_____________________________________________________________"); 
    →000954BLOCK { 
        →000953TEXT("Member Properties"); 
        →000809TEXT("CSS"); 
        →000810TEXT("="); 
        →000877TEXT(IO.Beam.Item); 
        →000811TEXT("Specified Cross Section"); 
        →000813TEXT("d↓beam←"); 
        →000814TEXT("="); 
        →000880TEXT(d↓beam←); 
        →000815TEXT("Beam Depth"); 
        →000819TEXT("t↓w←"); 
        →000820TEXT("="); 
        →000881TEXT(t↓w←); 
        →000821TEXT("Web Thickness"); 
        →000816TEXT("b↓f←"); 
        →000817TEXT("="); 
        →000882TEXT(b↓f←); 
        →000818TEXT("Flange Width"); 
        →000825TEXT("t↓f←"); 
        →000826TEXT("="); 
        →000883TEXT(t↓f←); 
        →000827TEXT("Flange Thickness"); 
    } 
    →000829BLOCK { 
        →000830TEXT("Material"); 
        →000831TEXT("Mat."); 
        →000832TEXT("="); 
        →000885TEXT(IO.BeamMat.Item); 
        →000833TEXT("Beam Material"); 
        →000834TEXT("F↓yb←"); 
        →000835TEXT("="); 
        →000886TEXT(F↓yb←); 
        →000836TEXT("Minimum Yield Stress"); 
        →000837TEXT("F↓ub←"); 
        →000838TEXT("="); 
        →000887TEXT(F↓ub←); 
        →000839TEXT("Minimum Tensile Stress"); 
    } 
} 
→000872BLOCK { 
    →010108TEXT("Plate Details"); 
    →010107TEXT("_____________________________________________________________"); 
    →000957BLOCK { 
        →000866TEXT("Member Properties"); 
        double Edge↓h,min← →012552= PhysConst(1.5, "in"); 
        double Edge↓v,min← →012553= PhysConst(1.25, "in"); 
        b↓p← →000997= (Gap+([n↓c←-1]*s↓h←)+(2*MAX(Edge↓h,min←, Edge↓h←))); 
        h↓p← →000999= (n↓v←-1)*s↓v←+2*MAX(Edge↓v,min←, Edge↓v←); 
        →000868TEXT("b↓p←"); 
        →000852TEXT("="); 
        →000993TEXT(b↓p←); 
        →000869TEXT("Width"); 
        →000889TEXT("h↓p←"); 
        →000888TEXT("="); 
        →000994TEXT(h↓p←); 
        →001001TEXT("Depth"); 
        →000870TEXT("t↓p←"); 
        →000853TEXT("="); 
        →000995TEXT(t↓p←); 
        →000871TEXT("Thickness"); 
        →000913TEXT("Gap"); 
        →000912TEXT("="); 
        →000996TEXT(Gap); 
        →004285TEXT("Beam Set Back"); } 
    →000854BLOCK { 
        →000855TEXT("Material"); 
        →000856TEXT("Mat."); 
        →000857TEXT("="); 
        →000952TEXT(IO.Plate.Item); 
        →000858TEXT("Plate Material"); 
        →000859TEXT("F↓yp←"); 
        →000860TEXT("="); 
        →000955TEXT(F↓yp←); 
        →000861TEXT("Minimum Yield Stress"); 
        →000862TEXT("F↓up←"); 
        →000863TEXT("="); 
        →000956TEXT(F↓up←); 
        →000864TEXT("Minimum Tensile Stress"); } 
} 
→000894BLOCK { 
    →010110TEXT("Connection Details"); 
    →010109TEXT("_____________________________________________________________"); 
    →012507TEXT("__________________________"); //brief
    →004430BLOCK { 
        →004429TEXT("Plate to Beam - Bolted Connection"); 
        →000895TEXT("Bolt Type"); 
        →000896TEXT("="); 
        →000897TEXT(BoltType); 
        →005716TEXT("F↓nv←"); 
        →005717TEXT("="); 
        →005718TEXT(F↓nv←); 
        →005719TEXT("Nominal Shear Strength of Bolts"); 
        →000900TEXT("d↓b←"); 
        →000905TEXT("="); 
        →000926TEXT(d↓b←); 
        →000923TEXT("Bolt Diameter"); 
        A↓b← →005715= π*(d↓b←/2)↑2←; 
        →000924TEXT("A↓b←"); 
        →000922TEXT("="); 
        →000927TEXT(A↓b←); 
        →000925TEXT("Bolt Area"); 
        →004455TEXT("n"); 
        →004456TEXT("="); 
        n →004457= n↓c←*n↓v←; 
        →004458TEXT(n); 
        →000907TEXT("Total # of Bolts"); 
        →004459TEXT("n↓c←"); 
        →000901TEXT("="); 
        →000960TEXT(n↓c←); 
        →000903TEXT("# of Bolt Columns"); 
        →000904TEXT("n↓v←"); 
        →000902TEXT("="); 
        →000961TEXT(n↓v←); 
        →004460TEXT("Bolts per Column"); 
        →000910TEXT("s↓h←"); 
        →000908TEXT("="); 
        →000966TEXT(s↓h←); 
        →004461TEXT("Spacing between Columns"); 
        →000911TEXT("s↓v←"); 
        →000909TEXT("="); 
        →000967TEXT(s↓v←); 
        →004462TEXT("Spacing within Column"); 
        
        IF(d↓b← &lt; 1.125) { 
            s↓e← →005720= d↓b←+PhysConst(0.25, "in"); 
        } 
        IF(d↓b← &gt;= 1.125 &amp;&amp; d↓b← &lt;= 1.25) { 
            s↓e← →005721= d↓b←+PhysConst(0.375, "in"); 
        } 
        IF(d↓b← &gt; 1.25) { 
            s↓e← →005722= 1.25*d↓b←; 
        } 
        →000898TEXT("Hole Type:"); 
        →000959TEXT(HoleTyp); 
        IF(HoleTyp != "STD") { 
            //Check If Error Message needed
            →005900TEXT("*Verify compatibility*"); 
        } 
        //Determination of Hole Dimensions and Edge Distances
        //Short Slot Length
        IF(d↓b← == PhysConst(0.5, "in")) { 
            SS↓L← →005919= PhysConst(0.1875, "in")+d↓b←; 
        } 
        IF(d↓b← &gt; PhysConst(0.5, "in") &amp;&amp; d↓b← &lt; PhysConst(1, "in")) { 
            SS↓L← →005920= PhysConst(0.25, "in")+d↓b←; 
        } 
        IF(d↓b← == PhysConst(1, "in")) { 
            SS↓L← →005921= PhysConst(0.3125, "in")+d↓b←; 
        } 
        IF(d↓b← &gt; PhysConst(1, "in")) { 
            SS↓L← →005922= PhysConst(0.375, "in")+d↓b←; 
        } 
        //Long Slot Length
        LS↓L← →005923= d↓b←*2.5; 
        //C↓2← Edge Distance Increment
        IF(HoleTyp == "SSLT" || HoleTyp == "SSLP") { 
            IF(d↓b← &lt;= PhysConst(1, "in")) { 
                C↓2← →005926= PhysConst(0.125, "in"); 
            } 
            IF(d↓b← &gt;= PhysConst(1, "in")) { 
                C↓2← →005927= PhysConst(0.1875, "in"); 
            } 
        } 
        IF(HoleTyp == "LSLT" || HoleTyp == "LSLP") { 
            C↓2← →005928= 0.75*d↓b←; 
        } 
        
        IF(HoleTyp == "STD") { 
            //Horizontal Dim 
            Hole↓h← →000974= d↓b←+PhysConst(0.0625, "in"); 
            Edge↓h← →000976= MAX(s↓e←, Edge↓h,min←); 
            //Vertical Dim
            Hole↓v← →000973= d↓b←+PhysConst(0.0625, "in"); 
            Edge↓v← →000975= MAX(s↓e←, Edge↓v,min←); 
        } 
        IF(HoleTyp == "SSLT") { 
            //Horizontal Dim 
            Hole↓h← →000977= d↓b←+PhysConst(0.0625, "in"); 
            Edge↓h← →000978= s↓e←; 
            Edge↓h← →012594= MAX(s↓e←, Edge↓h,min←); 
            //Vertical Dim
            Hole↓v← →000979= SS↓L←; 
            Edge↓v← →000980= s↓e←+C↓2←; 
            Edge↓v← →012597= MAX(s↓e←+C↓2←, Edge↓v,min←); 
        } 
        IF(HoleTyp == "SSLP") { 
            //Horizontal Dim 
            Hole↓h← →000989= SS↓L←; 
            Edge↓h← →000990= s↓e←+C↓2←; 
            Edge↓h← →012595= MAX(s↓e←+C↓2←, Edge↓h,min←); 
            //Vertical Dim
            Hole↓v← →000991= d↓b←+PhysConst(0.0625, "in"); 
            Edge↓v← →000992= s↓e←; 
            Edge↓v← →012598= MAX(s↓e←, Edge↓v,min←); 
        } 
        IF(HoleTyp == "LSLT") { 
            →012629TEXT("Slots perpendicular to beam centerline"); 
            //Horizontal Dim 
            Hole↓h← →000981= d↓b←+PhysConst(0.0625, "in"); 
            Edge↓h← →000982= s↓e←; 
            Edge↓h← →012596= MAX(s↓e←, Edge↓h,min←); 
            //Vertical Dim
            Hole↓v← →000983= LS↓L←; 
            Edge↓v← →000984= s↓e←+C↓2←; 
            Edge↓v← →012599= MAX(s↓e←+C↓2←, Edge↓v,min←); 
        } 
        IF(HoleTyp == "LSLP") { 
            →012630TEXT("Slots parallel to beam centerline"); 
            //Horizontal Dim 
            Hole↓h← →000985= LS↓L←; 
            Edge↓h← →000986= s↓e←+C↓2←; 
            Edge↓h← →012601= MAX(s↓e←+C↓2←, Edge↓h,min←); 
            //Vertical Dim
            Hole↓v← →000987= d↓b←+PhysConst(0.0625, "in"); 
            Edge↓v← →000988= s↓e←; 
            Edge↓v← →012600= MAX(s↓e←, Edge↓v,min←); 
        } 
        
        →000920TEXT("Hole↓v←"); 
        →000918TEXT("="); 
        →000968TEXT(Hole↓v←); 
        →004463TEXT("Hole Vertical Dimension"); 
        →000921TEXT("Hole↓h←"); 
        →000919TEXT("="); 
        →000969TEXT(Hole↓h←); 
        →004464TEXT("Hole Horizontal Dimension"); 
        →004465TEXT("Edge↓v←"); 
        →000914TEXT("="); 
        →000970TEXT(Edge↓v←); 
        →000916TEXT("Minimum Vertical Edge Distance"); 
        →004466TEXT("Edge↓h←"); 
        →000915TEXT("="); 
        →000971TEXT(Edge↓h←); 
        →000917TEXT("Minimum Horizontal Edge Distance"); 
    } 
    →004432BLOCK { 
        →004431TEXT("Plate to Column - Welded Connection"); 
        →004433TEXT("NOTE: Column weld sized to develop the Connection Plate."); 
        //Calculating Weld Thickness    
        D↓5/8← →004434= (0.625*t↓p←)*PhysConst(16, "in↑-1←"); 
        D↓5/8← →004435= roundup(D↓5/8←, 0); 
        IF(D↓5/8← &lt;= 8 &amp;&amp; D↓5/8← &gt; 3) { 
            D↓5/8← →004437= D↓5/8←; } 
        IF(D↓5/8← &lt;= 3) { 
            D↓5/8← →004438= 3; } 
        IF(D↓5/8← &gt;= 9 &amp;&amp; D↓5/8← &lt;= 10) { 
            D↓5/8← →004439= 10; } 
        IF(D↓5/8← &gt;= 11) { 
            D↓5/8← →004440= 12; } 
        
        //check min weld thickness
        D↓1← →004436= t↓p←*PhysConst(16, "in↑-1←"); 
        IF(D↓1← &lt;= 6) { 
            D↓1← →004441= 3; } 
        IF(D↓1← &gt;= 7 &amp;&amp; D↓1← &lt;= 10) { 
            D↓1← →004442= 4; } 
        IF(D↓1← &gt;= 11) { 
            D↓1← →004443= 5; } 
        D →004444= PARMAX(D↓1←, D↓5/8←); 
        →004446TEXT("Fillet Weld Thickness, D↓weld← =  " &amp; '(5/8*t↓p←)' &amp; " = " &amp; D/16 &amp; " in"); //&amp; "in"); 
        
    } 
    
    //Dynamic Graphic
    object Graphic →012557= LoadExternCLC("HSS Column.CLC"); 
    //HSS Column
    Graphic.b↓c← →012558= b↓c←; 
    Graphic.h↓c← →012559= h↓c←; 
    Graphic.t↓c← →012560= t↓HSS←; 
    IF(ConnFace == "Wide") { 
        →012561Graphic.ConnFace →012591= FALSE; 
        
        →012587TEXT(ConnFace); 
    } ELSE { 
        →012562Graphic.ConnFace →012592= TRUE; 
        →012588TEXT(ConnFace); 
    } 
    //Wide Flange Beam
    Graphic.d↓beam← →012563= d↓beam←; 
    Graphic.t↓w← →012564= t↓w←; 
    Graphic.b↓f← →012565= b↓f←; 
    Graphic.t↓f← →012566= t↓f←; 
    Graphic.BeamDia →012567= k↓1←; 
    double BeamRad →012568= 0.5*k↓1←; 
    Graphic.BeamRad →012569= BeamRad; 
    //Plate
    Graphic.b↓p← →012570= b↓p←; 
    Graphic.h↓p← →012571= h↓p←; 
    Graphic.t↓p← →012572= t↓p←; 
    Graphic.Gap →012573= Gap; 
    //Connection
    Graphic.n↓c← →012574= n↓c←; 
    Graphic.n↓b← →012575= n↓v←; 
    Graphic.d↓b← →012576= d↓b←; 
    Graphic.s↓h← →012577= s↓h←; 
    Graphic.s↓v← →012578= s↓v←; 
    Graphic.Edge↓h← →012579= Edge↓h←; 
    Graphic.Edge↓v← →012580= Edge↓v←; 
    Graphic.D↓weld,c← →012581= PhysConst(D, "in"); 
    D↓wc← →012582= PhysConst(D/16, "in"); 
    Graphic.D↓wc← →012583= D↓wc←; 
    //Output
    IF(d↓beam← &lt; PhysConst(16, "in")) { 
        Graphic.UserScale →012607= 7; 
        Graphic.DimFontSize →012608= 8; 
    } 
    IF(d↓beam← &gt;= PhysConst(16, "in") &amp;&amp; d↓beam← &lt; PhysConst(20, "in")) { 
        Graphic.UserScale →012584= 7.5; 
        Graphic.DimFontSize →012605= 7; 
    } 
    IF(d↓beam← &gt;= PhysConst(20, "in") &amp;&amp; d↓beam← &lt; PhysConst(25, "in")) { 
        Graphic.UserScale →012609= 9.5; 
        Graphic.DimFontSize →012610= 7; 
    } 
    IF(d↓beam← &gt;= PhysConst(25, "in") &amp;&amp; d↓beam← &lt; PhysConst(29, "in")) { 
        Graphic.UserScale →012611= 11; 
        Graphic.DimFontSize →012612= 6; 
    } 
    IF(d↓beam← &gt;= PhysConst(29, "in") &amp;&amp; d↓beam← &lt; PhysConst(33, "in")) { 
        Graphic.UserScale →012613= 12.5; 
        Graphic.DimFontSize →012614= 5; 
    } 
    IF(d↓beam← &gt;= PhysConst(33, "in") &amp;&amp; d↓beam← &lt; PhysConst(37, "in")) { 
        Graphic.UserScale →012615= 14; 
        Graphic.DimFontSize →012616= 5; 
    } 
    IF(d↓beam← &gt;= PhysConst(37, "in") &amp;&amp; d↓beam← &lt; PhysConst(41, "in")) { 
        Graphic.UserScale →012617= 15.5; 
        Graphic.DimFontSize →012618= 5; 
    } 
    IF(d↓beam← &gt;= PhysConst(41, "in")) { 
        Graphic.UserScale →012619= 17; 
        Graphic.DimFontSize →012620= 5; 
    } 
    Graphic.VisibDim →012593= VisibDim; 
    →012586Graphic.Draw(False, 0); 
    
    IF(n↓c← == 1) { 
        e →005804= Gap+MAX(PhysConst(1.5, "in"), Edge↓h←); } 
    ELSE { 
        e →005805= Gap+MAX(PhysConst(1.5, "in"), Edge↓h←)+(n↓c←-1)*s↓h←/2; } 
    object ExternEC →005806= LoadExternCLC("Bolt Group Eccentricity (Linked Connections).CLC"); 
    ExternEC.e↓x← →005807= e; 
    ExternEC.e↓y← →005808= 0; 
    ExternEC.s↓h← →005809= s↓h←; 
    ExternEC.s↓v← →005810= s↓v←; 
    ExternEC.n↓c← →005811= n↓c←; 
    ExternEC.n↓v← →005812= n↓v←; 
    ExternEC.BoltGroupMethod →005813= Method; 
    →005814ExternEC.Calculate(); 
} 

→012459BLOCK { 
    →010101PAGEBREAK(); 
} 
SWITCH(DesignMethod) { //loading
    CASE 0 :  { //LRFD
        
        →012508BLOCK { 
            →010111TEXT("Loading Analysis"); 
            →012268BLOCK { 
                LSR↓max← →012253= MAX(ABS(L↓LR←), ABS(S↓L←), ABS(R↓L←)); 
                IF(LSR↓max← == ABS(L↓LR←)) { 
                    LSR →012254= L↓LR←; } 
                IF(LSR↓max← == ABS(S↓L←)) { 
                    LSR →012255= S↓L←; } 
                IF(LSR↓max← == ABS(R↓L←)) { 
                    LSR →012256= R↓L←; } 
                
                LW↓max← →012257= MAX(ABS(L↓L←), ABS(0.5*W↓L←)); 
                
                IF(LW↓max← == ABS(L↓L←)) { 
                    LW →012258= L↓L←; } 
                IF(LW↓max← == ABS(0.5*W↓L←)) { 
                    LW →012259= 0.5*W↓L←; } 
                LRFD↓1← →012260= 1.4*D↓L←; 
                LRFD↓2← →012261= 1.2*D↓L←+1.6*L↓L←+0.5*LSR; 
                LRFD↓3← →012262= 1.2*D↓L←+1.6*LSR+LW; 
                LRFD↓4← →012263= 1.2*D↓L←+1.0*W↓L←+L↓L←+0.5*LSR; 
                LRFD↓5← →012264= 1.2*D↓L←+1.0*E↓L←+L↓L←+0.2*S↓L←; 
                LRFD↓6← →012265= 0.9*D↓L←+1.0*W↓L←; 
                LRFD↓7← →012266= 0.9*D↓L←+1.0*E↓L←; 
                V↓u← →012267= PARMAX(LRFD↓1←, LRFD↓2←, LRFD↓3←, LRFD↓4←, LRFD↓5←, LRFD↓6←, LRFD↓7←); 
                
                
            } 
            
            
            →012269BLOCK { 
                →006051BLOCK { 
                    →010112TEXT("Loading"); 
                    →012004TEXT("________________________"); 
                    →006047TEXT("D↓L←"); 
                    →006048TEXT("="); 
                    →006049TEXT(D↓L←); 
                    →006050TEXT("Dead Load"); 
                    →006052TEXT("L↓L←"); 
                    →006053TEXT("="); 
                    →006054TEXT(L↓L←); 
                    →006055TEXT("Live Load"); 
                    →006056TEXT("L↓LR←"); 
                    →006057TEXT("="); 
                    →006058TEXT(L↓LR←); 
                    →006059TEXT("Roof Live Load"); 
                    →006060TEXT("S↓L←"); 
                    →006061TEXT("="); 
                    →006062TEXT(S↓L←); 
                    →006063TEXT("Snow Load"); 
                    →006064TEXT("R↓L←"); 
                    →006065TEXT("="); 
                    →006066TEXT(R↓L←); 
                    →006067TEXT("Rain Load"); 
                    →006068TEXT("W↓L←"); 
                    →006069TEXT("="); 
                    →006070TEXT(W↓L←); 
                    →006071TEXT("Wind Load"); 
                    →006072TEXT("E↓L←"); 
                    →006073TEXT("="); 
                    →006074TEXT(E↓L←); 
                    →006075TEXT("Earthquake Load"); 
                } 
                
                →000790BLOCK { 
                    →012003TEXT("Resulting Forces"); 
                    →012005TEXT("________________________"); 
                    →001002TEXT("V↓u←"); 
                    →005765TEXT("="); 
                    →005766TEXT(V↓u←); 
                    →004450TEXT("Factored Shear Load"); 
                    R↓u← →004384= V↓u←; 
                    →004381TEXT("R↓u←"); 
                    →005767TEXT("="); 
                    →005768TEXT(R↓u←); 
                    →001005TEXT("Resultant Force"); 
                    // →001006TEXT("r↓u←   =   " &amp; r↓u←); 
                    //→001009TEXT("max shear/bolt"); 
                    M↓up← →004385= V↓u←*e; 
                    →001010TEXT("M↓u←"); 
                    →005769TEXT("="); 
                    →005770TEXT(M↓up←); 
                    →004387TEXT("Moment on Plate"); 
                } 
            } 
            →000784BLOCK { 
                →011999TEXT("Load Combinations - LRFD"); 
                →012000TEXT("____________________________________"); 
                LSR↓max← →006253= MAX(ABS(L↓LR←), ABS(S↓L←), ABS(R↓L←)); 
                IF(LSR↓max← == ABS(L↓LR←)) { 
                    LSR →006254= L↓LR←; } 
                IF(LSR↓max← == ABS(S↓L←)) { 
                    LSR →006255= S↓L←; } 
                IF(LSR↓max← == ABS(R↓L←)) { 
                    LSR →006256= R↓L←; } 
                
                LW↓max← →006257= MAX(ABS(L↓L←), ABS(0.5*W↓L←)); 
                
                IF(LW↓max← == ABS(L↓L←)) { 
                    LW →006258= L↓L←; } 
                IF(LW↓max← == ABS(0.5*W↓L←)) { 
                    LW →006259= 0.5*W↓L←; } 
                LRFD↓1← →011974= 1.4*D↓L←; 
                LRFD↓2← →011975= 1.2*D↓L←+1.6*L↓L←+0.5*LSR; 
                LRFD↓3← →011976= 1.2*D↓L←+1.6*LSR+LW; 
                LRFD↓4← →011977= 1.2*D↓L←+1.0*W↓L←+L↓L←+0.5*LSR; 
                LRFD↓5← →011978= 1.2*D↓L←+1.0*E↓L←+L↓L←+0.2*S↓L←; 
                LRFD↓6← →011979= 0.9*D↓L←+1.0*W↓L←; 
                LRFD↓7← →011980= 0.9*D↓L←+1.0*E↓L←; 
                
                
                
                
                →011981TEXT("LRFD↓1← = " &amp; '1.4*D↓L←'); 
                →011982TEXT(" = " &amp; 1.4*D↓L← &amp; " = " &amp; LRFD↓1←); 
                
                →011983TEXT("LRFD↓2← = " &amp; '1.2*D↓L←+1.6*L↓L←+0.5*MAX(L↓LR←, S↓L←, R↓L←)'); 
                →011984TEXT(" = " &amp; 1.2*D↓L←+1.6*L↓L←+0.5*LSR &amp; " = " &amp; LRFD↓2←); 
                
                →011985TEXT("LRFD↓3← = " &amp; '1.2*D↓L←+1.6*MAX(L↓LR←, S↓L←, R↓L←)+MAX(L↓L←, 0.5*W↓L←)'); 
                →011986TEXT(→011987" = " &amp; 1.2*D↓L←+1.6*LSR+LW &amp; " = " &amp; LRFD↓3←); 
                
                →011988TEXT("LRFD↓4← = " &amp; '1.2*D↓L←+1.0*W↓L←+L↓L←+0.5*MAX(L↓LR←, S↓L←, R↓L←)'); 
                →011989TEXT(→011990" = " &amp; 1.2*D↓L←+1.0*W↓L←+L↓L←+0.5*LSR &amp; " = " &amp; LRFD↓4←); 
                
                →011991TEXT("LRFD↓5← = " &amp; '1.2*D↓L←+1.0*E↓L←+L↓L←+0.2*S↓L←'); 
                →011992TEXT(→011993" = " &amp; 1.2*D↓L←+1.0*E↓L←+L↓L←+0.2*S↓L← &amp; " = " &amp; LRFD↓5←); 
                
                →011994TEXT("LRFD↓6← = " &amp; '0.9*D↓L←+1.0*W↓L←'); 
                →011995TEXT(→011996" = " &amp; 0.9*D↓L←+1.0*W↓L← &amp; " = " &amp; LRFD↓6←); 
                
                →011997TEXT("LRFD↓7← = 0.9*D↓L←+1.0*E↓L←"); 
                →011998TEXT(" = " &amp; 0.9*D↓L←+1.0*E↓L← &amp; " = " &amp; LRFD↓7←); 
                V↓u← →000022= PARMAX(LRFD↓1←, LRFD↓2←, LRFD↓3←, LRFD↓4←, LRFD↓5←, LRFD↓6←, LRFD↓7←); 
            } 
        } 
    } 
    CASE 1 :  { //ASD

        →005192BLOCK { 
            →012064TEXT("Loading Analysis"); 
            →012501BLOCK { 
                LSR↓max← →012485= MAX(ABS(L↓LR←), ABS(S↓L←), ABS(R↓L←)); 
                IF(LSR↓max← == ABS(L↓LR←)) { 
                    LSR →012486= L↓LR←; } 
                IF(LSR↓max← == ABS(S↓L←)) { 
                    LSR →012487= S↓L←; } 
                IF(LSR↓max← == ABS(R↓L←)) { 
                    LSR →012488= R↓L←; } 
                
                WE↓max← →012489= MAX(ABS(0.6*W↓L←), ABS(0.7*E↓L←)); 
                
                IF(WE↓max← == ABS(0.6*W↓L←)) { 
                    WE →012490= 0.6*W↓L←; } 
                IF(WE↓max← == ABS(0.7*E↓L←)) { 
                    WE →012491= 0.7*E↓L←; } 
                ASD↓1← →012492= D↓L←; 
                ASD↓2← →012493= D↓L←+L↓L←; 
                ASD↓3← →012494= D↓L←+LSR; 
                ASD↓4← →012495= D↓L←+0.75*L↓L←+0.75*LSR; 
                ASD↓5← →012496= D↓L←+WE; 
                ASD↓6a← →012497= D↓L←+0.75*L↓L←+0.75*(0.6*W↓L←)+0.75*LSR; 
                ASD↓6b← →012498= D↓L←+0.75*L↓L←+0.75*(0.7*E↓L←)+0.75*S↓L←; 
                ASD↓7← →012499= 0.6*D↓L←+0.6*W↓L←; 
                ASD↓8← →012500= 0.6*D↓L←+0.7*E↓L←; 
                V↓a← →012505= PARMAX(ASD↓1←, ASD↓2←, ASD↓3←, ASD↓4←, ASD↓5←, ASD↓6a←, ASD↓6b←, ASD↓7←, ASD↓8←); 
                
            } 
            
            →012502BLOCK { 
                
                →006076BLOCK { 
                    →012240TEXT("Loading"); 
                    →012503TEXT("________________________"); 
                    →006077TEXT("D↓L←"); 
                    →006078TEXT("="); 
                    →006079TEXT(D↓L←); 
                    →006080TEXT("Dead Load"); 
                    →006081TEXT("L↓L←"); 
                    →006082TEXT("="); 
                    →006083TEXT(L↓L←); 
                    →006084TEXT("Live Load"); 
                    →006085TEXT("L↓LR←"); 
                    →006086TEXT("="); 
                    →006087TEXT(L↓LR←); 
                    →006088TEXT("Roof Live Load"); 
                    →006089TEXT("S↓L←"); 
                    →006090TEXT("="); 
                    →006091TEXT(S↓L←); 
                    →006092TEXT("Snow Load"); 
                    →006093TEXT("R↓L←"); 
                    →006094TEXT("="); 
                    →006095TEXT(R↓L←); 
                    →006096TEXT("Rain Load"); 
                    →006097TEXT("W↓L←"); 
                    →006098TEXT("="); 
                    →006099TEXT(W↓L←); 
                    →006100TEXT("Wind Load"); 
                    →006101TEXT("E↓L←"); 
                    →006102TEXT("="); 
                    →006103TEXT(E↓L←); 
                    →006104TEXT("Earthquake Load"); 
                } 
                
                →005211BLOCK { 
                    →012242TEXT("Resulting Forces"); 
                    →012504TEXT("________________________"); 
                    →005212TEXT("V↓a←"); 
                    →005771TEXT("="); 
                    →005772TEXT(V↓a←); 
                    →005213TEXT("Factored Shear Load"); 
                    R↓a← →005214= V↓a←; 
                    →005215TEXT("R↓a←"); 
                    →005773TEXT("="); 
                    →005774TEXT(R↓a←); 
                    →005216TEXT("Resultant Force"); 
                    //→005217TEXT("r↓a←   =   " &amp; r↓a←); 
                    //→005218TEXT("max shear/bolt"); 
                    M↓ap← →005219= V↓a←*e; 
                    →005220TEXT("M↓a←"); 
                    →005775TEXT("="); 
                    →005776TEXT(M↓ap←); 
                    →005221TEXT("Moment on Plate"); 
                } 
            } 
            →005193BLOCK { 
                →012237TEXT("Load Combinations - ASD"); 
                →012238TEXT("__________________________________"); 
                LSR↓max← →006274= MAX(ABS(L↓LR←), ABS(S↓L←), ABS(R↓L←)); 
                IF(LSR↓max← == ABS(L↓LR←)) { 
                    LSR →006275= L↓LR←; } 
                IF(LSR↓max← == ABS(S↓L←)) { 
                    LSR →006276= S↓L←; } 
                IF(LSR↓max← == ABS(R↓L←)) { 
                    LSR →006277= R↓L←; } 
                
                WE↓max← →006278= MAX(ABS(0.6*W↓L←), ABS(0.7*E↓L←)); 
                
                IF(WE↓max← == ABS(0.6*W↓L←)) { 
                    WE →006279= 0.6*W↓L←; } 
                IF(WE↓max← == ABS(0.7*E↓L←)) { 
                    WE →006280= 0.7*E↓L←; } 
                ASD↓1← →012201= D↓L←; 
                ASD↓2← →012202= D↓L←+L↓L←; 
                ASD↓3← →012203= D↓L←+LSR; 
                ASD↓4← →012204= D↓L←+0.75*L↓L←+0.75*LSR; 
                ASD↓5← →012205= D↓L←+WE; 
                ASD↓6a← →012206= D↓L←+0.75*L↓L←+0.75*(0.6*W↓L←)+0.75*LSR; 
                ASD↓6b← →012207= D↓L←+0.75*L↓L←+0.75*(0.7*E↓L←)+0.75*S↓L←; 
                ASD↓7← →012208= 0.6*D↓L←+0.6*W↓L←; 
                ASD↓8← →012209= 0.6*D↓L←+0.7*E↓L←; 
                
                
                →012210TEXT("ASD↓1← = " &amp; 'D↓L←'); 
                →012211TEXT(→012212" = " &amp; D↓L← &amp; " = " &amp; ASD↓1←); 
                →012213TEXT("ASD↓2 ←= " &amp; 'D↓L←+L↓L←'); 
                →012214TEXT(→012215" = " &amp; D↓L←+L↓L← &amp; " = " &amp; ASD↓2←); 
                →012216TEXT("ASD↓3← = " &amp; 'D↓L←+MAX(L↓LR←, S↓L←, R↓L←)'); 
                →012217TEXT(→012218" = " &amp; D↓L←+LSR &amp; " = " &amp; ASD↓3←); 
                →012219TEXT("ASD↓4← = " &amp; 'D↓L←+0.75*L↓L←+0.75*MAX(L↓LR←, S↓L←, R↓L←)'); 
                →012220TEXT(→012221" = " &amp; D↓L←+0.75*L↓L←+0.75*LSR &amp; " = " &amp; ASD↓4←); 
                →012222TEXT("ASD↓5← = " &amp; 'D↓L←+MAX(0.6*W↓L←, 0.7*E↓L←)'); 
                →012223TEXT(→012224" = " &amp; D↓L←+WE &amp; " = " &amp; ASD↓5←); 
                →012225TEXT("ASD↓6a←= " &amp; 'D↓L←+0.75*L↓L←+0.75*(0.6*W↓L←)+0.75*MAX(L↓LR←, S↓L←, R↓L←)'); 
                →012226TEXT(→012227" = " &amp; D↓L←+0.75*L↓L←+0.75*(0.6*W↓L←)+0.75*LSR &amp; " = " &amp; ASD↓6a←); 
                →012228TEXT("ASD↓6b←= " &amp; 'D↓L←+0.75*L↓L←+0.75*(0.7*E↓L←)+0.75*S↓L←'); 
                →012229TEXT(→012230" = " &amp; D↓L←+0.75*L↓L←+0.75*(0.7*E↓L←)+0.75*S↓L← &amp; " = " &amp; ASD↓6b←); 
                →012231TEXT("ASD↓7 ←= " &amp; '0.6*D↓L←+0.6*W↓L←'); 
                →012232TEXT(→012233" = " &amp; 0.6*D↓L←+0.6*W↓L← &amp; " = " &amp; ASD↓7←); 
                →012234TEXT("ASD↓8← = " &amp; '0.6*D↓L←+0.7*E↓L←'); 
                →012235TEXT(→012236" = " &amp; 0.6*D↓L←+0.7*E↓L← &amp; " = " &amp; ASD↓8←); 
                
                V↓a← →000031= PARMAX(ASD↓1←, ASD↓2←, ASD↓3←, ASD↓4←, ASD↓5←, ASD↓6a←, ASD↓6b←, ASD↓7←, ASD↓8←); 
            } 
            
        } 
    } 
} 

→004724BLOCK { 
    →012002TEXT("Eccentricity &amp; Coefficient Calculations"); 
    →012006TEXT("Eccentricity"); 
    →012007TEXT("_____________________________________________________________"); 
    IF(n↓c← == 1) { 
        e →004725= Gap+MAX(PhysConst(1.5, "in"), Edge↓h←); } 
    ELSE { 
        e →004726= Gap+MAX(PhysConst(1.5, "in"), Edge↓h←)+(n↓c←-1)*s↓h←/2; } 
    →005815TEXT("Coefficient Calculations"); 
    →012008TEXT("_____________________________________________________________"); 
    IF(Method == 0) { 
        
        →005796ExternEC.Draw(TRUE, 0); 
        C →005802= ExternEC.C↓1←; 
        C↓prime← →005803= ExternEC.C↓2←; 
        
    } 
    ELSE { 
        
        →005797ExternEC.Draw(TRUE, 1); 
        C →005800= ExternEC.C↓el←; 
        C↓prime← →005801= ExternEC.C↓2←; 
    } 
    →012033PAGEBREAK(); 
} 


→001016BLOCK { 
    →012024TEXT("Limit State Calculations"); 
    →000840BLOCK { 
        →012025TEXT("Dimensional Limit States"); 
        
        →005907BLOCK { 
            →012034TEXT("Connection Sizing"); 
            →012026TEXT("_____________________________________________________________"); 
            →012035BLOCK { 
                
                →005906TEXT("Plate Sizing"); 
                →012027TEXT("Plate Dimensions"); 
                b↓p← →012029= (Gap+([n↓c←-1]*s↓h←)+(2*MAX(PhysConst(1.5, "in"), Edge↓h←))); 
                //b↓p← →012030= RoundUp(b↓p←, 0, "in"); 
                h↓p← →012031= (n↓v←-1)*s↓v←+2*MAX(PhysConst(1.25, "in"), Edge↓v←); 
                //h↓p← →012032= RoundUp(h↓p←, 0, "in"); 
                →012028TEXT("Plate on Beam"); 
                T↓beam← →005904= d↓beam←-2*k↓des←; //Tbeam calc ??
                IF(h↓p← &gt;= T↓beam←) { 
                    →005910TEXT("h↓p← &gt; T↓beam←"); 
                    →005911TEXT(h↓p← &amp; " &gt; " &amp; T↓beam←); 
                    →005932TEXT("Plate Depth Exceeds Web Depth - Revise"); 
                    DimLim →005933= DimLim+1; 
                    →005934G_X.Draw(1); 
                } 
                IF(h↓p← &lt; T↓beam← &amp;&amp; h↓p← &gt; (T↓beam←/2)) { 
                    →005914TEXT("h↓p← &lt; T↓beam←"); 
                    →005915TEXT(h↓p← &amp; " &lt; " &amp; T↓beam←); 
                    →005913TEXT("Connection Plate Fits on Beam"); 
                    →005912G_CHECK.Draw(1); 
                } 
                IF(h↓p← &lt;= (T↓beam←/2)) { 
                    →005930TEXT("h↓p← &lt; T↓beam←/2"); 
                    →005931TEXT(h↓p← &amp; " &lt; " &amp; T↓beam←/2); 
                    →005901TEXT("Increase Connection Depth for Beam Stability"); 
                    DimLim →005908= DimLim+1; 
                    →005909G_X.Draw(1); 
                } 
                
            } 
            →005917BLOCK { 
                →005916TEXT("Bolt Group Spacing"); 
                
                →005935TEXT("Horizontal Spacing between Bolt Columns"); 
                IF(n↓c← &gt;= 2) { 
                    s↓min← →005937= PARMIN(2.67*d↓b←, PhysConst(3, "in")); 
                    IF(s↓h← &gt;= s↓min←) { 
                        →005939TEXT("s↓h← ≥ s↓min←"); 
                        →005940TEXT(s↓h← &amp; " ≥ " &amp; s↓min←); 
                        →005941TEXT("Horizontal Spacing Sufficient"); 
                        →005938G_CHECK.Draw(1); 
                    } 
                    IF(s↓h← &lt; s↓min←) { 
                        →005942TEXT("s↓h← &lt; s↓min←"); 
                        →005943TEXT(s↓h← &amp; " &lt; " &amp; s↓min←); 
                        →005944TEXT("Increase Horizontal Spacing"); 
                        DimLim →005945= DimLim+1; 
                        →005946G_X.Draw(1); 
                    } 
                } 
                ELSE { 
                    →005956TEXT("N/A"); 
                } 
                
                →005936TEXT("Vertical Spacing within Columns"); 
                IF(n↓v← &gt;= 2) { 
                    s↓min← →005918= 2.67*d↓b←; 
                    IF(s↓v← &gt;= s↓min←) { 
                        →005947TEXT("s↓v← ≥ s↓min←"); 
                        →005948TEXT(s↓v← &amp; " ≥ " &amp; s↓min←); 
                        →005949TEXT("Vertical Spacing Sufficient"); 
                        →005950G_CHECK.Draw(1); 
                    } 
                    IF(s↓v← &lt; s↓min←) { 
                        →005951TEXT("s↓v← &lt; s↓min←"); 
                        →005952TEXT(s↓v← &amp; " &lt; " &amp; s↓min←); 
                        →005953TEXT("Increase Vertical Spacing"); 
                        DimLim →005954= DimLim+1; 
                        →005955G_X.Draw(1); 
                    } 
                } 
                ELSE { 
                    →005957TEXT("N/A"); 
                } 
            } 
        } 
        →004720BLOCK { 
            
            →004631TEXT("Design Checks"); 
            →012036TEXT("_____________________________________________________________"); 
            →012043BLOCK { 
                →004721BLOCK { 
                    →004632TEXT("AISC 360-10, Spec. K (K1-3)"); 
                    
                    t↓maxp1← →012250= (F↓uc←/F↓yp←)*t↓c←; 
                    →004762TEXT("(K1-3)"); 
                    IF(t↓p← &lt;= t↓maxp1←) { 
                        →004633TEXT("t↓p← ≤ (F↓u←/F↓yp←)*t"); 
                        →004637TEXT(t↓p← &amp; " ≤ " &amp; t↓maxp1←); 
                        →004638TEXT("Plate Thickness within Allowable Range"); 
                        →004639G_CHECK.Draw(1); 
                    } 
                    ELSE { 
                        →004640TEXT("t↓p← &gt; (F↓u←/F↓yp←)*t"); 
                        →004641TEXT(t↓p← &amp; " &gt; " &amp; t↓maxp1←); 
                        →004642TEXT("Maximum Plate Thickness Exceeded - Revise"); 
                        →004643G_X.Draw(1); 
                        DimLim →005733= DimLim+1; 
                    } 
                } 
                
                →004722BLOCK { 
                    →004644TEXT("AISC 360-10, Part 10, page 10-167"); 
                    IF(OD &gt; 0) { 
                        D↓tmax← →004645= 0.11*E↓c←/F↓yc←; 
                        D↓t← →004670= OD/t↓c←; 
                        IF(D↓t← &lt;= D↓tmax←) { 
                            →004646TEXT("D/t ≤ 0.11E/F↓y←"); 
                            →004671TEXT(D↓t← &amp; " ≤ " &amp; D↓tmax←); 
                            →004672TEXT("HSS Column is Not Slender"); 
                            →004673G_PASS.Draw(1); 
                        } 
                        ELSE { 
                            →004684TEXT("D/t &gt; 0.11E/F↓y←"); 
                            →004685TEXT(D↓t← &amp; " &gt; " &amp; D↓tmax←); 
                            →004675TEXT("HSS Column is Slender - Revise Design"); 
                            →004674G_X.Draw(1); 
                            DimLim →005734= DimLim+1; } 
                    } 
                    ELSE { 
                        b↓tmax← →004680= 1.4*SQRT(E↓c←/F↓yc←); 
                        b↓t← →004681= cf/t↓c←; 
                        IF(b↓t← &lt;= b↓tmax←) { 
                            →004682TEXT("b/t ≤ 1.40√(E/F↓y←)"); 
                            →004683TEXT(b↓t← &amp; " ≤ " &amp; b↓tmax←); 
                            →004676TEXT("HSS Column is Not Slender"); 
                            →004677G_CHECK.Draw(1); 
                        } 
                        ELSE { 
                            →004686TEXT("b/t &gt; 1.40√(E/F↓y←)"); 
                            →004687TEXT(b↓t← &amp; " &gt; " &amp; b↓tmax←); 
                            →004678TEXT("HSS Column is Slender - Revise"); 
                            →004679G_X.Draw(1); 
                            DimLim →005735= DimLim+1; 
                            
                        } 
                    } 
                } 
                
                
                →004723BLOCK { 
                    →004692TEXT("AISC 360-10, Part 9, page 9-5"); 
                    t↓cmin← →004693= (0.6*F↓EXX←*(SQRT(2)/2)*(D/PhysConst(16, "in↑-1←")))/(0.6*F↓uc←); 
                    →004763TEXT("(9-2)"); 
                    
                    IF(t↓c← &gt;= t↓cmin←) { 
                        →004694TEXT("t↓c← ≥ t↓cmin←"); 
                        →004695TEXT(t↓c← &amp; " ≥ " &amp; t↓cmin←); 
                        →004688TEXT("HSS Thickness within Allowable Range"); 
                        →004689G_CHECK.Draw(1); 
                    } 
                    ELSE { 
                        
                        →004696TEXT("t↓c← &lt; t↓cmin←"); 
                        →004697TEXT(t↓c← &amp; " &lt; " &amp; t↓cmin←); 
                        →004690TEXT("HSS Thickness Below Minimum - Revise"); 
                        →004691G_X.Draw(1); 
                        DimLim →005736= DimLim+1; 
                    } 
                } 
            } 
            →012037BLOCK { 
                →004630TEXT("AISC 360-10, Part 10 page 10-104"); 
                t↓des← →004553= (d↓b←/2)+PhysConst(0.0625, "in"); 
                
                IF(n↓c← &lt;= 2) { 
                    IF(n↓c← == 1) { //check exception for single verticle row of bolts
                        Exception →012482= 0; 
                        IF(t↓p← &lt;= t↓des←) { 
                            →004554TEXT("t↓p ←≤ d↓b←/2 + 1/16"); 
                            →004555TEXT(t↓p← &amp; " ≤ " &amp; t↓des←); 
                            L↓eh← →004572= 2*d↓b←; 
                            L↓ehp← →004574= (b↓p←-([n↓c←-1]*s↓h←)-Gap)/2; 
                            L↓ehb← →004575= (b↓p←-([n↓c←-1]*s↓h←)-Gap)/2; 
                            →004573TEXT("L↓ehp← ≥ 2d↓b←"); 
                            →004576TEXT(L↓ehp← &amp; " = " &amp; L↓eh←); 
                            →004577TEXT("L↓ehb← ≥ 2d↓b←"); 
                            →004578TEXT(L↓ehb← &amp; " = " &amp; L↓eh←); 
                            →004562TEXT("t↓max← need not be checked"); 
                            →004627TEXT("Design Check Exception Satisfied"); 
                            →004625G_CHECK.Draw(1); 
                            Exception →012483= Exception+1; 
                        } 
                        IF(t↓p← &gt; t↓des← &amp;&amp; t↓w← &lt;= t↓des←) { 
                            →004556TEXT("t↓w ←≤ d↓b←/2 + 1/16"); 
                            →004557TEXT(t↓w← &amp; " ≤ " &amp; t↓des←); 
                            L↓eh← →004579= 2*d↓b←; 
                            L↓ehp← →004580= (b↓p←-([n↓c←-1]*s↓h←)-Gap)/2; 
                            L↓ehb← →004581= (b↓p←-([n↓c←-1]*s↓h←)-Gap)/2; 
                            →004582TEXT("L↓ehp← ≥ 2d↓b←"); 
                            →004583TEXT(L↓ehp← &amp; " = " &amp; L↓eh←); 
                            →004584TEXT("L↓ehb← ≥ 2d↓b←"); 
                            →004585TEXT(L↓ehb← &amp; " = " &amp; L↓eh←); 
                            →004563TEXT("t↓max← need not be checked"); 
                            →004628TEXT("Design Check Exception Satisfied"); 
                            →004624G_CHECK.Draw(1); 
                            Exception →012484= Exception+1; 
                        } 
                        IF(Exception == 0) { 
                            →004561TEXT("neither t↓w← or t↓p← satisfy t ≤ d↓b←/2 + 1/16"); 
                            M↓maxp← →004559= (F↓v←/0.9)*[A↓b←*C↓prime←]; 
                            →004758TEXT("(10-4)"); 
                            t↓maxp← →004560= (6*M↓maxp←)/(F↓yp←*[h↓p←]↑2←); 
                            →004759TEXT("(10-3)"); 
                            IF(t↓p← &lt;= t↓maxp←) { 
                                →004616TEXT("t↓p← ≤ t↓max←"); 
                                →004617TEXT(t↓p← &amp; " ≤ " &amp; t↓maxp←); 
                                →004618TEXT("Plate Thickness within Allowable Range"); 
                                →012480G_CHECK.Draw(1); 
                            } 
                            ELSE { 
                                →004620TEXT("t↓p← &gt; t↓max←"); 
                                →004621TEXT(t↓p← &amp; " &gt; " &amp; t↓maxp←); 
                                →004622TEXT("Maximum Plate Thickness Exceeded - Revise Design"); 
                                DimLim →005730= DimLim+1; 
                                →004623G_X.Draw(1); 
                            } 
                        } 
                    } 
                    ELSE { //exception for double verticle rows of bolts
                        IF(t↓p← &lt;= t↓des← &amp;&amp; t↓w← &lt;= t↓des←) { //if
                            →004566TEXT("t↓p ←≤ d↓b←/2 + 1/16"); 
                            →004567TEXT(t↓p← &amp; " ≤ " &amp; t↓des←); 
                            →004564TEXT("t↓w ←≤ d↓b←/2 + 1/16"); 
                            →004565TEXT(t↓w← &amp; " ≤ " &amp; t↓des←); 
                            L↓eh← →004586= 2*d↓b←; 
                            L↓ehp← →004587= (b↓p←-([n↓c←-1]*s↓h←)-Gap)/2; 
                            L↓ehb← →004588= (b↓p←-([n↓c←-1]*s↓h←)-Gap)/2; 
                            →004589TEXT("L↓ehp← ≥ 2d↓b←"); 
                            →004590TEXT(L↓ehp← &amp; " = " &amp; L↓eh←); 
                            →004591TEXT("L↓ehb← ≥ 2d↓b←"); 
                            →004592TEXT(L↓ehb← &amp; " = " &amp; L↓eh←); 
                            →004568TEXT("t↓max← need not be checked"); 
                            →004629TEXT("Design Check Exception Satisfied"); 
                            →004626G_CHECK.Draw(1); 
                        } 
                        ELSE { 
                            →004571TEXT("neither t↓w← or t↓p← satisfy t ≤ d↓b←/2 + 1/16"); 
                            M↓maxp← →004569= (F↓v←/0.9)*[A↓b←*C↓prime←]; 
                            →004756TEXT("(10-4)"); 
                            t↓maxp2← →004570= (6*M↓maxp←)/(F↓yp←*[h↓p←]↑2←); 
                            →004757TEXT("(10-3)"); 
                            IF(t↓p← &lt;= t↓maxp2←) { 
                                →004608TEXT("t↓p← ≤ t↓max←"); 
                                →004609TEXT(t↓p← &amp; " ≤ " &amp; t↓maxp2←); 
                                →004610TEXT("Plate Thickness within Allowable Range"); 
                                →004611G_CHECK.Draw(1); 
                            } 
                            ELSE { 
                                →004612TEXT("t↓p← &gt; t↓max←"); 
                                →004613TEXT(t↓p← &amp; " &gt; " &amp; t↓maxp2←); 
                                →004614TEXT("Maximum Plate Thickness Exceeded - Revise"); 
                                →004615G_X.Draw(1); 
                                DimLim →005731= DimLim+1; 
                            } 
                        } 
                    } 
                } 
                ELSE { 
                    M↓maxp← →001019= (F↓v←/0.9)*[A↓b←*C↓prime←]; 
                    →004760TEXT("(10-4)"); 
                    t↓maxp2← →001020= (6*M↓maxp←)/(F↓yp←*[h↓p←]↑2←); 
                    →004761TEXT("(10-3)"); 
                    
                    IF(t↓p← &lt;= t↓maxp2←) { 
                        →004593TEXT("t↓p← ≤ t↓max←"); 
                        →004594TEXT(t↓p← &amp; " ≤ " &amp; t↓maxp2←); 
                        →004607TEXT("Plate Thickness within Allowable Range"); 
                        →012481G_CHECK.Draw(1); 
                    } ELSE { 
                        →004595TEXT("t↓p← &gt; t↓max←"); 
                        →004596TEXT(t↓p← &amp; " &gt; " &amp; t↓maxp2←); 
                        →004599TEXT("Maximum Plate Thickness Exceeded - Revise"); 
                        →004605G_X.Draw(1); 
                        DimLim →005732= DimLim+1; 
                    } 
                    
                } 
            } 
        } 
    } 
} 
→012457BLOCK { 
    →012042PAGEBREAK(); 
} 

→012039BLOCK { 
    →012038TEXT("Strength Limit States"); 
    →001013BLOCK { 
        →012041TEXT("Bolt Shear"); 
        →012040TEXT("_____________________________________________________________"); 
        →004817TEXT("AISC 360-10, Part 7"); 
        
        →004808TEXT("F↓nv←  =  " &amp; F↓nv←); 
        →004809TEXT("Shear Strength of Bolt Material"); 
        →004811TEXT("C  =  " &amp; C); 
        →004810TEXT("Eccentricity Coefficient"); 
        
        v↓n← →004813= F↓nv←*A↓b←; 
        →005492TEXT("/bolt"); 
        V↓n1← →004815= C*v↓n←; 
        
        →004818TEXT("(7-19)"); 
        
        IF(DesignMethod == 0) { //LRFD 

            IF(Bolt == 5 || Bolt == 2) { 
                IF(HoleTyp == "STD" || HoleTyp == "SSLT") { 
                    ϕ →005816= 1.0; 
                } 
                
                IF(HoleTyp == "SSLP") { 
                    ϕ →005818= 0.85; 
                } 
                IF(HoleTyp == "LSLT" || HoleTyp == "LSLP") { 
                    ϕ →005820= 0.7; 
                } 
            } ELSE { 
                ϕ →004812= 0.75; } 
            
            ϕv↓n← →004814= ϕ*v↓n←; 
            →005493TEXT("/bolt"); 
            
            ϕV↓n1← →004816= ϕ*V↓n1←; 
            U↓1← →004819= V↓u←/ϕV↓n1←; 
            →004820TEXT("Unity Check"); 
            
        } ELSE { //ASD
            IF(Bolt == 5 || Bolt == 2) { 
                IF(HoleTyp == "STD" || HoleTyp == "SSLT") { 
                    Ω →005969= 1.5; 
                } 
                
                IF(HoleTyp == "SSLP") { 
                    Ω →005970= 1.76; 
                } 
                IF(HoleTyp == "LSLT" || HoleTyp == "LSLP") { 
                    Ω →005971= 2.14; 
                } 
            } ELSE { 
                Ω →005972= 2; } 
            v↓nΩ← →005712= v↓n←/Ω; 
            →005977TEXT("/bolt"); 
            
            V↓n1/←Ω →005234= V↓n1←/Ω; 
            U↓1← →005235= V↓a←/(V↓n1/←Ω); 
            →005236TEXT("Unity Check"); 
        } 
        IF(U↓1← &gt; 1) { 
            →004821TEXT("Bolt Shear Strength Exceeded - Revise Design"); 
            →004822G_FAIL.Draw(1); 
            LimitExc →004823= LimitExc+1; 
        } ELSE { 
            →004824TEXT("Bolt Shear Strength Sufficient"); 
            →004825G_PASS.Draw(1); 
        } 
    } 
    →000841BLOCK { 
        →012054TEXT("Bolt Bearing - Plate"); 
        →012044TEXT("_____________________________________________________________"); 
        →004732TEXT("AISC 360-10, Spec. J3.10"); 
        l↓c,end← →001029= 0.5*[h↓p←-(n↓v←-1)*s↓v←-[Hole↓v←+PhysConst(1, "in")/16]]; 
        l↓c,int← →001030= s↓v←-[Hole↓v←+PhysConst(1, "in")/16]; 
        IF(HoleTyp == "LSLP") { 
            V↓n,end← →001031= PARMIN(1*l↓c,end←*t↓p←*F↓up←, 2*d↓b←*t↓p←*F↓up←); 
            →004733TEXT("(J3-6c)"); 
            V↓n,int← →001033= PARMIN(1*l↓c,int←*t↓p←*F↓up←, 2*d↓b←*t↓p←*F↓up←); 
            →004734TEXT("(J3-6c)"); 
        } 
        ELSE { 
            V↓n,end← →001032= PARMIN(1.2*l↓c,end←*t↓p←*F↓up←, 2.4*d↓b←*t↓p←*F↓up←); 
            →004735TEXT("(J3-6a)"); 
            V↓n,int← →001034= PARMIN(1.2*l↓c,int←*t↓p←*F↓up←, 2.4*d↓b←*t↓p←*F↓up←); 
            →004736TEXT("(J3-6a)"); 
        } 
        
        V↓n2← →001035= [V↓n,end←*n↓c←]+[V↓n,int←*(n-n↓c←)]; 
        
        IF(DesignMethod == 0) { //LRFD

            ϕ →004296= 0.75; 
            ϕV↓n2← →001036= ϕ*V↓n2←; 
            U↓2← →001041= V↓u←/(ϕV↓n2←); 
            →001044TEXT("Unity Check"); 
            
        } ELSE { 
            Ω →005255= 2; 
            V↓n2/←Ω →005256= V↓n2←/Ω; 
            U↓2← →005257= V↓a←/(V↓n2/←Ω); 
            →005259TEXT("Unity Check"); 
        } 
        IF(U↓2← &gt; 1) { 
            →004280TEXT("Plate Bolt Bearing Exceeded - Revise Design"); 
            →004281G_FAIL.Draw(1); 
            LimitExc →004282= LimitExc+1; 
        } ELSE { 
            →004283TEXT("Plate Bolt Bearing Sufficient"); 
            →004284G_PASS.Draw(1); 
        } 
    } 
    →001028BLOCK { 
        →012055TEXT("Bolt Bearing - Beam"); 
        →012045TEXT("_____________________________________________________________"); 
        →004741TEXT("AISC 360-10, Spec. J3.10"); 
        l↓c,end← →001067= 0.5*[(d↓beam←-(n↓v←-1)*s↓v←-[Hole↓v←+PhysConst(1, "in")/16])]; 
        l↓c,int← →001068= s↓v←-[Hole↓v←+PhysConst(1, "in")/16]; 
        IF(HoleTyp == "LSLP") { 
            V↓n,end← →001069= PARMIN(1*l↓c,end←*t↓w←*F↓ub←, 2*d↓b←*t↓w←*F↓ub←); 
            →004737TEXT("(J3-6c)"); 
            V↓n,int← →001070= PARMIN(1*l↓c,int←*t↓w←*F↓ub←, 2*d↓b←*t↓w←*F↓ub←); 
            →004740TEXT("(J3-6c)"); 
        } 
        ELSE { 
            V↓n,end← →001071= PARMIN(1.2*l↓c,end←*t↓w←*F↓ub←, 2.4*d↓b←*t↓w←*F↓ub←); 
            →004738TEXT("(J3-6a)"); 
            V↓n,int← →001072= PARMIN(1.2*l↓c,int←*t↓w←*F↓ub←, 2.4*d↓b←*t↓w←*F↓ub←); 
            →004739TEXT("(J3-6a)"); 
        } 
        
        V↓n3← →001073= V↓n,end←*n↓c←+V↓n,int←*(n-n↓c←); 
        IF(DesignMethod == 0) { //LRFD
            ϕ →004297= 0.75; 
            ϕV↓n3← →001074= ϕ*V↓n3←; 
            U↓3← →001075= V↓u←/(ϕV↓n3←); 
            →012626TEXT("Unity Check"); 
        } ELSE { 
            Ω →005278= 2; 
            V↓n3/←Ω →005279= V↓n3←/Ω; 
            U↓3← →005280= V↓a←/(V↓n3/←Ω); 
            →005282TEXT("Unity Check"); 
        } 
        IF(U↓3← &gt; 1) { 
            →004286TEXT("Beam Bolt Bearing Exceeded - Revise Design"); 
            →005958G_FAIL.Draw(1); 
            LimitExc →004288= LimitExc+1; 
        } ELSE { 
            →004289TEXT("Beam Bolt Bearing Sufficient"); 
            →004290G_PASS.Draw(1); 
        } 
        
    } 
    →012243PAGEBREAK(); 
    →000843BLOCK { 
        →012056TEXT("Plate Shear Yield"); 
        →012046TEXT("_____________________________________________________________"); 
        →004742TEXT("AISC 360-10, Spec. J4.2(a)"); 
        A↓gv← →004295= h↓p←*t↓p←; 
        →004744TEXT("Gross Area Subject to Shear"); 
        V↓n4← →004298= 0.6*F↓yp←*A↓gv←; 
        →004743TEXT("(J4-3)"); 
        IF(DesignMethod == 0) { 
            ϕ →004299= 1; 
            ϕV↓n4← →004300= ϕ*V↓n4←; 
            U↓4← →004306= V↓u←/ϕV↓n4←; 
            →004307TEXT("Unity Check"); 
        } ELSE { 
            Ω →005294= 1.5; 
            V↓n4/←Ω →005295= V↓n4←/Ω; 
            U↓4← →005296= V↓a←/V↓n4/←Ω; 
            →005297TEXT("Unity Check"); 
        } 
        IF(U↓4← &gt; 1) { 
            →004301TEXT("Plate Shear Yield Exceeded - Revise Design"); 
            →004302G_FAIL.Draw(1); 
            LimitExc →004303= LimitExc+1; 
        } ELSE { 
            →004304TEXT("Plate Shear Yield Sufficient"); 
            →004305G_PASS.Draw(1); 
        } 
        
    } 
    
    →001017BLOCK { 
        →012057TEXT("Plate Shear Rupture"); 
        →012047TEXT("_____________________________________________________________"); 
        →004745TEXT("AISC 360-10, Spec. J4.2(b)"); 
        
        A↓nv← →004312= (h↓p←-n↓v←*[Hole↓h←+(PhysConst(1, "in")/16)])*t↓p←; //must check
        →004746TEXT("Net Area Subject to Shear"); 
        V↓n5← →004313= 0.6*A↓nv←*F↓up←; 
        →004747TEXT("(J4-4)"); 
        IF(DesignMethod == 0) { //LRFD
            ϕ →004314= 0.75; 
            ϕV↓n5← →004315= ϕ*V↓n5←; 
            U↓5← →004316= V↓u←/ϕV↓n5←; 
            →004317TEXT("Unity Check"); 
        } ELSE { 
            Ω →005309= 2; 
            V↓n5/←Ω →005310= V↓n5←/Ω; 
            U↓5← →005311= V↓a←/V↓n5/←Ω; 
            →005312TEXT("Unity Check"); 
            
        } 
        
        IF(U↓5← &gt; 1) { 
            →004318TEXT("Plate Shear Rupture Exceeded - Revise Design"); 
            →004319G_FAIL.Draw(1); 
            LimitExc →004320= LimitExc+1; 
        } ELSE { 
            →004321TEXT("Plate Shear Rupture Sufficient"); 
            →004322G_PASS.Draw(1); 
        } 
    } 
    
    →000844BLOCK { 
        →012058TEXT("Plate Block Shear"); 
        →012048TEXT("_____________________________________________________________"); 
        →004748TEXT("AISC 360-10, Spec. J4.3"); 
        
        L↓gv← →004325= (h↓p←-[n↓v←-1]*s↓v←)/2+[n↓v←-1]*s↓v←; 
        A↓gv← →004326= L↓gv←*t↓p←; 
        →004332TEXT("Gross Area Subject to Shear"); 
        A↓nv← →004327= A↓gv←-[n↓v←-0.5]*[Hole↓v←+(PhysConst(1, "in")/16)]*t↓p←; 
        →004333TEXT("Net Area Subject to Shear"); 
        A↓nt← →004335= [[b↓p←-Gap]/2+[n↓c←-1]*s↓h←/2-[n↓c←-0.5]*[Hole↓h←+(PhysConst(1, "in")/16)]]*t↓p←; 
        →004334TEXT("Net Area Subject to Tension"); 
        IF(n↓c← == 1) { 
            U↓bs← →004329= 1; 
        } 
        IF(n↓c← == 2) { 
            U↓bs← →004330= 0.5; 
        } 
        IF(n↓c← &gt; 2) { 
            U↓bs← →004331= 1-(e/L↓gv←); 
        } 
        
        V↓n6← →004336= PARMIN(0.6*F↓up←*A↓nv←+U↓bs←*F↓up←*A↓nt←, 0.6*F↓yp←*A↓gv←+U↓bs←*F↓up←*A↓nt←); 
        →004749TEXT("(J4-5)"); 
        IF(DesignMethod == 0) { 
            ϕ →004342= 0.75; 
            ϕV↓n6← →004343= ϕ*V↓n6←; 
            U↓6← →004344= V↓u←/ϕV↓n6←; 
            →004345TEXT("Unity Check"); 
        } ELSE { 
            Ω →005332= 2; 
            V↓n6/←Ω →005333= V↓n6←/Ω; 
            U↓6← →005334= V↓a←/V↓n6/←Ω; 
            →005335TEXT("Unity Check"); 
            
        } 
        IF(U↓6← &gt; 1) { 
            →004337TEXT("Plate Block Shear Failure - Revise Design"); 
            →004338G_FAIL.Draw(1); 
            LimitExc →004339= LimitExc+1; 
        } ELSE { 
            →004340TEXT("Plate Block Shear Sufficient"); 
            →004341G_PASS.Draw(1); 
        } 
    } 
    →012244PAGEBREAK(); 
    →004374BLOCK { 
        →012059TEXT("Plate Buckling"); 
        →012049TEXT("_____________________________________________________________"); 
        →004750TEXT("AISC 360-10, Part 9, page 9-8"); 
        double π →004376= Math.PI; 
        F↓cr← →004375= MIN(0.62*π*E↓p←*(t↓p←↑2←/(e*h↓p←))*3.5, F↓yp←); 
        →004751TEXT("(9-12)"); 
        S↓net← →004377= t↓p←*h↓p←↑2←/6; 
        M↓n7← →004378= F↓cr←*S↓net←; 
        →004752TEXT("(9-6)"); 
        IF(DesignMethod == 0) { 
            
            ϕ →004379= 0.9; 
            ϕΜ↓n7← →004380= ϕ*M↓n7←; 
            U↓7← →004388= M↓up←/ϕΜ↓n7←; 
            →004389TEXT("Unity Check"); 
        } ELSE { 
            Ω →005349= 1.67; 
            Μ↓n7/←Ω →005350= M↓n7←/Ω; 
            U↓7← →005351= M↓ap←/Μ↓n7/←Ω; 
            →005352TEXT("Unity Check"); 
            
        } 
        IF(U↓7← &gt; 1) { 
            →004390TEXT("Plate Buckling Failure - Revise Design"); 
            →004391G_FAIL.Draw(1); 
            LimitExc →004392= LimitExc+1; 
        } ELSE { 
            →004393TEXT("Plate Buckling Sufficient"); 
            →004394G_PASS.Draw(1); 
        } 
    } 
    →004399BLOCK { 
        →012060TEXT("Combined Shear and Bending on Plate"); 
        →012050TEXT("_____________________________________________________________"); 
        →004755TEXT("AISC 360-10, Part 10, page 10-104"); 
        A↓gpl← →004406= h↓p←*t↓p←; 
        Z↓pl← →004407= t↓p←*h↓p←↑2←/4; 
        IF(DesignMethod == 0) { 
            V↓r← →004402= V↓u←; 
        } ELSE { 
            V↓r← →012506= V↓a←; 
        } 
        V↓n← →004412= 0.6*F↓yp←*A↓gpl←; 
        IF(DesignMethod == 0) { 
            ϕ↓v← →004405= 1.0; 
            V↓c← →004413= ϕ↓v←*V↓n←; 
        } ELSE { 
            Ω↓v← →005364= 1.5; 
            V↓c← →005365= V↓n←/Ω↓v←; 
        } 
        
        M↓r← →004403= V↓r←*e; 
        M↓n← →004410= F↓yp←*Z↓pl←; 
        IF(DesignMethod == 0) { 
            ϕ↓b← →004404= 0.9; 
            M↓c← →004411= ϕ↓b←*M↓n←; 
        } ELSE { 
            Ω↓b← →005368= 1.67; 
            M↓c← →005369= M↓n←/Ω↓b←; 
        } 
        →004754TEXT("(V↓r←/V↓c←)↑2←+(M↓r←/M↓c←)↑2←  ≤  1.0"); 
        →004753TEXT("(10-5)"); 
        U↓8← →004414= [V↓r←/V↓c←]↑2←+[M↓r←/M↓c←]↑2←; 
        →004415TEXT("Interaction Unity Check"); 
        IF(U↓8← &gt; 1) { 
            →004416TEXT("Shear Buckling/Flexural Yielding Failure - Revise Design"); 
            →004417G_FAIL.Draw(1); 
            LimitExc →004418= LimitExc+1; 
        } ELSE { 
            →004419TEXT("Shear Buckling/Flexural Yielding Sufficient"); 
            →004420G_PASS.Draw(1); 
        } 
    } 
    →004501BLOCK { 
        →012063TEXT("Beam Shear Rupture"); 
        →012053TEXT("_____________________________________________________________"); 
        →004829TEXT("AISC 360-10, Spec. J4.2(b)"); 
        A↓nv← →004502= [d↓beam←-n↓v←*[Hole↓h←+(PhysConst(1, "in")/16)]]*t↓w←; //must check
        V↓n9← →004503= 0.6*F↓ub←*A↓nv←; 
        →004513TEXT("(J4-4)"); 
        IF(DesignMethod == 0) { 
            ϕ →004504= 0.75; 
            ϕV↓n9← →004505= ϕ*V↓n9←; 
            U↓9← →004512= V↓u←/ϕV↓n9←; 
            →004506TEXT("Unity Check"); 
        } ELSE { 
            Ω →005454= 2; 
            V↓n9/←Ω →005455= V↓n9←/Ω; 
            U↓9← →005456= V↓a←/(V↓n9/←Ω); 
            →005457TEXT("Unity Check"); 
        } 
        IF(U↓9← &gt; 1) { 
            →004507TEXT("Beam Shear Rupture Failure - Revise Design"); 
            →004508G_FAIL.Draw(1); 
            LimitExc →004509= LimitExc+1; 
        } ELSE { 
            →004510TEXT("Beam Shear Rupture Sufficient"); 
            →004511G_PASS.Draw(1); 
        } 
    } 
    →012246PAGEBREAK(); 
    →004451BLOCK { 
        →012061TEXT("Beam Block Shear"); 
        →012051TEXT("_____________________________________________________________"); 
        →004826TEXT("AISC 360-10, Spec. J4.3"); 
        L↓gv← →004698= (d↓beam←-[n↓v←-1]*s↓v←)/2+[n↓v←-1]*s↓v←; 
        A↓gv← →004699= L↓gv←*t↓w←; 
        →004700TEXT("Gross Area in Shear"); 
        A↓nv← →004701= A↓gv←-[n↓v←-0.5]*[Hole↓v←+(PhysConst(1, "in")/16)]*t↓w←; 
        →004702TEXT("Net Area in Shear"); 
        A↓nt← →004703= [[b↓p←-Gap]/2+[n↓c←-1]*s↓h←/2-[n↓c←-0.5]*[Hole↓h←+(PhysConst(1, "in")/16)]]*t↓w←; 
        →004704TEXT("Net Area in Tension"); 
        IF(n↓c← == 1) { 
            U↓bs← →004705= 1; 
        } 
        IF(n↓c← == 2) { 
            U↓bs← →004706= 0.5; 
        } 
        IF(n↓c← &gt; 2) { 
            U↓bs← →004707= 1-(e/L↓gv←); 
        } 
        
        V↓n10← →004708= PARMIN(0.6*F↓ub←*A↓nv←+U↓bs←*F↓ub←*A↓nt←, 0.6*F↓yb←*A↓gv←+U↓bs←*F↓ub←*A↓nt←); 
        →004827TEXT("(J4-5)"); 
        IF(DesignMethod == 0) { 
            ϕ →004709= 0.75; 
            ϕV↓n10← →004710= ϕ*V↓n10←; 
            U↓10← →004711= V↓u←/ϕV↓n10←; 
            →004712TEXT("Unity Check"); 
        } ELSE { 
            Ω →005393= 2; 
            V↓n10/←Ω →005394= V↓n10←/Ω; 
            U↓10← →005395= V↓a←/(V↓n10/←Ω); 
            →005396TEXT("Unity Check"); 
        } 
        IF(U↓10← &gt; 1) { 
            →004713TEXT("Beam Block Shear Failure - Revise Design"); 
            →004714G_FAIL.Draw(1); 
            LimitExc →004715= LimitExc+1; 
        } ELSE { 
            →004716TEXT("Beam Block Shear Sufficient"); 
            →004717G_PASS.Draw(1); 
        } 
    } 
    →004487BLOCK { 
        →012062TEXT("Beam Shear Yield &amp; Shear Buckling"); 
        →012052TEXT("_____________________________________________________________"); 
        →004828TEXT("AISC 360-10,Spec. G2.1"); 
        →004488A↓w← →004489= d↓beam←*t↓w←; 
        →004552TEXT("Area of Web"); 
        h →004516= d↓beam←-2*k↓des←; 
        →004527TEXT("B4.1b.(a)"); 
        ht↓w← →004520= h/t↓w←; 
        IF((h/t↓w←) &lt;= (2.24*SQRT(E↓b←/F↓yb←))) { 
            ht↓w2← →004521= 2.24*SQRT(E↓b←/F↓yb←); 
            →004526TEXT('h/t↓w←' &amp; " ≤ 2.24√(E/F↓y←)"); 
            →004525TEXT("(G2-2)"); 
            →004517TEXT('h/t↓w←' &amp; " = " &amp; h/t↓w← &amp; " = " &amp; ht↓w← &amp; " ≤ " &amp; "2.24√(E/F↓y←)" &amp; " = " &amp; 2.24*SQRT(E↓b←/F↓yb←) &amp; " = " &amp; ht↓w2←); 
            C↓v← →004523= 1; 
            →004550TEXT("(G2-2)"); 
            IF(DesignMethod == 0) { 
                ϕ →004524= 1; 
            } ELSE { 
                Ω →005417= 1.5; 
            } 
        } ELSE { 
            IF(h/t↓w← &lt;= 1.37*SQRT(k↓v←*E↓b←/F↓yb←) &amp;&amp; h/t↓w← &gt; 1.1*SQRT(k↓v←*E↓b←/F↓yb←)) { 
                →004528TEXT("Does not meet criteria stated in Section G2.1(a)"); 
                →004530TEXT("1.1√(k↓v←*E/F↓y←) &lt; h/t↓w← ≤ 1.37√(k↓v←*E/F↓y←)"); 
                →004531TEXT(1.1*SQRT(k↓v←*E↓b←/F↓yb←) &amp; " &lt; " &amp; h/t↓w← &amp; " ≤ " &amp; 1.37*SQRT(k↓v←*E↓b←/F↓yb←) &amp; " = " &amp; ht↓w1← &amp; " &lt; " &amp; ht↓w← &amp; " ≤ " &amp; ht↓w2←); 
                ht↓w1← →004534= 1.1*SQRT(k↓v←*E↓b←/F↓yb←); 
                ht↓w2← →004535= 1.37*SQRT(k↓v←*E↓b←/F↓yb←); 
                →004529TEXT("Web shear coefficent (C↓v←) must be adjusted for inelastic web buckling"); 
                C↓v← →004536= (1.1*SQRT(k↓v←*E↓b←/F↓yb←))/((h/t↓w←)*CUnit(F↓yb←, "ksi")); 
                →004548TEXT("(G2-4)"); 
                IF(DesignMethod == 0) { 
                    ϕ →004537= 0.9; 
                } ELSE { 
                    Ω →005428= 1.67; 
                } 
            } 
            IF(h/t↓w← &gt; 1.37*SQRT(k↓v←*E↓b←/F↓yb←)) { 
                →004538TEXT("Does not meet criteria stated in Section G2.1(a)"); 
                ht↓w2← →012516= 1.37*SQRT(k↓v←*E↓b←/F↓yb←); 
                →012518TEXT('h/t↓w←' &amp; " &gt; 1.37√((k↓v←*E/F↓y←)"); 
                →004539TEXT('h/t↓w←' &amp; " = " &amp; h/t↓w← &amp; " = " &amp; ht↓w← &amp; " &gt; 1.37√(k↓v←*E/F↓y←)" &amp; " = " &amp; 1.37*SQRT(k↓v←*E↓b←/F↓yb←) &amp; " = " &amp; ht↓w2←); 
                →004545TEXT("Web shear coefficent (C↓v←) must be adjusted for elastic web buckling"); 
                C↓v← →004546= (1.51*k↓v←*CUnit(E↓b←, "ksi"))/([h/t↓w←]↑2←*CUnit(F↓yb←, "ksi")); 
                →004549TEXT("(G2-5)"); 
                IF(DesignMethod == 0) { 
                    ϕ →004547= 0.9; 
                } ELSE { 
                    Ω →005596= 1.67; 
                } 
            } 
        } 
        V↓n11← →004491= 0.6*F↓yb←*A↓w←*C↓v←; 
        →004515TEXT("(G2-1)"); 
        IF(DesignMethod == 0) { 
            ϕV↓n11← →004499= ϕ*V↓n11←; 
            U↓11← →004500= V↓u←/ϕV↓n11←; 
            →004492TEXT("Unity Check"); 
        } ELSE { 
            V↓n11/←Ω →005441= V↓n11←/Ω; 
            U↓11← →005442= V↓a←/(V↓n11/←Ω); 
            →005443TEXT("Unity Check"); 
        } 
        IF(U↓11← &gt; 1) { 
            →004493TEXT("Beam Shear Yield Failure - Revise Design"); 
            →004494G_FAIL.Draw(1); 
            LimitExc →004495= LimitExc+1; 
        } 
        ELSE { 
            →004496TEXT("Beam Shear Yield Sufficient"); 
            →004497G_PASS.Draw(1); 
        } 
    } 
    
    →012247PAGEBREAK(); 
    
} 

→012460BLOCK { //Summary
    IF(DesignMethod == 0) { 
        →011346TEXT("Limit State Check Summary (LRFD)"); 
        →012602TEXT("________________________"); 
    } ELSE { 
        →012624TEXT("Limit State Check Summary (ASD)"); 
        →012625TEXT("________________________"); 
    } 
    object ExtTables →011320= LoadExternCLC("LimitStateCompTables.CLC"); 
    object TableCellsFont →003272= new Font("Tahoma", Convert.ToSingle(9), FontStyle.Regular); //Table font
    object TableHeaderFont →003273= new Font("Tahoma", Convert.ToSingle(9), FontStyle.Bold); //Table header font
    object TableBorderPen →003274= new Pen(Color.DimGray, 1); //Pen for outline of the table
    object TableGridPen →003275= new Pen(Color.LightGray, 1); //Pen for grid inside of the table
    double TableWidth →011319= 585; 
    
    ExtTables.DesignMethod →012627= DesignMethod; 
    
    →011345ExtTables.TableLimitStates(double s↓v←, double T↓beam←, double h↓p←, double s↓h←, double s↓min←, double t↓p←, double t↓maxp1←, double t↓maxp2←, double b↓t←, double b↓tmax←, double t↓c←, double t↓cmin←, double V↓u←, double V↓a←, double ϕV↓n1←, double V↓n1/←Ω, double U↓1←, double ϕV↓n2←, double V↓n2/←Ω, double U↓2←, double ϕV↓n3←, double V↓n3/←Ω, double U↓3←, double ϕV↓n4←, double V↓n4/←Ω, double U↓4←, double ϕV↓n5←, double V↓n5/←Ω, double U↓5←, double ϕV↓n6←, double V↓n6/←Ω, double U↓6←, double M↓up←, double M↓ap←, double ϕΜ↓n7←, double Μ↓n7/←Ω, double U↓7←, double U↓8←, double ϕV↓n9←, double V↓n9/←Ω, double U↓9←, double ϕV↓n10←, double V↓n10/←Ω, double U↓10←, double ϕV↓n11←, double V↓n11/←Ω, double U↓11←, double TableWidth, object TableCellsFont, object TableHeaderFont, object TableBorderPen, object TableGridPen, object G_FAIL, object G_PASS); 
    
    
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" NAD="" LicenceID="50320" Autor="" Autor2="" Version="1" EWNSource="" Icon="/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCABkAGQDASIAAhEBAxEB/8QAHQAAAgMAAwEBAAAAAAAAAAAAAAoICQsEBgcFA//EADQQAAICAgEEAgECAgkFAQAAAAMEAgUBBgcACBMUCRIVChEWJBchJjEzNlNjcSIlQkSDI//EAB0BAAICAwEBAQAAAAAAAAAAAAAIBgkFBwoDBAH/xAAvEQACAgIBAwMDAwQCAwAAAAABAgMEBQYRAAcSCBMhCRQiFRYxIzJRcRhCJEFS/9oADAMBAAIRAxEAPwB/jo6Ojo6Ojo68b575/wCJe2XjHYOXuadxrNL0nXgzyRx4w/euLPK7LKWua3W/eLd/s1tFQ8KqkroGdbyIxcDgsuycKd3ed+oB7j+Y2LnTO2tYPb9x5kxVB7VWMSt+U79UZEZQcHsTiSYNRCcyrJABo6pW5Gi967VvIkZRjDds3vXtOiU5Wyz3JUL18bUUTXZl5ID+BZI4IiwIE1iSJGKssZd1K9Mp6fvSh3i9SN+VNCwkNbXKNlauY3XYJpMdrGMm4R3rC0kNi1k8gkUkcjY7EVL1qJJYZbaVa8qz9OEcz9yfAfbvTM33N3Luh8apLV8bTwbNsCSt07XzeFWxZqNbGQ2w3cJPmGpiNPVvT82cw+n7wn9azt9+e/46dItW6qv3vfuQ5KGTF7+hcd2rVUyNtAb0mVHtmY1cZwpzJGvcjjEWIPxIMS5gDIzFDC5u7nY7R282G3s766sjZZsbi5fatLSwYliMZMO2DxTttGzGMY5KcxCZxGOMy/bGOubVantV8vNyj1nYLlQZpLEaqqaxsVxsQgMs15nTWMKJoiMEkhSlgkYFHPMcRnHOdD5Hv1sNqUphcJj6kfPKiybOSssq+XJJianGoYFCVET+BBHuMCCLYNP+kz2fwFBLPc/uht2w2yoWV8IuF0rDRTSCApGoyEOyXZzG62I1la/W+5SWNvtYHiId4lb9RB8fR2FwFDzumIxhCI4zxtVzXVGQkYTZYinuTTcggjnJSxVVZYzCMsAXMXMRylPxP8wXx28wTqk6LuO1zWbu2sIVa9DyNU7Hx+6N01gvXqCM/stSlrsoOzcUOBha7YWisYsmTLlQtBI5/dvwrzJr/r/nuJeTaT2/N6n5fQ9prfa9fxef1/dqg+bw+YPm8f28flF9/r5Ifv5yyswmwwm4uZVtUxVmlWREAwswAkhHXYAWMChMEsZDKIkYkGSMoTjiWM4x8kXfHdacqm/i8TLETwY5KV2o5/g/hILZCtx/9RuPy58T8cSG99LP0xbFSkTUd87gUryKXjuU9n1fYayf3oDZpnX0eSL3OORFdqMWj8BKvLc6tFPdU+w1y9xQW1ZeVLnm9S0p31bOua9c5VT+u6kU6x/AyAy5vEWXjOEoZ/Ug5xx9LrMz7Ze+Puf7RbQbnCPKuxa9SzsEbGz0Zt92x0K9NXslbXjbaxNoak4SOcuWppSSYdCUyjZzJsMLlb5+PX5weGu7GwQ4z5uU13gXmhyDMKgbF03nj3djKQYbPCmvbhUK+sWEkYD9Gjv7tti0bA4sg8ZqVeo7t3UO7uu7NJDRthsJlZSqR1rcqvVsyseBHVuhY0Z2JASKwkEjsfCJZWAJrs9RX07O8vY6nkNowDRd0dBoLNZt5rX6UtbO4ahEvm1vPaw01uzFXhRZXs3sTay9GrBEbV+ajGxSO9Po6OjrbHVfvR0dHR0dHR1HLuq7oOMe0HhnYuauVn5q0NRMdbVV4Pt7ux7M6s2xU67XywMsRtPxRaJkkoEyNZZiYAONYXSZkb0hz82vfXd9y/cVZ8TavYWaHEXDZia8lXgesBVO33fkhYG2xuqfRr2wOTiwFXImABHEaKAPWOWqDcWMH7gbfFpuAmvjxfIWGNXFwOpZZLbqW9yQAj+lXQGWTlh5cKg5ZwC0fpE9Ot71J93cZqDmerqWIiXP7zk4JFhlqa9WnijarVkZZPHIZaw8ePpFYpDE0slp1WGtK6Qc75O+Tlrvl5asOQOQLAyWtpGMto2jLGJGm1amiQuFQhVwUgpOyEScjnlMxMEMxKTDLLLzz0QdcrE7vYaGmsLlLXULe6q6x7YLKJZ11Em+8BVm5fgDEjTSrAlm61EMclkABMDxmecY6kl2jdnvL/eZyFa6FxPTON51zWbPbNpvY1b9hW0NUgAklhs5THmM7O5bh6VJU4MN+4PBkVUB5pf1CeKcn8Ybpw7ultoO/VP4jY6j1iGCNld1NtN1cbaFhXvqEKs4k4sWBITHPBQFwZJ0Ktiq2ouleRGbyA/c2VitW4MjdlRshOH9mzYiKtLAJFI8AqkIip4KqqyRfMTBOnHTZO2Gosex2gZDA6/lNN1qjYh1DFvX/UcJiL6yxUMo9OZXFmSWVDasS2PuJpZZobWQBW/BJYeN7Ofhi+PfQNA1jdMVY+6C2vlkNgrOUdysGo1JvrJ+SrOr6rQvqVVGMMW4COtZyubhOzrAEM6tYpeMFxGq6Ho2iLkT0jTNU01QwUljK6rrtPry5V62BRVy5AVCaYphQEcw0hSjkasDFgCI4knjKMHxR/LNs3Zhs0OM+Y7a82jttvprwnX4Fm0d42dHk/lv9bXAsS0ZGyEgF3qnB2FjrV6SayqmcCfr3qNS23Wd81mk3LTbuv2PV9jrwWlJd1Z8MJWCTGP3gUU8ftKE4SxMLC5oDZUZGZVoIWQlFBwe2ma1PNYaNtfxtDEW6qJHkMbDFEtqvJ+SrK8oBntQTEOYrUru7gskpEodeucX1t9tPUF2z7k24e8G6bV3DwOfs2reobrkbt+bB5imDBNLRr49mXGYPJ4wGrHkcFRr16tZkgnoJJQkqzN+1/rGt7WmKu2nXqPZK8LMHQo39ShcJicGIwBtiVsV2QDZGBlgMDxhgsRHMOM8QLPEoa8//HT2pdw1Y8DbOLdZRuT+sVO5r6lWQkT1ybK9aEVMTGK9KsGwx7lgvrsdesbKUnRyuAYt7abk5ujqf3MfRyETw3ada1FIPF0nhSQEcEf9lJB4JAIII5PB6UfXtu2nUr1fJaxsOZwN6pJ7lezisjapPG/krkgQSorBnRGZXVkcopZT4jhI/vp+Cnk/gutt+QuDnIbpo9bOZWKxh0hX4K5hhSsWT+683g3liwmVppW1zjXht3dXR1e1O2eV0nF/P+401j/7tVbVTv8Avo2NbYon/wDkym6myL/bOucf/gSH9WrU6knZJt11ios/XvrHSeRdAJpN1NoUwNKNqngQDKzICTCcBoTEYU5jJCUJZxlVn5mPi2cfUrObOFFUjnSM7W5oyZFG9txnWlYrakZ45cM2x6lass2dKsD5OwZMljr18zh4FJZ3C6dxu0VepXmzmqxSRiEe7axUY8wR5rzJT/JWj8FJb2VDliAIwGPzcz6MPqJ5bPZjGdrO/mQqW/1NxRwe/XWFd0b2JvClsh9qWO4bUwihGSmev7IkeS5JJGpKd8+FD5Y7XlRnWOz3uIvDWvIGQ2CnE/INqZBc2xJVyjtqHTLckYIgK7XVas0NdzGBbNqCqiGM2eWMfiGc+spKkubTXLmo2GjdNW3VDZoXNPYrZxFivtKtoT1e6vKUZRwZVsATizKMsYIOOcxzj+rrRj+MfvTB3y9q+qcoW5qkPJ9AyzpfLtNVDAkujuVTEZI2ilVCxsWUKnZ6k6F3X4YkGHmYfTWHgaEsRkPZvfps5XfWsvO02Tx8AloWpW8pLlCPwjeKVmPlJZqEqfcYs80D+TflA7vp76kvpIxnazMVe9fbrGQ4/R9uyjUNrwVGARU9a2u4Z7Ve9QghUQ1MJn0SdBUjjirYzKV/ZhPs5SpWrWFdHR0db26ql6hF8inOQO3ztG5a32c2Rskom6NCQK4FmIp3kHm2691Y5wSitdVFdZUcGFyDOs5ZKGi1WDgS3r82mysHLexftbA3sP2brVg8x4xC87jpyMsm8QICCLymLOfjCMYofb6jhCGMRw6z+or2pxLtX1bVa+88QLfZlWdj18TYp+wmK81w+v2D9dmU5i+r9ZaDqbLIhFz4LpJRjIS2gCJmccap/HfIeh6P5vW/jLc9X1T2PJ4fB/EV4jUeby+s54vF7n38nqNfT6/b1j/t4pKX3yv2L214/DpyYqdGExL5cK9i/K3kSOfHkCONPI/kPyX4AHPQl9K3UsTq3YDcu49kIt3Y9qya35vZBmr4fU8fC0KLIVEhWV7lywYUPtMFgkBZ2IR8z4R+1Wu7buyXTNndRZByF3BDT5X3Q1hXWNU+tXPrTFo2vTTsS+TC1RrhI2AmIKpwbcvrBgcTrEWYJ+vyWfGhofdhpVvstBQBDvqAbe0XlWpELaKXbycxH2zWlE2q8tjZFLBZva9Km2Kt3+KKrwoB3RBFq1tqpaeu16nqaCnX9Opo6xCnq1PMdj1a6sVEkiv52inZP4FgCF5mDGOT6/cxSElKefpdMdFqmI/bNXV7FWGbH16MNQoUHBeNB52F8uSJZJvOdn/uMjlieST1S7d7/wDcM97s931xGdyGM3DMbRkNhWzHYYNHWtWH+2w8ntlUfH08aIMVFWC+ylKCOBUEahest/mvg3kHgHcS6ZyDXBA3IOG6u4rSMNa/sCGc4jl+ksGFUyshGXOQsBYVVdUNjxtqAlIf3tW+KP5Ztm7MNmhxnzHbXm0dtt9NeE6/As2jvGzo8n8t/ra4FiWjI2QkAu9U4OwsdavSTWVUzgT9ezD8jvxxaN3S6NfXFPQ/2l/mbh5GnWH+YxceOWZ7hp8MR/zL/fLYNfjj1d2V8pBi/iX7R2BE7nTgvee3/eXNK3VP/Uaob5UZPw+zU/kzANpVmnj/AIG6kTPtVzX2XYj/AIZCq3sWu7D2qz8OZw08poiQmtZIZ4mjc8NTvxqVWWGQELwxH5ePysyxSvfD2c7y9nvX52kyXbXuZi6CbSaajMYVWhr5CG3XXzh2XUrc0c0lDJVGUykwK/8AS97mOfGzX6NfT41LbdZ3zWaTctNu6/Y9X2OvBaUl3VnwwlYJMY/eBRTx+0oThLEwsLmgNlRkZlWghZCUUOxdIOfFH8rmzdjGzQ4z5Lnebf20bfeLmt6gLGXXeLHXcnhZblptbMBDsjZORNnY9cWcWWsFlnHkUzbAaE2Hu9J3bUeSdR13fdC2Kp23TNtqU73W9konBP1NxUviwZV1NoOcwmOcM/WcJfUoCxIA4xHEQcWT0fecZuuNFisVrZKuqjJYxn8pazkkCSMkKZqspHMUyr8c+3KElVl6pQ9UvpY3j0xbo2HzSTZnTMvNNJpe8Q1vZo52rGqSSU7cSSTrjM9QVxHkMZNL5N4i7SaxQminPaOutbjqdPvWrX2oX4fPU7DWM1rf1GqQ6/nh/wDg+l7qziwbOsZiGxq2irH9KxVVbgPJAQ67L0dTVlV1ZHAZXUqykchlYEEEf+wQSCP8dLFDNLWmisQSNFPBLHNDKh8XilicPHIjD5DI6hlI/ggHrN6+STt1J26dz27Ui34/8Ls1rd3Sg6wkpoo3al29U7fXKQKJQ8a+OwqNWlRjKCa4aa2rkAjwZBoYbKf05PP9to/dNvvb+XHsazzpoxLuECHLj8dt3FYLS4rm1QxSaj/Pa7cbMq/jLVYI/grSHO2dCvUl7T+pG4/TQ23ije1QMnPYlFGxdO2LxIOX1O9UQr0kx+Ccln6/i1FyZTieKu4o3+zqwHgpypS+NTZltQ7+e0u+duK+gRX5t0xN+1tGUk69avuX8Ur0WWrHMVF4NKWBlImJOExzPCS5BsYFOKb2Iv2Z3driofbgTO1CoDBB9nlSkNtD5AoiGOzYUKOVRPFQyleV6TcLf/5LfTszDbGpt5Wx2rzyyySRNZk/cOhJPk9ftKIZUsWLKWsJiJpJW9uW1YEsjwzRzeM2lB0dHR05XXNb0tD+oqp7EHE9DflX+tTZi02nSb8wJeexo9q2B20X8ES5ZH6q2w05fMYIwH9z6LlMRdqAFNuA7BOo514WtbA3roVnLPHNg8x4yl8CaW4UzLJvECBTF8QRTn4wjIWf1+o4TnnEcu9/OlxTYckdoVg6mlCylrQ7w6iS2ITu83Ifwu5InqRGUOKcMVuh3aVjABg2jS78aysEwawJkCGKzLCbC7ibBlW1TCZVaWKQDCzACRKBhc4pQKEwSxiQRRyiQZIxnCWJYxnCf954no71XulCYnqUp4yf+7QTPJKgPAHwzqP55AYc/wCT0Z/TQv1dq9KuZ1lbEceQg2LZsXcWM/NaDJ4unRx87qWdwZIa0jklfF3jcoOOUTV66Oox9mnP9Z3PdsfDXNKL3u2G36NQm2yBFk69pLdVa5dba1WqtFlsFX97kbLyCuC/UlO5Wugj6ra8pSc6bmrZhu1q9yu4eC1BFYhcccNFMiyRt8Ej5Vgfgn/fXPDncLkdbzeX17L12qZXB5O9iMlWcMGgvY6zLUtREOqt+E8LqCVUkAHgc9HVS3yO/HFo3dLo19cU9D/aX+ZuHkadYf5jFx45ZnuGnwxH/Mv98tg1+OPV3ZXykGL+JftHYLaejr5criqOZoz4/IQJPWnRkdHUNx5AjyXkHgjn/RHweQes5oe+bP222fF7dqOUs4rM4mzFZr2K8rxeZikWQRye2ylkYqD/ACGVgHQhgD1lv838JbrwLvlro25omxJU0pU1+JJwFJtNXIYDgtaNtoIxOBwJkIXxrkPmrsos1bc8Nqljizf4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbRoD5Hfji0bul0a+uKeh/tL/M3DyNOsP8xi48csz3DT4Yj/AJl/vlsGvxx6u7K+UgxfxL9o7AidzpwXvPb/ALy5pW6p/wCo1Q3yoyfh9mp/JmAbSrNPH/A3UiZ9qua+y7Ef8MhVD2TWtg7W5+HM4aeUUxMzVLaqzRiJ2/KjdQkiWCReI2Dn8zxyVlEUjdE/ZTvb2h9efaPJds+5WLpPskmPijz+AmkihuPdrQf0tp1eysaNQylOb3LcRqoTXUyFUnx736kGnlpO7ajyTqOu77oWxVO26ZttSne63slE4J+puKl8WDKuptBzmExzhn6zhL6lAWJAHGI4iDj2jpBb4pPlb27sY25fjbkli223td222wW+oRZK/bcYWz5YxY3fSF5SzOak55wfatVBmIrkUZ2VbAV8KUbR8HSd21HknUdd33Qtiqdt0zbalO91vZKJwT9TcVL4sGVdTaDnMJjnDP1nCX1KAsSAOMRxEHFldG3nG7tjRYrla2SrKi5LGs/MleQ/AliJ4MtSUgmKUDkHmKULIpBpM9VHpX3X0w7q2Iy6zZnSszNYl0rdYq5jqZinGfNqF9U8o8fsOPjZFyGPZ/F18btJpqUyOqvv6ky4XVqOKKbJA+9bs6myIBUhsEkhVf0uZdYWaKuWKBgtvVYpFXOq6ddphUciolsRZXH7KNIY5I7wO2HSFXw1Zdi544sTlYsBIzBJeG5VDTjMVhyHJowlFzyWVyZYbLGBAK2oIk2RWt/qDee/6Q+66v4prLb8lR8WUohHh+I9H07hkcVG6j3WALNv/ibdfZGPPAU1S/m/2FZWSoUAVMcPhI4XuOXfkM4bsVE2SUfEkrnlbZbGNJ+Yrq4Gu1jK9HCwJNlUFWSx2awqEqyxlI51bGYGFkzzBKQlx20psHd2OnWVrEZzeLx7hSOGWCaH7sqyuQEjHvEuCpARm4BHJuj9PQsdovp3W9kzUsOJsjtjvW3V3njZjFNk8dkF15J4JKys1m4642OOBknEjWIY/NlbwTQW6Ojo6cbrm368v5q44X5c4r3bjpmQcR2ammsvFvI8IFsE2AWdWva4IjZYnTM2SSi9yKCLBzVRHBLxieYyQzS+5zhO47e+bd64uuE2UfwdswSsA6D1HIVDJiySE2gSws3UGU/oVA6lozi0GVScnQhLPMMagnS4fze/Hj/S5q+eeuOae2a22iHZuM19HWU+FZWLuKgR6976HrjzW3A60nlnmYmnX7hGwlJ153d1amWnu8Wny7FhI8lRiMuSw/nIqKOXmpv8zxKP55BAkUKCWdVB8U8mFjv04PUbS7N90bembTfWlpXcj7anPZmYJWxuw1+UxWRmY8KI2V3pTPJIiRV55pFEs4hhkgr8BvyKV/E2zOdnHMew19Pxzu1hY7DxDfPpzgOg5CeyqS51i1u4HivXa7siKh7NFixVwohsC7EC2Kw7nEYuTdZRn/caax/92qtqp3/fRsa2xRP/APJlN1NkX+2dc4//AAJD+pvn4tfnK1/cavTO3rvQ2INLvoTKatqPPFwwaNXumD5WU15Lkc8U5qU2wQlgyNlvlk+nV2spVTd5ANgW8vjQ7tF3JrQVodT2G0tZoCIsNesMViMZbgY2xK7cRPEx4ps/jEYv/GLI0cKysj9RL0T5zKZvI+oHs9hJczDlY2v9ydWw8AmvxXI4vOXdMPRrRed+tehT3djgg966l3nNJHZgt5GSgz10dcZJ1OyTUsa5tZ+vfWA6i8kcTSbqbQoHVbUaBMgGVmQEgYBwzmIwpwIOcoSxnPJ6ZIEEcg8g/II/gj/PVKTKysVYFWUlWVgQysDwQQfkEH4IPyD8Ho6qW+R344tG7pdGvrinof7S/wAzcPI06w/zGLjxyzPcNPhiP+Zf75bBr8ceruyvlIMX8S/aOwW09HWOyuKo5mjPj8hAk9adGR0dQ3HkCPJeQeCOf9EfB5B6mGh75s/bbZ8Xt2o5SziszibMVmvYryvF5mKRZBHJ7bKWRioP8hlYB0IYA9ZcvOnBe89v+8uaVuqf+o1Q3yoyfh9mp/JmAbSrNPH/AAN1ImfarmvsuxH/AAyFnl8fHyvc39idPtfHaXk3jiLaFnmq7VrI0Ttce7c1+0pbXo+XczSXk9+0429A8MtE89Ja7MmVtV1W4Yr+a3hvtDW4iud35W3PUNH22znl2o1TLeI7nsO1P+ytX7XodLVpWt2OwM8CYtyLmpnq9tWjdtbhlK3UaLeI+dJntGKv9stqVsJlljlKSS1mgmVrMNaU+LV7sPLH2pAeIxMOZAhYcvEsrdK/YnfdS9cnYOev3R7fyW6SWamPzaZTGz18NkszRX3osxrWR8IVW/TkXyttjJPCobKROVq5CTHx9z5E3i45K3nat8vp+S22q6ct2/8ApVj4/YJnwL/ySiC0/VWiFbyjTX8/i80xRISfTj/6eTtHPxVwbuHctttJ6m2c5/jqzT2242IHlONagxXY4WAYUKxms2eznX3I7VFhubOUQVrA0GKg8GlyfjU+Pveu/jm4GtKrO03D+l+vcctb/ILQ0KmuJLOK/W6xoYJBd2zYzRlivpsNJHlVKXFnl1MVfk+NEvXNeptS16i1TXK8NTr2s01Xr1DVLZJlespqVEFbV16+SzIXIU0VgLCyQhCZGOP3nKX7yzP+yepWbuRsbplI3MUTTx4x5l/K3dseaXLq+QHKwqzwrIOVeaaUKQ8DcKP9T71BYPWtMw/pk0W1WS3dixVzeKuNmAi1/WsOKs+s6vMImYRzZKaCtkpqblJq+Nx2PeVWr5WPy+z0dHR0z3VF/R1xnUk7JNuusVFn699Y6TyLoBNJuptCmBpRtU8CAZWZASYTgNCYjCnMZIShLOM8no6CAQQRyD8EH+CP8Hr9VmVgykqykMrKSGVgeQQR8gg/II+QfkdKq/Kv8Mrmy3rvN3bagBc7/uO7PTni+RQYk02HmJ3TCSlgyvlZZUn47b3A5TOsPFZur6jyyOyXipOz6psul3LmvbZR2evXSBmF2q61UMmxAirTCJ5QiWOInDFtVkEWQSKuUgCYEWeI5z1qwdVzd1nxd9qnddVkhsuj1mq7IMOA12ya3XjUnXY+yMI+qmiesOgEIVTFHX0FnR1dhaNkstlR2HMcrE0RvfZuvmp58rrskNHITFpJ6UvKU7Mp45ZGUN7EjnlmIXwJJJBJ56tb9KX1J8z2wxmK0HvJTyO16fj44aWM2Sj42djwlKMyBYbEU0kX6tUroY44Y2lFmONEiikWNApSI7Xfkr7ye0FOdJw7y7Zw06f7ZxoO5Kr7ppS0vLXSISrpb3DGKExl60KJTUDFWXKZTwjOBZwMO7Hjj9TXtC8GQ8u9qtBbFyGMk7DjjkWx12EWIsG+4mafZ6DaJECVQgMRYFeDIBhQ0srMisYRq/Fuev07fcFrjthZ8K7RrO1U8U3reVVYvHyOsHF9ksKdOwgrDaLpxWohjAllNKdYeYGmJZt1uzYWqa49m+JP5DNbhM8O2PkTYlBhCUrGs1ZLEkCGYyvhaFYfCd0yYecjMaSdYwuJcuDSYxELXr6wrt3h0zipVjzv2sQ4jhWqMzSEalgPYSSG2IY/yJIjWEj4LAEDh6sxF9OD1MFtizlrtYM7kCXuZCfOSdtNmNyX2WYZWxUyOvNkrv8ATREkuS5JX5kSvJIJZPO9Fn9TlosF2JJ9oW2nbiEslQM8w06q5mMQlkAmGhcfOFWCQuIwKwNNogYZkSCx5RwKUDebf1EfeLyRRP0XGur8e8Ge+s0jK910DW17IBV5MQDmVf2iB007ZU8CmqbNGsU9ATR4GWddEhYpV1UXxm9/my/jp0vaZzO2tbLQdrrImqHSp20zK5dA2K6eItU5WaW+pVDydiJvyBgtMpDhhOY/DHwG9/3KX4t3a9Y0zhSjsPd8znI+1qkuEPU/KiH7OsaoPYbeHtN16wg+aC/2VtUbAflVwzkHu2y96c/xThjzyCRSpNTCpjAQ5QFmurTrmLjyX8/uIwqsW5CknrFQ9k/pk9pS2xZK92mtSU5VmSPP9zLO7uJK6TSCKHV32PLpkC3syn7c4a480qLEEd/bj6qI5D5I33lnbLPe+S9tvN33C6nAlrsexPmsbR4kMft92GTZzKc5yzMxZf1SMyU7RszYOYpLCOwH4ruf++baat0NZbcY8ICZwTY+YNh12zzXHQECDB1NGWZGgltt4X2EACXFaLJrQfjYHYIuk2LDJPa5+ny7U+IC0ex86Wtt3D7Ygsuw1UWgja1x1i4MnML4568g+V69qU2JCLTBtXxfYo2GLdZ8LStfVX4JJJ1qaldXKLIV6CwEkUUgCVTSTVFACqiioIDAsssAcAgAGEBBFCAxwjCOMYk2qdkb1m0Mnutn8TKszYyCw1izbdiXk/ULytxGGbgOK0k0svLH34SAW0f3/wDqh6vhcG+j+mHBkSRUpcZBu+Uw8OIwmArxIteodQ1aaLyttDCGNeTNUsdRpGOFRichG7CHxft07dOJe1XiXWeF+F9ZDrWma0HMs5lkbFzsVywMUbXatqtYiCW62a6KEZbGxKMY4DGtXVyyFPX1tan7j0dHTKQQQVYIq1aKOCvBGkMEEKLHFFFGoVI40UBURFAVVUAAAADqk7LZbJ57J5DNZrIXMtl8tcsZDJ5PI2Jbd7IXrcrT2rly1OzzWLFiZ3lmmldnd2LMST0dHR0devWP6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6Ojo6//Z">
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://designforms.net</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>HSS Column Shear Tab Connection</ENU>
      </CalculationName>
      <ResultGroups TranslateID="ResultGroups">
        <ENU>
        </ENU>
      </ResultGroups>
    </Header>
    <Styles>
      <Style Key="Subchapter 2" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" />
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|14|0|2" Font2="Tahoma|14|5|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|15|0|2" Font2="Tahoma|15|5|2" />
      <Style Key="Text 1" X="10" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body - dy 8 " X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="8" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Outcome Text dy 12" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" />
      <Style Key="Limit State Outcome" X="500" Y="0" Hor="0" Ver="2" SpX="20" SpY="-8" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Limit State Body - Wrap dy 25" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="25" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body Label" X="500" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Limit State Title" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Title" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" />
      <Style Key="Outcome Test dy16" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="16" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" />
      <Style Key="Label Italics" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Input Table" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body- Wrap dy 50" X="5" Y="0" Hor="0" Ver="4" SpX="5" SpY="60" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body Right" X="215" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="tab loads" X="45" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Label Left" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="Label Right" X="550" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
      <Style Key="=" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="= value" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body2" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Body1" X="350" Y="0" Hor="0" Ver="2" SpX="350" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="___" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="-19" Font1="Tahoma|18|0|2" Font2="Tahoma|18|1|2" />
      <Style Key="Limit State Body3" X="405" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Limit State Outcome Dim" X="400" Y="0" Hor="1" Ver="2" SpX="315" SpY="-8" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" />
      <Style Key="Limit State tab" X="10" Y="0" Hor="0" Ver="4" SpX="5" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="Outcome Text dy 12 R" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Tahoma|12|0|2" Font2="Tahoma|12|3|2" />
      <Style Key="Limit State Body2.5" X="355" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" />
      <Style Key="NoSpaceBlock" X="0" Y="0" Hor="0" Ver="4" SpX="5" SpY="3" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="BriefTableNotes" X="350" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="-1" Style="2" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="2" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="2" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="2" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="2" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="-1" Style="2" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Name="A↓b←" ESA_ID="" Type="Double" Value="285.023e-6" Precision="2">
        <Description TranslateID="VARIABLE_A↓b←">
          <ENU>Bolt Area</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Name="A↓gpl←" ESA_ID="" Type="Double" Value="8.22579e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓gpl←">
          <ENU>Gross Cross-Sectional Area of the Shear Plate</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Name="A↓gv←" ESA_ID="" Type="Double" Value="1.942738e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓gv←">
          <ENU>Gross Area in Shear</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Name="A↓nt←" ESA_ID="" Type="Double" Value="565.5231e-6" Precision="2">
        <Description TranslateID="VARIABLE_A↓nt←">
          <ENU>Net Area in Tension</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Name="A↓nv←" ESA_ID="" Type="Double" Value="1.554634e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓nv←">
          <ENU>Net Area in Shear</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Name="A↓w←" ESA_ID="" Type="Double" Value="2.820962e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓w←">
          <ENU>Area of Beam Web</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="645.16e-6" Dim="in↑2←" />
      </Variable>
      <Variable Name="ASD↓1←" ESA_ID="" Type="Double" Value="62275.11" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓1←">
          <ENU>ASD Load Combination Equation</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ASD↓2←" ESA_ID="" Type="Double" Value="106757.3" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓2←">
          <ENU>ASD Load Combination Equation</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ASD↓3←" ESA_ID="" Type="Double" Value="62275.11" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓3←">
          <ENU>ASD Load Combination Equation</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ASD↓4←" ESA_ID="" Type="Double" Value="95636.78" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓4←">
          <ENU>ASD Load Combination Equation</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ASD↓5←" ESA_ID="" Type="Double" Value="62275.11" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓5←">
          <ENU>ASD Load Combination Equation</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ASD↓6a←" ESA_ID="" Type="Double" Value="95636.78" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓6a←">
          <ENU>ASD Load Combination Equation</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ASD↓6b←" ESA_ID="" Type="Double" Value="95636.78" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓6b←">
          <ENU>ASD Load Combination Equation</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ASD↓7←" ESA_ID="" Type="Double" Value="37365.07" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓7←">
          <ENU>ASD Load Combination Equation</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ASD↓8←" ESA_ID="" Type="Double" Value="37365.07" Precision="2">
        <Description TranslateID="VARIABLE_ASD↓8←">
          <ENU>ASD Load Combination Equation</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="b↓c←" ESA_ID="Column.B" Type="Double" Value="101.6e-3" Precision="2">
        <Description TranslateID="VARIABLE_b↓c←">
          <ENU>Column Overall Width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="b↓f←" ESA_ID="Beam.b↓f←" Type="Double" Value="140.462e-3" Precision="2">
        <Description TranslateID="VARIABLE_b↓f←">
          <ENU>Beam Flange Width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="b↓p←" ESA_ID="" Type="Double" Value="177.8e-3" Precision="2">
        <Description TranslateID="VARIABLE_b↓p←">
          <ENU>Width of Plate</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="b↓t←" ESA_ID="" Type="Double" Value="17.2043" Precision="2">
        <Description TranslateID="VARIABLE_b↓t←">
          <ENU>Ratio b/t</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="b↓tmax←" ESA_ID="" Type="Double" Value="35.15184" Precision="2">
        <Description TranslateID="VARIABLE_b↓tmax←">
          <ENU>Slenderness Ratio Limit</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="B1" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_B1">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="BeamRad" ESA_ID="" Type="Double" Value="9.525e-3" Precision="2">
        <Description TranslateID="VARIABLE_BeamRad">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="Bolt" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description TranslateID="VARIABLE_Bolt">
          <ENU>Bolt Type</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="BoltType" ESA_ID="" Type="String" Value="A490SC">
        <Description TranslateID="VARIABLE_BoltType">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="C" ESA_ID="" Type="Double" Value="2.65706" Precision="2">
        <Description TranslateID="VARIABLE_C">
          <ENU>Coefficient for Eccentrically Loaded Bolt Groups</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="C↓2←" ESA_ID="" Type="Double" Value="401.0068e-3" Precision="2">
        <Description TranslateID="VARIABLE_C↓2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="C↓prime←" ESA_ID="" Type="Double" Value="401.0068e-3" Precision="2">
        <Description TranslateID="VARIABLE_C↓prime←">
          <ENU>Coefficient for Bolt Eccentricity</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="C↓v←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_C↓v←">
          <ENU>Web Shear Coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="cf" ESA_ID="" Type="Double" Value="203.2e-3" Precision="2">
        <Description TranslateID="VARIABLE_cf">
          <ENU>Connecting Face Width</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="ConnFace" ESA_ID="" Type="String" Value="Wide">
        <Description TranslateID="VARIABLE_ConnFace">
          <ENU>Connection Face </ENU>
        </Description>
      </Variable>
      <Variable Name="D" ESA_ID="" Type="Double" Value="12" Precision="2">
        <Description TranslateID="VARIABLE_D">
          <ENU>Weld Diameter in # of 16th of an Inch</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="D↓1←" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description TranslateID="VARIABLE_D↓1←">
          <ENU>Minimum Weld Diameter</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="D↓5/8←" ESA_ID="" Type="Double" Value="12" Precision="2">
        <Description TranslateID="VARIABLE_D↓5/8←">
          <ENU>Weld Diameter using 5/8 * t</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="d↓b←" ESA_ID="" Type="Double" Value="19.05e-3" Precision="3">
        <Description TranslateID="VARIABLE_d↓b←">
          <ENU>Bolt Diameter</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="d↓beam←" ESA_ID="Beam.d" Type="Double" Value="403.86e-3" Precision="2">
        <Description TranslateID="VARIABLE_d↓beam←">
          <ENU>Beam Depth</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="D↓L←" ESA_ID="" Type="Double" Value="62275.11" Precision="2">
        <Description TranslateID="VARIABLE_D↓L←">
          <ENU>Dead Load</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="D↓t←" ESA_ID="" Type="Double" Value="20.83333" Precision="2">
        <Description TranslateID="VARIABLE_D↓t←">
          <ENU>Ratio for Slenderness D/t</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="D↓tmax←" ESA_ID="" Type="Double" Value="75.95238" Precision="2">
        <Description TranslateID="VARIABLE_D↓tmax←">
          <ENU>Maximum for Nonslender Elements</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="D↓wc←" ESA_ID="" Type="Double" Value="19.05e-3" Precision="3">
        <Description TranslateID="VARIABLE_D↓wc←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="DesignMethod" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_DesignMethod">
          <ENU>Design Method</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="DimLim" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_DimLim">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="e" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_e">
          <ENU>Eccentricity</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="E↓b←" ESA_ID="BeamMat.E" Type="Double" Value="199.948e9" Precision="2">
        <Description TranslateID="VARIABLE_E↓b←">
          <ENU>Modulus of Elasticity of Steel Beam</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="E↓c←" ESA_ID="ColumnMat.E" Type="Double" Value="199.948e9" Precision="2">
        <Description TranslateID="VARIABLE_E↓c←">
          <ENU>Modulus of Elasticity of Steel Column</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="E↓L←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_E↓L←">
          <ENU>Earthquake Load</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="E↓p←" ESA_ID="Plate.E" Type="Double" Value="199.948e9" Precision="2">
        <Description TranslateID="VARIABLE_E↓p←">
          <ENU>Modulus of Elasticity of Steel Plate</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="Edge↓h,min←" ESA_ID="" Type="Double" Value="38.1e-3" Precision="2">
        <Description TranslateID="VARIABLE_Edge↓h,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="Edge↓h←" ESA_ID="" Type="Double" Value="38.1e-3" Precision="3">
        <Description TranslateID="VARIABLE_Edge↓h←">
          <ENU>Horizontal Edge Distance</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="Edge↓v,min←" ESA_ID="" Type="Double" Value="31.75e-3" Precision="2">
        <Description TranslateID="VARIABLE_Edge↓v,min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="Edge↓v←" ESA_ID="" Type="Double" Value="31.75e-3" Precision="3">
        <Description TranslateID="VARIABLE_Edge↓v←">
          <ENU>Vertical Edge Distance</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="Exception" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_Exception">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ExternEC" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ExternEC">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="ExtTables" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ExtTables">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="F↓cr←" ESA_ID="" Type="Double" Value="248.2113e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓cr←">
          <ENU>Flexural Local Buckling Stress</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="F↓EXX←" ESA_ID="" Type="Double" Value="482.6331e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓EXX←">
          <ENU>Filler Metal Classification Strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="F↓nv←" ESA_ID="" Type="Double" Value="185.7178e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓nv←">
          <ENU>Nominal Shear Strenght of Bolts</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="F↓ub←" ESA_ID="BeamMat.F↓u←" Type="Double" Value="448.1593e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓ub←">
          <ENU>Beam Min Tensile Strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="F↓uc←" ESA_ID="ColumnMat.F↓u←" Type="Double" Value="399.896e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓uc←">
          <ENU>Column Min Tensile Strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="F↓up←" ESA_ID="Plate.F↓u←" Type="Double" Value="399.896e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓up←">
          <ENU>Plate Min Tensile Strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="F↓v←" ESA_ID="" Type="Double" Value="372.3169e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓v←">
          <ENU>Shear Strength of an Individual Bolt</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="F↓yb←" ESA_ID="BeamMat.F↓y←" Type="Double" Value="344.7379e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓yb←">
          <ENU>Beam Min Yield Strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="F↓yc←" ESA_ID="ColumnMat.F↓y←" Type="Double" Value="317.1589e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓yc←">
          <ENU>Column Min Yield Strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="F↓yp←" ESA_ID="Plate.F↓y←" Type="Double" Value="248.2113e6" Precision="2">
        <Description TranslateID="VARIABLE_F↓yp←">
          <ENU>Plate Min Yield Strength</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="6.894758e6" Dim="ksi" />
      </Variable>
      <Variable Name="G_CHECK" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_G_CHECK">
          <ENU>
          </ENU>
        </Description>
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
      <Variable Name="G_X" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_G_X">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="Gap" ESA_ID="" Type="Double" Value="25.4e-3" Precision="2">
        <Description TranslateID="VARIABLE_Gap">
          <ENU>Beam Set Back - Gap</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="Graphic" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_Graphic">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="h" ESA_ID="" Type="Double" Value="361.0864e-3" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>Height of Web</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="h↓c←" ESA_ID="Column.H" Type="Double" Value="203.2e-3" Precision="2">
        <Description TranslateID="VARIABLE_h↓c←">
          <ENU>Column Overall Height</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="h↓p←" ESA_ID="" Type="Double" Value="215.9e-3" Precision="2">
        <Description TranslateID="VARIABLE_h↓p←">
          <ENU>Height of Plate</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="Hole↓h←" ESA_ID="" Type="Double" Value="20.6375e-3" Precision="3">
        <Description TranslateID="VARIABLE_Hole↓h←">
          <ENU>Hole Dimension Horizontal</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="Hole↓v←" ESA_ID="" Type="Double" Value="20.6375e-3" Precision="3">
        <Description TranslateID="VARIABLE_Hole↓v←">
          <ENU>Hole Dimension Vertical</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="HoleTyp" ESA_ID="" Type="String" Value="STD">
        <Description TranslateID="VARIABLE_HoleTyp">
          <ENU>Hole Type</ENU>
        </Description>
      </Variable>
      <Variable Name="ht↓w←" ESA_ID="" Type="Double" Value="51.69455" Precision="2">
        <Description TranslateID="VARIABLE_ht↓w←">
          <ENU>Compact Section Criteria h/t</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ht↓w1←" ESA_ID="" Type="Double" Value="50.06424" Precision="2">
        <Description TranslateID="VARIABLE_ht↓w1←">
          <ENU>Compact Section Criteria used for max and min</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ht↓w2←" ESA_ID="" Type="Double" Value="53.94634" Precision="2">
        <Description TranslateID="VARIABLE_ht↓w2←">
          <ENU>Compact Section Criteria used for max and min</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="k↓1←" ESA_ID="Beam.k↓1←" Type="Double" Value="19.05e-3" Precision="3">
        <Description TranslateID="VARIABLE_k↓1←">
          <ENU>Detailing Distance (Web Center to Flange Toe)</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="k↓des←" ESA_ID="Beam.k↓des←" Type="Double" Value="21.3868e-3" Precision="2">
        <Description TranslateID="VARIABLE_k↓des←">
          <ENU>Design Distance (Flange to Web Toe)</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="k↓v←" ESA_ID="" Type="Double" Value="5" Precision="2">
        <Description TranslateID="VARIABLE_k↓v←">
          <ENU>Shear Buckling Coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="l↓c,end←" ESA_ID="" Type="Double" Value="114.6175e-3" Precision="2">
        <Description TranslateID="VARIABLE_l↓c,end←">
          <ENU>Clear distance between the edge of the hole and the edge of the adjacent hole</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="l↓c,int←" ESA_ID="" Type="Double" Value="53.975e-3" Precision="2">
        <Description TranslateID="VARIABLE_l↓c,int←">
          <ENU>Clear distance between the edge of the hole and the edge of the adjacent hole</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="L↓eh←" ESA_ID="" Type="Double" Value="38.1e-3" Precision="2">
        <Description TranslateID="VARIABLE_L↓eh←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="L↓ehb←" ESA_ID="" Type="Double" Value="38.1e-3" Precision="2">
        <Description TranslateID="VARIABLE_L↓ehb←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="L↓ehp←" ESA_ID="" Type="Double" Value="38.1e-3" Precision="2">
        <Description TranslateID="VARIABLE_L↓ehp←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="L↓gv←" ESA_ID="" Type="Double" Value="278.13e-3" Precision="2">
        <Description TranslateID="VARIABLE_L↓gv←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="L↓L←" ESA_ID="" Type="Double" Value="44482.22" Precision="2">
        <Description TranslateID="VARIABLE_L↓L←">
          <ENU>Live Load</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="L↓LR←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_L↓LR←">
          <ENU>Roof Live Load</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="LimitExc" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_LimitExc">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="LRFD↓1←" ESA_ID="" Type="Double" Value="87185.15" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="LRFD↓2←" ESA_ID="" Type="Double" Value="145901.7" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="LRFD↓3←" ESA_ID="" Type="Double" Value="119212.4" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓3←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="LRFD↓4←" ESA_ID="" Type="Double" Value="119212.4" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓4←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="LRFD↓5←" ESA_ID="" Type="Double" Value="119212.4" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓5←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="LRFD↓6←" ESA_ID="" Type="Double" Value="56047.6" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓6←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="LRFD↓7←" ESA_ID="" Type="Double" Value="56047.6" Precision="2">
        <Description TranslateID="VARIABLE_LRFD↓7←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="LS↓L←" ESA_ID="" Type="Double" Value="47.625e-3" Precision="2">
        <Description TranslateID="VARIABLE_LS↓L←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="LSR" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LSR">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="LSR↓max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_LSR↓max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="LW" ESA_ID="" Type="Double" Value="44482.22" Precision="2">
        <Description TranslateID="VARIABLE_LW">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="LW↓max←" ESA_ID="" Type="Double" Value="44482.22" Precision="2">
        <Description TranslateID="VARIABLE_LW↓max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="M↓a←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_M↓a←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="M↓ap←" ESA_ID="" Type="Double" Value="11016.02" Precision="2">
        <Description TranslateID="VARIABLE_M↓ap←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip•ft" />
      </Variable>
      <Variable Name="M↓c←" ESA_ID="" Type="Double" Value="99182.33" Precision="2">
        <Description TranslateID="VARIABLE_M↓c←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="112.9848" Dim="kip•in" />
      </Variable>
      <Variable Name="M↓maxp←" ESA_ID="" Type="Double" Value="47282.66" Precision="2">
        <Description TranslateID="VARIABLE_M↓maxp←">
          <ENU>Maximum Plate Moment Strength</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="112.9848" Dim="kip•in" />
      </Variable>
      <Variable Name="M↓n←" ESA_ID="" Type="Double" Value="110202.6" Precision="2">
        <Description TranslateID="VARIABLE_M↓n←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="112.9848" Dim="kip•in" />
      </Variable>
      <Variable Name="M↓n7←" ESA_ID="" Type="Double" Value="73468.39" Precision="2">
        <Description TranslateID="VARIABLE_M↓n7←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip•ft" />
      </Variable>
      <Variable Name="M↓r←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_M↓r←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="112.9848" Dim="kip•in" />
      </Variable>
      <Variable Name="M↓up←" ESA_ID="" Type="Double" Value="14823.61" Precision="2">
        <Description TranslateID="VARIABLE_M↓up←">
          <ENU>Moment in Plate due to conn ecc</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip•ft" />
      </Variable>
      <Variable Name="Method" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_Method">
          <ENU>Eccentricity Calculation Method</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="n" ESA_ID="" Type="Double" Value="6" Precision="2">
        <Description TranslateID="VARIABLE_n">
          <ENU>Total Number of Bolts</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="n↓b←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_n↓b←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="n↓c←" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description TranslateID="VARIABLE_n↓c←">
          <ENU>Number of Bolt Columns</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="n↓v←" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description TranslateID="VARIABLE_n↓v←">
          <ENU>Number of Bolts per Column</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="OD" ESA_ID="Column.OD" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_OD">
          <ENU>Outside Diameter of Round HSS Section</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="of" ESA_ID="" Type="Double" Value="101.6e-3" Precision="2">
        <Description TranslateID="VARIABLE_of">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="R↓a←" ESA_ID="" Type="Double" Value="106757.3" Precision="2">
        <Description TranslateID="VARIABLE_R↓a←">
          <ENU>Demand Load ASD</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="R↓L←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_R↓L←">
          <ENU>Rain Load</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="R↓u←" ESA_ID="" Type="Double" Value="145901.7" Precision="2">
        <Description TranslateID="VARIABLE_R↓u←">
          <ENU>Demand Load LRFD</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="s↓e←" ESA_ID="" Type="Double" Value="25.4e-3" Precision="2">
        <Description TranslateID="VARIABLE_s↓e←">
          <ENU>Minimum Edge Distance</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="s↓h←" ESA_ID="" Type="Double" Value="76.2e-3" Precision="2">
        <Description TranslateID="VARIABLE_s↓h←">
          <ENU>Horizontal Bolt Spacing</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="S↓L←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_S↓L←">
          <ENU>Snow Load</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="s↓min←" ESA_ID="" Type="Double" Value="50.8635e-3" Precision="4">
        <Description TranslateID="VARIABLE_s↓min←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="S↓net←" ESA_ID="" Type="Double" Value="295.9913e-6" Precision="2">
        <Description TranslateID="VARIABLE_S↓net←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="3" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="16.38706e-6" Dim="in↑3←" />
      </Variable>
      <Variable Name="s↓v←" ESA_ID="" Type="Double" Value="76.2e-3" Precision="2">
        <Description TranslateID="VARIABLE_s↓v←">
          <ENU>Vertical Bolt Spacing</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="SS↓L←" ESA_ID="" Type="Double" Value="25.4e-3" Precision="2">
        <Description TranslateID="VARIABLE_SS↓L←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="T↓beam←" ESA_ID="" Type="Double" Value="361.0864e-3" Precision="2">
        <Description TranslateID="VARIABLE_T↓beam←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓c←" ESA_ID="Column.t↓des←" Type="Double" Value="11.811e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓c←">
          <ENU>HSS Column Thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓cmin←" ESA_ID="" Type="Double" Value="16.25736e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓cmin←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓des←" ESA_ID="" Type="Double" Value="11.1125e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓des←">
          <ENU>Design Thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓f←" ESA_ID="Beam.t↓f←" Type="Double" Value="11.176e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓f←">
          <ENU>Beam Flange Thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓HSS←" ESA_ID="Column.t↓des←" Type="Double" Value="11.811e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓HSS←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓maxp←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_t↓maxp←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="t↓maxp1←" ESA_ID="" Type="Double" Value="19.02883e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓maxp1←">
          <ENU>Maximum Plate Thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓maxp2←" ESA_ID="" Type="Double" Value="24.52033e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓maxp2←">
          <ENU>Maximum Plate Thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓p←" ESA_ID="" Type="Double" Value="38.1e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓p←">
          <ENU>Plate Thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="t↓w←" ESA_ID="Beam.t↓w←" Type="Double" Value="6.985e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓w←">
          <ENU>Beam Web Thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="25.4e-3" Dim="in" />
      </Variable>
      <Variable Name="TableBorderPen" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_TableBorderPen">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="TableCellsFont" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_TableCellsFont">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="TableGridPen" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_TableGridPen">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="TableHeaderFont" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_TableHeaderFont">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Name="TableWidth" ESA_ID="" Type="Double" Value="585" Precision="2">
        <Description TranslateID="VARIABLE_TableWidth">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="TextScale" ESA_ID="" Type="Double" Value="8" Precision="2">
        <Description TranslateID="VARIABLE_TextScale">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓1←" ESA_ID="" Type="Double" Value="1.037351" Precision="3">
        <Description TranslateID="VARIABLE_U↓1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓10←" ESA_ID="" Type="Double" Value="368.0458e-3" Precision="3">
        <Description TranslateID="VARIABLE_U↓10←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓11←" ESA_ID="" Type="Double" Value="250.0477e-3" Precision="3">
        <Description TranslateID="VARIABLE_U↓11←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓2←" ESA_ID="" Type="Double" Value="54.93792e-3" Precision="3">
        <Description TranslateID="VARIABLE_U↓2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓3←" ESA_ID="" Type="Double" Value="226.5389e-3" Precision="3">
        <Description TranslateID="VARIABLE_U↓3←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓4←" ESA_ID="" Type="Double" Value="119.0995e-3" Precision="3">
        <Description TranslateID="VARIABLE_U↓4←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓5←" ESA_ID="" Type="Double" Value="142.6048e-3" Precision="3">
        <Description TranslateID="VARIABLE_U↓5←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓6←" ESA_ID="" Type="Double" Value="117.073e-3" Precision="3">
        <Description TranslateID="VARIABLE_U↓6←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓7←" ESA_ID="" Type="Double" Value="224.1873e-3" Precision="3">
        <Description TranslateID="VARIABLE_U↓7←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓8←" ESA_ID="" Type="Double" Value="14.18469e-3" Precision="3">
        <Description TranslateID="VARIABLE_U↓8←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓9←" ESA_ID="" Type="Double" Value="307.1714e-3" Precision="3">
        <Description TranslateID="VARIABLE_U↓9←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="U↓bs←" ESA_ID="" Type="Double" Value="500e-3" Precision="3">
        <Description TranslateID="VARIABLE_U↓bs←">
          <ENU>Reduction Coefficient</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="UserScale" ESA_ID="" Type="Double" Value="20" Precision="2">
        <Description TranslateID="VARIABLE_UserScale">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="V↓a←" ESA_ID="" Type="Double" Value="106757.3" Precision="2">
        <Description TranslateID="VARIABLE_V↓a←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓c←" ESA_ID="" Type="Double" Value="1.22504e6" Precision="2">
        <Description TranslateID="VARIABLE_V↓c←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n,end←" ESA_ID="" Type="Double" Value="143121.5" Precision="2">
        <Description TranslateID="VARIABLE_V↓n,end←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n,int←" ESA_ID="" Type="Double" Value="143121.5" Precision="2">
        <Description TranslateID="VARIABLE_V↓n,int←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="v↓n←" ESA_ID="" Type="Double" Value="52933.84" Precision="2">
        <Description TranslateID="VARIABLE_v↓n←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n←" ESA_ID="" Type="Double" Value="1.22504e6" Precision="2">
        <Description TranslateID="VARIABLE_V↓n←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n1/←Ω" ESA_ID="" Type="Double" Value="160383.9" Precision="2">
        <Description TranslateID="VARIABLE_V↓n1/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n1←" ESA_ID="" Type="Double" Value="140648.4" Precision="2">
        <Description TranslateID="VARIABLE_V↓n1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n10/←Ω" ESA_ID="" Type="Double" Value="233843.6" Precision="2">
        <Description TranslateID="VARIABLE_V↓n10/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n10←" ESA_ID="" Type="Double" Value="528563.5" Precision="2">
        <Description TranslateID="VARIABLE_V↓n10←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n11/←Ω" ESA_ID="" Type="Double" Value="388997" Precision="2">
        <Description TranslateID="VARIABLE_V↓n11/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n11←" ESA_ID="" Type="Double" Value="583495.5" Precision="2">
        <Description TranslateID="VARIABLE_V↓n11←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n2/←Ω" ESA_ID="" Type="Double" Value="491806.5" Precision="2">
        <Description TranslateID="VARIABLE_V↓n2/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n2←" ESA_ID="" Type="Double" Value="3.541007e6" Precision="2">
        <Description TranslateID="VARIABLE_V↓n2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n3/←Ω" ESA_ID="" Type="Double" Value="357803.9" Precision="2">
        <Description TranslateID="VARIABLE_V↓n3/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n3←" ESA_ID="" Type="Double" Value="858729.3" Precision="2">
        <Description TranslateID="VARIABLE_V↓n3←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n4/←Ω" ESA_ID="" Type="Double" Value="272231.2" Precision="2">
        <Description TranslateID="VARIABLE_V↓n4/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n4←" ESA_ID="" Type="Double" Value="1.22504e6" Precision="2">
        <Description TranslateID="VARIABLE_V↓n4←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n5/←Ω" ESA_ID="" Type="Double" Value="104005" Precision="2">
        <Description TranslateID="VARIABLE_V↓n5/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n5←" ESA_ID="" Type="Double" Value="1.364158e6" Precision="2">
        <Description TranslateID="VARIABLE_V↓n5←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n6/←Ω" ESA_ID="" Type="Double" Value="227561.3" Precision="2">
        <Description TranslateID="VARIABLE_V↓n6/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n6←" ESA_ID="" Type="Double" Value="1.661661e6" Precision="2">
        <Description TranslateID="VARIABLE_V↓n6←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n9/←Ω" ESA_ID="" Type="Double" Value="240623.1" Precision="2">
        <Description TranslateID="VARIABLE_V↓n9/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓n9←" ESA_ID="" Type="Double" Value="633312.8" Precision="2">
        <Description TranslateID="VARIABLE_V↓n9←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="v↓nΩ←" ESA_ID="" Type="Double" Value="53059.44" Precision="2">
        <Description TranslateID="VARIABLE_v↓nΩ←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓r←" ESA_ID="" Type="Double" Value="145901.7" Precision="2">
        <Description TranslateID="VARIABLE_V↓r←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="V↓u←" ESA_ID="" Type="Double" Value="145901.7" Precision="2">
        <Description TranslateID="VARIABLE_V↓u←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="VisibDim" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_VisibDim">
          <ENU>Visiblity of Graphic Dimensions</ENU>
        </Description>
      </Variable>
      <Variable Name="W↓L←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_W↓L←">
          <ENU>Wind Load</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="WE" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_WE">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="WE↓max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_WE↓max←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="Z↓pl←" ESA_ID="" Type="Double" Value="443.987e-6" Precision="2">
        <Description TranslateID="VARIABLE_Z↓pl←">
          <ENU>Plastic Section Modulus of the Shear Plate</ENU>
        </Description>
        <Unit m="3" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="16.38706e-6" Dim="in↑3←" />
      </Variable>
      <Variable Name="Μ↓n7/←Ω" ESA_ID="" Type="Double" Value="14664.35" Precision="2">
        <Description TranslateID="VARIABLE_Μ↓n7/←Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip•ft" />
      </Variable>
      <Variable Name="π" ESA_ID="" Type="Double" Value="3.141593" Precision="5">
        <Description TranslateID="VARIABLE_π">
          <ENU>pi</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕ" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_ϕ">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕ↓b←" ESA_ID="" Type="Double" Value="900e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓b←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕ↓v←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓v←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕR↓n1←" ESA_ID="" Type="Double" Value="324956" Precision="2">
        <Description TranslateID="VARIABLE_ϕR↓n1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕv↓n←" ESA_ID="" Type="Double" Value="52933.84" Precision="2">
        <Description TranslateID="VARIABLE_ϕv↓n←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕV↓n1←" ESA_ID="" Type="Double" Value="140648.4" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕV↓n10←" ESA_ID="" Type="Double" Value="396422.6" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n10←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕV↓n11←" ESA_ID="" Type="Double" Value="583495.5" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n11←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕV↓n2←" ESA_ID="" Type="Double" Value="2.655755e6" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕV↓n3←" ESA_ID="" Type="Double" Value="644046.9" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n3←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕV↓n4←" ESA_ID="" Type="Double" Value="1.22504e6" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n4←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕV↓n5←" ESA_ID="" Type="Double" Value="1.023119e6" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n5←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕV↓n6←" ESA_ID="" Type="Double" Value="1.246246e6" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n6←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕV↓n7←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n7←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕV↓n8←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n8←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="ϕV↓n9←" ESA_ID="" Type="Double" Value="474984.6" Precision="2">
        <Description TranslateID="VARIABLE_ϕV↓n9←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="4448.222" Dim="kip" />
      </Variable>
      <Variable Name="ϕΜ↓n7←" ESA_ID="" Type="Double" Value="66121.55" Precision="2">
        <Description TranslateID="VARIABLE_ϕΜ↓n7←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1355.818" Dim="kip•ft" />
      </Variable>
      <Variable Name="Ω" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_Ω">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="Ω↓b←" ESA_ID="" Type="Double" Value="1.67" Precision="2">
        <Description TranslateID="VARIABLE_Ω↓b←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Name="Ω↓v←" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_Ω↓v←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
    </Variables>
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Brief</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Summary</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_2">
          <ENU>Detailed</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_3">
          <ENU>Layout 0</ENU>
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
      <VC ID="000022">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="75" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="75" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="375" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000031">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="375" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000780">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000781">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000782">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000783">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="000784">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="2" SpX="350" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000786">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000787">
        <Set Vis="1" Prev="-1" Style="2" StyleName="NoSpaceBlock" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000788">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000789">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000790">
        <Set Vis="1" Prev="4446" Style="2" StyleName="" X="405" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="400" Y="0" Hor="0" Ver="2" SpX="350" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000791">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000792">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000793">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000794">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000795">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000796">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000797">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000798">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000799">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000800">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000803">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000809">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000810">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000811">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000812">
        <Set Vis="1" Prev="-1" Style="2" StyleName="NoSpaceBlock" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000813">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="809" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="809" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000814">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000815">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000816">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="819" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="819" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000817">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000818">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000819">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="813" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="813" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000820">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000821">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000825">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="816" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="816" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000826">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000827">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000829">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000830">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000831">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000832">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000833">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000834">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000835">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000836">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000837">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000838">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000839">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000840">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000841">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000843">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000844">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000852">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000853">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000854">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000855">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000856">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000857">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000858">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000859">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000860">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000861">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000862">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000863">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000864">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000866">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000868">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000869">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000870">
        <Set Vis="1" Prev="889" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="889" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="889" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000871">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000872">
        <Set Vis="1" Prev="-1" Style="2" StyleName="NoSpaceBlock" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000874">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000875">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000876">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000877">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000880">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000881">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000882">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000883">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000885">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000886">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000887">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000888">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000889">
        <Set Vis="1" Prev="868" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="868" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="868" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000894">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000895">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000896">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000897">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="20" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000898">
        <Set Vis="1" Prev="911" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="911" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="911" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000900">
        <Set Vis="1" Prev="895" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="5716" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="5716" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000901">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000902">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000903">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000904">
        <Set Vis="1" Prev="4459" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="4459" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="4459" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000905">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000907">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000908">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000909">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000910">
        <Set Vis="1" Prev="904" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="904" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="904" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000911">
        <Set Vis="1" Prev="910" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="910" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="910" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000912">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000913">
        <Set Vis="1" Prev="870" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="870" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="870" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000914">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000915">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000916">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000917">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000918">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000919">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="35" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000920">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000921">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="920" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="920" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000922">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000923">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000924">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="900" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="900" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000925">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000926">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000927">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000929">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000945">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000952">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000953">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000954">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000955">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000956">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000957">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000958">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000959">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="65" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="65" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="65" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000960">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000961">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000966">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000967">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000968">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000969">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000970">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000971">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000973">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000974">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000975">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000976">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000977">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000978">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000979">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000980">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000981">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000982">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000983">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000984">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000985">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000986">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000987">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000988">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000989">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000990">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000991">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000992">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000993">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000994">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000995">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000996">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000997">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="000999">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001001">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001002">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="4" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001005">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001010">
        <Set Vis="1" Prev="4381" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="4" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="4381" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001013">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001016">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001017">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001019">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001020">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="355" Y="0" Hor="0" Ver="4" SpX="0" SpY="45" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001028">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001029">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001030">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001031">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001032">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="1030" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001033">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001034">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="1032" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001035">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001036">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001041">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001044">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001067">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001068">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001069">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001070">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001071">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="1068" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001072">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="1071" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001073">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001074">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001075">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="001077">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="003272">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="28.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="003273">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="45.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="003274">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="62.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="003275">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="78.6" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004258">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004280">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004281">
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004282">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004283">
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="15" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Test dy16" EqStyle="15" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004284">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004285">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004286">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="5280" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004288">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004289">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004290">
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004295">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004296">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004297">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004298">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4295" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004299">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4298" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004300">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004301">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004302">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004303">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004304">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004305">
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004306">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004307">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004312">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004313">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004314">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4313" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004315">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004316">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004317">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004318">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004319">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004320">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004321">
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004322">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004325">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004326">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004327">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="4326" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004329">
        <Set Vis="1" Prev="4335" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="4335" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="4335" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="4335" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004330">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="12" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="12" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="12" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="12" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004331">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="4335" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004332">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004333">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004334">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004335">
        <Set Vis="1" Prev="4327" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="4327" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="4327" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="4327" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004336">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004337">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004338">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004339">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004340">
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004341">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004342">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="4336" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004343">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004344">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004345">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004374">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004375">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004376">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="5" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="5" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="5" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="5" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004377">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="4375" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004378">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4377" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004379">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4378" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004380">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004381">
        <Set Vis="1" Prev="1002" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="4" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="1002" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004384">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004385">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004387">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004388">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004389">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004390">
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004391">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004392">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004393">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004394">
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004399">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004402">
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Body" EqStyle="5" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004403">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004404">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004405">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004406">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004407">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004410">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004411">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004412">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004413">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004414">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4754" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004415">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004416">
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4414" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004417">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004418">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004419">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4414" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004420">
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004429">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004430">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004431">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004432">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004433">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|12|0|2" Font2="Tahoma|12|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004434">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004435">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004436">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004437">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004438">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004439">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004440">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004441">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004442">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004443">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004444">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004446">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004449">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004450">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004451">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004454">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|18|0|2" Font2="Tahoma|18|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|18|0|2" Font2="Tahoma|18|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|18|0|2" Font2="Tahoma|18|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004455">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="924" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="924" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004456">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004457">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004458">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004459">
        <Set Vis="1" Prev="900" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="4455" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="4455" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004460">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004461">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004462">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004463">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004464">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004465">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="921" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="921" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004466">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4465" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="4465" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004487">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004489">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004491">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004492">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004493">
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004494">
        <Set Vis="1" Prev="4280" Style="2" StyleName="" X="350" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="2" StyleName="" X="350" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="2" StyleName="" X="350" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="2" StyleName="" X="350" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004495">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004496">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004497">
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004499">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4491" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004500">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004501">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004502">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004503">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004504">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4503" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004505">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004506">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004507">
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004508">
        <Set Vis="1" Prev="4280" Style="2" StyleName="" X="350" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="2" StyleName="" X="350" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="2" StyleName="" X="350" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="2" StyleName="" X="350" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004509">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004510">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004511">
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004512">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004513">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004515">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004516">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4489" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004517">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4526" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004520">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="12511" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004521">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004523">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004524">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4523" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004525">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004526">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4516" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004527">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004528">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4516" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004529">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Tahoma|12|0|2" Font2="Tahoma|12|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004530">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004531">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4530" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004534">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004535">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004536">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004537">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4536" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004538">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4516" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004539">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004545">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004546">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004547">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4546" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004548">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004549">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004550">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004552">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004553">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004554">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004555">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004556">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004557">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004559">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004560">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="355" Y="0" Hor="0" Ver="4" SpX="0" SpY="40" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004561">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004562">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004563">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004564">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004565">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004566">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004567">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004568">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004569">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004570">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4569" Style="2" StyleName="Limit State Body2.5" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004571">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004572">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004573">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004574">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004575">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004576">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004577">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004578">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004579">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004580">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004581">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004582">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004583">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004584">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004585">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004586">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004587">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004588">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004589">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004590">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004591">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004592">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004593">
        <Set Vis="1" Prev="1020" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="1020" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="1020" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="1020" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004594">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004595">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="355" Y="0" Hor="0" Ver="4" SpX="0" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004596">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004599">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004605">
        <Set Vis="1" Prev="828" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="828" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="828" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004607">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004608">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="355" Y="0" Hor="0" Ver="4" SpX="0" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004609">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004610">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004611">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004612">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="355" Y="0" Hor="0" Ver="4" SpX="0" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004613">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="355" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004614">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004615">
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="4614" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004616">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="355" Y="0" Hor="0" Ver="4" SpX="0" SpY="55" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004617">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004618">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004620">
        <Set Vis="1" Prev="4560" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="4560" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="4560" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="4560" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004621">
        <Set Vis="1" Prev="4620" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4620" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4620" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4620" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004622">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004623">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004624">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004625">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004626">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004627">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004628">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004629">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004630">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004631">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Italics" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004632">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004633">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="12250" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4635" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004637">
        <Set Vis="1" Prev="4633" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="4633" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="4633" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004638">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004639">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004640">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="12250" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004641">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004642">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004643">
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004644">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004645">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004646">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004647">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004648">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004649">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004650">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004652">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004653">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004670">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004671">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004672">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004673">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004674">
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004675">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004676">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004677">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004678">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004679">
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004680">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004681">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004682">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004683">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004684">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004685">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004686">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004687">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004688">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004689">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004690">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004691">
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004692">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004693">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004694">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="10" Y="0" Hor="0" Ver="4" SpX="5" SpY="60" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004695">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004696">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="4693" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004697">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004698">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004699">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004700">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004701">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004702">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004703">
        <Set Vis="1" Prev="4701" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="4701" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="4701" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - Wrap dy 25" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004704">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004705">
        <Set Vis="1" Prev="4703" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="4703" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="4703" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="4703" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004706">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="12" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="12" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="12" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="12" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004707">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="5" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="5" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="5" SpY="50" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004708">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body - dy 8 " EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004709">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004710">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004711">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004712">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004713">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004714">
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="4280" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004715">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004716">
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004717">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004720">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004721">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004722">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004723">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004724">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004725">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004726">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004732">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004733">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004734">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004735">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004736">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004737">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004738">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004739">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004740">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004741">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004742">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004743">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004744">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004745">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004746">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004747">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004748">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004749">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004750">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004751">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004752">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004753">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004754">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004755">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004756">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004757">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004758">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004759">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004760">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004761">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004762">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004763">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="200" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004770">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004771">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004773">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="45" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004774">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004792">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="800" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="800" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004793">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="105" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="105" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="105" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="140" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004794">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004795">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4792" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="4792" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004796">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004797">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004798">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004799">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4795" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="4795" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004800">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004801">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004802">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004808">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004809">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004810">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004811">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4808" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004812">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4815" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004813">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4811" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004814">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004815">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004816">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4814" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004817">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004818">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004819">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004820">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004821">
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Outcome Test dy16" EqStyle="7" />
        <Set Vis="1" Prev="4278" Style="0" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004822">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004823">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004824">
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="15" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Test dy16" EqStyle="15" />
        <Set Vis="1" Prev="4278" Style="2" StyleName="Outcome Text dy 12" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004825">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="004826">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004827">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004828">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="004829">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005192">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="405" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005193">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005211">
        <Set Vis="1" Prev="4446" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="400" Y="0" Hor="0" Ver="2" SpX="400" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005212">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005213">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005214">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005215">
        <Set Vis="1" Prev="5212" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="5212" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005216">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005219">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005220">
        <Set Vis="1" Prev="5215" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="400" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="5215" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005221">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Right" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005234">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="1" Prev="5712" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005235">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005236">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005255">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="1035" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005256">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="5255" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005257">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="5256" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005259">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005278">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="1073" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005279">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005280">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005282">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005294">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4298" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005295">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="5294" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005296">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="5295" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005297">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005309">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4313" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005310">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005311">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005312">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005332">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="4336" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005333">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="5332" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005334">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="5333" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005335">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005349">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4378" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005350">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="5349" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005351">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="5350" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005352">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005364">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4412" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005365">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005368">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005369">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005393">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body- Wrap dy 50" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005394">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005395">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005396">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005417">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4523" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005428">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4536" Style="2" StyleName="Limit State Body" EqStyle="1" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005441">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4491" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005442">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="5441" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005443">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005454">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4503" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005455">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005456">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005457">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005492">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005493">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005596">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4546" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005712">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="5972" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005715">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005716">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="895" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="895" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005717">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005718">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005719">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005720">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005721">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005722">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005727">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005730">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005731">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005732">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005733">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005734">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005735">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005736">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005765">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005766">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005767">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005768">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005769">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005770">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005771">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005772">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005773">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005774">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005775">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005776">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005777">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005778">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005779">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005780">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005781">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005782">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005783">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005784">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005785">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005786">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005796">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005797">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005800">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005801">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005802">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005803">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005804">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005805">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005806">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005807">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005808">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005809">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005810">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005811">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005812">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005813">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005814">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005815">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005816">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005818">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005820">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005846">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005847">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005848">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005849">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005850">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005851">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005852">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005853">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005854">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005855">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005856">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005857">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005858">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005859">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005860">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005861">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005862">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005863">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005864">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005865">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005866">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005867">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005868">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005869">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005870">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005871">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005872">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005873">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005874">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005875">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005876">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005877">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005878">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005879">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005880">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005881">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005882">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005883">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005884">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005885">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005886">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005887">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005888">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005889">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005890">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005891">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005892">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005893">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005894">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005895">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005896">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005897">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005898">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005899">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005900">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="40" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="40" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="40" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="40" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005901">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005904">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005906">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="3" Font1="Tahoma|13|0|2" Font2="Tahoma|13|4|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005907">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005908">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005909">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="005910">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005911">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005912">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="005913">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005914">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005915">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005916">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005917">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005918">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005919">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005920">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005921">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005922">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005923">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005926">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005927">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005928">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005930">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005931">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005932">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005933">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005934">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="005935">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005936">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005937">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005938">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="005939">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005940">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005941">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005942">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005943">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005944">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005945">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005946">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="005947">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005948">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005949">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005950">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="005951">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005952">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005953">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12 R" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Outcome Text dy 12" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005954">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005955">
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome Dim" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="005956">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body2.5" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005957">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005958">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Outcome" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005969">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4815" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005970">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4815" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005971">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4815" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005972">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="4815" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="005977">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006047">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="4" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006048">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006049">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006050">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006051">
        <Set Vis="0" Prev="4446" Style="2" StyleName="" X="405" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006052">
        <Set Vis="0" Prev="6047" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="4" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6047" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006053">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006054">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006055">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006056">
        <Set Vis="0" Prev="6052" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="4" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6052" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006057">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006058">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006059">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006060">
        <Set Vis="0" Prev="6056" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="4" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6056" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006061">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006062">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006063">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006064">
        <Set Vis="0" Prev="6060" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="4" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6060" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006065">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006066">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006067">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006068">
        <Set Vis="0" Prev="6064" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="4" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6064" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006069">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006070">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006071">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006072">
        <Set Vis="0" Prev="6068" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="4" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6068" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006073">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="20" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006074">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006075">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006076">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="405" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006077">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006078">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006079">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006080">
        <Set Vis="1" Prev="6077" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006081">
        <Set Vis="1" Prev="6077" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6077" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006082">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006083">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006084">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006085">
        <Set Vis="1" Prev="6081" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6081" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006086">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006087">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006088">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006089">
        <Set Vis="1" Prev="6085" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6085" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006090">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006091">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006092">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006093">
        <Set Vis="1" Prev="6089" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6089" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006094">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006095">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006096">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006097">
        <Set Vis="1" Prev="6093" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6093" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006098">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006099">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006100">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006101">
        <Set Vis="1" Prev="6097" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="6097" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006102">
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006103">
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006104">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="150" Y="0" Hor="0" Ver="2" SpX="50" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006253">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006254">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006255">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006256">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006257">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006258">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006259">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006274">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006275">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006276">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006277">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006278">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006279">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="006280">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="008456">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="BriefTableNotes" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="009644">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="8" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010099">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010100">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010101">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010102">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010103">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010104">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010106">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010107">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010108">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010109">
        <Set Vis="0" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010110">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010111">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010112">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="010737">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="010738">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="010739">
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="010740">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="12" Y="291" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011319">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011320">
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011345">
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="350" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011346">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
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
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="0" Y="1006" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="011974">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011975">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011976">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011977">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011978">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011979">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011980">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011981">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011982">
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="325" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011983">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011984">
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="325" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011985">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011986">
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="325" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011988">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011989">
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="325" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011991">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011992">
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="325" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011994">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011995">
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="325" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011997">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011998">
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="325" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="011999">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012000">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012001">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012002">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012003">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012004">
        <Set Vis="0" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012005">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012006">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="5" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012007">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012008">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012009">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="4799" Style="2" StyleName="Input Table" EqStyle="7" />
        <Set Vis="1" Prev="4799" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012010">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012011">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012012">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012020">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012021">
        <Set Vis="0" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="=" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="30" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012022">
        <Set Vis="0" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="= value" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="2" SpX="25" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012023">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Label Left" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012024">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012025">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012026">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012027">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012028">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012029">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012031">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012033">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012034">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012035">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012036">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012037">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012038">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|14|0|2" Font2="Tahoma|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012039">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012040">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012041">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012042">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012043">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012044">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012045">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012046">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012047">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012048">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012049">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012050">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012051">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012052">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012053">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012054">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012055">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012056">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012057">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012058">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012059">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012060">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012061">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012062">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012063">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012064">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012201">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012202">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012203">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012204">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012205">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012206">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012207">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012208">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012209">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012210">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012211">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012213">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012214">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012216">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012217">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012219">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012220">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012222">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012223">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012225">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012226">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012228">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012229">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012231">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012232">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012234">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="290" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012235">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="320" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="tab loads" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012237">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012238">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012240">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012242">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Title" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012243">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012244">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012246">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012247">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012250">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State tab" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012253">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012254">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012255">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012256">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012257">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012258">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012259">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012260">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012261">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012262">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012263">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012264">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012265">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012266">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012267">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="75" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="75" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="75" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012268">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012269">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="405" Y="0" Hor="0" Ver="2" SpX="405" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012457">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012459">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012460">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="650" Hor="0" Ver="0" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012480">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="012481">
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome Dim" EqStyle="15" />
        <Set Vis="1" Prev="333" Style="2" StyleName="Limit State Outcome" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="0" StyleName="" X="543" Y="417" Hor="1" Ver="4" SpX="117" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="012482">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012483">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012484">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012485">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012486">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012487">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012488">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012489">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012490">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012491">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012492">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012493">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012494">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012495">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012496">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012497">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012498">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012499">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012500">
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="tab loads" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012501">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012502">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012503">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012504">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012505">
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="100" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="" X="375" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|0|2" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="6" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012506">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="5" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012507">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012508">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="405" Y="0" Hor="0" Ver="2" SpX="405" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012516">
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012518">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012552">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012553">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="4" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012557">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012558">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012559">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012560">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012563">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="3" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012564">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="3" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012565">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="3" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012566">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="3" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012567">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="3" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012568">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012569">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="3" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012570">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012571">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012572">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012573">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012574">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012575">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012576">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012577">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012578">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012579">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012580">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012581">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012582">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012583">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="3" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012584">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012585">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012586">
        <Set Vis="1" Prev="872" Style="2" StyleName="" X="325" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="10109" Style="2" StyleName="" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="10109" Style="2" StyleName="" X="350" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012587">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012588">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012591">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012592">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012593">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012594">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012595">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012596">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012597">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012598">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012599">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012600">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012601">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012602">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012603">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012604">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012605">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012606">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012607">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012608">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012609">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012610">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012611">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012612">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012613">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012614">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012615">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012616">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012617">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012618">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012619">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012620">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012621">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012622">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012623">
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012624">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="1" Ver="4" SpX="0" SpY="10" Font1="Tahoma|13|0|2" Font2="Tahoma|13|1|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012625">
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="___" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012626">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body Label" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012627">
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012628">
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="Limit State Body" EqStyle="15" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012629">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="012630">
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="" X="5" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|3|2" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="-1" Style="2" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="550">
      <TPanel Name="" ID="46" Translate="1" AutoWidth="False" AutoHeight="False" TabIndex="2" Dock="5" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-4934476" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-4934476" CaptionColor="-16777216" Collapsed="False">
        <Texts TranslateID="DIALOG_000046">
          <ENU>
          </ENU>
        </Texts>
        <TGroupBox Name="" ID="47" Translate="1" Height="56" AutoWidth="False" AutoHeight="False" TabIndex="15" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-16777216">
          <Texts TranslateID="DIALOG_000047">
            <ENU>Output Options</ENU>
          </Texts>
          <TCheckBox Name="" ID="48" Translate="1" Height="34" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="VisibDim" BookMarkID="" ForeColor="-16711423" ChbRight="True">
            <Texts TranslateID="DIALOG_000048">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
        </TGroupBox>
        <TGroupBox Name="" ID="15" Translate="1" AutoWidth="True" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-16777216">
          <Texts TranslateID="DIALOG_000015">
            <ENU>Beam Shear Loads</ENU>
          </Texts>
          <TDoubleInput Name="" ID="20" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="22" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="E↓L←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="18" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="21" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="W↓L←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="24" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="20" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="R↓L←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="22" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="19" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="S↓L←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="26" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="18" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="L↓LR←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="28" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="17" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="L↓L←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="30" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="16" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="D↓L←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        </TGroupBox>
        <TGroupBox Name="" ID="13" Translate="1" AutoWidth="True" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-16777216">
          <Texts TranslateID="DIALOG_000013">
            <ENU>Shear Connection</ENU>
          </Texts>
          <TDoubleInput Name="" ID="39" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="15" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="s↓h←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="" ID="37" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="14" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="s↓v←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="" ID="45" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="8" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="n" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="" ID="43" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="13" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="n↓v←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="" ID="41" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="12" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="n↓c←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="" ID="32" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="11" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="d↓b←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TComboBox Name="HoleType" ID="7" Translate="1" Height="32" AutoWidth="False" AutoHeight="False" TabIndex="10" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="HoleTyp" VarNameVisible="False" InputColor="-6703919" DescPos="1" InputWidth="125" Values="0|1|2|3|4" Index="0">
            <Texts TranslateID="DIALOG_000007">
              <ENU>STD|SSLT|SSLP|LSLT|LSLP</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Bolt Type" ID="31" Translate="1" Height="32" AutoWidth="False" AutoHeight="False" TabIndex="9" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="Bolt" VarNameVisible="False" InputColor="-6703919" DescPos="1" InputWidth="125" Values="0|1|2|3|4|5" Index="5">
            <Texts TranslateID="DIALOG_000031">
              <ENU>A325N|A325X|A325SC|A490N|A490X|A490SC</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
        <TGroupBox Name="" ID="12" Translate="1" AutoWidth="True" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-16777216">
          <Texts TranslateID="DIALOG_000012">
            <ENU>Shear Plate</ENU>
          </Texts>
          <TDoubleInput Name="" ID="35" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="8" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="Gap" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TDoubleInput Name="" ID="33" Translate="1" Height="30" AutoWidth="False" AutoHeight="False" TabIndex="7" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|0|3" VarName="t↓p←" VarNameVisible="True" UnitsVisible="True" InputColor="-6703919" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="0" DescPos="1" />
          <TCustomLibrary Name="Plate Steel Grade" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="Plate" DataFile="US\US_Steel.xml" Collapsed="True" UseCombo="True" Category="Carbon" Item="A36">
            <Data>
              <Header>
                <PropertySet Symbol="F↓y←" ESA_ID="F↓y←" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="F↓u←" ESA_ID="F↓u←" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="ν" ESA_ID="ν" Unit="" Type="Numeric" />
                <PropertySet Symbol="E" ESA_ID="E" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="G" ESA_ID="G" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="ρ" ESA_ID="ρ" Unit="lb/ft↑3←" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>Carbon</P>
                  <P>A36</P>
                  <P>36</P>
                  <P>58</P>
                  <P>0.3</P>
                  <P>29000</P>
                  <P>11200</P>
                  <P>490</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
        </TGroupBox>
        <TGroupBox Name="" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-16777216">
          <Texts TranslateID="DIALOG_000011">
            <ENU>Wide Flange Beam</ENU>
          </Texts>
          <TCustomLibrary Name="Wide Flange Beam Steel Grade" ID="4" Translate="1" Height="40" AutoWidth="False" AutoHeight="False" TabIndex="6" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="BeamMat" DataFile="US\US_Steel.xml" Collapsed="True" UseCombo="True" Category="High Strength Low-Alloy" Item="A992">
            <Data>
              <Header>
                <PropertySet Symbol="F↓y←" ESA_ID="F↓y←" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="F↓u←" ESA_ID="F↓u←" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="ν" ESA_ID="ν" Unit="" Type="Numeric" />
                <PropertySet Symbol="E" ESA_ID="E" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="G" ESA_ID="G" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="ρ" ESA_ID="ρ" Unit="lb/ft↑3←" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>High Strength Low-Alloy</P>
                  <P>A992</P>
                  <P>50</P>
                  <P>65</P>
                  <P>0.3</P>
                  <P>29000</P>
                  <P>11200</P>
                  <P>490</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
          <TCustomLibrary Name="Wide Flange Beam Section" ID="3" Translate="1" Height="40" AutoWidth="False" AutoHeight="False" TabIndex="5" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="Beam" DataFile="US\US_SteelSections.xml" Collapsed="True" UseCombo="True" Category="W" Item="W16x31">
            <Data>
              <Header>
                <PropertySet Symbol="W" ESA_ID="W" Unit="lb/ft" Type="Numeric" />
                <PropertySet Symbol="A" ESA_ID="A" Unit="in↑2←" Type="Numeric" />
                <PropertySet Symbol="d" ESA_ID="d" Unit="in" Type="Numeric" />
                <PropertySet Symbol="b↓f←" ESA_ID="b↓f←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="H" ESA_ID="H" Unit="in" Type="Numeric" />
                <PropertySet Symbol="OD" ESA_ID="OD" Unit="in" Type="Numeric" />
                <PropertySet Symbol="B" ESA_ID="B" Unit="in" Type="Numeric" />
                <PropertySet Symbol="t↓w←" ESA_ID="t↓w←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="t↓f←" ESA_ID="t↓f←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="t↓des←" ESA_ID="t↓des←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="k↓des←" ESA_ID="k↓des←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="k↓1←" ESA_ID="k↓1←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="I↓x←" ESA_ID="I↓x←" Unit="in↑4←" Type="Numeric" />
                <PropertySet Symbol="Z↓x←" ESA_ID="Z↓x←" Unit="in↑3←" Type="Numeric" />
                <PropertySet Symbol="S↓x←" ESA_ID="S↓x←" Unit="in↑3←" Type="Numeric" />
                <PropertySet Symbol="r↓x←" ESA_ID="r↓x←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="I↓y←" ESA_ID="I↓y←" Unit="in↑4←" Type="Numeric" />
                <PropertySet Symbol="Z↓y←" ESA_ID="Z↓y←" Unit="in↑3←" Type="Numeric" />
                <PropertySet Symbol="S↓y←" ESA_ID="S↓y←" Unit="in↑3←" Type="Numeric" />
                <PropertySet Symbol="r↓y←" ESA_ID="r↓y←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="I↓z←" ESA_ID="I↓z←" Unit="in↑4←" Type="Numeric" />
                <PropertySet Symbol="S↓z←" ESA_ID="S↓z←" Unit="in↑3←" Type="Numeric" />
                <PropertySet Symbol="r↓z←" ESA_ID="r↓z←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="J" ESA_ID="J" Unit="in↑4←" Type="Numeric" />
                <PropertySet Symbol="C↓w←" ESA_ID="C↓w←" Unit="in↑6←" Type="Numeric" />
                <PropertySet Symbol="C" ESA_ID="C" Unit="in↑3←" Type="Numeric" />
                <PropertySet Symbol="tan(α)" ESA_ID="tan(α)" Unit="-" Type="Numeric" />
                <PropertySet Symbol="Q↓s←" ESA_ID="Q↓s←" Unit="-" Type="Numeric" />
                <PropertySet Symbol="I↓w←" ESA_ID="I↓w←" Unit="in↑4←" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>W</P>
                  <P>W16x31</P>
                  <P>31.0</P>
                  <P>9.13</P>
                  <P>15.9</P>
                  <P>5.53</P>
                  <P>0</P>
                  <P>0</P>
                  <P>0.00</P>
                  <P>0.275</P>
                  <P>0.440</P>
                  <P>0</P>
                  <P>0.842</P>
                  <P>0.7500</P>
                  <P>375.000</P>
                  <P>54.000</P>
                  <P>47.200</P>
                  <P>6.410</P>
                  <P>12.400</P>
                  <P>7.030</P>
                  <P>4.490</P>
                  <P>1.170</P>
                  <P>0</P>
                  <P>0</P>
                  <P>0</P>
                  <P>0.461</P>
                  <P>739</P>
                  <P>0</P>
                  <P>0</P>
                  <P>0</P>
                  <P>0</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
        </TGroupBox>
        <TGroupBox Name="" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-16777216">
          <Texts TranslateID="DIALOG_000010">
            <ENU>HSS Column</ENU>
          </Texts>
          <TComboBox Name="Connection Face" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="ConnFace" VarNameVisible="False" InputColor="-6703919" DescPos="1" InputWidth="125" Values="0|1|2" Index="1">
            <Texts TranslateID="DIALOG_000008">
              <ENU>N/A|Wide|Narrow</ENU>
            </Texts>
          </TComboBox>
          <TCustomLibrary Name="HSS Steel Grade" ID="2" Translate="1" Height="40" AutoWidth="False" AutoHeight="False" TabIndex="3" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="ColumnMat" DataFile="US\US_Steel.xml" Collapsed="True" UseCombo="True" Category="Carbon" Item="A500 Gr. B (Rect HSS)">
            <Data>
              <Header>
                <PropertySet Symbol="F↓y←" ESA_ID="F↓y←" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="F↓u←" ESA_ID="F↓u←" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="ν" ESA_ID="ν" Unit="" Type="Numeric" />
                <PropertySet Symbol="E" ESA_ID="E" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="G" ESA_ID="G" Unit="ksi" Type="Numeric" />
                <PropertySet Symbol="ρ" ESA_ID="ρ" Unit="lb/ft↑3←" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>Carbon</P>
                  <P>A500 Gr. B (Rect HSS)</P>
                  <P>46</P>
                  <P>58</P>
                  <P>0.3</P>
                  <P>29000</P>
                  <P>11200</P>
                  <P>490</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
          <TCustomLibrary Name="HSS Column CSS" ID="49" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="Column" DataFile="US\US_HSS Shapes.xml" Collapsed="True" UseCombo="True" Category="Rectangular HSS" Item="HSS8x4x1/2">
            <Data>
              <Header>
                <PropertySet Symbol="W" ESA_ID="W" Unit="lb/ft" Type="Numeric" />
                <PropertySet Symbol="A" ESA_ID="A" Unit="in↑2←" Type="Numeric" />
                <PropertySet Symbol="H" ESA_ID="H" Unit="in" Type="Numeric" />
                <PropertySet Symbol="OD" ESA_ID="OD" Unit="in" Type="Numeric" />
                <PropertySet Symbol="B" ESA_ID="B" Unit="in" Type="Numeric" />
                <PropertySet Symbol="t↓des←" ESA_ID="t↓des←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="I↓x←" ESA_ID="I↓x←" Unit="in↑4←" Type="Numeric" />
                <PropertySet Symbol="Z↓x←" ESA_ID="Z↓x←" Unit="in↑3←" Type="Numeric" />
                <PropertySet Symbol="S↓x←" ESA_ID="S↓x←" Unit="in↑3←" Type="Numeric" />
                <PropertySet Symbol="r↓x←" ESA_ID="r↓x←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="I↓y←" ESA_ID="I↓y←" Unit="in↑4←" Type="Numeric" />
                <PropertySet Symbol="Z↓y←" ESA_ID="Z↓y←" Unit="in↑3←" Type="Numeric" />
                <PropertySet Symbol="S↓y←" ESA_ID="S↓y←" Unit="in↑3←" Type="Numeric" />
                <PropertySet Symbol="r↓y←" ESA_ID="r↓y←" Unit="in" Type="Numeric" />
                <PropertySet Symbol="J" ESA_ID="J" Unit="in↑4←" Type="Numeric" />
                <PropertySet Symbol="C" ESA_ID="C" Unit="in↑3←" Type="Numeric" />
              </Header>
              <Items>
                <Item>
                  <P>Rectangular HSS</P>
                  <P>HSS8x4x1/2</P>
                  <P>35.24</P>
                  <P>9.74</P>
                  <P>8.00</P>
                  <P>0</P>
                  <P>4.00</P>
                  <P>0.465</P>
                  <P>71.800</P>
                  <P>23.500</P>
                  <P>17.900</P>
                  <P>2.710</P>
                  <P>23.600</P>
                  <P>14.300</P>
                  <P>11.800</P>
                  <P>1.560</P>
                  <P>61.1</P>
                  <P>24.4</P>
                </Item>
              </Items>
            </Data>
          </TCustomLibrary>
        </TGroupBox>
        <TGroupBox Name="" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-16777216">
          <Texts TranslateID="DIALOG_000014">
            <ENU>Code</ENU>
          </Texts>
          <TComboBox Name="" ID="17" Translate="1" AutoWidth="True" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="Method" VarNameVisible="False" InputColor="-6703919" DescPos="2" InputWidth="220" Values="0|1" Index="1">
            <Texts TranslateID="DIALOG_000017">
              <ENU>Instantaneous Center of Rotation Method|Elastic Method</ENU>
            </Texts>
          </TComboBox>
          <TComboBox Name="Design Method" ID="16" Translate="1" AutoWidth="True" AutoHeight="True" TabIndex="0" Dock="3" Anchor="5" Padding="5|5|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Tahoma|9|0|3" VarName="DesignMethod" VarNameVisible="False" InputColor="-6703919" DescPos="2" InputWidth="220" Values="0|1" Index="0">
            <Texts TranslateID="DIALOG_000016">
              <ENU>LRFD|ASD</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
      </TPanel>
    </Main>
    <MemberData Width="400" />
    <Setup Width="400" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="TEXT_000786">
      <ENU>"Member Properties"</ENU>
    </Item>
    <Item TranslateID="TEXT_000788">
      <ENU>"Material"</ENU>
    </Item>
    <Item TranslateID="TEXT_000791">
      <ENU>"Column Material"</ENU>
    </Item>
    <Item TranslateID="TEXT_000792">
      <ENU>"F↓yc←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000793">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000794">
      <ENU>"Minimum Yield Stress"</ENU>
    </Item>
    <Item TranslateID="TEXT_000795">
      <ENU>"F↓uc←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000796">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000797">
      <ENU>"Minimum Tensile Stress"</ENU>
    </Item>
    <Item TranslateID="TEXT_000798">
      <ENU>"Mat."</ENU>
    </Item>
    <Item TranslateID="TEXT_000799">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000800">
      <ENU>"CSS"</ENU>
    </Item>
    <Item TranslateID="TEXT_000803">
      <ENU>"Specified Cross Section"</ENU>
    </Item>
    <Item TranslateID="TEXT_000809">
      <ENU>"CSS"</ENU>
    </Item>
    <Item TranslateID="TEXT_000810">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000811">
      <ENU>"Specified Cross Section"</ENU>
    </Item>
    <Item TranslateID="TEXT_000813">
      <ENU>"d↓beam←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000814">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000815">
      <ENU>"Beam Depth"</ENU>
    </Item>
    <Item TranslateID="TEXT_000816">
      <ENU>"b↓f←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000817">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000818">
      <ENU>"Flange Width"</ENU>
    </Item>
    <Item TranslateID="TEXT_000819">
      <ENU>"t↓w←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000820">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000821">
      <ENU>"Web Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_000825">
      <ENU>"t↓f←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000826">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000827">
      <ENU>"Flange Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_000830">
      <ENU>"Material"</ENU>
    </Item>
    <Item TranslateID="TEXT_000831">
      <ENU>"Mat."</ENU>
    </Item>
    <Item TranslateID="TEXT_000832">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000833">
      <ENU>"Beam Material"</ENU>
    </Item>
    <Item TranslateID="TEXT_000834">
      <ENU>"F↓yb←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000835">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000836">
      <ENU>"Minimum Yield Stress"</ENU>
    </Item>
    <Item TranslateID="TEXT_000837">
      <ENU>"F↓ub←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000838">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000839">
      <ENU>"Minimum Tensile Stress"</ENU>
    </Item>
    <Item TranslateID="TEXT_000852">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000853">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000855">
      <ENU>"Material"</ENU>
    </Item>
    <Item TranslateID="TEXT_000856">
      <ENU>"Mat."</ENU>
    </Item>
    <Item TranslateID="TEXT_000857">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000858">
      <ENU>"Plate Material"</ENU>
    </Item>
    <Item TranslateID="TEXT_000859">
      <ENU>"F↓yp←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000860">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000861">
      <ENU>"Minimum Yield Stress"</ENU>
    </Item>
    <Item TranslateID="TEXT_000862">
      <ENU>"F↓up←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000863">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000864">
      <ENU>"Minimum Tensile Stress"</ENU>
    </Item>
    <Item TranslateID="TEXT_000866">
      <ENU>"Member Properties"</ENU>
    </Item>
    <Item TranslateID="TEXT_000868">
      <ENU>"b↓p←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000869">
      <ENU>"Width"</ENU>
    </Item>
    <Item TranslateID="TEXT_000870">
      <ENU>"t↓p←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000871">
      <ENU>"Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_000874">
      <ENU>IO.ColumnMat.Item</ENU>
    </Item>
    <Item TranslateID="TEXT_000875">
      <ENU>F↓yc←</ENU>
    </Item>
    <Item TranslateID="TEXT_000876">
      <ENU>F↓uc←</ENU>
    </Item>
    <Item TranslateID="TEXT_000877">
      <ENU>IO.Beam.Item</ENU>
    </Item>
    <Item TranslateID="TEXT_000880">
      <ENU>d↓beam←</ENU>
    </Item>
    <Item TranslateID="TEXT_000881">
      <ENU>t↓w←</ENU>
    </Item>
    <Item TranslateID="TEXT_000882">
      <ENU>b↓f←</ENU>
    </Item>
    <Item TranslateID="TEXT_000883">
      <ENU>t↓f←</ENU>
    </Item>
    <Item TranslateID="TEXT_000885">
      <ENU>IO.BeamMat.Item</ENU>
    </Item>
    <Item TranslateID="TEXT_000886">
      <ENU>F↓yb←</ENU>
    </Item>
    <Item TranslateID="TEXT_000887">
      <ENU>F↓ub←</ENU>
    </Item>
    <Item TranslateID="TEXT_000888">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000889">
      <ENU>"h↓p←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000895">
      <ENU>"Bolt Type"</ENU>
    </Item>
    <Item TranslateID="TEXT_000896">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000897">
      <ENU>BoltType</ENU>
    </Item>
    <Item TranslateID="TEXT_000898">
      <ENU>"Hole Type:"</ENU>
    </Item>
    <Item TranslateID="TEXT_000900">
      <ENU>"d↓b←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000901">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000902">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000903">
      <ENU>"# of Bolt Columns"</ENU>
    </Item>
    <Item TranslateID="TEXT_000904">
      <ENU>"n↓v←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000905">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000907">
      <ENU>"Total # of Bolts"</ENU>
    </Item>
    <Item TranslateID="TEXT_000908">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000909">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000910">
      <ENU>"s↓h←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000911">
      <ENU>"s↓v←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000912">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000913">
      <ENU>"Gap"</ENU>
    </Item>
    <Item TranslateID="TEXT_000914">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000915">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000916">
      <ENU>"Minimum Vertical Edge Distance"</ENU>
    </Item>
    <Item TranslateID="TEXT_000917">
      <ENU>"Minimum Horizontal Edge Distance"</ENU>
    </Item>
    <Item TranslateID="TEXT_000918">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000919">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000920">
      <ENU>"Hole↓v←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000921">
      <ENU>"Hole↓h←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000922">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_000923">
      <ENU>"Bolt Diameter"</ENU>
    </Item>
    <Item TranslateID="TEXT_000924">
      <ENU>"A↓b←"</ENU>
    </Item>
    <Item TranslateID="TEXT_000925">
      <ENU>"Bolt Area"</ENU>
    </Item>
    <Item TranslateID="TEXT_000926">
      <ENU>d↓b←</ENU>
    </Item>
    <Item TranslateID="TEXT_000927">
      <ENU>A↓b←</ENU>
    </Item>
    <Item TranslateID="TEXT_000929">
      <ENU>"OD"</ENU>
    </Item>
    <Item TranslateID="TEXT_000945">
      <ENU>"Outside Diameter"</ENU>
    </Item>
    <Item TranslateID="TEXT_000952">
      <ENU>IO.Plate.Item</ENU>
    </Item>
    <Item TranslateID="TEXT_000953">
      <ENU>"Member Properties"</ENU>
    </Item>
    <Item TranslateID="TEXT_000955">
      <ENU>F↓yp←</ENU>
    </Item>
    <Item TranslateID="TEXT_000956">
      <ENU>F↓up←</ENU>
    </Item>
    <Item TranslateID="TEXT_000959">
      <ENU>HoleTyp</ENU>
    </Item>
    <Item TranslateID="TEXT_000960">
      <ENU>n↓c←</ENU>
    </Item>
    <Item TranslateID="TEXT_000961">
      <ENU>n↓v←</ENU>
    </Item>
    <Item TranslateID="TEXT_000966">
      <ENU>s↓h←</ENU>
    </Item>
    <Item TranslateID="TEXT_000967">
      <ENU>s↓v←</ENU>
    </Item>
    <Item TranslateID="TEXT_000968">
      <ENU>Hole↓v←</ENU>
    </Item>
    <Item TranslateID="TEXT_000969">
      <ENU>Hole↓h←</ENU>
    </Item>
    <Item TranslateID="TEXT_000970">
      <ENU>Edge↓v←</ENU>
    </Item>
    <Item TranslateID="TEXT_000971">
      <ENU>Edge↓h←</ENU>
    </Item>
    <Item TranslateID="TEXT_000993">
      <ENU>b↓p←</ENU>
    </Item>
    <Item TranslateID="TEXT_000994">
      <ENU>h↓p←</ENU>
    </Item>
    <Item TranslateID="TEXT_000995">
      <ENU>t↓p←</ENU>
    </Item>
    <Item TranslateID="TEXT_000996">
      <ENU>Gap</ENU>
    </Item>
    <Item TranslateID="TEXT_001001">
      <ENU>"Depth"</ENU>
    </Item>
    <Item TranslateID="TEXT_001002">
      <ENU>"V↓u←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001005">
      <ENU>"Resultant Force"</ENU>
    </Item>
    <Item TranslateID="TEXT_001010">
      <ENU>"M↓u←"</ENU>
    </Item>
    <Item TranslateID="TEXT_001044">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_001077">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_004280">
      <ENU>"Plate Bolt Bearing Exceeded - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004283">
      <ENU>"Plate Bolt Bearing Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004285">
      <ENU>"Beam Set Back"</ENU>
    </Item>
    <Item TranslateID="TEXT_004286">
      <ENU>"Beam Bolt Bearing Exceeded - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004289">
      <ENU>"Beam Bolt Bearing Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004301">
      <ENU>"Plate Shear Yield Exceeded - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004304">
      <ENU>"Plate Shear Yield Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004307">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_004317">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_004318">
      <ENU>"Plate Shear Rupture Exceeded - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004321">
      <ENU>"Plate Shear Rupture Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004332">
      <ENU>"Gross Area Subject to Shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_004333">
      <ENU>"Net Area Subject to Shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_004334">
      <ENU>"Net Area Subject to Tension"</ENU>
    </Item>
    <Item TranslateID="TEXT_004337">
      <ENU>"Plate Block Shear Failure - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004340">
      <ENU>"Plate Block Shear Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004345">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_004381">
      <ENU>"R↓u←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004387">
      <ENU>"Moment on Plate"</ENU>
    </Item>
    <Item TranslateID="TEXT_004389">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_004390">
      <ENU>"Plate Buckling Failure - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004393">
      <ENU>"Plate Buckling Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004415">
      <ENU>"Interaction Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_004416">
      <ENU>"Shear Buckling/Flexural Yielding Failure - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004419">
      <ENU>"Shear Buckling/Flexural Yielding Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004429">
      <ENU>"Plate to Beam - Bolted Connection"</ENU>
    </Item>
    <Item TranslateID="TEXT_004431">
      <ENU>"Plate to Column - Welded Connection"</ENU>
    </Item>
    <Item TranslateID="TEXT_004433">
      <ENU>"NOTE: Column weld sized to develop the Connection Plate."</ENU>
    </Item>
    <Item TranslateID="TEXT_004446">
      <ENU>"Fillet Weld Thickness, D↓weld← =  " &amp; '(5/8*t↓p←)' &amp; " = " &amp; D/16 &amp; " in"</ENU>
    </Item>
    <Item TranslateID="TEXT_004449">
      <ENU>"Error - Specify the Connection Face"</ENU>
    </Item>
    <Item TranslateID="TEXT_004450">
      <ENU>"Factored Shear Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_004454">
      <ENU>"Simple Shear Connection - Shear Tab (WF Beam to HSS Column)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004455">
      <ENU>"n"</ENU>
    </Item>
    <Item TranslateID="TEXT_004456">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_004458">
      <ENU>n</ENU>
    </Item>
    <Item TranslateID="TEXT_004459">
      <ENU>"n↓c←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004460">
      <ENU>"Bolts per Column"</ENU>
    </Item>
    <Item TranslateID="TEXT_004461">
      <ENU>"Spacing between Columns"</ENU>
    </Item>
    <Item TranslateID="TEXT_004462">
      <ENU>"Spacing within Column"</ENU>
    </Item>
    <Item TranslateID="TEXT_004463">
      <ENU>"Hole Vertical Dimension"</ENU>
    </Item>
    <Item TranslateID="TEXT_004464">
      <ENU>"Hole Horizontal Dimension"</ENU>
    </Item>
    <Item TranslateID="TEXT_004465">
      <ENU>"Edge↓v←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004466">
      <ENU>"Edge↓h←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004492">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_004493">
      <ENU>"Beam Shear Yield Failure - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004496">
      <ENU>"Beam Shear Yield Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004506">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_004507">
      <ENU>"Beam Shear Rupture Failure - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004510">
      <ENU>"Beam Shear Rupture Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004513">
      <ENU>"(J4-4)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004515">
      <ENU>"(G2-1)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004517">
      <ENU>'h/t↓w←' &amp; " = " &amp; h/t↓w← &amp; " = " &amp; ht↓w← &amp; " ≤ " &amp; "2.24√(E/F↓y←)" &amp; " = " &amp; 2.24*SQRT(E↓b←/F↓yb←) &amp; " = " &amp; ht↓w2←</ENU>
    </Item>
    <Item TranslateID="TEXT_004525">
      <ENU>"(G2-2)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004526">
      <ENU>'h/t↓w←' &amp; " ≤ 2.24√(E/F↓y←)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004527">
      <ENU>"B4.1b.(a)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004528">
      <ENU>"Does not meet criteria stated in Section G2.1(a)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004529">
      <ENU>"Web shear coefficent (C↓v←) must be adjusted for inelastic web buckling"</ENU>
    </Item>
    <Item TranslateID="TEXT_004530">
      <ENU>"1.1√(k↓v←*E/F↓y←) &lt; h/t↓w← ≤ 1.37√(k↓v←*E/F↓y←)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004531">
      <ENU>1.1*SQRT(k↓v←*E↓b←/F↓yb←) &amp; " &lt; " &amp; h/t↓w← &amp; " ≤ " &amp; 1.37*SQRT(k↓v←*E↓b←/F↓yb←) &amp; " = " &amp; ht↓w1← &amp; " &lt; " &amp; ht↓w← &amp; " ≤ " &amp; ht↓w2←</ENU>
    </Item>
    <Item TranslateID="TEXT_004538">
      <ENU>"Does not meet criteria stated in Section G2.1(a)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004539">
      <ENU>'h/t↓w←' &amp; " = " &amp; h/t↓w← &amp; " = " &amp; ht↓w← &amp; " &gt; 1.37√(k↓v←*E/F↓y←)" &amp; " = " &amp; 1.37*SQRT(k↓v←*E↓b←/F↓yb←) &amp; " = " &amp; ht↓w2←</ENU>
    </Item>
    <Item TranslateID="TEXT_004545">
      <ENU>"Web shear coefficent (C↓v←) must be adjusted for elastic web buckling"</ENU>
    </Item>
    <Item TranslateID="TEXT_004548">
      <ENU>"(G2-4)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004549">
      <ENU>"(G2-5)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004550">
      <ENU>"(G2-2)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004552">
      <ENU>"Area of Web"</ENU>
    </Item>
    <Item TranslateID="TEXT_004554">
      <ENU>"t↓p ←≤ d↓b←/2 + 1/16"</ENU>
    </Item>
    <Item TranslateID="TEXT_004555">
      <ENU>t↓p← &amp; " ≤ " &amp; t↓des←</ENU>
    </Item>
    <Item TranslateID="TEXT_004556">
      <ENU>"t↓w ←≤ d↓b←/2 + 1/16"</ENU>
    </Item>
    <Item TranslateID="TEXT_004557">
      <ENU>t↓w← &amp; " ≤ " &amp; t↓des←</ENU>
    </Item>
    <Item TranslateID="TEXT_004561">
      <ENU>"neither t↓w← or t↓p← satisfy t ≤ d↓b←/2 + 1/16"</ENU>
    </Item>
    <Item TranslateID="TEXT_004562">
      <ENU>"t↓max← need not be checked"</ENU>
    </Item>
    <Item TranslateID="TEXT_004563">
      <ENU>"t↓max← need not be checked"</ENU>
    </Item>
    <Item TranslateID="TEXT_004564">
      <ENU>"t↓w ←≤ d↓b←/2 + 1/16"</ENU>
    </Item>
    <Item TranslateID="TEXT_004565">
      <ENU>t↓w← &amp; " ≤ " &amp; t↓des←</ENU>
    </Item>
    <Item TranslateID="TEXT_004566">
      <ENU>"t↓p ←≤ d↓b←/2 + 1/16"</ENU>
    </Item>
    <Item TranslateID="TEXT_004567">
      <ENU>t↓p← &amp; " ≤ " &amp; t↓des←</ENU>
    </Item>
    <Item TranslateID="TEXT_004568">
      <ENU>"t↓max← need not be checked"</ENU>
    </Item>
    <Item TranslateID="TEXT_004571">
      <ENU>"neither t↓w← or t↓p← satisfy t ≤ d↓b←/2 + 1/16"</ENU>
    </Item>
    <Item TranslateID="TEXT_004573">
      <ENU>"L↓ehp← ≥ 2d↓b←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004576">
      <ENU>L↓ehp← &amp; " = " &amp; L↓eh←</ENU>
    </Item>
    <Item TranslateID="TEXT_004577">
      <ENU>"L↓ehb← ≥ 2d↓b←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004578">
      <ENU>L↓ehb← &amp; " = " &amp; L↓eh←</ENU>
    </Item>
    <Item TranslateID="TEXT_004582">
      <ENU>"L↓ehp← ≥ 2d↓b←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004583">
      <ENU>L↓ehp← &amp; " = " &amp; L↓eh←</ENU>
    </Item>
    <Item TranslateID="TEXT_004584">
      <ENU>"L↓ehb← ≥ 2d↓b←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004585">
      <ENU>L↓ehb← &amp; " = " &amp; L↓eh←</ENU>
    </Item>
    <Item TranslateID="TEXT_004589">
      <ENU>"L↓ehp← ≥ 2d↓b←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004590">
      <ENU>L↓ehp← &amp; " = " &amp; L↓eh←</ENU>
    </Item>
    <Item TranslateID="TEXT_004591">
      <ENU>"L↓ehb← ≥ 2d↓b←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004592">
      <ENU>L↓ehb← &amp; " = " &amp; L↓eh←</ENU>
    </Item>
    <Item TranslateID="TEXT_004593">
      <ENU>"t↓p← ≤ t↓max←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004594">
      <ENU>t↓p← &amp; " ≤ " &amp; t↓maxp2←</ENU>
    </Item>
    <Item TranslateID="TEXT_004595">
      <ENU>"t↓p← &gt; t↓max←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004596">
      <ENU>t↓p← &amp; " &gt; " &amp; t↓maxp2←</ENU>
    </Item>
    <Item TranslateID="TEXT_004599">
      <ENU>"Maximum Plate Thickness Exceeded - Revise"</ENU>
    </Item>
    <Item TranslateID="TEXT_004607">
      <ENU>"Plate Thickness within Allowable Range"</ENU>
    </Item>
    <Item TranslateID="TEXT_004608">
      <ENU>"t↓p← ≤ t↓max←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004609">
      <ENU>t↓p← &amp; " ≤ " &amp; t↓maxp2←</ENU>
    </Item>
    <Item TranslateID="TEXT_004610">
      <ENU>"Plate Thickness within Allowable Range"</ENU>
    </Item>
    <Item TranslateID="TEXT_004612">
      <ENU>"t↓p← &gt; t↓max←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004613">
      <ENU>t↓p← &amp; " &gt; " &amp; t↓maxp2←</ENU>
    </Item>
    <Item TranslateID="TEXT_004614">
      <ENU>"Maximum Plate Thickness Exceeded - Revise"</ENU>
    </Item>
    <Item TranslateID="TEXT_004616">
      <ENU>"t↓p← ≤ t↓max←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004617">
      <ENU>t↓p← &amp; " ≤ " &amp; t↓maxp←</ENU>
    </Item>
    <Item TranslateID="TEXT_004618">
      <ENU>"Plate Thickness within Allowable Range"</ENU>
    </Item>
    <Item TranslateID="TEXT_004620">
      <ENU>"t↓p← &gt; t↓max←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004621">
      <ENU>t↓p← &amp; " &gt; " &amp; t↓maxp←</ENU>
    </Item>
    <Item TranslateID="TEXT_004622">
      <ENU>"Maximum Plate Thickness Exceeded - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004627">
      <ENU>"Design Check Exception Satisfied"</ENU>
    </Item>
    <Item TranslateID="TEXT_004628">
      <ENU>"Design Check Exception Satisfied"</ENU>
    </Item>
    <Item TranslateID="TEXT_004629">
      <ENU>"Design Check Exception Satisfied"</ENU>
    </Item>
    <Item TranslateID="TEXT_004630">
      <ENU>"AISC 360-10, Part 10 page 10-104"</ENU>
    </Item>
    <Item TranslateID="TEXT_004631">
      <ENU>"Design Checks"</ENU>
    </Item>
    <Item TranslateID="TEXT_004632">
      <ENU>"AISC 360-10, Spec. K (K1-3)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004633">
      <ENU>"t↓p← ≤ (F↓u←/F↓yp←)*t"</ENU>
    </Item>
    <Item TranslateID="TEXT_004637">
      <ENU>t↓p← &amp; " ≤ " &amp; t↓maxp1←</ENU>
    </Item>
    <Item TranslateID="TEXT_004638">
      <ENU>"Plate Thickness within Allowable Range"</ENU>
    </Item>
    <Item TranslateID="TEXT_004640">
      <ENU>"t↓p← &gt; (F↓u←/F↓yp←)*t"</ENU>
    </Item>
    <Item TranslateID="TEXT_004641">
      <ENU>t↓p← &amp; " &gt; " &amp; t↓maxp1←</ENU>
    </Item>
    <Item TranslateID="TEXT_004642">
      <ENU>"Maximum Plate Thickness Exceeded - Revise"</ENU>
    </Item>
    <Item TranslateID="TEXT_004644">
      <ENU>"AISC 360-10, Part 10, page 10-167"</ENU>
    </Item>
    <Item TranslateID="TEXT_004646">
      <ENU>"D/t ≤ 0.11E/F↓y←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004671">
      <ENU>D↓t← &amp; " ≤ " &amp; D↓tmax←</ENU>
    </Item>
    <Item TranslateID="TEXT_004672">
      <ENU>"HSS Column is Not Slender"</ENU>
    </Item>
    <Item TranslateID="TEXT_004675">
      <ENU>"HSS Column is Slender - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004676">
      <ENU>"HSS Column is Not Slender"</ENU>
    </Item>
    <Item TranslateID="TEXT_004678">
      <ENU>"HSS Column is Slender - Revise"</ENU>
    </Item>
    <Item TranslateID="TEXT_004682">
      <ENU>"b/t ≤ 1.40√(E/F↓y←)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004683">
      <ENU>b↓t← &amp; " ≤ " &amp; b↓tmax←</ENU>
    </Item>
    <Item TranslateID="TEXT_004684">
      <ENU>"D/t &gt; 0.11E/F↓y←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004685">
      <ENU>D↓t← &amp; " &gt; " &amp; D↓tmax←</ENU>
    </Item>
    <Item TranslateID="TEXT_004686">
      <ENU>"b/t &gt; 1.40√(E/F↓y←)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004687">
      <ENU>b↓t← &amp; " &gt; " &amp; b↓tmax←</ENU>
    </Item>
    <Item TranslateID="TEXT_004688">
      <ENU>"HSS Thickness within Allowable Range"</ENU>
    </Item>
    <Item TranslateID="TEXT_004690">
      <ENU>"HSS Thickness Below Minimum - Revise"</ENU>
    </Item>
    <Item TranslateID="TEXT_004692">
      <ENU>"AISC 360-10, Part 9, page 9-5"</ENU>
    </Item>
    <Item TranslateID="TEXT_004694">
      <ENU>"t↓c← ≥ t↓cmin←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004695">
      <ENU>t↓c← &amp; " ≥ " &amp; t↓cmin←</ENU>
    </Item>
    <Item TranslateID="TEXT_004696">
      <ENU>"t↓c← &lt; t↓cmin←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004697">
      <ENU>t↓c← &amp; " &lt; " &amp; t↓cmin←</ENU>
    </Item>
    <Item TranslateID="TEXT_004700">
      <ENU>"Gross Area in Shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_004702">
      <ENU>"Net Area in Shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_004704">
      <ENU>"Net Area in Tension"</ENU>
    </Item>
    <Item TranslateID="TEXT_004712">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_004713">
      <ENU>"Beam Block Shear Failure - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004716">
      <ENU>"Beam Block Shear Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004732">
      <ENU>"AISC 360-10, Spec. J3.10"</ENU>
    </Item>
    <Item TranslateID="TEXT_004733">
      <ENU>"(J3-6c)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004734">
      <ENU>"(J3-6c)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004735">
      <ENU>"(J3-6a)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004736">
      <ENU>"(J3-6a)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004737">
      <ENU>"(J3-6c)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004738">
      <ENU>"(J3-6a)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004739">
      <ENU>"(J3-6a)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004740">
      <ENU>"(J3-6c)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004741">
      <ENU>"AISC 360-10, Spec. J3.10"</ENU>
    </Item>
    <Item TranslateID="TEXT_004742">
      <ENU>"AISC 360-10, Spec. J4.2(a)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004743">
      <ENU>"(J4-3)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004744">
      <ENU>"Gross Area Subject to Shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_004745">
      <ENU>"AISC 360-10, Spec. J4.2(b)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004746">
      <ENU>"Net Area Subject to Shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_004747">
      <ENU>"(J4-4)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004748">
      <ENU>"AISC 360-10, Spec. J4.3"</ENU>
    </Item>
    <Item TranslateID="TEXT_004749">
      <ENU>"(J4-5)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004750">
      <ENU>"AISC 360-10, Part 9, page 9-8"</ENU>
    </Item>
    <Item TranslateID="TEXT_004751">
      <ENU>"(9-12)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004752">
      <ENU>"(9-6)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004753">
      <ENU>"(10-5)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004754">
      <ENU>"(V↓r←/V↓c←)↑2←+(M↓r←/M↓c←)↑2←  ≤  1.0"</ENU>
    </Item>
    <Item TranslateID="TEXT_004755">
      <ENU>"AISC 360-10, Part 10, page 10-104"</ENU>
    </Item>
    <Item TranslateID="TEXT_004756">
      <ENU>"(10-4)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004757">
      <ENU>"(10-3)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004758">
      <ENU>"(10-4)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004759">
      <ENU>"(10-3)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004760">
      <ENU>"(10-4)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004761">
      <ENU>"(10-3)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004762">
      <ENU>"(K1-3)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004763">
      <ENU>"(9-2)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004770">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_004771">
      <ENU>IO.Column.Item</ENU>
    </Item>
    <Item TranslateID="TEXT_004773">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_004774">
      <ENU>OD</ENU>
    </Item>
    <Item TranslateID="TEXT_004792">
      <ENU>"Connection Width"</ENU>
    </Item>
    <Item TranslateID="TEXT_004793">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_004794">
      <ENU>cf</ENU>
    </Item>
    <Item TranslateID="TEXT_004795">
      <ENU>"b↓c←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004796">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_004797">
      <ENU>b↓c←</ENU>
    </Item>
    <Item TranslateID="TEXT_004798">
      <ENU>"Overall Width"</ENU>
    </Item>
    <Item TranslateID="TEXT_004799">
      <ENU>"h↓c←"</ENU>
    </Item>
    <Item TranslateID="TEXT_004800">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_004801">
      <ENU>h↓c←</ENU>
    </Item>
    <Item TranslateID="TEXT_004802">
      <ENU>"Overall Height"</ENU>
    </Item>
    <Item TranslateID="TEXT_004808">
      <ENU>"F↓nv←  =  " &amp; F↓nv←</ENU>
    </Item>
    <Item TranslateID="TEXT_004809">
      <ENU>"Shear Strength of Bolt Material"</ENU>
    </Item>
    <Item TranslateID="TEXT_004810">
      <ENU>"Eccentricity Coefficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004811">
      <ENU>"C  =  " &amp; C</ENU>
    </Item>
    <Item TranslateID="TEXT_004817">
      <ENU>"AISC 360-10, Part 7"</ENU>
    </Item>
    <Item TranslateID="TEXT_004818">
      <ENU>"(7-19)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004820">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_004821">
      <ENU>"Bolt Shear Strength Exceeded - Revise Design"</ENU>
    </Item>
    <Item TranslateID="TEXT_004824">
      <ENU>"Bolt Shear Strength Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_004826">
      <ENU>"AISC 360-10, Spec. J4.3"</ENU>
    </Item>
    <Item TranslateID="TEXT_004827">
      <ENU>"(J4-5)"</ENU>
    </Item>
    <Item TranslateID="TEXT_004828">
      <ENU>"AISC 360-10,Spec. G2.1"</ENU>
    </Item>
    <Item TranslateID="TEXT_004829">
      <ENU>"AISC 360-10, Spec. J4.2(b)"</ENU>
    </Item>
    <Item TranslateID="TEXT_005212">
      <ENU>"V↓a←"</ENU>
    </Item>
    <Item TranslateID="TEXT_005213">
      <ENU>"Factored Shear Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_005215">
      <ENU>"R↓a←"</ENU>
    </Item>
    <Item TranslateID="TEXT_005216">
      <ENU>"Resultant Force"</ENU>
    </Item>
    <Item TranslateID="TEXT_005220">
      <ENU>"M↓a←"</ENU>
    </Item>
    <Item TranslateID="TEXT_005221">
      <ENU>"Moment on Plate"</ENU>
    </Item>
    <Item TranslateID="TEXT_005236">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_005259">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_005282">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_005297">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_005312">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_005335">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_005352">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_005396">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_005443">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_005457">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_005492">
      <ENU>"/bolt"</ENU>
    </Item>
    <Item TranslateID="TEXT_005493">
      <ENU>"/bolt"</ENU>
    </Item>
    <Item TranslateID="TEXT_005716">
      <ENU>"F↓nv←"</ENU>
    </Item>
    <Item TranslateID="TEXT_005717">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_005718">
      <ENU>F↓nv←</ENU>
    </Item>
    <Item TranslateID="TEXT_005719">
      <ENU>"Nominal Shear Strength of Bolts"</ENU>
    </Item>
    <Item TranslateID="TEXT_005765">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_005766">
      <ENU>V↓u←</ENU>
    </Item>
    <Item TranslateID="TEXT_005767">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_005768">
      <ENU>R↓u←</ENU>
    </Item>
    <Item TranslateID="TEXT_005769">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_005770">
      <ENU>M↓up←</ENU>
    </Item>
    <Item TranslateID="TEXT_005771">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_005772">
      <ENU>V↓a←</ENU>
    </Item>
    <Item TranslateID="TEXT_005773">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_005774">
      <ENU>R↓a←</ENU>
    </Item>
    <Item TranslateID="TEXT_005775">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_005776">
      <ENU>M↓ap←</ENU>
    </Item>
    <Item TranslateID="TEXT_005815">
      <ENU>"Coefficient Calculations"</ENU>
    </Item>
    <Item TranslateID="TEXT_005900">
      <ENU>"*Verify compatibility*"</ENU>
    </Item>
    <Item TranslateID="TEXT_005901">
      <ENU>"Increase Connection Depth for Beam Stability"</ENU>
    </Item>
    <Item TranslateID="TEXT_005906">
      <ENU>"Plate Sizing"</ENU>
    </Item>
    <Item TranslateID="TEXT_005910">
      <ENU>"h↓p← &gt; T↓beam←"</ENU>
    </Item>
    <Item TranslateID="TEXT_005911">
      <ENU>h↓p← &amp; " &gt; " &amp; T↓beam←</ENU>
    </Item>
    <Item TranslateID="TEXT_005913">
      <ENU>"Connection Plate Fits on Beam"</ENU>
    </Item>
    <Item TranslateID="TEXT_005914">
      <ENU>"h↓p← &lt; T↓beam←"</ENU>
    </Item>
    <Item TranslateID="TEXT_005915">
      <ENU>h↓p← &amp; " &lt; " &amp; T↓beam←</ENU>
    </Item>
    <Item TranslateID="TEXT_005916">
      <ENU>"Bolt Group Spacing"</ENU>
    </Item>
    <Item TranslateID="TEXT_005930">
      <ENU>"h↓p← &lt; T↓beam←/2"</ENU>
    </Item>
    <Item TranslateID="TEXT_005931">
      <ENU>h↓p← &amp; " &lt; " &amp; T↓beam←/2</ENU>
    </Item>
    <Item TranslateID="TEXT_005932">
      <ENU>"Plate Depth Exceeds Web Depth - Revise"</ENU>
    </Item>
    <Item TranslateID="TEXT_005935">
      <ENU>"Horizontal Spacing between Bolt Columns"</ENU>
    </Item>
    <Item TranslateID="TEXT_005936">
      <ENU>"Vertical Spacing within Columns"</ENU>
    </Item>
    <Item TranslateID="TEXT_005939">
      <ENU>"s↓h← ≥ s↓min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_005940">
      <ENU>s↓h← &amp; " ≥ " &amp; s↓min←</ENU>
    </Item>
    <Item TranslateID="TEXT_005941">
      <ENU>"Horizontal Spacing Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_005942">
      <ENU>"s↓h← &lt; s↓min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_005943">
      <ENU>s↓h← &amp; " &lt; " &amp; s↓min←</ENU>
    </Item>
    <Item TranslateID="TEXT_005944">
      <ENU>"Increase Horizontal Spacing"</ENU>
    </Item>
    <Item TranslateID="TEXT_005947">
      <ENU>"s↓v← ≥ s↓min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_005948">
      <ENU>s↓v← &amp; " ≥ " &amp; s↓min←</ENU>
    </Item>
    <Item TranslateID="TEXT_005949">
      <ENU>"Vertical Spacing Sufficient"</ENU>
    </Item>
    <Item TranslateID="TEXT_005951">
      <ENU>"s↓v← &lt; s↓min←"</ENU>
    </Item>
    <Item TranslateID="TEXT_005952">
      <ENU>s↓v← &amp; " &lt; " &amp; s↓min←</ENU>
    </Item>
    <Item TranslateID="TEXT_005953">
      <ENU>"Increase Vertical Spacing"</ENU>
    </Item>
    <Item TranslateID="TEXT_005956">
      <ENU>"N/A"</ENU>
    </Item>
    <Item TranslateID="TEXT_005957">
      <ENU>"N/A"</ENU>
    </Item>
    <Item TranslateID="TEXT_005977">
      <ENU>"/bolt"</ENU>
    </Item>
    <Item TranslateID="TEXT_006047">
      <ENU>"D↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006048">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006049">
      <ENU>D↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006050">
      <ENU>"Dead Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006052">
      <ENU>"L↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006053">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006054">
      <ENU>L↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006055">
      <ENU>"Live Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006056">
      <ENU>"L↓LR←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006057">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006058">
      <ENU>L↓LR←</ENU>
    </Item>
    <Item TranslateID="TEXT_006059">
      <ENU>"Roof Live Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006060">
      <ENU>"S↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006061">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006062">
      <ENU>S↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006063">
      <ENU>"Snow Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006064">
      <ENU>"R↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006065">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006066">
      <ENU>R↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006067">
      <ENU>"Rain Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006068">
      <ENU>"W↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006069">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006070">
      <ENU>W↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006071">
      <ENU>"Wind Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006072">
      <ENU>"E↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006073">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006074">
      <ENU>E↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006075">
      <ENU>"Earthquake Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006077">
      <ENU>"D↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006078">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006079">
      <ENU>D↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006080">
      <ENU>"Dead Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006081">
      <ENU>"L↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006082">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006083">
      <ENU>L↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006084">
      <ENU>"Live Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006085">
      <ENU>"L↓LR←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006086">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006087">
      <ENU>L↓LR←</ENU>
    </Item>
    <Item TranslateID="TEXT_006088">
      <ENU>"Roof Live Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006089">
      <ENU>"S↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006090">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006091">
      <ENU>S↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006092">
      <ENU>"Snow Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006093">
      <ENU>"R↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006094">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006095">
      <ENU>R↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006096">
      <ENU>"Rain Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006097">
      <ENU>"W↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006098">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006099">
      <ENU>W↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006100">
      <ENU>"Wind Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_006101">
      <ENU>"E↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_006102">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_006103">
      <ENU>E↓L←</ENU>
    </Item>
    <Item TranslateID="TEXT_006104">
      <ENU>"Earthquake Load"</ENU>
    </Item>
    <Item TranslateID="TEXT_009644">
      <ENU>"Notes:"</ENU>
    </Item>
    <Item TranslateID="TEXT_010102">
      <ENU>"Input Information"</ENU>
    </Item>
    <Item TranslateID="TEXT_010103">
      <ENU>"HSS Column Details"</ENU>
    </Item>
    <Item TranslateID="TEXT_010104">
      <ENU>"Wide Flange Beam Details"</ENU>
    </Item>
    <Item TranslateID="TEXT_010106">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_010107">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_010108">
      <ENU>"Plate Details"</ENU>
    </Item>
    <Item TranslateID="TEXT_010109">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_010110">
      <ENU>"Connection Details"</ENU>
    </Item>
    <Item TranslateID="TEXT_010111">
      <ENU>"Loading Analysis"</ENU>
    </Item>
    <Item TranslateID="TEXT_010112">
      <ENU>"Loading"</ENU>
    </Item>
    <Item TranslateID="TEXT_011346">
      <ENU>"Limit State Check Summary (LRFD)"</ENU>
    </Item>
    <Item TranslateID="TEXT_011981">
      <ENU>"LRFD↓1← = " &amp; '1.4*D↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_011982">
      <ENU>" = " &amp; 1.4*D↓L← &amp; " = " &amp; LRFD↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_011983">
      <ENU>"LRFD↓2← = " &amp; '1.2*D↓L←+1.6*L↓L←+0.5*MAX(L↓LR←, S↓L←, R↓L←)'</ENU>
    </Item>
    <Item TranslateID="TEXT_011984">
      <ENU>" = " &amp; 1.2*D↓L←+1.6*L↓L←+0.5*LSR &amp; " = " &amp; LRFD↓2←</ENU>
    </Item>
    <Item TranslateID="TEXT_011985">
      <ENU>"LRFD↓3← = " &amp; '1.2*D↓L←+1.6*MAX(L↓LR←, S↓L←, R↓L←)+MAX(L↓L←, 0.5*W↓L←)'</ENU>
    </Item>
    <Item TranslateID="TEXT_011986">
      <ENU>→011987" = " &amp; 1.2*D↓L←+1.6*LSR+LW &amp; " = " &amp; LRFD↓3←</ENU>
    </Item>
    <Item TranslateID="TEXT_011988">
      <ENU>"LRFD↓4← = " &amp; '1.2*D↓L←+1.0*W↓L←+L↓L←+0.5*MAX(L↓LR←, S↓L←, R↓L←)'</ENU>
    </Item>
    <Item TranslateID="TEXT_011989">
      <ENU>→011990" = " &amp; 1.2*D↓L←+1.0*W↓L←+L↓L←+0.5*LSR &amp; " = " &amp; LRFD↓4←</ENU>
    </Item>
    <Item TranslateID="TEXT_011991">
      <ENU>"LRFD↓5← = " &amp; '1.2*D↓L←+1.0*E↓L←+L↓L←+0.2*S↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_011992">
      <ENU>→011993" = " &amp; 1.2*D↓L←+1.0*E↓L←+L↓L←+0.2*S↓L← &amp; " = " &amp; LRFD↓5←</ENU>
    </Item>
    <Item TranslateID="TEXT_011994">
      <ENU>"LRFD↓6← = " &amp; '0.9*D↓L←+1.0*W↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_011995">
      <ENU>→011996" = " &amp; 0.9*D↓L←+1.0*W↓L← &amp; " = " &amp; LRFD↓6←</ENU>
    </Item>
    <Item TranslateID="TEXT_011997">
      <ENU>"LRFD↓7← = 0.9*D↓L←+1.0*E↓L←"</ENU>
    </Item>
    <Item TranslateID="TEXT_011998">
      <ENU>" = " &amp; 0.9*D↓L←+1.0*E↓L← &amp; " = " &amp; LRFD↓7←</ENU>
    </Item>
    <Item TranslateID="TEXT_011999">
      <ENU>"Load Combinations - LRFD"</ENU>
    </Item>
    <Item TranslateID="TEXT_012000">
      <ENU>"____________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012001">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012002">
      <ENU>"Eccentricity &amp; Coefficient Calculations"</ENU>
    </Item>
    <Item TranslateID="TEXT_012003">
      <ENU>"Resulting Forces"</ENU>
    </Item>
    <Item TranslateID="TEXT_012004">
      <ENU>"________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012005">
      <ENU>"________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012006">
      <ENU>"Eccentricity"</ENU>
    </Item>
    <Item TranslateID="TEXT_012007">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012008">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012009">
      <ENU>"t↓HSS←"</ENU>
    </Item>
    <Item TranslateID="TEXT_012010">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_012011">
      <ENU>t↓HSS←</ENU>
    </Item>
    <Item TranslateID="TEXT_012012">
      <ENU>"HSS Wall Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_012020">
      <ENU>"t↓HSS←"</ENU>
    </Item>
    <Item TranslateID="TEXT_012021">
      <ENU>"="</ENU>
    </Item>
    <Item TranslateID="TEXT_012022">
      <ENU>t↓HSS←</ENU>
    </Item>
    <Item TranslateID="TEXT_012023">
      <ENU>"HSS Wall Thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_012024">
      <ENU>"Limit State Calculations"</ENU>
    </Item>
    <Item TranslateID="TEXT_012025">
      <ENU>"Dimensional Limit States"</ENU>
    </Item>
    <Item TranslateID="TEXT_012026">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012027">
      <ENU>"Plate Dimensions"</ENU>
    </Item>
    <Item TranslateID="TEXT_012028">
      <ENU>"Plate on Beam"</ENU>
    </Item>
    <Item TranslateID="TEXT_012034">
      <ENU>"Connection Sizing"</ENU>
    </Item>
    <Item TranslateID="TEXT_012036">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012038">
      <ENU>"Strength Limit States"</ENU>
    </Item>
    <Item TranslateID="TEXT_012040">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012041">
      <ENU>"Bolt Shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_012044">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012045">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012046">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012047">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012048">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012049">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012050">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012051">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012052">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012053">
      <ENU>"_____________________________________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012054">
      <ENU>"Bolt Bearing - Plate"</ENU>
    </Item>
    <Item TranslateID="TEXT_012055">
      <ENU>"Bolt Bearing - Beam"</ENU>
    </Item>
    <Item TranslateID="TEXT_012056">
      <ENU>"Plate Shear Yield"</ENU>
    </Item>
    <Item TranslateID="TEXT_012057">
      <ENU>"Plate Shear Rupture"</ENU>
    </Item>
    <Item TranslateID="TEXT_012058">
      <ENU>"Plate Block Shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_012059">
      <ENU>"Plate Buckling"</ENU>
    </Item>
    <Item TranslateID="TEXT_012060">
      <ENU>"Combined Shear and Bending on Plate"</ENU>
    </Item>
    <Item TranslateID="TEXT_012061">
      <ENU>"Beam Block Shear"</ENU>
    </Item>
    <Item TranslateID="TEXT_012062">
      <ENU>"Beam Shear Yield &amp; Shear Buckling"</ENU>
    </Item>
    <Item TranslateID="TEXT_012063">
      <ENU>"Beam Shear Rupture"</ENU>
    </Item>
    <Item TranslateID="TEXT_012064">
      <ENU>"Loading Analysis"</ENU>
    </Item>
    <Item TranslateID="TEXT_012210">
      <ENU>"ASD↓1← = " &amp; 'D↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_012211">
      <ENU>→012212" = " &amp; D↓L← &amp; " = " &amp; ASD↓1←</ENU>
    </Item>
    <Item TranslateID="TEXT_012213">
      <ENU>"ASD↓2 ←= " &amp; 'D↓L←+L↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_012214">
      <ENU>→012215" = " &amp; D↓L←+L↓L← &amp; " = " &amp; ASD↓2←</ENU>
    </Item>
    <Item TranslateID="TEXT_012216">
      <ENU>"ASD↓3← = " &amp; 'D↓L←+MAX(L↓LR←, S↓L←, R↓L←)'</ENU>
    </Item>
    <Item TranslateID="TEXT_012217">
      <ENU>→012218" = " &amp; D↓L←+LSR &amp; " = " &amp; ASD↓3←</ENU>
    </Item>
    <Item TranslateID="TEXT_012219">
      <ENU>"ASD↓4← = " &amp; 'D↓L←+0.75*L↓L←+0.75*MAX(L↓LR←, S↓L←, R↓L←)'</ENU>
    </Item>
    <Item TranslateID="TEXT_012220">
      <ENU>→012221" = " &amp; D↓L←+0.75*L↓L←+0.75*LSR &amp; " = " &amp; ASD↓4←</ENU>
    </Item>
    <Item TranslateID="TEXT_012222">
      <ENU>"ASD↓5← = " &amp; 'D↓L←+MAX(0.6*W↓L←, 0.7*E↓L←)'</ENU>
    </Item>
    <Item TranslateID="TEXT_012223">
      <ENU>→012224" = " &amp; D↓L←+WE &amp; " = " &amp; ASD↓5←</ENU>
    </Item>
    <Item TranslateID="TEXT_012225">
      <ENU>"ASD↓6a←= " &amp; 'D↓L←+0.75*L↓L←+0.75*(0.6*W↓L←)+0.75*MAX(L↓LR←, S↓L←, R↓L←)'</ENU>
    </Item>
    <Item TranslateID="TEXT_012226">
      <ENU>→012227" = " &amp; D↓L←+0.75*L↓L←+0.75*(0.6*W↓L←)+0.75*LSR &amp; " = " &amp; ASD↓6a←</ENU>
    </Item>
    <Item TranslateID="TEXT_012228">
      <ENU>"ASD↓6b←= " &amp; 'D↓L←+0.75*L↓L←+0.75*(0.7*E↓L←)+0.75*S↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_012229">
      <ENU>→012230" = " &amp; D↓L←+0.75*L↓L←+0.75*(0.7*E↓L←)+0.75*S↓L← &amp; " = " &amp; ASD↓6b←</ENU>
    </Item>
    <Item TranslateID="TEXT_012231">
      <ENU>"ASD↓7 ←= " &amp; '0.6*D↓L←+0.6*W↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_012232">
      <ENU>→012233" = " &amp; 0.6*D↓L←+0.6*W↓L← &amp; " = " &amp; ASD↓7←</ENU>
    </Item>
    <Item TranslateID="TEXT_012234">
      <ENU>"ASD↓8← = " &amp; '0.6*D↓L←+0.7*E↓L←'</ENU>
    </Item>
    <Item TranslateID="TEXT_012235">
      <ENU>→012236" = " &amp; 0.6*D↓L←+0.7*E↓L← &amp; " = " &amp; ASD↓8←</ENU>
    </Item>
    <Item TranslateID="TEXT_012237">
      <ENU>"Load Combinations - ASD"</ENU>
    </Item>
    <Item TranslateID="TEXT_012238">
      <ENU>"__________________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012240">
      <ENU>"Loading"</ENU>
    </Item>
    <Item TranslateID="TEXT_012242">
      <ENU>"Resulting Forces"</ENU>
    </Item>
    <Item TranslateID="TEXT_012503">
      <ENU>"________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012504">
      <ENU>"________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012507">
      <ENU>"__________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012518">
      <ENU>'h/t↓w←' &amp; " &gt; 1.37√((k↓v←*E/F↓y←)"</ENU>
    </Item>
    <Item TranslateID="TEXT_012587">
      <ENU>ConnFace</ENU>
    </Item>
    <Item TranslateID="TEXT_012588">
      <ENU>ConnFace</ENU>
    </Item>
    <Item TranslateID="TEXT_012602">
      <ENU>"________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012624">
      <ENU>"Limit State Check Summary (ASD)"</ENU>
    </Item>
    <Item TranslateID="TEXT_012625">
      <ENU>"________________________"</ENU>
    </Item>
    <Item TranslateID="TEXT_012626">
      <ENU>"Unity Check"</ENU>
    </Item>
    <Item TranslateID="TEXT_012629">
      <ENU>"Slots perpendicular to beam centerline"</ENU>
    </Item>
    <Item TranslateID="TEXT_012630">
      <ENU>"Slots parallel to beam centerline"</ENU>
    </Item>
  </Texts>
</Root>