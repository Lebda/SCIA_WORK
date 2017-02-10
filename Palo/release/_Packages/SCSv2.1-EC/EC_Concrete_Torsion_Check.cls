<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="ea763f0e-1d01-4975-8365-9edb14385757">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">IF(PrintCaption) { 
    →INI400_001093TEXT("Check of torsion according to EN 1992-1-1"); 
} 
double π →INI400_006674= Math.PI; 
→INI400_000134BLOCK { //National annexes
    →INI400_005867BLOCK { //NA.2.7 Clause 2.4.2.4 Partial factors for materials, Paragraph (1)
        object Clause2_4_2_4_1 →INI400_005868= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_2.4.2.4(1).CLC", true); 
        →INI400_005845Clause2_4_2_4_1.Calculate(false); 
        γ↓c← →INI400_005869= Clause2_4_2_4_1.γ↓C,Per←; 
        γ↓s← →INI400_005841= Clause2_4_2_4_1.γ↓SR,Per←; 
    } 
    →INI400_000143BLOCK { //NA.2.12 Clause 3.1.6 Design compressive and tensile strength, Paragraph(1)P
        object Clause3_1_6_1P →INI400_000144= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_3.1.6(1)P.CLC", true); 
        SWITCH(IO.SetupNA.EC_NA.Code) { 
            CASE "BS" :  { 
                Clause3_1_6_1P.Press →INI400_005822= Pressure; 
            } 
            CASE "IS" :  { 
                Clause3_1_6_1P.Press →INI400_005823= Pressure; 
            } 
        } 
        →INI400_000145Clause3_1_6_1P.Calculate(false); 
        α↓cc← →INI400_000146= Clause3_1_6_1P.α↓cc←; 
    } 
    →INI400_005824BLOCK { //NA.2.13 Clause 3.1.6 Design compressive and tensile strength, Paragraph(2)P
        object Clause3_1_6_2P →INI400_005813= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_3.1.6(2)P.CLC", true); 
        →INI400_005825Clause3_1_6_2P.Calculate(false); 
        α↓ct← →INI400_005826= Clause3_1_6_2P.α↓ct←; 
    } 
    →INI400_005254BLOCK { //NA.2.46 Clause 6.2.2 Members not requiring design shear reinforcement, Paragraph(6)
        object Clause6_2_2_6 →INI400_005255= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_6.2.2(6).CLC", true); 
        Clause6_2_2_6.f↓ck← →INI400_005259= f↓ck←; 
        SWITCH(IO.SetupNA.EC_NA.Code) { 
            CASE "NBN" :  { 
                Clause6_2_2_6.α↓cc← →INI400_005833= α↓cc←; 
            } 
            CASE "DIN" :  { 
                Clause6_2_2_6.Type →INI400_005834= 0; 
            } 
        } 
    } 
    →INI400_005847BLOCK { //NA.2.47 Clause 6.2.3 Members requiring design shear reinforcement, Paragraph(2)
        object Clause6_2_3_2 →INI400_005848= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_6.2.3(2).CLC", true); 
        SWITCH(IO.SetupNA.EC_NA.Code) { 
            CASE "DIN" :  { 
                Clause6_2_3_2.f↓ck← →INI400_005849= f↓ck←; 
                Clause6_2_3_2.f↓cd← →INI400_005850= f↓cd←; 
                Clause6_2_3_2.σ↓cd← →INI400_005851= 0; 
                Clause6_2_3_2.b↓w← →INI400_005852= b↓w←; 
                Clause6_2_3_2.z →INI400_005280= 0; 
                Clause6_2_3_2.V↓Ed← →INI400_005281= 1000000; 
            } 
        } 
        →INI400_005853Clause6_2_3_2.Calculate(false); 
        θ↓min← →INI400_005854= Clause6_2_3_2.θ↓min←; 
        θ↓max← →INI400_005855= Clause6_2_3_2.θ↓max←; 
    } 
    →INI400_005835BLOCK { //NA.2.48 Clause 6.2.3 Members requiring design shear reinforcement, Paragraph(3)
        object Clause6_2_3_3 →INI400_005836= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_6.2.3(3).CLC", true); 
        Clause6_2_3_3.f↓ck← →INI400_005837= f↓ck←; 
        Clause6_2_3_3.f↓ywk← →INI400_005288= f↓ywk←; 
        Clause6_2_3_3.Prestress →INI400_005838= False; 
        SWITCH(IO.SetupNA.EC_NA.Code) { 
            CASE "NBN" :  { 
                Clause6_2_3_3.α↓cc← →INI400_005839= α↓cc←; 
            } 
            CASE "NF" :  { 
                Clause6_2_3_3.σ↓cp← →INI400_005840= 0; 
            } 
            CASE "BS" :  { 
                Clause6_2_3_3.α↓s← →INI400_005842= α↓s←; 
                
            } 
        } 
    } 
    →INI400_005856BLOCK { //NA.2.85 Clause 9.2.2 Shear reinforcement, Paragraph(5)
        object Clause9_2_2_5 →INI400_005857= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_9.2.2(5).CLC", true); 
        Clause9_2_2_5.f↓ck← →INI400_005858= f↓ck←; 
        Clause9_2_2_5.f↓yk← →INI400_005859= f↓yk←; 
        SWITCH(IO.SetupNA.EC_NA.Code) { 
            CASE "ONORM" :  { 
                Clause9_2_2_5.f↓ctm← →INI400_005860= f↓ctm←; 
                Clause9_2_2_5.f↓yd← →INI400_005861= f↓yk←/γ↓s←; 
            } 
            CASE "NBN" :  { 
                Clause9_2_2_5.f↓ywk← →INI400_005862= f↓ywk←; 
            } 
            CASE "DIN" :  { 
                Clause9_2_2_5.f↓ctm← →INI400_005863= f↓ctm←; 
                Clause9_2_2_5.Pretension →INI400_005864= False; 
            } 
        } 
    } 
} 

IndexEWN →INI400_004063= 4; 

IF(bStandAlone == True) { 
    object Diagrams →INI400_002727= LoadExternCLC("StressStrain_Diagrams.clc"); 
    Diagrams.PrintDiagrams →INI400_003342= False; 
    →INI400_003341Diagrams.Calculate(false); 
    object ReinfMat →INI400_006321= IO.REINF.EC; 
    object[] ConDiagram →INI400_002728= Diagrams.ConcreteULSdiagram(α↓cc←, γ↓c←, False); 
    object[] ReinfDiagram →INI400_002741= Diagrams.ReinfULSdiagram(γ↓s←, Coeffε↓Sud←); 
    Object[] ShapeCss →INI400_001729= IO.CS.Component.Shape.Point; 
    Object[] ReinfBars →INI400_001731= IO.Beam.Reinforcement.Bar; 
    Object[] ShearReinf →INI400_005571= IO.Beam.Reinforcement.StirrupChars; 
    double FormCode →INI400_006422= IO.CS.Geometry.FormCode; 
    
    CssID →INI400_005218= 0; 
    b_interaction →INI400_005808= False; 
    →INI400_001288CONCRETE.CreateCS(CssID, ShapeCss, ConDiagram, ReinfBars, ReinfDiagram); 
    object TableCellsFont →INI400_002929= new Font("Segoe UI", Convert.ToSingle(8.5)); //Table font
    object TableHeaderFont →INI400_002930= new Font("Segoe UI", Convert.ToSingle(8.5), FontStyle.Bold); 
    object TableBorderPen →INI400_002931= new Pen(Color.DimGray, 1); //Pen for outline of the table
    object TableGridPen →INI400_002932= new Pen(Color.LightGray, 1); //Pen for grid inside of the table  
    object EWNBorderPen →INI400_008626= new Pen(Color.White, 0); //Pen for EWN note
    object EWNCellsFont →INI400_008625= new Font("Segoe UI", Convert.ToSingle(8.5), FontStyle.Italic); //Table font
    TableWidth →INI400_002849= 585; 
    object FontStatus →INI400_007325= new Font("Segoe UI", Convert.ToSingle(8.5), FontStyle.Bold); 
    string sOK →INI400_007326= TR("OK"); 
    string sOKBUT →INI400_007327= TR("OK*"); 
    string sNOTOK →INI400_007328= TR("Not OK"); 
    double ForcesID →INI400_005871= 0; 
    →INI400_001315CONCRETE.SetForcesId(ForcesID, 0, 0, 0, T↓Ed←, 0, 0); 
    object tablerowColor →INI400_007741= Color.AliceBlue; 
    object tableHeaderColor →INI400_007742= Color.LightBlue; 
    double Alpha →INI400_008579= 128; 
    object ColorNotOK →INI400_008577= Color.FromArgb(255, 130, 130); 
    object ColorOK →INI400_008578= Color.FromArgb(100, 255, 100); 
    object ColorOKBut →INI400_008580= Color.FromArgb(100, 255, 100); 
    object ColorNotCalc →INI400_008581= Color.FromArgb(200, 200, 200); 
} 
→INI400_005830BLOCK { //NA.2.15 Clause 3.2.7 Design compressive and tensile strength, Paragraph(2)
    object Clause3_2_7_2 →INI400_005831= LoadExternCLC(Tools.Dir_Forms &amp; "Codes\EN\EN_1992\EN_1992_1_1\Clause_3.2.7(2).CLC", true); 
    Clause3_2_7_2.ε↓uk← →INI400_007183= ReinfMat.eps_uk; 
    →INI400_005225Clause3_2_7_2.Calculate(false); 
    Coeffε↓Sud← →INI400_005224= Clause3_2_7_2.X_ε_uk; 
} 
→INI400_006813BLOCK { 
    //mat chars
    f↓cd← →INI400_006810= α↓cc←*f↓ck←/γ↓c←; 
    f↓ctd← →INI400_006812= α↓ct←*f↓ctk005←/γ↓c←; 
} 

double Number↓E← →INI400_001772= 0; 
double Number↓W← →INI400_001773= 0; 
double Number↓N← →INI400_001774= 0; 
object[] EWN →INI400_001776= new object[]; 
object[] Number↓EWN← →INI400_001783= new object[]; 

a↓sl← →INI400_003883= 0; A↓sl← →INI400_005753= 0; A↓k← →INI400_005754= 0; u↓k← →INI400_005755= 0; t↓ef← →INI400_005758= 0; 
A↓swt← →INI400_003891= 0; A↓swtm← →INI400_003892= 0; s↓l← →INI400_003893= 0; θ →INI400_003897= 0; 
T↓Rdc← →INI400_005748= 0; T↓Rdst← →INI400_005756= 0; T↓Rdmax← →INI400_005749= 0; T↓Rd← →INI400_005757= 0; UC →INI400_005759= 0; 

→INI400_006440PAGEBREAK(); 

→INI400_002915BLOCK("Input data") { 
    →INI400_001096TEXT("Concrete parameters:"); 
    →INI400_001097TEXT("γ↓c←= " &amp; γ↓c← &amp; ", "); 
    →INI400_001098TEXT("α↓cc←= " &amp; α↓cc← &amp; ", "); 
    →INI400_001099TEXT("α↓ct←= " &amp; α↓ct←); 
    →INI400_001100TEXT("Reinforcement parameters:"); 
    →INI400_001101TEXT("γ↓s←= " &amp; γ↓s←); 
    →INI400_005324TEXT("Automatically created equivalent thin walled cross-section for torsion:"); 
    IF(AutoType == True) { 
        →INI400_005325TEXT("Yes"); 
    } ELSE { 
        →INI400_005326TEXT("No"); 
        →INI400_005327TEXT("Type of method for creation equivalent thin walled cross-section:"); 
        SWITCH(TypeTorCssInput) { 
            CASE 1 :  { 
                →INI400_006432TEXT("From torsional stirrup"); 
            } 
            CASE 2 :  { 
                →INI400_006433TEXT("Inputted cross-section"); 
            } 
            CASE 3 :  { 
                →INI400_006434TEXT("Effective rectangular"); 
            } 
            CASE 4 :  { 
                →INI400_006435TEXT("User input"); 
                →INI400_006437TEXT("- A↓k.inp← = " &amp; Val(A↓k.inp←*1000000, 2) &amp; " mm↑2←"); 
                →INI400_006438TEXT("- u↓k.inp← = " &amp; Val(u↓k.inp←*1000, 2) &amp; " mm"); 
                →INI400_006439TEXT("- t↓ef.inp← = " &amp; Val(t↓ef.inp←*1000, 2) &amp; " mm"); 
            } 
        } 
    } 
    →INI400_001102TEXT("Automatic calculation angle between the concrete compression strut and axis member:"); 
    IF(Auto↓θ← == True) { 
        →INI400_004005TEXT("Yes"); 
    } ELSE { 
        →INI400_004006TEXT("No"); 
    } 
    →INI400_004004TEXT("The angle between the concrete compression strut and axis member:"); 
    cotθ↓max← →INI400_001103= COTG(θ↓max←); 
    cotθ↓min← →INI400_001104= COTG(θ↓min←); 
    cotθ↓inp← →INI400_001105= COTG(θ↓inp←); 
    →INI400_001106TEXT("- user input value:"); 
    →INI400_001107TEXT("θ↓inp← = " &amp; θ↓inp← &amp; "° =&gt; cot(θ↓inp←) = " &amp; cotθ↓inp←); 
    →INI400_001108TEXT("- minimum value:"); 
    →INI400_001109TEXT("θ↓min← = " &amp; θ↓min← &amp; "° =&gt; cot(θ↓min←) = " &amp; cotθ↓min←); 
    →INI400_001110TEXT("- maximum value:"); 
    →INI400_001111TEXT("θ↓max← = " &amp; θ↓max← &amp; "° =&gt; cot(θ↓max←) = " &amp; cotθ↓max←); 
    →INI400_004007TEXT("Check maximum longitudinal spacing of shear links:"); 
    IF(bMaxSpacing == True) { 
        →INI400_004008TEXT("Yes"); 
    } ELSE { 
        →INI400_004009TEXT("No"); 
    } 
} 
→INI400_003031PAGEBREAK(); 



→INI400_002916BLOCK("Loading") { 
    object forces →INI400_006425= Concrete.GetForces(ForcesID); 
    →INI400_001114TEXT("Torsional moment:"); 
    →INI400_005199TEXT("T↓Ed← = " &amp; Val(forces.Mx/1000, 2) &amp; " kNm"); 
} 
→INI400_003032PAGEBREAK(); 

//IF(T↓Ed← == 0) { 
//    →INI400_005568TEXT("Note: Check is not done, because torsional moment (T↓Ed←) is zero"); 
//    Number↓N← →INI400_005569= Number↓N←+1; 
//    →INI400_005570EWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TR("Note"), "Description", TR("Check is not done, because torsional moment (T↓Ed←) is zero"), "Solution", TR("-"))); 
//} ELSE { 

→INI400_002917BLOCK("Materials") { 
    →INI400_001173TEXT("Concrete"); 
    →INI400_001693TEXT("C" &amp; Val(f↓ck←/1000000, 0) &amp; "/" &amp; Val(f↓ck,cube←/1000000, 0)); 
    →INI400_001172TEXT("Longitudinal reinforcement and stirrup"); 
    →INI400_001694TEXT("B" &amp; Val(f↓yk←/1000000, 0) &amp; ReinfClass); 
    →INI400_007330BLOCK("Material characteristics") { 
        →INI400_001140TEXT("Design con. compressive strength"); 
        f↓cd← →INI400_001141= α↓cc←*f↓ck←/γ↓c←; 
        →INI400_001142TEXT("Design tensile strength of concrete"); 
        f↓ctd← →INI400_001143= α↓ct←*f↓ctk005←/γ↓c←; 
    } 
} 
→INI400_003033PAGEBREAK(); 

//    Exter graphics with CSS+Reinf+Sideview
→INI400_002918BLOCK { 
    →INI400_008586TEXT("Cross section parameters"); 
    IF(IO.IsDrawing || bPrint_Img) { 
        object G2 →INI400_006407= LoadExternCLC("Graphics_2_CSS_with_reinforcement_side_view.CLC", true); 
        G2.Reinf →INI400_006421= CONCRETE.General.GetReinfBars(CssID); 
        G2.Outline →INI400_006408= CONCRETE.General.GetOutline(CssID); 
        
        G2.UserScale →INI400_006411= UserScale; 
        G2.ShapeCSS →INI400_006412= ShapeCss; 
        G2.ShearReinf →INI400_006413= ShearReinf; //ShearReinfShape; 
        G2.FormCode →INI400_006414= FormCode; 
        G2.UserDimFont →INI400_006415= 8; 
        G2.DrawStirrups →INI400_006416= true; 
        G2.DrawAxis →INI400_006417= true; 
        G2.UCSPosition →INI400_006418= 4; //UCSPosition; 
        →INI400_006420G2.Draw(false, 0); 
        
        →INI400_006442PAGEBREAK(); 
    } 
} 
object ConcreteCssCharacteristics →INI400_005178= CONCRETE.Characteristics(CssID, ForcesID, CONCRETE.CharType.WholeCharConcrete, CONCRETE.StiffnessType.Linear); 
double NBranch →INI400_005185= ShearReinf.Branch.Count; 
double[] Coord →INI400_005186= CONCRETE.General.CentreOfPolygon(ShapeCss); 
double n↓s.cal← →INI400_005187= 0; 
FOR(i, 1, NBranch) { 
    object[] OffsetPoint →INI400_005267= new object[]; 
    FOR(j, 1, ShearReinf.Branch[i-1].Point.Count) { 
        →INI400_005268OffsetPoint.Add(new Structure("X", ShearReinf.Branch[i-1].Point[j-1].X-Coord.X, "Y", ShearReinf.Branch[i-1].Point[j-1].Y-Coord.Y)); 
    } 
    double StirrupID →INI400_005188= CONCRETE.Stirrup.CreateStirrup(i-1, ShearReinf.D, ShearReinf.Angle, ShearReinf.ss, f↓ywk←, OffsetPoint); 
} 
TypeTorCss →INI400_005791= TypeTorCssInput; 
double StirrupIDTor →INI400_005252= 0; 
double α↓tor← →INI400_005283= ShearReinf.Angle; 
IF(α↓tor← != 90) { 
    →INI400_005279TEXT("Note: Check of torsion will not be done, because angle of stirrup for torsion is different than 90 degree"); 
    Number↓E← →INI400_005284= Number↓E←+1; 
    →INI400_005285EWN.Add(new Structure("Index", "E" &amp; IndexEWN &amp; "/" &amp; Number↓E←, "Type", TR("Error"), "Description", TR("Check of torsion will not be done, because angle of stirrup for torsion is different than 90 degree"), "Solution", TR("To set angle of stirrup for torsion to 90 degree"))); 
    UC →INI400_005286= UC_lim; 
} ELSE { 
    IF(TypeTorCss != 4) { 
        →INI400_005177TEXT("Total area of cross-section"); 
        A↓c← →INI400_005179= ConcreteCssCharacteristics.A; 
        →INI400_005180TEXT("Total circumference of cross-section"); 
        u↓c← →INI400_005181= ConcreteCssCharacteristics.Perimeter; 
        →INI400_005184TEXT("The area of longitudinal reinforcement for torsion"); 
        double StripeWidth →INI400_005192= 0.05; 
        A↓sl← →INI400_005193= CONCRETE.Torsion.LongReinAreaForTorsion(CssID, StirrupIDTor, StripeWidth); 
        →INI400_005195TEXT("The minimum distance between reinf. bars inside stirrup for torsion and edge of Css"); 
        double StripeWidth →INI400_005196= 0.05; 
        
        IF(CONCRETE.Torsion.MinDistReinfInsideStirrup(CssID, StirrupIDTor, StripeWidth) &gt; 999) { 
            a↓sl← →INI400_008635= 0; 
        } ELSE { 
            a↓sl← →INI400_005197= CONCRETE.Torsion.MinDistReinfInsideStirrup(CssID, StirrupIDTor, StripeWidth); 
        } 
        
        →INI400_001828TEXT("Effective wall thickness"); 
        t↓ef← →INI400_005198= MAX(A↓c←/u↓c←, 2*a↓sl←); 
        →INI400_006443PAGEBREAK(); 
    } 
    double CssIDTor →INI400_005226= 1; 
    CreateTorCss →INI400_005314= False; 
    AutoCal →INI400_005793= False; 
    →INI400_005331TEXT(TypeTorCss); 
    IF(AutoType == True) { TypeTorCss →INI400_005330= 1; } 
    WHILE(AutoCal == False) { 
        SWITCH(TypeTorCss) { 
            CASE 1 :  { 
                CssIDTor →INI400_005275= CssID; 
                object[] OuterPol →INI400_005814= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 0, StirrupIDTor); 
                object[] CentreLinePol →INI400_005247= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 1, StirrupIDTor); 
                object[] InnerPol →INI400_005815= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 2, StirrupIDTor); 
                IF(CentreLinePol.Count &gt; 2) { 
                    →INI400_005238TEXT("Perimeter of area and area enclosed by the centre line of effective cross-section "); 
                    u↓k← →INI400_005239= CONCRETE.Torsion.ParameterUkFromPolygon(CentreLinePol); 
                    A↓k← →INI400_005241= CONCRETE.Torsion.ParameterAkFromPolygon(CentreLinePol); 
                    →INI400_005299TEXT("Note: Parameters for torsion (value A↓k← and u↓k←) are calculated for equivalent thin walled section&lt;BR&gt;which is created around selected stirrup for torsion"); 
                    Number↓N← →INI400_005300= Number↓N←+1; 
                    →INI400_005301EWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TR("Note"), "Description", TR("Parameters for torsion (value A↓k← and u↓k←) are calculated for equivalent thin walled section which is created around selected stirrup for torsion"), "Solution", "-")); 
                    CreateTorCss →INI400_005312= True; 
                    AutoCal →INI400_005794= True; 
                } ELSE { 
                    TypeTorCss →INI400_005310= 2; 
                    CreateTorCss →INI400_005313= False; 
                    →INI400_005801AutoCal == False; 
                    IF(AutoType == False) { 
                        →INI400_005776TEXT("Note: Parameters for torsion (value A↓k← and u↓k←) is not possible&lt;BR&gt;to calculate around selected stirrup for torsion"); 
                        Number↓W← →INI400_005777= Number↓W←+1; 
                        →INI400_005778EWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TR("Warning"), "Description", TR("Parameters for torsion (value A↓k← and u↓k←) is not possible to calculate around selected stirrup for torsion"), "Solution", TR("To select different method for calculation parameters for torsion"))); 
                        AutoCal →INI400_005795= True; 
                    } 
                } 
                →INI400_006444PAGEBREAK(); 
            } 
            CASE 2 :  { 
                CssIDTor →INI400_005276= CssID; 
                object[] OuterPol →INI400_005816= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 0, -1); 
                object[] CentreLinePol →INI400_005817= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 1, -1); 
                object[] InnerPol →INI400_005818= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 2, -1); 
                IF(CentreLinePol.Count &gt; 2) { 
                    →INI400_005305TEXT("Perimeter of area and area enclosed by the centre line of effective cross-section "); 
                    u↓k← →INI400_005263= CONCRETE.Torsion.ParameterUkFromPolygon(CentreLinePol); 
                    A↓k← →INI400_005265= CONCRETE.Torsion.ParameterAkFromPolygon(CentreLinePol); 
                    →INI400_005302TEXT("Note: Parameters for torsion (value A↓k← and u↓k←) are calculated for equivalent thin walled section&lt;BR&gt;which is created from input cross-section"); 
                    Number↓N← →INI400_005303= Number↓N←+1; 
                    →INI400_005304EWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TR("Note"), "Description", TR("Parameters for torsion (value A↓k← and u↓k←) are calculated for equivalent thin walled section which is created from input cross-section"), "Solution", "-")); 
                    CreateTorCss →INI400_005316= True; 
                    AutoCal →INI400_005796= True; 
                } ELSE { 
                    TypeTorCss →INI400_005317= 3; 
                    CreateTorCss →INI400_005318= False; 
                    →INI400_005802AutoCal == False; 
                    IF(AutoType == False) { 
                        →INI400_005779TEXT("Note: Parameters for torsion (value A↓k← and u↓k←) is not possible&lt;BR&gt;to calculate from input cross-section"); 
                        Number↓W← →INI400_005780= Number↓W←+1; 
                        →INI400_005781EWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TR("Warning"), "Description", TR("Parameters for torsion (value A↓k← and u↓k←) is not possible to calculate from input cross-section"), "Solution", TR("To select different method for calculation parameters for torsion"))); 
                        AutoCal →INI400_005797= True; 
                    } 
                } 
                →INI400_008627PAGEBREAK(); 
            } 
            
            CASE 3 :  { 
                CssIDTor →INI400_005229= CONCRETE.Torsion.CreateEffRectCssForTorsion(CssIDTor, CssID); 
                object[] OuterPol →INI400_005819= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 0, -1); 
                object[] CentreLinePol →INI400_005820= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 1, -1); 
                object[] InnerPol →INI400_005821= CONCRETE.Torsion.PolygonCssForTorsion(CssIDTor, t↓ef←, 2, -1); 
                Diskr →INI400_005775= 16*A↓c←-u↓c←↑2←; 
                //                        →INI400_005785TEXT(CssIDTor); 
                IF(CssIDTor == 1 &amp;&amp; Diskr &lt;= 0) { 
                    →INI400_005221TEXT("Calculation dimensions of effective rectangular cross-section"); 
                    
                    h↓ef← →INI400_005219= [u↓c←+SQRT(u↓c←↑2←-16*A↓c←)]/4; 
                    b↓ef← →INI400_005220= A↓c←/h↓ef←; 
                    →INI400_005296TEXT("Perimeter of area and area enclosed by the centre line of effective cross-section "); 
                    u↓k← →INI400_005222= 2*[h↓ef←+b↓ef←]-4*t↓ef←; 
                    A↓k← →INI400_005223= [h↓ef←-t↓ef←]*[b↓ef←-t↓ef←]; 
                    →INI400_005295TEXT("Note: Parameters for torsion (value A↓k← and u↓k←) are calculated for effective rectangular Css,&lt;BR&gt;which is created from input Css to area and perimeter of effective cross-section were same &lt;BR&gt;as area and perimeter of input Css"); 
                    Number↓N← →INI400_005297= Number↓N←+1; 
                    →INI400_005298EWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TR("Note"), "Description", TR("Parameters for torsion (value A↓k← and u↓k←) are calculated for effective rectangular Css, which is created from input Css to area and perimeter of effective cross-section were same as area and perimeter of input Css"), "Solution", "-")); 
                    CreateTorCss →INI400_005320= True; 
                    AutoCal →INI400_005798= True; 
                } ELSE { 
                    TypeTorCss →INI400_005321= 4; 
                    CreateTorCss →INI400_005322= False; 
                    →INI400_005803AutoCal == False; 
                    IF(AutoType == False) { 
                        →INI400_005792TEXT("Note: Parameters for torsion (value A↓k← and u↓k←) is not possible&lt;BR&gt;to calculate for effective rectangular cross-section"); 
                        Number↓W← →INI400_005783= Number↓W←+1; 
                        →INI400_005784EWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TR("Warning"), "Description", TR("Parameters for torsion (value A↓k← and u↓k←) is not possible to calculate for effective rectangular cross-section"), "Solution", TR("To select different method for calculation parameters for torsion"))); 
                        AutoCal →INI400_005799= True; 
                    } 
                } 
                →INI400_006445PAGEBREAK(); 
            } 
            CASE 4 :  { 
                →INI400_005293TEXT("Effective wall thickness"); 
                t↓ef← →INI400_005294= t↓ef.inp←; 
                →INI400_005309TEXT("Perimeter of area and area enclosed by the centre line of effective cross-section "); 
                u↓k← →INI400_005290= u↓k.inp←; 
                A↓k← →INI400_005292= A↓k.inp←; 
                →INI400_005306TEXT("Note: Parameters for torsion (value t↓ef←, A↓k← and u↓k←) are taken into account from input parameters"); 
                Number↓N← →INI400_005307= Number↓N←+1; 
                →INI400_005308EWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TR("Note"), "Description", TR("Parameters for torsion (value t↓ef←, A↓k← and u↓k←) are taken into account from input parameters"), "Solution", "-")); 
                CreateTorCss →INI400_005323= True; 
                AutoCal →INI400_005800= True; 
                →INI400_006446PAGEBREAK(); 
            } 
        } 
    } 
    
    IF(CreateTorCss == False || A↓k← == 0 || u↓k← == 0) { 
        →INI400_005804TEXT("Note: Check of torsion will not be done , because parameters for torsion ( A↓k← and u↓k←) are zero &lt;BR&gt;or thin walled section was not created"); 
        Number↓E← →INI400_005805= Number↓E←+1; 
        →INI400_005806EWN.Add(new Structure("Index", "E" &amp; IndexEWN &amp; "/" &amp; Number↓E←, "Type", TR("Note"), "Description", TR("Check of torsion will not be done , because parameters for torsion ( A↓k← and u↓k←) are zero or thin walled section was not created"), "Solution", "To select different method for calculation parameters for torsion")); 
        UC →INI400_005807= UC_lim; 
    } ELSE { 
        ///create polygons of cross-section for torsion
        IF(TypeTorCss != 4) { 
            FOR(i, 0, OuterPol.Count-1) { 
                →INI400_005232TEXT("y=" &amp; OuterPol[i].X &amp; ", z=" &amp; OuterPol[i].Y); 
            } 
            FOR(i, 0, CentreLinePol.Count-1) { 
                →INI400_005233TEXT("y=" &amp; CentreLinePol[i].X &amp; ", z=" &amp; CentreLinePol[i].Y); 
            } 
            FOR(i, 0, InnerPol.Count-1) { 
                →INI400_005234TEXT("y=" &amp; InnerPol[i].X &amp; ", z=" &amp; InnerPol[i].Y); 
            } 
            →INI400_003038PAGEBREAK(); 
            
            //Drawing CSS for torsion
            IF(IO.IsDrawing || bPrint_Img) { 
                object G5 →INI400_005409= LoadExternCLC("Graphics_5_CSS_with_torsion.CLC", true); 
                G5.Reinf →INI400_006423= CONCRETE.General.GetReinfBars(CssID); 
                G5.Outline →INI400_006424= CONCRETE.General.GetOutline(CssID); 
                G5.UserScale →INI400_005413= UserScale; 
                G5.ShapeCSS →INI400_005414= ShapeCss; 
                G5.ShearReinf →INI400_005415= ShearReinf; 
                G5.FormCode →INI400_005416= FormCode; 
                G5.UserDimFont →INI400_005417= 8; 
                G5.DrawStirrups →INI400_005418= bool DrawStirrups; 
                G5.DrawAxis →INI400_005420= bool DrawAxis; 
                G5.UCSPosition →INI400_005421= 4; 
                
                G5.OuterPol →INI400_005429= OuterPol; 
                G5.CentreLinePol →INI400_005430= CentreLinePol; 
                G5.InnerPol →INI400_005431= InnerPol; 
                
                →INI400_005424G5.Draw(false, 0); 
            } 
        } 
    } 
    
    →INI400_006447PAGEBREAK(); 
    →INI400_002919BLOCK { 
        →INI400_008599TEXT("Parameters of shear/torsion reinforcement"); 
        →INI400_007331BLOCK { 
            →INI400_001148TEXT("Diameter of shear reinforcement"); 
            →INI400_001149TEXT("ϕ↓s← = " &amp; Val(1000*ϕ↓s←, 0) &amp; " mm"); 
            →INI400_001277TEXT("Centre - to - centre distance of stirrup in longitudinal direction"); 
            →INI400_001278TEXT("s↓inp← = " &amp; s↓inp← &amp; " m"); 
            →INI400_001150TEXT("Angle of stirrups from axis of member"); 
            →INI400_001151TEXT("α↓s← = " &amp; α↓s← &amp; " °"); 
            →INI400_001152TEXT("Characteristic yield strength of shear reinforcement"); 
            →INI400_001153TEXT("f↓ywk← = " &amp; Val(0.000001*f↓ywk←, 0) &amp; " MPa"); 
            →INI400_003039PAGEBREAK(); 
            →INI400_001154TEXT("Cross - sectional area of shear  reinforcement"); 
            A↓swt← →INI400_001155= π*(ϕ↓s←/2)↑2←; 
            IF(A↓swt← == 0) { 
                →INI400_003911TEXT("Note: The cross-sectional area of shear reinforcement is zero, stirrups will not be taken into account "); 
                Number↓N← →INI400_003909= Number↓N←+1; 
                →INI400_003910EWN.Add(new Structure("Index", "N4/" &amp; Number↓N←, "Type", TR("Note"), "Description", TR("The cross-sectional area of shear reinforcement is zero, stirrups will not be taken into account "), "Solution", "-")); 
            } 
            ELSE { 
                →INI400_001300TEXT("Minimum shear reinforcement ratio"); 
                →INI400_005865Clause9_2_2_5.Draw(false, 2); 
                ρ↓w,min← →INI400_005866= Clause9_2_2_5.ρ↓w,min←; 
                →INI400_004157TEXT("Minimum area of shear reinforcement per meter"); 
                A↓swtm.min← →INI400_004158= ρ↓w,min←*b↓w←; 
                →INI400_001302TEXT("Maximum longitudinal spacing of shear links"); 
                IF(bMaxSpacing == True) { 
                    s↓l← →INI400_001303= PARMIN(A↓swt←/(b↓w←*ρ↓w,min←), 0.75*d, s↓inp←); 
                } ELSE { 
                    s↓l← →INI400_003913= s↓inp←; 
                } 
                →INI400_003040PAGEBREAK(); 
                →INI400_001279TEXT("Cross - sectional area of shear reinforcement per meter"); 
                A↓swtm← →INI400_001280= A↓swt←/s↓l←; 
                →INI400_005204TEXT("Design yield strength of shear reinforcement"); 
                f↓ywd← →INI400_005205= f↓ywk←/γ↓s←; 
            } 
        } 
    } 
    →INI400_003041PAGEBREAK(); 
    
    →INI400_004030BLOCK { 
        →INI400_008630TEXT("Calculation of angle between concrete compression strut and member axis"); 
        IF(Auto↓θ←) { 
            IF(b_interaction == False) { 
                object CalcTheta →INI400_005342= LoadExternCLC("EC_Angle_Theta.clc"); 
                CalcTheta.bStandalone →INI400_006818= false; 
                CalcTheta.TableCellsFont →INI400_006819= TableCellsFont; //Table font
                CalcTheta.TableHeaderFont →INI400_006820= TableHeaderFont; 
                CalcTheta.TableBorderPen →INI400_006821= TableBorderPen; //Pen for outline of the table
                CalcTheta.TableGridPen →INI400_006822= TableGridPen; //Pen for grid inside of the table  
                CalcTheta.EWNBorderPen →INI400_008628= EWNBorderPen; 
                CalcTheta.EWNCellsFont →INI400_008629= EWNCellsFont; 
                CalcTheta.TableWidth →INI400_006823= TableWidth; 
                CalcTheta.bShear →INI400_005352= False; 
                CalcTheta.bTorsion →INI400_005353= True; 
                CalcTheta.f↓ck← →INI400_005343= f↓ck←; 
                CalcTheta.f↓cd← →INI400_005344= f↓cd←; 
                CalcTheta.f↓ywk← →INI400_005345= f↓ywk←; 
                CalcTheta.θ↓min← →INI400_005347= θ↓min←; 
                CalcTheta.θ↓max← →INI400_005348= θ↓max←; 
                CalcTheta.t↓ef← →INI400_005349= t↓ef←; 
                CalcTheta.A↓k← →INI400_005350= A↓k←; 
                CalcTheta.T↓Ed← →INI400_005351= T↓Ed←; 
                CalcTheta.IndexEWN →INI400_005367= IndexEWN; 
                CalcTheta.Number↓N← →INI400_008633= Number↓N←; 
                IF(IO.IsDrawing) { 
                    →INI400_005354CalcTheta.Draw(False); 
                } 
                ELSE { 
                    →INI400_007337CalcTheta.Calculate(False); 
                } 
                θ →INI400_005356= CalcTheta.θ; 
                Number↓N← →INI400_005360= Number↓N←+CalcTheta.Number↓N←; 
                Number↓E← →INI400_005361= Number↓E←+CalcTheta.Number↓E←; 
                Number↓W← →INI400_005362= Number↓W←+CalcTheta.Number↓W←; 
                object EWN_Theta →INI400_005365= CalcTheta.EWN; 
                FOR(i, 1, EWN_Theta.Count) { 
                    →INI400_005366EWN.Add(EWN_Theta[i-1]); 
                } 
            } ELSE { 
                →INI400_005809TEXT("Note: Automatic calculation of angle is switched on, the calculated value from interaction V+T is taken into account."); 
                Number↓N← →INI400_005810= Number↓N←+1; 
                →INI400_005811EWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TR("Note"), "Description", TR("Automatic calculation of angle is switched on, the calculated value from interaction V+T is taken into account."), "Solution", "-")); 
                θ →INI400_005812= θ↓int←; 
            } 
        } ELSE { 
            →INI400_001194TEXT("Note: Automatic calculation of angle is switched off, user value is taken into account."); 
            Number↓N← →INI400_001821= Number↓N←+1; 
            →INI400_001822EWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TR("Note"), "Description", TR("Automatic calculation of angle is switched off, user value is taken into account"), "Solution", "-")); 
            IF(θ↓inp← &gt; θ↓min← &amp;&amp; θ↓inp← &lt; θ↓max←) { 
                θ →INI400_001195= θ↓inp←; 
                cotθ →INI400_001196= COTG(θ); 
                →INI400_001197TEXT("θ = θ↓inp← = " &amp; θ↓inp← &amp; " °, cot(θ)= " &amp; cotθ); 
            } ELSE { 
                IF(θ↓inp← &lt; θ↓min←) { 
                    θ →INI400_001198= θ↓min←; 
                    cotθ →INI400_003085= COTG(θ); 
                    →INI400_001200TEXT("θ &lt; θ↓min← =&gt; θ = θ↓min← = " &amp; θ↓min← &amp; " ° ,cot(θ) = " &amp; cotθ); 
                    →INI400_001201TEXT("Note: The angle between the concrete compression strut and axis member &lt;BR&gt;is lesser than minimal value"); 
                    Number↓W← →INI400_001823= Number↓W←+1; 
                    →INI400_001824EWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, TR("Warning"), "Description", TR("The inputted angle between concrete compression strut and longitudinal member axis is lesser than recommended minimal value. The recommended minimal value will be taken into account."), "Solution", TR("To increase angle between concrete compression strut and longitudinal member axis or to change recommended minimal angle in setting of national annexes"))); 
                } 
                IF(θ↓inp← &gt; θ↓max←) { 
                    θ →INI400_001203= θ↓max←; 
                    cotθ →INI400_003086= COTG(θ); 
                    →INI400_001205TEXT("θ &gt; θ↓max← =&gt; θ = θ↓max← = " &amp; θ↓max← &amp; " ° ,cot(θ) = " &amp; cotθ); 
                    →INI400_001206TEXT("Note: The angle between the concrete compression strut and axis member is lesser than minimal value"); 
                    Number↓W← →INI400_001825= Number↓W←+1; 
                    →INI400_001826EWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TR("Warning"), "Description", TR("The inputted angle between concrete compression strut and longitudinal member axis is bigger than recommended minimal value. The recommended minimal value will be taken into account."), "Solution", TR("To decrease angle between concrete compression strut and longitudinal member axis or to change recommended maximal angle in setting of national annexes"))); 
                } 
            } 
        } 
    } 
    →INI400_006448PAGEBREAK(); 
    →INI400_008588BLOCK { 
        →INI400_008587TEXT("Calculation of torsional resistances"); 
        →INI400_008590TEXT("Design torsional cracking moment "); 
        T↓Rdc← →INI400_005200= 2*f↓ctd←*t↓ef←*A↓k←; 
        →INI400_006449PAGEBREAK(); 
        
        →INI400_008591TEXT("Design torsional resistance moment of torsional reinforcement "); 
        T↓Rdst← →INI400_005203= 2*A↓k←*(A↓swt←/s↓l←)*f↓ywd←*COTG(θ); 
        →INI400_006450PAGEBREAK(); 
        
        →INI400_005207BLOCK { 
            →INI400_008592TEXT("Maximal design torsional resistance moment "); 
            →INI400_005209TEXT("Strength reduction factor for concrete cracked in shear - value ν"); 
            →INI400_005260Clause6_2_2_6.Draw(False, 2); //Natioanl annex value 
            →INI400_005215TEXT("Coefficient taking into account state of the stress in the compression chord"); 
            →INI400_005843Clause6_2_3_3.Calculate(false); 
            α↓cw← →INI400_005870= Clause6_2_3_3.α↓cw←; 
            →INI400_005217TEXT("Maximal design torsional resistance moment"); 
            T↓Rdmax← →INI400_005208= 2*ν*α↓cw←*f↓cd←*A↓k←*t↓ef←*COS(θ)*SIN(θ); 
        } 
        →INI400_003053PAGEBREAK(); 
        →INI400_002925BLOCK { 
            →INI400_008593TEXT("Torsional resistance moment of the member"); 
            IF(A↓swt← == 0) { 
                T↓Rd← →INI400_001258= T↓Rdc←; 
            } ELSE { 
                T↓Rd← →INI400_001259= MIN(T↓Rdst←, T↓Rdmax←); 
            } 
            T↓Rdmax_sum← →INI400_003923= T↓Rdmax←+T↓ccd←+T↓td←; 
            T↓Rds_sum← →INI400_003947= T↓Rdst←+T↓ccd←+T↓td←; 
        } 
    } 
    →INI400_003054PAGEBREAK(); 
    →INI400_005874BLOCK { 
        →INI400_008595TEXT("Torsional check"); 
        →INI400_008596TEXT("Check T↓Rdmax←"); 
        IF(ABS(T↓Ed←) &gt; T↓Rdmax_sum←) { 
            →INI400_003918TEXT("T↓Ed← = " &amp; Val(ABS(T↓Ed←)/1000, 2) &amp; " kNm &gt; T↓Rdmax←  = " &amp; Val(T↓Rdmax_sum←/1000, 2) &amp; " kNm"); 
            →INI400_003919TEXT("The check does not satisfy, because crushing of the compression strut"); 
            →INI400_003920TEXT("Note: It is necessary to change angle of compression strut or to increase quality of concrete &lt;BR&gt;or  to increase dimensions of the cross-section"); 
            Number↓E← →INI400_003921= Number↓E←+1; 
            →INI400_003922EWN.Add(new Structure("Index", "E" &amp; IndexEWN &amp; "/" &amp; Number↓E←, "Type", TR("Error"), "Description", TR("The calculation does not satisfy, because crushing of the compression strut (V↓Ed← &gt; V↓Rd,max← + V↓td← + V↓ccd←)."), "Solution", TR("To change angle of compression strut or to increase quality of concrete or  to increase dimensions of the cross-section"))); 
        } ELSE { 
            →INI400_003997TEXT("T↓Ed← = " &amp; Val(ABS(T↓Ed←)/1000, 2) &amp; " kNm ≤ T↓Rdmax←  = " &amp; Val(T↓Rdmax_sum←/1000, 2) &amp; " kNm"); 
            →INI400_003998TEXT("The check satisfies."); 
        } 
        
        →INI400_006451PAGEBREAK(); 
        →INI400_008597TEXT("Check T↓Rdc← and T↓Rdst←"); 
        IF(ABS(T↓Ed←) &lt;= T↓Rdc←) { 
            IF(A↓swt← == 0) { 
                →INI400_003975TEXT("T↓Ed← = " &amp; Val(ABS(T↓Ed←)/1000, 2) &amp; " kNm &lt; T↓Rdc←  = " &amp; Val(T↓Rdc←/1000, 2) &amp; " kNm"); 
                →INI400_003976TEXT("The check satisfies, torsional moment carried by concrete (T↓Ed← ≤ T↓Rdc←), no shear reinforcement is required"); 
                →INI400_004010TEXT("Note: Only minimum shear reinforcement according to detailing provisions has to be inputted"); 
                Number↓W← →INI400_003977= Number↓W←+1; 
                →INI400_003978EWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TR("Warning"), "Description", TR("The check satisfies, torsional moment carried by concrete, no shear reinforcement is required"), "Solution", TR("Only minimum shear reinforcement according to detailing provisions has to be inputted"))); 
                →INI400_003979PAGEBREAK(); 
            } ELSE { 
                IF(ABS(T↓Ed←) &lt;= T↓Rds_sum←) { 
                    →INI400_003980TEXT("T↓Ed← = " &amp; Val(T↓Ed←/1000, 2) &amp; " kNm &lt; T↓Rdc←  = " &amp; Val(T↓Rdc←/1000, 2) &amp; " kNm and  T↓Ed← = " &amp; Val(ABS(T↓Ed←)/1000, 2) &amp; " kNm &lt; T↓Rdst← = " &amp; Val(T↓Rds_sum←/1000, 2) &amp; " kNm"); 
                    →INI400_003981TEXT("The check satisfies, torsional moment can be carried by concrete"); 
                    →INI400_004011TEXT("Note: Only minimum shear reinforcement according to detailing provisions has to be inputted"); 
                    Number↓W← →INI400_003982= Number↓W←+1; 
                    →INI400_003983EWN.Add(new Structure("Index", "W" &amp; IndexEWN &amp; "/" &amp; Number↓W←, "Type", TR("Warning"), "Description", TR("The check satisfies, torsional moment can be carried by concrete, no shear reinforcement is required"), "Solution", TR("Only minimum shear reinforcement according to detailing provision has to be inputted"))); 
                } ELSE { 
                    →INI400_003984TEXT("T↓Ed← = " &amp; Val(ABS(T↓Ed←)/1000, 2) &amp; " kNm &lt; T↓Rdc←  = " &amp; Val(T↓Rdc←/1000, 2) &amp; "kNm and  T↓Ed← = " &amp; Val(ABS(T↓Ed←)/1000, 2) &amp; " kNm &gt; T↓Rdst← = " &amp; Val(T↓Rds_sum←/1000, 2) &amp; " kNm"); 
                    →INI400_003985TEXT("The check does not satisfies, because of shear reinforcement, but torsional moment &lt;BR&gt;can be carried by concrete."); 
                    →INI400_003986TEXT("Note: It is necessary to remove shear reinforcement (design only minimum shear  &lt;BR&gt;reinforcement according to detailing provisions) or increase amount of shear reinforcement"); 
                    Number↓E← →INI400_003987= Number↓E←+1; 
                    →INI400_003988EWN.Add(new Structure("Index", "E" &amp; IndexEWN &amp; "/" &amp; Number↓E←, "Type", TR("Error"), "Description", TR("The check does not satisfies, because of shear reinforcement but torsional moment can be carried by concrete."), "Solution", TR("To remove shear reinforcement (design only minimum shear reinforcement according to detailing provisions) or increase amount of shear reinforcement"))); 
                    →INI400_003989PAGEBREAK(); 
                } 
            } 
        } ELSE { 
            IF(ABS(T↓Ed←) &lt;= T↓Rds_sum←) { 
                →INI400_003990TEXT("T↓Ed← = " &amp; Val(ABS(T↓Ed←)/1000, 2) &amp; " kNm &lt; T↓Rdst← = " &amp; Val(T↓Rds_sum←/1000, 2) &amp; " kNm"); 
                →INI400_003991TEXT("The check satisfies"); 
            } ELSE { 
                →INI400_003992TEXT("T↓Ed← = " &amp; Val(ABS(T↓Ed←)/1000, 2) &amp; " kNm &gt; T↓Rdst← = " &amp; Val(T↓Rds_sum←/1000, 2) &amp; " kNm"); 
                →INI400_003993TEXT("The check does not satisfy, because of shear reinforcement."); 
                →INI400_003994TEXT("Note: It is necessary to increase area of shear reinforcement or to increase dimensions of the &lt;BR&gt;cross-section or quality of shear reinforcement"); 
                Number↓E← →INI400_003995= Number↓E←+1; 
                →INI400_003996EWN.Add(new Structure("Index", "E" &amp; IndexEWN &amp; "/" &amp; Number↓E←, "Type", TR("Error"), "Description", TR("The check does not satisfy, because shear reinforcement (V↓Ed← &gt; V↓Rd,s← + V↓td← + V↓ccd←)."), "Solution", TR("To increase area of shear reinforcement  or  to increase dimensions of the cross-section or quality of shear reinforcement"))); 
            } 
        } 
        →INI400_003059PAGEBREAK(); 
        →INI400_008598TEXT("Unity check"); 
        UC →INI400_004012= ABS(T↓Ed←)/T↓Rd←; 
    } 
} 

Number↓EWN←[0] →INI400_001778= Number↓E←; 
Number↓EWN←[1] →INI400_001801= Number↓W←; 
Number↓EWN←[2] →INI400_001802= Number↓N←; 

double Check →INI400_004083= 0; 
//result of the check
IF(Number↓EWN←[0] &gt; 0) { 
    string sCheck →INI400_001785= TR("NOT OK"); 
    Check →INI400_004080= 0; 
} ELSE { 
    IF(Number↓EWN←[1] &gt; 0) { 
        string sCheck →INI400_001786= TR("OK*"); 
        Check →INI400_004081= 2; 
    } ELSE { 
        string sCheck →INI400_001787= TR("OK"); 
        Check →INI400_004082= 1; 
    } 
} 

//list of errors, warnigs
ListEWN →INI400_002911= ""; 
FOR(i, 0, EWN.Count-1) { 
    IF(i != EWN.Count-1) { 
        ListEWN →INI400_002910= ListEWN &amp; EWN[i].Index &amp; ", "; 
    } ELSE { 
        ListEWN →INI400_002986= ListEWN &amp; EWN[i].Index &amp; "."; 
    } 
} 
IF(IO.IsDrawing) { 
    object GOK →INI400_007329= new Graphics(); 
    →INI400_000420GOK.DrawText(sOK, FontStatus, 0, 0, ContentAlignment.MiddleLeft, Color.Green); 
    object GOKBUT →INI400_004591= new Graphics(); 
    →INI400_004593GOKBUT.DrawText(sOKBUT, FontStatus, 0, 0, ContentAlignment.MiddleLeft, Color.Green); 
    object GNOTOK →INI400_005161= new Graphics(); 
    →INI400_005163GNOTOK.DrawText(sNOTOK, FontStatus, 0, 0, ContentAlignment.MiddleLeft, Color.Red); 
    // summary table
    →INI400_008583BLOCK { 
        →INI400_008582TEXT("Summary of check"); 
        NColumns →INI400_005357= 8; 
        object T_Sum →INI400_002858= new Table(NColumns); 
        T_Sum[0][0].Value →INI400_002939= "T↓Ed← &lt;BR&gt; [kNm]"; 
        T_Sum[1][0].Value →INI400_002862= Val(T↓Ed←/1000, 2); 
        T_Sum[0][1].Value →INI400_002954= "T↓Rdc← &lt;BR&gt; [kNm]"; 
        T_Sum[1][1].Value →INI400_002864= Val(T↓Rdc←/1000, 2); 
        T_Sum[0][2].Value →INI400_002957= "T↓Rdst← &lt;BR&gt; [kNm]"; 
        T_Sum[1][2].Value →INI400_002870= Val(T↓Rdst←/1000, 2); 
        T_Sum[0][3].Value →INI400_002961= "T↓Rdmax← &lt;BR&gt; [kNm]"; 
        T_Sum[1][3].Value →INI400_002872= Val(T↓Rdmax←/1000, 2); 
        T_Sum[0][4].Value →INI400_002963= "T↓Rd← &lt;BR&gt; [kNm]"; 
        T_Sum[1][4].Value →INI400_002876= Val(T↓Rd←/1000, 2); 
        T_Sum[0][5].Value →INI400_002965= "U.C.&lt;BR&gt;[-]"; 
        T_Sum[1][5].Value →INI400_002878= Val(UC, 2).ToString("0.00"); 
        T_Sum[0][6].Value →INI400_002968= TR("Limit") &amp; "&lt;BR&gt; [-]"; 
        T_Sum[1][6].Value →INI400_002880= Val(Limit, 2); 
        T_Sum[0][7].Value →INI400_002971= TR("Status"); 
        T_Sum[1][7].Value =  { 
            SWITCH(Check) { 
                CASE 0 :  { →INI400_005164GNOTOK.Draw(1); } 
                CASE 1 :  { →INI400_005165GOK.Draw(1); } 
                CASE 2 :  { →INI400_005166GOKBUT.Draw(1); } 
            } 
        } 
        SWITCH(Check) { 
            CASE 0 :  { T_Sum[1][5].BackColor →INI400_007724= ColorNotOK; } 
            CASE 1 :  { T_Sum[1][5].BackColor →INI400_007725= ColorOK; } 
            CASE 2 :  { T_Sum[1][5].BackColor →INI400_007726= ColorOKBut; } 
            CASE 3 :  { T_Sum[1][5].BackColor →INI400_007727= ColorNotCalc; } 
        } 
        FOR(i, 0, NColumns-1) { 
            T_Sum[0][i].Alignment →INI400_002972= ContentAlignment.MiddleCenter; 
        } 
        FOR(i, 0, NColumns-1) { 
            T_Sum[1][i].Alignment →INI400_002974= ContentAlignment.MiddleCenter; 
        } 
        
        T_Sum.Padding.All →INI400_004031= 5; 
        T_Sum.Padding.Top →INI400_002899= 3; 
        T_Sum.Padding.Bottom →INI400_002900= 3; 
        T_Sum.Font →INI400_002979= TableCellsFont; 
        T_Sum[0].Font →INI400_002980= TableHeaderFont; 
        T_Sum.BorderPen →INI400_002981= TableBorderPen; 
        T_Sum.GridPen →INI400_002982= TableGridPen; 
        T_Sum[0].BorderPen →INI400_002983= T_Sum.BorderPen; 
        T_Sum[0].BackColor →INI400_007743= tableHeaderColor; 
        →INI400_002861T_Sum.Draw(); 
        
        string FListEWN(object[] EWN)
        { 
            IF(EWN.Count == 0) { 
                ListEWN →INI400_003869= TR("There are no errors, warnings or notes"); 
            } 
            ELSE { 
                string ListEWN →INI400_003337= ""; 
                FOR(i, 0, EWN.Count-1)
                { 
                    
                    IF(i &lt; EWN.Count-1) { ListEWN →INI400_003338= ListEWN &amp; EWN[i].Index &amp; ", "; } 
                    ELSE { ListEWN →INI400_003868= ListEWN &amp; EWN[i].Index; } 
                } 
            } 
            string Final →INI400_003870= TR("List of errors/warnings/notes: ") &amp; ListEWN; 
            return Final; 
        } 
        →INI400_003871TEXT(FListEWN(EWN)); 
    } 
    →INI400_003060PAGEBREAK(); 
} 
// errors and warnings
IF(IO.IsDrawing) { 
    →INI400_008585BLOCK { 
        →INI400_008584TEXT("Explanation of errors, warnings and notes"); 
        IF(Number↓E←+Number↓W←+Number↓N← &gt; 0 &amp;&amp; PrintEWN == True) { 
            
            object T_EWN →INI400_003872= new Table(4); 
            T_EWN[0][0].Value →INI400_002869= TR("Index"); 
            T_EWN[0][1].Value →INI400_003873= TR("Type"); 
            T_EWN[0][2].Value →INI400_002871= TR("Description"); 
            T_EWN[0][3].Value →INI400_003874= TR("Solution"); 
            FOR(i, 0, EWN.Count-1) { 
                T_EWN[i+1][0].Value →INI400_002873= EWN[i].Index; 
                T_EWN[i+1][1].Value →INI400_003875= EWN[i].Type; 
                T_EWN[i+1][2].Value →INI400_002875= EWN[i].Description; 
                T_EWN[i+1][3].Value →INI400_003876= EWN[i].Solution; 
            } 
            //Column alignment
            FOR(i, 0, 1) { 
                T_EWN.Columns[i].Alignment →INI400_001063= ContentAlignment.MiddleCenter; 
                
            } 
            FOR(i, 2, 3) { 
                T_EWN.Columns[i].Alignment →INI400_002845= ContentAlignment.MiddleLeft; 
            } 
            
            //Layout
            T_EWN.Padding.Top →INI400_002840= 3; 
            T_EWN.Padding.Bottom →INI400_002841= 3; 
            T_EWN.Padding.Left →INI400_002877= 3; 
            T_EWN.Padding.Right →INI400_003877= 3; 
            T_EWN.Font →INI400_002846= TableCellsFont; 
            T_EWN[0].Font →INI400_002879= TableHeaderFont; 
            T_EWN.BorderPen →INI400_001832= TableBorderPen; 
            T_EWN[0].BorderPen →INI400_002842= TableBorderPen; 
            T_EWN.GridPen →INI400_001833= TableGridPen; 
            
            T_EWN.Columns[0].Width →INI400_003878= Convert.ToSingle(0.10*TableWidth); 
            T_EWN.Columns[1].Width →INI400_002881= Convert.ToSingle(0.10*TableWidth); 
            T_EWN.Columns[2].Width →INI400_003879= Convert.ToSingle(0.45*TableWidth); 
            T_EWN.Columns[3].Width →INI400_002883= Convert.ToSingle(0.35*TableWidth); 
            T_EWN.Columns[2].Wrap →INI400_003259= True; 
            T_EWN.Columns[3].Wrap →INI400_003260= True; 
            T_EWN[0].BackColor →INI400_007745= tableHeaderColor; 
            →INI400_002889T_EWN.Draw(); 
        } 
    } 
} 

</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="1" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10200" Autor="User" Autor2="" Version="205" EWNSource="" Icon="/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCABkAGQDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD+/iiiigAorxv49/H/AOEv7Mvwx8QfF740+MdM8F+CfD0LmS8vpo/t2sambe5ubLw54b03et3r/ibVltJ00rRNOSa9uzFNKI0tre5nh/ju/bO/4OAf2j/jHcaz4M/Zrtof2fvh4ZpbSPxVplw2r/FPX7WOSxZLyPxFeWVnB4RhnmtbmSCHQ9KtdZjsb77Pdau0isq/G8Wcd8PcHUovNcTKeMqwc8PluEiq2NrRu0p8jlCnQpOSaVbEVKUJOMo03OcXE/pT6P30UPGL6SOPqw4CySjhuHMDiY4XOONeIK1TLuGMsrWhOeGWKhRxGKzPMIUqlOpLLsowmOxVKFWjVxcMLh6sa5/YR8Z/2k/gH+zvo1zr3xu+LvgP4a2Vtp66p5HibxBZWutXunvfRaatzpHhuOSbxDraNfzR2gXR9Lvn84lNmUfb+Z3j3/gvf/wTp8Eard6Vp/jvx98Q2tJrOL7f4C+Heq3WlXMd3YR3zXNpfeJrjwvHPDZvIun3igLcJfrJHFbzQRyXK/wYazres+I9Uvdc8Q6vqeva1qUxudR1jWb+61TVNQuGCq1xe6hfSz3d1MVVVMs80khCqC2AKu6V4T8Va9bveaH4Z8QazaRzNbSXWlaNqOo28dwiRyvbvPZ200SzLFNDI0TMJFSWNyoV1J/B8x8euIcVVcMlyTL8JTveKxLxOZYmUY8123Slg6cVJODcVSnyNNe0kmmv9YOD/wBkz4P5BgIYnxP8UOLuIcW4qNWeSRyXgrJqVaoqDhTiswo8SY2u6c44inGrLH4b6zCrTl9VoTpNT/uJtv8Ag4g/4J9T3FvBLD8d7OKaaKKS8ufhtpb29rHJIqPc3C2fjK6u2hgUmWVbW1ubgorCC3mlKxt9T/Cf/gsF/wAE7fjA+lWehftHeHPDOt6tqCaXb6D8RtJ8R/D+9jvZtQt9PtIpr/xLpNl4dZL17y0nguLbW7i2W2mla5mt5bDVIrH/AD+9X+Cvxk8P/Z/7e+EvxN0T7X532T+1/AfinTftX2fyvP8As/23SofO8nzofO8vd5fmxb9vmJnzm5trizuLizvLea1u7WaW2urW5ikguLa4gkaKe3uIJVSWGaGVWjlikVZI5FZHUMCByUvHHjXB1YvH5XlNWk3Z06mCxuEm9n7lRYtqMrfzU5r3r8r0t9Djv2Wf0YuIsFUhwjx54gYLHQi508Zg+J+F+IcND44J4nBvh+E6lL2lrqljcJJyp8iqxvK/+rRo+taP4h0631jQNW0zXNJvPO+yapo9/a6np119nnltZ/s97ZSz20/kXME1vN5UreXPDLC+2SN1GlX+Zn+zL+3H+0/+yLqkd58Efir4i8PaK+oWOo6n4Gu7+91HwFrs2n3Mt3brq3hh7qO0dGnnlN09k1lcXsMs1pdzzWdxcW8v9fP/AAT1/wCC4Pwa/ax1Cw+GfxutPDvwF+NF4lymkR3GtXZ+Hvjaa0S4u500bXdYtYbfwxqDWKR/YdD1/W7u41S7gvLawvprptPtL39d4Q8XeHeJqlHA4tSyTNarjCnhsXVjPC4mrJ2VPC41RpwlOTaUKWIhQqTk+SlGrJJv/Oz6RX7Ozxl8DsHmHFGQSpeKPAOAjWxOLzrh/BVcNnuTYClHnli8+4YlWxeJpYejCNWeJx2U4rN8DhaFJ4rH1sDTk4U/3Tooor9YP8/QooooAK+cv2qv2oPhj+yD8GfEXxq+K1+9roOkPHpulafBu+2+I/E17bXdxpPh3T2Ecqx3V+tjdSGRkkMdtbXDwQXl0Leyufo2v4Of+C2v7det/tL/ALRWp/CbwvqGp2Hwi+Dc0nh6y0+C+1CLSfF+t+YmoTeLLvSr+x0+7gvHW4htTFcQQxrHY2EH2aeXSodY1H4fxA4vpcG5BWx65Z5hiJPC5XQnFyjUxc4uXtKiTX7rDwTq1LyXNaMFeU0n/Uf0RPo6476Sfi7lnCE3XwvCWUUo5/xzmdCpGjVwnD2Gr0qcsLhako1OXMM2xE6eX4JxpVHSlVqYqcY0cNVnD4c/bk/bk+LX7cvxa1D4gfEDUJrLw3ZTTW3gbwNbTSLo3hbRlklFrDDaiWSJr1opHaednmkEk1wzXFzc3N9fX3yD4c0yz1vxDoOjahrNl4dsNX1rS9MvvEGpLK+naFZ399Ba3Os36QBpnstMhle9ulhUytBBIIwXIFfSX7I37Hvxf/bM+IWq+AvhPo15dnw54Z1PxZ4p11dLv9Q03QdKsIJGto7k2cZV9T1m7T7FomkiaO/1idLmLSoL66t/skninxP+GHjT4O+NNW8A+PtJ/sjxHpH2aSaGO5t72zu7O9t47uw1DT7+0kltryyvLaVJEeNxLBKJrK9htdRtbu0t/wCK8xWd5gv9Zs1pYrF0MxxtWEswrqfscTiKTjKrQVSLXIoxahCMOSMYxlClrSkof9OPBtTww4Rk/A7gDMMh4fzTg3hrA4ijwhlc8P8A2jkmUY+NWlgM0ng60ZrE1KtWDxWIq4j6xWq1a1HFZgnHH0KmI/uN/Y5/4Ixf8E9/AHgDwx40Glx/tQatr1tYeINM+KPjLULpdJm2tfta3PhfwroN/aaVoccK3aRT22ptrOsWep6ZBJNe22o2XlwfsR4V8B+BvAlvJZ+CPBnhTwbaTQ2VtNa+FfDuj+HreW301JYtOt5INIs7OJ4bCKeaOyiZTHapNKkCxrI4P8MH/BKP/grN4m/Yw8TJ8M/jHq2ueKP2bdee3R9PER1S9+G17GZ/N1/w3bwW0mqXMdzDJBb32kie4tp7bT7KztrW0Iiv9P8A7qPCXi3wz488M6J4y8G63p/iPwv4j0+DVNE1vS5xcWWoWVwMpLE4wyOjB4bi3mSO5tLmOa1uoYbmGWJP7B8NM64TzrJqcuH8twGUYvCwhTzDLaNKlHFYep70Y1Z1UnXxVCs1N0sVVnOc05QqtVVOJ/zi/Tb8NPpBeGfiTi6PjBxpxV4h5Dn+JxWL4Q41zHG4+tkecYNOhWq4HD5fKUcsyPM8sTwtPMciwOHw+Fw0oUK+AhUwFTC1pTa/4Y8N+K7OLTvFPh7Q/Emnw3KXsNjr+k2GsWcV5HFNBHdxWuo29zBHcxwXNxCk6oJVinmjVwkrhvjX4/8A/BOn9lL9obTL6DxZ8LfDNjrM/wBmls9Z0/SbVorGfTrO5t9Nhi0aQDT7LTI7i4+2ahb+HV8PajqTNextrEA1fVnvPuaivv8AGZfgcwpTo43B4bFUqi5Zwr0YVE1Zr7UW07NpNNNXdmfyPw9xdxTwljsPmXDHEOc5DjsJU9ph8TlWY4rBTpz5ozbSoVYRkpThCUozjKE3CLlF8qt/Ef8At0/8EKfif8C9N1f4hfA68Txp4H013luNMuL2SW/S1KC00y2s99u99Drmo3FnLdXVrqpHh6O71vS9D0vxVe6mbeyvP5/P+Jjo2o/8vulatpV7/wBN7HUdN1Gxn/7ZXNne2dzF/wBM57eeP+CROP8AVqvbKz1Kzu9O1G0tr/T7+2nsr6xvYIrqzvbO6ieC6tLu1nSSC5trmCR4Z4JkeKaJ3jkRkYg/ys/8FmP+CW15f2mmfGz4KWtlPPZTXumnQ5DEuu6vHPbNqNt4Smvp5Rc6tPpNtpmp3PgrUJzPcTWcmo+HteuRfQaJqesfzp4jeEWHwmHrZ5wrSqU1RXtcVlVNc6a543qYP3oyp8kW5exipuTSVNKT1/2Z+hh+0TzbPs4yzws8fMwwmL/tOawOR8fY2Sw84S9hW5MFxI/ZVaeMeKrKlRWZVp4f2KqTqYypUpxbh3n/AARQ/wCCseq/FS58Mfse/tEa5NqvxAMOoWnwn+IOqzWFvN4istOtL3VYfBmryKljBLe6dpdq9h4dKpLqd0lraWAOpm4H9kf051/lJaJrOqeHNZ0jxDod7NputaDqdhrOj6jbELcafqml3UV9p97bsysomtbuCGeIsrASRqSpHFf6Mf8AwTH/AG04P25f2V/CnxQ1ebSYfifoFzc+C/i7o2lRwWVvY+MtJWORdUtNKTUdRubDSfE+kz2Gt6eLhoU864v7O2jEdgwX6Hwb4+rZ5h58NZvXlWzPL6Cq4DFVZc1TGYCnyU50qspPmqYnCNxftJOU61CfNL3qE5z/AB79pL9EjLPCzOML41+HWWUcv4H4uzSWA4ryLA0FSwfDXFeMdfFYfHYChRiqOEyTP4QrwWEp06WGyzNMP7Gi/Y5phMNhv0Kooor92P8AKU+Iv+Cinxyg/Z8/ZG+LXj13uY7mTQrvQ7BoNOg1OKWe+sL67u9PvbaeeBltta0jTtS0NLi3kjntrzUrSZbrTI0k1fT/APNp1LULzV9Rv9V1Cb7Rf6ne3WoX1x5cUXn3l7PJc3M3lQJFDF5s0rv5cMccSbtsaIgCj+1n/g4r8VXll+yv4W8K6frnlQav4mtbnxH4fiu4n+0WcWueHJ/D+oX+nFneLbf6Zqkek6kYopT5GtWVpcGGXVIJP4zPhx4U/wCE7+IfgPwP532b/hMvGfhfwp9o8zyfI/4SLXLHSPO837NeeV5X2zf5n2S62bd32afHlN/Jfjlj8RjuK8vyeF3SweBoulHmtGeIx9WXM2r8t0qdOHM/eXvR0SV/+hL9lbwllPC3gBxl4j4lQjjeI+Kszjj63sU62HyfhPL6MqMI1HFVHGrPGYzEOjB+yko0Kicpyah/eZ/wRH/ZV079m79iXwZ4nvbG5g+IX7QUdn8V/Gk2oadqOlX9tp1/bPF4G8PPZ6jL5gttI8OSLqEVwlrZpd3mvahcRrPbSW1xJL/wUs/4JoeA/wBrDwVq/iXQNAhh8e2EOr6pbtptlJLqlprd9ZvFP4s8NWlndafLqOpSypbXfivwU93Fpvj9bG1vokh8aWFjdar+tWi6Pp3h7R9J0DR7f7HpOh6ZYaPpdp509x9l07TLWKysbfz7qWe5n8i2gii864mmnk275pZJGZzpV/R1LhTKP9WcLwviMLRrZfh8DRwjg4KznTgufER5rtValbnryn8TqTcm7ts/xdxvj/4hvxuz7x1yjPcwyzjDOOKMw4hjiaeIkpU8NisRP6tk9T2bjCeX4PLVQyqlhlH2MMFQp0IwVOKif5b/AMa/gb8QfgD4xl8GfEHToYLtoRd6XrGmyXF14f8AEFgSFN/omoXFrZy3MMcpMNxDcWtre2kw8u7tIGaPf+q3/BKP/grN4m/Yw8TJ8M/jHq2ueKP2bdee3R9PER1S9+G17GZ/N1/w3bwW0mqXMdzDJBb32kie4tp7bT7KztrW0Iiv9P8A6Yf+Cjv/AATi8DftS+Bte1jR9B/4qX/SdYvrHR7aP+2BrHlsX8YeD0C/8jL1bxB4fUfZfG1r5skcX/CS7l8QfwnfHT4F+Of2f/HN54K8a2f/AD0utB161jk/sfxNo/mFIdU0uZx9I72ykP2rTrrdb3C/6uSX+W+IuHeIfCrP6Oc5NXqvAqo3hsS1KdKVObtLB4+nFxjVo1E1G0mve5dY1o0qs/8AeHwc8ZfB76fnhJmXhr4mZXgIcUvBxWcZLGVHD5hRxeHjz0eJeEsXWp1qmAzLCSi6rdCM/wB17a9OvltbH4HD/wCnx4S8W+GfHnhnRPGXg3W9P8R+F/Eenwapomt6XOLiy1CyuBlJYnGGR0YPDcW8yR3NpcxzWt1DDcwyxJ0VfwOf8Eo/+Crnib9hjxMnwz+Jb654v/Zo8X65bzavpENwb29+Fl7emdNS8ZeDdNeCSe5juZ5LO58R+HLa8trbULa2vL6xs5vEEyPcf3d+CfG3hH4k+EfDvj3wF4i0nxb4M8W6TZ674b8SaFeRX+k6xpN/EJrW9s7qElHjdDtdG2ywSrJBPHFPFJGv9J8D8c5ZxrlqxGGccNmWHjFZllkp81XDTbaVSm2outharV6VaMdL+zqqFWMon+KH0pfosccfRi40lk+dQrZzwZm9atU4L44o4b2OBz3C04wqVMHi6UKleOWZ9gIzVPMMsrVeaXKsbgpYjAVqVd9RXNeMfCej+OvC2veENfh8/SfEOmXOm3e2O1knt/PT9xf2X222vLaHU9MuVh1HS7qW2n+xaja2t2kZkgSulor7WUYzjKE0pRnFxlFq6lGSaaa6pptNdj+YqNarhq1LEUKkqVehVp1qNWD5Z0qtKanTqQktVKE4qUWtmkz/ADev+Ckn7Osn7On7T3jbRLb+z/7F8TarretWkemSM9jY63aa3faT4v060SWK0nXT18Q2l1qmkA2Fnbw6Nq2nWEMYmsLqOH9Kf+Dcn4/6t4H/AGpvHv7P8o+0eGfjp4Gk1tEknlH9neLvhXBqmsadd2sK2V0v+neHdY8TWt+DdaZFP5GmyTz3c9hp9o3tP/ByN8P7Ow8W/Cjx3awXM8+oyxLqN7PdxeVYXmvaPfaQmn2VnH5DtbX+n/C2xvHlnivpbe8tLvF7bQX0Nm34pf8ABNTxNbeEP2+f2S9evdY0/QLG3+Nvgyzv9V1S5srPT7bT9Zvxot8tzdaiVtLdLq01Ca0WaR0eN50a3kjuBE6/xviKX+pni7h1hH7OhDPcI4pSUF9TzVwo4uD5k4Qg6eJxEVFXjCHLFSi43j/0m5Lj/wDiZb9nZnEuI4vF5riPCvPo1alSlLE1P9YeAoV8z4fxUVRqwxGIxMMVkmUVqlWXs6uKxCq1J0a1Oty1v9KCiiiv7KP+a0/mh/4OKtH1GD4T6Dr8tvt0nU4vBuj2V350DefqOh+KvEF7qlv5Cym5j+y23iHR5fOmhjgn+2bLeWaS3ukg/k2+AeoWekfHX4LarqE32ew0z4s/DnUL648uWXyLOy8YaNc3M3lQJLNL5UMTv5cMckr7dsaO5Cn+3v8A4LpfCnUPiR+yFqF7Z2Sak3hqPXJ7Sytgj62dZh/sXxlYz6TFNaTxOg03wHrdlqKQTQ6pdW9+umaZFcTahIYP4Mba5uLO4t7yzuJrW7tZorm1uraWSC4triCRZYLi3niZJYZoZVWSKWNlkjkVXRgwBH8f+M9KeB46w+NcG6U8Jgq9Nv7cqFadSrBOyWkpxW90pK/d/wDRn+zQx+F4q+irnPDMcRTp5hQ4i4myvGRpvXDUMzyvB4HL684uU5p1KOGqTbceWc6c3BWvCH+r1RXzH+xp8f8ATP2nv2Y/g18abG++26h4v8DaDN4sSS2s9PurLxra6db23iu1utLsbm7g0vfrMdzfWFqJdsmj3mm3sC/Zbu3Zvpyv65wuJo43DYfGYeanQxVCliKM1a0qVaEalOWja1jJPRv1P+eHPclzHhvO834ezfDywma5HmeOyjMsNNSUqGOy7E1cJiqTU4xl7lejOKbjFtJOyuFfkt/wUd/4JxeBv2pfA2vaxo+g/wDFS/6TrF9Y6PbR/wBsDWPLYv4w8HoF/wCRl6t4g8PqPsvja182SOL/AISXcviD9aaK5c1yrA5zga+X5hQhXw1eEoThOKlbmTXNG6dmr+jWjume5wHx5xP4bcT5XxdwjmmJyrOcpxNLE4fEYerOlzulUjUVOp7OUXKEnFPdSjJKcGpJM/y3/jf8EvGvwF8ear4G8Z2Mwa1mZtG1+KyvINE8U6W0cE8Gq6Hd3UMcV5CIrmGG/jt5JzpepLc6XduLu1lUfpv/AMEpP+Crfi79hjxdb/Db4k3GreLf2XfFurCXXtBiMt/q3ww1a/lVbjxv4It2Yu9o7kT+KvCsBWLWYlfUtNSLXomXVP6gP+Cjv/BOLwN+1L4G17WNH0H/AIqX/SdYvrHR7aP+2BrHlsX8YeD0C/8AIy9W8QeH1H2Xxta+bJHF/wAJLuXxB/Cd8dPgX45/Z/8AHN54K8a2f/PS60HXrWOT+x/E2j+YUh1TS5nH0jvbKQ/atOut1vcL/q5Jf5D4k4a4g8Lc/o5zk1eqsGq0pYTFxjKVNUpy97A42DbVWhUjanJTfvu13GqqVSX/AET+Cnjb4Q/Tz8I8y8M/ErK8FPiSpl9Knn+QVqlKjjJ43DUP3XFPC+JjThLAZpg63tMXSeFg3h4uo4wr5fPH4Sh/p5eCfG3hH4k+EfDvj3wF4i0nxb4M8W6TZ674b8SaFeRX+k6xpN/EJrW9s7qElHjdDtdG2ywSrJBPHFPFJGvUV/At/wAEpP8Agq34u/YY8XW/w2+JNxq3i39l3xbqwl17QYjLf6t8MNWv5VW48b+CLdmLvaO5E/irwrAVi1mJX1LTUi16Jl1T+8HwT428I/Enwj4d8e+AvEWk+LfBni3SbPXfDfiTQryK/wBJ1jSb+ITWt7Z3UJKPG6Ha6NtlglWSCeOKeKSNf6V4G45y3jbLViMO44bMsNGEcyy2U71MPUeiq0m7OrhKrTdKqldO9Kqo1ItP/Ez6VH0V+Nfow8ayyjN41s54KzmtiKvBXGtLDunhM4wdN88sBj4w5qeX8Q5fTlCOYZfKfLOPLjcFKtgq0Jx/l9/4OTNYt7XSPhRoxkh+3avc+E7mKCWyjuJGsNK/4W4b24trqW3lWwmhu77S4mlt57W9nt7q4tY2lsZdRiP84/7FHgi4+JH7YH7MPgi1v4dLl8RfHj4WWbajcQyXKWVunjLSLq8uVto2ja6mitLedra1M1tHc3Aiglu7SKR7mL9W/wDg4N+Pf/Cw/wBq7T/hTpmrf2lofws0WKKdP7I+w/Y9YuY1tLvSPttxBbXd/wD2Tq9v4kuPPSJ7WX+28RalqVrDYQaT84f8ESPgvrHxd/4KGfBvUbSzuZND+Ejaz8VvEuoron9sadp0Hh3TLm30NNQke5tYNLk1HxNqGkWWmaizTz2uovBcW1nO8DNF/OPFrhxB4u08HhoyxFN53leXzUWrSjQrUfrbjKM2lCmvbNzTi0oSlZNXf+0f0eliPCL9ndi+JM6q0cpxK8MeOuLsPOvTlJ0q2Z5dmEeHoV6FTDRlLE4ycctp06EoV1UliKNPnlGXJD/QWooor+xj/m3PL/jV8OLf4ufCvxt8OrloQvibRntrdbsxiwl1CzuINT0u31USWOpB9GudSsrS31mJLG4nm0qS8it1Wd45E/zS/wBpz4J6x+z38bfHXwu1izubH+w9WuJNMgvYPsl4mkXM0rWUV3YSahqd7YXNnslsJ7TVLkapHLaO17DDK5Qf6glfzh/8Fvf+CeP/AAtzwufj18OdH1a68W6FHqd5c6foemaOLVtRvRpEU+n32yfTp3tvGE9s19bX1ysz6f4wXUGa9vr3xva6S3494xcH1eIskp5lgaTq5lk/PUjCKvOtg5616UVvdNKpFRTcpxinyw5pL/R39nB9I3BeDfiji+DOKcfHBcFeJH1bB18TWkoYbLeIcPeGVZjWk7RVOUZzwVadSpCFLD161SKq11Ro1PhX/ggb/wAFFNP+E3ia8/Y4+MfiHT9H+HPjbUNR8Q/CHXr+zdI9A+IV8bWTWfDGq62k62+neHfEljaT6nY3Go2otLDxBb3CS6jbR6yFX+yav8oz/iY6NqP/AC+6Vq2lXv8A03sdR03UbGf/ALZXNne2dzF/0znt54/4JE4/r5/4Ja/8FyvD/jHS/Bn7PX7aHiKHRfHsM1p4W8I/HjWLiZdL8aCc21p4esviPOtm9po3iBGE1jqXjzUr+z0vVWbSrvXEh1CXXNem+O8IvEnDUMNR4T4hxUcNKg1SybHYiTjSdNysstxFWcrUp0pO2DlPlpOl/szlCVOjGr/SP7RL6E+eZpneY/SB8Hskq5zRzWnLH+JPC2T0FWx9LGU6XPV40yfA4alz4/DY6jD2vEdCh7bGwxt86hTxNDF5jUwH9PVFVrK9s9Ss7TUdOu7a/wBPv7aC9sb6yniurO9s7qJJ7W7tLqB5ILm2uYJEmgnhd4ponSSN2RgTZr+kk01dO6eqa2a7n+KUoyjJxknGUW4yjJNSjJOzTT1TT0aeqejCvyW/4KO/8E4vA37UvgbXtY0fQf8Aipf9J1i+sdHto/7YGseWxfxh4PQL/wAjL1bxB4fUfZfG1r5skcX/AAku5fEH600V52a5Vgc5wNfL8woQr4avCUJwnFStzJrmjdOzV/RrR3TPsOA+POJ/DbifK+LuEc0xOVZzlOJpYnD4jD1Z0ud0qkaip1PZyi5Qk4p7qUZJTg1JJn+XL8dPgX45/Z/8c3ngrxrZ/wDPS60HXrWOT+x/E2j+YUh1TS5nH0jvbKQ/atOut1vcL/q5JfvL/gnx/wAFXvjf+wno/iv4d2XmeOPhF4otr6607wtqUyz3Xw98XXWGbxX4HN6Xsrdr7Drq+gX0cuhX181trc1nLd2t7a6x/RX/AMFrfg3+yHbfCLWfG/xW8Z+EPA/i3U3N7pHhQ3YXxn4h8VX/ANpttP8AFfgPRdLstV1uPUJr6B4vGUp0l/C+rabHe6rrFzZavaXUuufw+V/GfFGVY/wy4qjLJM2jTquFSrhpUK0ZYmjhqr5ZYfG0byfsqidqarK9RQcledKNWX/Sv4E8e8JfTk8A6+H8UfD+pi8FDE4TL87hmmW18Pk2ZZzgY+2pZxw1mPJRjHH4OpHmxcssqcmEeJhSm44XMKmX0+z+InjjWPiV458VePNefzNW8Va1eavd/Lar5f2iQ+Rb/wChWlhbP9ltlhtvNjs7fz/K854lkkev7H/+DeT9kef4VfA3xh+0t4t0T7J4s+Of9naZ4Pu7tdRgvrT4a6RNLeqLaCaJNMudM8T6m+n6zHqtjcXb3JsYNNuI7C40idLr+cn/AIJqf8E+/HX7fHxug8NWtte6N8H/AAX9n1j4teP2huo7DSdOkYjT/DemXUcDQ3vizxHMrDT9GF1ZTtpVprGpm9s4tPM4/wBEvw54e0bwl4e0Lwp4c0+HSfD3hnRtL8PaDpVsZDb6Zo2i2MGm6Xp9uZXklMNnY20FtEZJJJDHGu92bLH7/wAE+EsTjcxxHGmaU5ulSlXp5ZOtH3sXjcRzwxmNjzJXjRjKdGNRXjOtWqqLU6ErfyP+0++kFkfDXBmT/Rk4FxWGhi8bSyrGccYXLayVLh/hrJ1ha/DPC9ZUpSVOtmVahhsyrYObhWw+W5dl86sZYfNafNs0UUV/Tx/heFVr2ys9Ss7vTtRtLa/0+/tp7K+sb2CK6s72zuongurS7tZ0kguba5gkeGeCZHimid45EZGINmihpNNNXT0aezXZjjKUZKUW4yi1KMotqUZJ3TTWqaeqa1T1R/Kr/wAFV/8AgjLeeJddvfjd+zbYQW89/wDbL3xPo8638lpHFZ2dxfXD61cWVpqFzbm2trWT+zvF95CbOe2jGmeNb+0vrax8Sa5/KT4n8KeJfBes3nh7xZoep+HtasJri3utO1W0ms7hJLW6uLGdkWVQs8K3drcwLcwNLbyyQSCKVwpNf6sFfnN+1Z/wS7/ZU/au0uRPEvgfTPCviSOEQ6d4k8N6fHaPpw3WKL9ls7GfTJ7CGGG1mlj0/QNT0PS9Q1S7k1LxLY+ISptpPwjjvwbw+dV6+a8O1KOBzCs5VK+Cq3hg8TVdryhKKl7CpN3lJqPI222m3c/1b+il+0nznwwyzKuAfGTB5jxXwfl9Ojgss4kwPLieI8kwVN1FGjiKVapS/tbCYeDp06NOVVYmnThClSqRpwUX/ER+y7/wUr/bJ/ZBs30T4O/F3U08HPgjwD4ytbfxp4Ktm83Tmkk0vRddFwNBmmt9NhsZZtAuNLlNnLOiukrpNH+2Pw4/4Oa/FFulzD8Xf2VdA1aUwq1nqHw4+Iuo+HUW4W4m3xXOj+J9A8UNJDLaSQBbiLXI5ILi0mY21zFqKLpfi3x6/wCDdv8AaC8OXuoan8FfFHhnxVo62d9q7aVqN9OY9MjW/uZU0ez1BLVPFGtXlrpCARW1p4Kvbi+uI7OK2u7271O4ttJ/OPxN/wAEk/8AgoZ4bR50/Zj+IniK0jhhlluPDOlyajIkk1wbcWyaZOLPWrmaMmOaZrPTLi3it5RM1wFhuvs/5hh5eMPBlsJhaee/VaStToxwqznBKnFyS9hCpRxao0/ebapxotaOSTSt/dWcUv2cH0mHLiLPMV4WLPcwbnjMwr55U8NOJnjKvsZSWa4jCZjw9LMsb+7hCFTGVcyjO9SGHqVFVqc/7o3P/Bzl4FS3uGs/2QvFs92sMrWsFz8YdHtbea4CMYIri6i+H15LbQyShUluI7O6khQtIltOyiJvg342/wDBxH+2L8SNCv8AQvhr4X+HvwM+3211Ytrvh2C68V+JILW+s4oJ5rW/8UJPZ2erWs6SzaTqdjplp9giup0mtr29isNRsvzq0L/gmb+354l/s59F/ZM+M93batbJe6dqUnhSey0e7s5rU3sF3FrV9JbaSba6ttstpO16sV35kKWzyyTwo/2P8GP+CBv7f3xS/su98V+GPBnwU0PUPtvnXnxH8V2smsWH2T+1Yo/tPhjwpH4h1dPtV3p9tFD5yW+611Wx1CPzbUXJg3lxL405/bB0aefQVSLi3hMlhliam4JyljY4PDulbmj7/wBYpqMZOV1FtnlUfBP9mT4SuXEWZY7wmxVTB1Y1oU8/8TMTxvNVMPCtUVKjwvPiPN4Zg5exqv6u8mxk61WEaShOfs6Z+RHxD+JHj34s+LNT8d/EvxbrnjfxhrTpJqviPxFfzajql9IgxvuLmYlnd2LzStw01zLPdTF7ieaWT9CP2Af+CV3x/wD25vFOl3sOmat8MfghFciTxH8YPEPh3Uzp09hFAlxPaeBra5jsLLxbrkv2iwgit4tUtrO2S/XUJ7iS3sruIf0k/suf8G+X7Kfwgl0PxH8dNV1b9ofxZYW1vcXWkapFN4a+HQ1iazeG/jfw9YX8t9ruk2dw0UujQ6rfxbpY7i41e2v4bq10/Sv3wsrKz02ztNO060trDT7C2gsrGxsoIrWzsrO1iSC1tLS1gSOC2traCNIYIIUSKGJEjjRUUAfTcKeCOOxOKWZ8a4n3XVjWlllDESxGJxc5Nzqf2hjoytTUpWU1hqlarVvJ+3otJy/D/H/9qHwvkuRz4H+jDkbVSlgquWUON80yejlGSZBh6UI4fCPhDhatS5sXKjRUnh6mdYLLsDgnToxWU5hTnJUfF/2dP2dPhL+yr8JfDPwX+C/hmHw14M8NQliWMdxrPiLWbiOJdV8VeKtVWKGXWvE2tSwxy6jqMsccaRx22nadbWGj6fpum2fuNFFf0pQoUMLQpYbDUqdDD0KcKNChRhGnSpUqcVGFOnCKUYQhFKMYxSSSSSP8Ts2zbM8+zPMM6zrMMZm2b5tjMRmGZ5nmOIq4vHZhjsXVlXxWMxmKrynWxGIxFac6tatVnKc5ycpNthRRRWp54UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf/2Q==">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://design-forms.scia-online.com/forms/cz/Beton_Navrh_smykove_vyztuze.htm</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Design of shear reinforcement - rectangle</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" />
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|1|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
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
      <Variable Modifier="Public" Name="A" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="A↓c←" ESA_ID="" Type="Double" Value="202.5e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓c←">
          <ENU>The area of concrete cross-section</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓k.inp←" ESA_ID="" Type="Double" Value="120e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓k.inp←">
          <ENU>Input value of area enclosed by the centre line of effective cross-section</ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓k←" ESA_ID="Result.3" Type="Double" Value="88.9e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓k←">
          <ENU>Area enclosed by the centre line of effective cross-section</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="a↓sl←" ESA_ID="Result.1" Type="Double" Value="40e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sl←" ESA_ID="Result.0" Type="Double" Value="3.141593e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓sl←">
          <ENU>The area of tensile longitudinal reinforcement</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓swt←" ESA_ID="Result.5" Type="Double" Value="50.26548e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓swtm.min←" ESA_ID="" Type="Double" Value="134.1641e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="A↓swtm←" ESA_ID="Result.7" Type="Double" Value="335.1032e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="Alpha" ESA_ID="" Type="Double" Value="128" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Auto↓θ←" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_Auto↓θ←">
          <ENU>Automatic calculation angle between the concrete compression strut and axis member</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="AutoCal" ESA_ID="" Type="Boolean" Value="1">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="AutoType" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_AutoType">
          <ENU>Automatically created equivalent thin walled cross-section for torsion</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="b_interaction" ESA_ID="" Type="Boolean" Value="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="b↓ef←" ESA_ID="" Type="Double" Value="150e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="b↓w←" ESA_ID="" Type="Double" Value="150e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="bMaxSpacing" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_bMaxSpacing">
          <ENU>Check maximum longitudinal spacing of shear links</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="bPrint_Img" ESA_ID="" Type="Boolean" Value="1">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="bStandAlone" ESA_ID="" Type="Boolean" Value="1">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CalcTheta" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CentreLinePol" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Check" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Clause2_4_2_4_1" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause3_1_6_1P" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause3_1_6_2P" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause3_2_7_2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause6_2_2_6" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause6_2_3_2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause6_2_3_3" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Clause9_2_2_5" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Coeffε↓Sud←" ESA_ID="" Type="Double" Value="900e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ColorNotCalc" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ColorNotOK" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ColorOK" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ColorOKBut" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ConcreteCssCharacteristics" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ConDiagram" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Coord" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="cotθ" ESA_ID="" Type="Double" Value="1.191754" Precision="2">
        <Description TranslateID="VARIABLE_cotθ">
          <ENU>Cotangent of angle of compression diagonal</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="cotθ↓inp←" ESA_ID="" Type="Double" Value="1.191754" Precision="2">
        <Description TranslateID="VARIABLE_cotθ↓inp←">
          <ENU>Cotangent of angle of compression diagonal</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="cotθ↓max←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_cotθ↓max←">
          <ENU>Cotangent of angle of compression diagonal</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="cotθ↓min←" ESA_ID="" Type="Double" Value="2.500177" Precision="2">
        <Description TranslateID="VARIABLE_cotθ↓min←">
          <ENU>Cotangent of angle of compression diagonal</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CreateTorCss" ESA_ID="" Type="Boolean" Value="1">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="CssID" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CssIDTor" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>Effective depth of cross-section</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="Diagrams" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Diskr" ESA_ID="" Type="Double" Value="-5.76" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DrawAxis" ESA_ID="" Type="Boolean" Value="1">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="DrawStirrups" ESA_ID="" Type="Boolean" Value="1">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="EWN" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="EWN_Theta" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="EWNBorderPen" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="EWNCellsFont" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="f↓cd←" ESA_ID="" Type="Double" Value="13.33333e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓cd←">
          <ENU>Design compressive cylinder strength of concrete</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ck,cube←" ESA_ID="CONCRETE.EC.fckcube" Type="Double" Value="25e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ck←" ESA_ID="CONCRETE.EC.fck" Type="Double" Value="20e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ck←">
          <ENU>Characteristic compressive cylinder strength of concrete</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctd←" ESA_ID="" Type="Double" Value="1e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ctd←">
          <ENU>Design value of tensile strength of concrete</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctk005←" ESA_ID="CONCRETE.EC.fctk_05" Type="Double" Value="1.5e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ctk005←">
          <ENU>Characteristic axial tensile strength of concrete (5%)</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctm←" ESA_ID="CONCRETE.EC.fctm" Type="Double" Value="2.2e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓yk←" ESA_ID="REINF.EC.fyk" Type="Double" Value="400e6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ywd←" ESA_ID="" Type="Double" Value="347.8261e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ywd←">
          <ENU>Design yield strength of shear reinforcement</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ywk←" ESA_ID="REINF.EC.fyk" Type="Double" Value="400e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ywk←">
          <ENU>Characteristic yield strength of shear reinforcement</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="Font" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FontStatus" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="forces" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ForcesID" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="FormCode" ESA_ID="" Type="Double" Value="2009" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="G2" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="G5" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="GNOTOK" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="GOK" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="GOKBUT" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h↓ef←" ESA_ID="" Type="Double" Value="1.35" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="IndexEWN" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="InnerPol" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="j" ESA_ID="" Type="Double" Value="16" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Limit" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_Limit">
          <ENU>Limit value of the check</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ListEWN" ESA_ID="" Type="String" Value="N4/1, N4/2, W4/1.">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="n↓s.cal←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NBranch" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NColumns" ESA_ID="" Type="Double" Value="8" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Number↓E←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Number↓EWN←" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Number↓N←" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Number↓W←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="OffsetPoint" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="OuterPol" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Pressure" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_Pressure">
          <ENU>Compression in flexure and axial loading or other cases</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintCaption" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_PrintCaption">
          <ENU>Print caption</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintEWN" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_PrintEWN">
          <ENU>Print explanation errors/warnings/notes</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ReinfBars" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ReinfClass" ESA_ID="REINF.EC.Class" Type="String" Value="B">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ReinfDiagram" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ReinfMat" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="s↓inp←" ESA_ID="Beam.Reinforcement.StirrupChars.ss" Type="Double" Value="150e-3" Precision="2">
        <Description TranslateID="VARIABLE_s↓inp←">
          <ENU>Centre - to - centre distance of stirrup in longitudinal direction</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="s↓l←" ESA_ID="Result.6" Type="Double" Value="150e-3" Precision="2">
        <Description TranslateID="VARIABLE_s↓l←">
          <ENU>Calculated centre - to - centre distance of stirrup in longitudinal direction</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="sCheck" ESA_ID="" Type="String" Value="OK*">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ShapeCss" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ShearReinf" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="sNOTOK" ESA_ID="" Type="String" Value="Not OK">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="sOK" ESA_ID="" Type="String" Value="OK">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="sOKBUT" ESA_ID="" Type="String" Value="OK*">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="StirrupID" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="StirrupIDTor" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="StripeWidth" ESA_ID="" Type="Double" Value="50e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="T_EWN" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T_Sum" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T↓ccd←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="T↓Ed←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_T↓Ed←">
          <ENU>Applied torsional moment</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="t↓ef.inp←" ESA_ID="" Type="Double" Value="100e-3" Precision="2">
        <Description TranslateID="VARIABLE_t↓ef.inp←">
          <ENU>Input value of effective wall thickness</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="t↓ef←" ESA_ID="Result.2" Type="Double" Value="80e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="T↓Rd←" ESA_ID="Result.12" Type="Double" Value="37353.25" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="T↓Rdc←" ESA_ID="Result.9" Type="Double" Value="14224" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="T↓Rdmax_sum←" ESA_ID="" Type="Double" Value="37353.25" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="T↓Rdmax←" ESA_ID="Result.11" Type="Double" Value="37353.25" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="T↓Rds_sum←" ESA_ID="" Type="Double" Value="51813.53" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="T↓Rdst←" ESA_ID="Result.10" Type="Double" Value="51813.53" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="T↓td←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TableBorderPen" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableCellsFont" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableGridPen" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="tableHeaderColor" ESA_ID="" Type="Object">
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
      <Variable Modifier="Public" Name="tablerowColor" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="TableWidth" ESA_ID="" Type="Double" Value="585" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TypeTorCss" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TypeTorCssInput" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="u↓c←" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="u↓k.inp←" ESA_ID="" Type="Double" Value="1.2" Precision="2">
        <Description TranslateID="VARIABLE_u↓k.inp←">
          <ENU>Input value of perimeter of area enclosed by the centre line of effective cross-section</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="u↓k←" ESA_ID="Result.4" Type="Double" Value="2.68" Precision="2">
        <Description TranslateID="VARIABLE_u↓k←">
          <ENU>Perimeter of area enclosed by the centre line of effective cross-section</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="UC" ESA_ID="Result.13" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UC_lim" ESA_ID="" Type="Double" Value="3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UserScale" ESA_ID="" Type="Double" Value="10" Precision="2">
        <Description TranslateID="VARIABLE_UserScale">
          <ENU>Picture user scale</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="X" ESA_ID="" Type="Double" Value="474.1866e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓cc←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_α↓cc←">
          <ENU>Coeffcient taking into account of long term effect on the compressive strength</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓ct←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_α↓ct←">
          <ENU>Coeffcient taking into account of long term effect on the tensile strength</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓cw←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_α↓cw←">
          <ENU>Coeffcient taking into account state of the stress in the compression chord</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓s←" ESA_ID="Beam.Reinforcement.StirrupChars.Angle" Type="Double" Value="90" Precision="2">
        <Description TranslateID="VARIABLE_α↓s←">
          <ENU>Angle of  stirrups from axis of member</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="α↓tor←" ESA_ID="" Type="Double" Value="90" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓c←" ESA_ID="" Type="Double" Value="1.5" Precision="2">
        <Description TranslateID="VARIABLE_γ↓c←">
          <ENU>Partial safety factor for concrete</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓s←" ESA_ID="" Type="Double" Value="1.15" Precision="2">
        <Description TranslateID="VARIABLE_γ↓s←">
          <ENU>Partial safety factor for reinforced steel</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="θ" ESA_ID="Result.8" Type="Double" Value="21.80001" Precision="2">
        <Description TranslateID="VARIABLE_θ">
          <ENU>The angle between the concrete compression strut and axis member</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="-1" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="θ↓inp←" ESA_ID="" Type="Double" Value="40" Precision="2">
        <Description TranslateID="VARIABLE_θ↓inp←">
          <ENU>The inputted angle between the concrete compression strut and axis member</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="θ↓int←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_θ↓int←">
          <ENU>Angle between the concrete compression strut and axis member from interaction</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="θ↓max←" ESA_ID="" Type="Double" Value="44.99999" Precision="2">
        <Description TranslateID="VARIABLE_θ↓max←">
          <ENU>The maximum angle between the concrete compression strut and axis member</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="θ↓min←" ESA_ID="" Type="Double" Value="21.80001" Precision="2">
        <Description TranslateID="VARIABLE_θ↓min←">
          <ENU>The minimum angle between the concrete compression strut and axis member</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="ν" ESA_ID="" Type="Double" Value="571.2e-3" Precision="2">
        <Description TranslateID="VARIABLE_ν">
          <ENU>Strength reduction factor for concrete cracked in shear </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="π" ESA_ID="" Type="Double" Value="3.141593" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓w,min←" ESA_ID="" Type="Double" Value="894.4272e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓s←" ESA_ID="Beam.Reinforcement.StirrupChars.D" Type="Double" Value="8e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓s←">
          <ENU>Diameter of shear reinforcement</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
    </Variables>
    <DrawingGroups />
    <ResultTables />
    <ResultGroups />
    <Layouts>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_0">
          <ENU>Summary</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Brief</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_2">
          <ENU>Standard</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_3">
          <ENU>Detailed</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_4">
          <ENU>Summary table</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_5">
          <ENU>Extern</ENU>
        </Names>
      </Layout>
    </Layouts>
    <VisualComponents>
      <VC ID="INI400_000134">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="61.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000143">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="92.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="149" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000144">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="106" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="162" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000145">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="119" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="175" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000146">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="126" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="183" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_000420">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="18189" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="4809" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="1371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001063">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="329" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="329" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="349" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5963" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3014" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="349" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001093">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Chapter" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="43.3" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|20|0|2" Font2="Segoe UI|20|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.3" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|20|0|2" Font2="Segoe UI|20|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001096">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="416" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="243" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="65.9" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="151" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="65.9" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001097">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="431" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="257" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="84.5" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="167" Y="151" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="167" Y="65.9" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001098">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="446" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="273" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="104" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="237" Y="151" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="237" Y="65.9" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001099">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="462" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="288" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="124" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="303" Y="151" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="303" Y="65.9" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001100">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="477" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="303" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="144" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="171" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="85.7" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001101">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="492" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="318" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="162" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="202" Y="171" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="202" Y="85.7" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001102">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="556" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="401" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="182" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="231" Hor="0" Ver="4" SpX="2" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="105" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001103">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="451" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="202" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="154" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="274" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001104">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="622" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="468" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="223" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="175" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="296" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001105">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="639" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="484" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="245" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="197" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="317" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="107" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001106">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="655" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="501" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="266" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="338" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="124" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001107">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="669" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="515" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="284" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="161" Y="338" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="161" Y="124" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001108">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="685" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="531" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="304" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="358" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="144" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001109">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="699" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="545" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="323" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="158" Y="358" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="158" Y="144" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001110">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="715" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="561" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="343" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="378" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="163" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001111">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="729" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="575" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="361" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="160" Y="378" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="160" Y="163" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001114">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="798" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="644" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="452" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="109" Hor="0" Ver="4" SpX="2" SpY="10" Font1="Segoe UI|16|0|2" Font2="Segoe UI|16|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001140">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="920" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="737" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="666" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="577" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2292" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001141">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="945" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="762" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="695" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="608" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2323" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001142">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="968" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="784" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="723" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="638" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2352" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001143">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="992" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="809" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="753" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="669" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2384" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001148">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2816" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3140" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="272" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1251" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2495" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001149">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2831" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3155" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="234" Y="272" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="234" Y="1251" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="234" Y="2495" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001150">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2876" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3200" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="311" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1291" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2535" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001151">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2890" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3215" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="269" Y="311" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="269" Y="1291" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="269" Y="2535" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001152">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2906" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3230" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="331" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1310" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2555" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001153">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2920" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3244" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="348" Y="331" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="348" Y="1310" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="348" Y="2555" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001154">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2941" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3265" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1335" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2574" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001155">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2969" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3293" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="331" Y="282" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1371" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2611" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001172">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="877" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="708" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="527" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="479" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001173">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="848" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="10" Y="693" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="508" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="461" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001194">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3271" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="462" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2808" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3623" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001195">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3301" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="607" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="5" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_001196">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3317" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="627" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_001197">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3332" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="718" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2827" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001198">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2988" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2641" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1599" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1599" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1599" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1599" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001200">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3020" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2673" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="459" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2862" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3641" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001201">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3036" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2688" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="459" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Arial|13|2|2" Font2="Arial|13|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2884" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3663" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001203">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001205">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001206">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1499" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1499" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001258">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3783" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2399" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="3013" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001259">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3614" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4246" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="802" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="4144" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001277">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2846" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3170" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="292" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1271" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2515" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001278">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2860" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3185" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="418" Y="292" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="418" Y="1271" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="418" Y="2515" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001279">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3472" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="331" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1591" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2808" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001280">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3176" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3497" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="331" Y="452" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1623" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2840" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001288">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="145" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="174" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="56.6" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="56.6" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="56.6" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="520" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001300">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2991" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3315" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="331" Y="268" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1399" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2639" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001302">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3432" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="331" Y="334" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1548" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2708" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001303">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2085" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1754" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="331" Y="378" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1953" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2758" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001315">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="821" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="667" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="142" Y="158" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="141" Y="398" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="141" Y="463" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2208" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001693">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="862" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="110" Y="693" Hor="1" Ver="2" SpX="100" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="93.5" Y="508" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="93.5" Y="461" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001694">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="891" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="110" Y="708" Hor="1" Ver="2" SpX="100" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="231" Y="527" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="231" Y="479" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001729">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="86.2" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="123" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001731">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="101" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001772">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="234" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="123" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001773">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="249" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="138" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001774">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="264" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="154" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001776">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="280" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="169" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001778">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3878" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4519" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1143" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001783">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="294" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="184" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001785">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1882" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4638" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1882" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1882" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1882" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1882" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001786">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1065" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1065" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1065" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1065" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1065" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1065" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001787">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4228" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3103" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3391" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1209" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3103" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001801">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3893" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4535" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1158" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001802">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3908" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4550" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1174" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3026" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001821">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3285" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="454" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001822">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3294" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2634" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="708" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2196" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2818" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3632" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001823">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3070" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2703" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="553" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="3200" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3200" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001824">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3078" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2711" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="598" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2918" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2918" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3696" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001825">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2628" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2628" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2628" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2628" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001826">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2637" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2637" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2637" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2637" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001828">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1616" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="788" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1941" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001832">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="509" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6123" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3173" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="509" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_001833">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="288" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="288" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="530" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6156" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3206" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="530" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002727">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="22.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="231" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="22.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002728">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="53" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="262" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="242" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="53" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="242" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002741">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="69.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="278" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="259" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="69.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="259" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002840">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="163" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="163" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6019" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3070" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002841">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="182" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="182" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="423" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6038" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3088" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="423" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002842">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="306" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="306" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="547" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6139" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3190" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="547" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002845">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="366" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="366" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6001" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3051" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="386" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002846">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="236" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="236" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="477" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6092" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3142" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="477" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002849">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="219" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="74.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002858">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4007" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="4339" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="1447" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="502" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002861">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4737" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="2681" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3875" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002862">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="97.9" Y="4024" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-110" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="173" Y="1483" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="610" Y="4401" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="136" Y="1509" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="66.9" Y="17197" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002864">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="81.8" Y="4043" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-115" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="169" Y="1539" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="606" Y="4464" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="120" Y="1572" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="62.3" Y="17387" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002869">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="192" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="192" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="37.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5710" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="2817" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="37.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002870">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4062" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-110" Y="135" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="173" Y="1557" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="633" Y="4528" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="148" Y="1635" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="66.9" Y="17450" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002871">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="221" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="221" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="66.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5739" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="2846" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="66.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002872">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="81.8" Y="4080" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-110" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="173" Y="1594" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="606" Y="4591" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="136" Y="1698" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="66.9" Y="17577" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002873">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="250" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="250" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="270" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5885" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="2934" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="270" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002875">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="279" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="150" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="299" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5914" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="2963" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="299" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002876">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="81.8" Y="4099" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-110" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="173" Y="1613" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="606" Y="4654" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="136" Y="1762" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="66.9" Y="17640" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002877">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="201" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="201" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="442" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6057" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3107" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="442" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002878">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="31.4" Y="4118" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-169" Y="117" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="115" Y="1633" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="564" Y="4718" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="69.8" Y="1826" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="8.12" Y="17704" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002879">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="250" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="250" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="492" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6106" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3157" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="492" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002880">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4138" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-86.9" Y="116" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="196" Y="1652" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="633" Y="4783" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="148" Y="1890" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="90" Y="17768" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002881">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="178" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="178" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="578" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6189" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3240" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="578" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002883">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="210" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="210" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="610" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6221" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3272" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="610" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002889">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4872" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Arial|13|5|2" Font2="Arial|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3314" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1180" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002899">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4643" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="582" Y="5465" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="2573" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="651" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002900">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4657" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="27.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="27.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="582" Y="5484" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="2591" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="651" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002910">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3953" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3867" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3867" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1257" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3867" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002911">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3924" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4691" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3809" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3809" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1243" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3809" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002915">
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_002916">
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
      </VC>
      <VC ID="INI400_002917">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="840" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="686" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="499" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="451" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002918">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1027" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="520" Hor="0" Ver="4" SpX="15" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_002919">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2794" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3088" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002925">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3606" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4239" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="792" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4130" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002929">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="154" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002930">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="171" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002931">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="188" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002932">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="204" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002939">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17154" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-127" Y="993" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17154" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="578" Y="4358" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="92.4" Y="1466" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17154" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002954">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17344" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-127" Y="993" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17344" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="578" Y="4421" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="92.4" Y="1529" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17344" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002957">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17407" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-127" Y="993" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17407" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="578" Y="4485" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="92.4" Y="1592" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17407" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002961">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="41.5" Y="17534" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-127" Y="993" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="41.5" Y="17534" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="578" Y="4548" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="92.4" Y="1656" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="41.5" Y="17534" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002963">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17597" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-127" Y="993" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17597" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="578" Y="4611" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="92.4" Y="1719" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="58.4" Y="17597" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002965">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-30.3" Y="17660" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-100" Y="993" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-30.3" Y="17660" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="605" Y="4675" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="119" Y="1782" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-30.3" Y="17660" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002968">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-27" Y="17725" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-110" Y="993" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-27" Y="17725" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="596" Y="4740" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="110" Y="1847" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-27" Y="17725" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002971">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="39.8" Y="17787" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="-63.8" Y="1323" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="39.8" Y="17787" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="582" Y="4801" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="1909" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="39.8" Y="17787" Hor="2" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002972">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4256" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="769" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="769" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="582" Y="4950" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="2058" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="577" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002974">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4372" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="769" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="769" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="582" Y="5099" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="2207" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="577" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002979">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4672" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="81.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="81.7" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="582" Y="5500" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="2608" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="487" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002980">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4686" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="96.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="96.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="582" Y="5515" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="2622" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="487" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002981">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4701" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="114" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="114" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="582" Y="5531" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="2639" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002982">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4715" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="134" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="134" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="582" Y="5550" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="2658" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="54.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002983">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="109" Y="4730" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="582" Y="5567" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="2674" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="487" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_002986">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3967" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4735" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3867" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3867" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1272" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3867" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003031">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="776" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="622" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="95.5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="347" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="412" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003032">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="826" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="672" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="163" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="403" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="468" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003033">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1013" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1243" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="168" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="629" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="61.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003038">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2460" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2949" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="708" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1339" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="538" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003039">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2933" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3258" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="348" Y="1806" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="348" Y="1326" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003040">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3465" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="2024" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1582" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003041">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3244" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1038" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2106" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2106" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003053">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3591" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1091" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003054">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3668" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4296" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2651" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="860" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003059">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4558" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1383" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2871" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1060" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003060">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4831" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="116" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5659" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="2766" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003085">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2833" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="627" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_003086">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2833" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="627" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_003259">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="194" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="194" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6236" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3287" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003260">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="210" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="210" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="610" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6251" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3301" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="610" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003337">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3137" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3137" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003338">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3195" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3195" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003341">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="45" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="254" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="234" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="45" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="234" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003342">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="37.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="246" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="227" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="37.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="227" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003868">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3195" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3195" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003869">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003870">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003871">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4817" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5646" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="2754" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003872">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="177" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="177" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="22.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5694" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="2802" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="22.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003873">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="206" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="206" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="52.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5724" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="2832" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="52.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003874">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="81.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5753" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="2861" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="81.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003875">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="264" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="136" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="285" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5899" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="2949" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="285" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003876">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="293" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="165" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="314" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="5928" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="2979" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="314" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003877">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="219" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="219" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="461" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6075" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3126" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="461" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003878">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="162" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="162" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="562" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6173" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="562" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003879">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="194" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="194" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="6205" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="3256" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="594" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003883">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="954" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="148" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="553" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="701" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003891">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1118" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1001" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="313" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="717" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="809" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003892">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1142" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1024" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="336" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="740" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="829" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003893">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1162" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1044" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="356" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="761" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="849" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003897">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1246" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1129" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="440" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="845" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="870" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003909">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3049" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1952" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2443" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="292" Y="2057" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="292" Y="2057" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2443" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003910">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3057" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1960" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="277" Y="633" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1888" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1781" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2451" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003911">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3035" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="17.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1879" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1772" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003913">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3131" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3452" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1567" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003918">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4977" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="4041" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003919">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4998" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4354" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="273" Y="1099" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="4061" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003920">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5014" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4370" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1120" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="4081" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1499" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003921">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5047" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4403" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2498" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3651" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3651" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3651" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003922">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5055" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4411" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1204" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2506" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2506" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2506" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003923">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3635" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4268" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1058" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3366" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="826" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003947">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3655" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4288" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1058" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3366" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="846" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003975">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3925" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="3363" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003976">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3945" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="3383" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003977">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3980" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2498" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2498" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2498" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2498" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003978">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3988" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="223" Y="1039" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2506" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2506" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2506" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003979">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3993" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="25" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="223" Y="1044" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2635" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="3416" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003980">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3756" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2979" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2651" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003981">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3776" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="20" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2671" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003982">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3810" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2498" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2498" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2498" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2498" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003983">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3818" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1378" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2506" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2506" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2506" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003984">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2793" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003985">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2815" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003986">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2859" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1499" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003987">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2498" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3613" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3613" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3613" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003988">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2506" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3621" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3621" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3621" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003989">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2898" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2898" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003990">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4095" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3014" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1026" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003991">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4115" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1046" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003992">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3701" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4434" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2800" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="4196" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003993">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3722" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4454" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2820" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_003994">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3738" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4470" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2840" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="4216" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003995">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3771" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4504" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="971" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3476" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="3476" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3476" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003996">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3779" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4512" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="3281" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2874" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="4225" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003997">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3706" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="955" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_003998">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3726" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="282" Y="1099" Hor="4" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="975" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004004">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="590" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="435" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="182" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="254" Hor="0" Ver="4" SpX="2" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="105" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004005">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="595" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="421" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="571" Y="231" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004006">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="575" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="561" Y="134" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004007">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="745" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="590" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="182" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="397" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="105" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004008">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="255" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004009">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="764" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="610" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="344" Y="397" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004010">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3965" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="3401" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004011">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3796" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2689" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004012">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3855" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3053" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1116" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="4278" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004030">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3264" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3655" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="596" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1211" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004031">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="5384" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="5384" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="5384" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="582" Y="5449" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="96" Y="2556" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="5384" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004063">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="1000" Y="405" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="63.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="63.9" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004080">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4657" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004081">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_004082">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2001" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2001" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2001" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2001" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1228" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2001" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004083">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4623" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1194" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004157">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3079" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3399" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="760" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1506" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004158">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3096" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3417" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="698" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1528" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004591">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="18191" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="4823" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="1373" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_004593">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="18233" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="4848" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="1415" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005161">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4358" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="18230" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4358" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="4862" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="1413" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4358" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005163">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="18267" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="4882" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="1449" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005164">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005165">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005166">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005177">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1441" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2028" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="593" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2156" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005178">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1314" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1857" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="64" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="64" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="64" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="64" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|11.7|0|2" Font2="Arial|11.7|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005179">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1458" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2045" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="610" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2179" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_005180">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1474" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2061" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="631" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2156" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005181">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1488" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2075" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="645" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2179" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_005184">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1504" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2091" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="666" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3041" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005185">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1828" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1876" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="386" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1401" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1401" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005186">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1897" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1421" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1421" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005187">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1847" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1917" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="405" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1441" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1441" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005188">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1868" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1958" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="426" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1217" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1217" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005192">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1523" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2110" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="685" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1194" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1194" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005193">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1546" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2133" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="708" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005195">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1561" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2148" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="728" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3041" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005196">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1580" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2168" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="747" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1236" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1236" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005197">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1601" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2188" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="768" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005198">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1645" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2232" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="817" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005199">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="813" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="659" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="141" Y="452" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="380" Y="128" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005200">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3387" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4035" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005203">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3432" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4080" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005204">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3199" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3519" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="918" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1652" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2949" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005205">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3224" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3544" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="731" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1684" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="2981" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005207">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3462" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4110" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3162" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005208">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3578" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4216" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="15" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="15" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005209">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3469" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4117" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="575" Hor="0" Ver="4" SpX="30" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3849" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005215">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3526" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4164" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="575" Hor="0" Ver="4" SpX="30" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3948" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005217">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3556" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4193" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="575" Hor="0" Ver="4" SpX="30" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3849" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005218">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="93.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="68.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="68.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005219">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1905" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2382" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="972" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="343" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005220">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1940" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2417" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1007" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005221">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1864" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2341" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="931" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="299" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2156" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005222">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1983" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2460" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1055" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="430" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005223">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2007" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2484" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1079" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="454" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005224">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="219" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="275" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005225">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="211" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="268" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005226">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1674" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2262" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="846" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1318" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1318" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005229">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2326" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="911" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1319" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1319" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005232">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2238" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2697" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1292" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1425" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1696" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005233">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2335" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2817" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1412" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1522" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1815" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005234">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2448" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2937" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1531" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1634" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1935" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005238">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1798" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="924" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="386" Y="121" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1799" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005239">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1818" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005241">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1841" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005247">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005252">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1406" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1993" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="553" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="597" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="597" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005254">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="44" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="44" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2100" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="288" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005255">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="72.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2113" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="301" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005259">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2136" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="325" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005260">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3476" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005263">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005265">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005267">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1353" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1937" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="534" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="905" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="905" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005268">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1365" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1950" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="703" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="868" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="66.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005275">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1761" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005276">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005279">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="916" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.7" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="110" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="507" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005280">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005281">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005283">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1426" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2013" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="573" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1072" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1072" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005284">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="593" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="452" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005285">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="601" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="235" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="541" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="541" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005286">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1368" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="487" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="562" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="967" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="967" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005288">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2209" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="464" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005290">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2035" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="116" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005292">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2058" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="139" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005293">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1980" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1053" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="296" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1941" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005294">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2000" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="159" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="790" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005295">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2030" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2507" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="477" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005296">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1963" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2440" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1035" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="410" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1799" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005297">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2081" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2557" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1152" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005298">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2089" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2566" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1160" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1334" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="533" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3632" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005299">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1863" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005300">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1896" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="454" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005301">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1905" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2634" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="708" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1258" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1457" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3632" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005302">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005303">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2926" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="454" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005304">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2934" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2634" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="708" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1258" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1452" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3632" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005305">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1686" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="924" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="386" Y="121" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1799" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005306">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2078" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005307">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2093" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="454" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005308">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2102" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2634" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="708" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1104" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1303" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3632" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005309">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2015" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="924" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="386" Y="121" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1799" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005310">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1160" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005312">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1270" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1270" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1270" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1270" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1270" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1270" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005313">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1180" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005314">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1694" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2281" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="866" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005316">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1270" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1270" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005317">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005318">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005320">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2101" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2578" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1173" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1564" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005321">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1866" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1201" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005322">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1886" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1221" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="366" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005323">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2114" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1136" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1136" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005324">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="507" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="333" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="182" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="191" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="105" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005325">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="338" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="319" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="465" Y="168" Hor="4" Ver="2" SpX="20" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005326">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="526" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="353" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="455" Y="191" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005327">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="541" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="367" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="144" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="209" Hor="0" Ver="4" SpX="2" SpY="2" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="85.7" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005330">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1135" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005331">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1733" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2301" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="886" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005342">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3619" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3668" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="609" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2619" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2619" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005343">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3681" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3730" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="671" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2621" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2621" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005344">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3704" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3753" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="694" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2621" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2621" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005345">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3728" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3776" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="718" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2621" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2621" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005347">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3769" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3817" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="758" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005348">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3789" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3838" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005349">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3809" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3858" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="799" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005350">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3830" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3878" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="819" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005351">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3850" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3899" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="840" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005352">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3639" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3688" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="629" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005353">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3659" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3707" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="648" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005354">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3883" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="853" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1211" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005356">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3962" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3986" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="927" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3865" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="3865" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005357">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3992" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="994" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="570" Y="980" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="524" Y="4324" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="1431" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005360">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3982" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3528" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="3528" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005361">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4002" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3528" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="3528" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005362">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4022" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3528" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="3528" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005365">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4043" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2708" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2708" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005366">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4050" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2634" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="708" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2608" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1278" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3632" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005367">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3871" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3899" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="840" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2618" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005409">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005413">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005414">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005415">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005416">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005417">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005418">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005420">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005421">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005424">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Tahoma|13|0|2" Font2="Tahoma|13|5|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005429">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005430">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005431">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005571">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="118" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="41.3" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005748">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1266" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1450" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="865" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="865" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="889" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005749">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1327" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1490" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="926" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="926" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="930" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005753">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="317" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="15" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="267" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="774" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="724" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005754">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1347" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1511" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="946" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="946" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="747" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005755">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1347" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1511" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="946" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="946" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="768" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005756">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1266" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1450" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="865" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="865" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="910" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005757">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1347" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1230" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="542" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="946" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="950" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005758">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="338" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="12.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="51.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="579" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="788" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005759">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="358" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="51.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="579" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="971" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005775">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1849" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="466" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1181" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="326" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005776">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1423" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005777">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2926" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="454" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005778">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2934" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2634" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="708" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1232" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1457" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3632" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005779">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1423" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005780">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2926" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="454" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005781">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2934" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2634" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="708" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1251" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1457" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3632" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005783">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1940" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="454" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005784">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1948" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2634" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="708" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1252" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="334" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3632" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005791">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1372" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="437" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="992" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="73.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005792">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1907" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="301" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005793">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1714" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2281" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="866" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005794">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1936" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2281" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="866" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005795">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1776" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2281" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="866" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005796">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1776" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2281" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="866" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005797">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1776" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2281" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="866" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005798">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2121" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2281" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="866" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005799">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1776" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2281" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="866" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005800">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1776" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2281" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="866" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1155" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005801">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1192" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005802">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005803">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="435" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1212" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="294" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005804">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2078" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="345" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005805">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2093" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="454" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005806">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2102" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2634" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="708" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1277" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="379" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3632" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005807">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1368" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="487" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="562" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="967" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="967" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005808">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="38.9" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005809">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2912" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2611" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="462" Hor="0" Ver="4" SpX="20" SpY="5" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2808" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3623" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005810">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2926" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2626" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="454" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2605" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005811">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2934" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2634" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="708" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="2818" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2818" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="3632" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005812">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2942" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="607" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1381" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_005813">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="152" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="209" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005814">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2598" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1193" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1418" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1418" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="5" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005815">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1432" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1835" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1835" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005816">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1976" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2598" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1193" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1418" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1418" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="5" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005817">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1782" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005818">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1432" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1835" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1835" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005819">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1779" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2598" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1193" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1418" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="5" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1418" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="5" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005820">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1801" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="1295" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005821">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1823" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2837" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1432" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1835" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1835" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005822">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005823">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005824">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="139" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="196" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005825">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="137" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="165" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="222" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005826">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="144" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="172" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="229" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005830">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_005831">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="198" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="255" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005833">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2457" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005834">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2457" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005835">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="60" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="44" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="44" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2150" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="405" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005836">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="72.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="57" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2163" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="418" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005837">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="441" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005838">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="887" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2438" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="484" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005839">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005840">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005841">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="106" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="121" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="136" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="59.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="59.2" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005842">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005843">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3538" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="880" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2511" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1108" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005845">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="78.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="93.1" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="109" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005847">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="338" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005848">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="198" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="351" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005849">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005850">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005851">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005852">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005853">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="364" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005854">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005855">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="391" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005856">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="111" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="186" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="497" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005857">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="77.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="198" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="510" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005858">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="533" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005859">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="556" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005860">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005861">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005862">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005863">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005864">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005865">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3003" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005866">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3064" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="1371" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005867">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="52.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="67.1" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="82.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005868">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="65.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="80.1" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="95.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="39" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005869">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="85.8" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="100" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="116" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="79.6" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005870">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3540" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="4178" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="575" Hor="0" Ver="4" SpX="30" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="3966" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="4" />
      </VC>
      <VC ID="INI400_005871">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_005874">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006321">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="21.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006407">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006408">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006411">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006412">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006413">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006414">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006415">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006416">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006417">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006418">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006420">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006421">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006422">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006423">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006424">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006425">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006432">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006433">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006434">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006435">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006437">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="395" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="207" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006438">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="415" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="227" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006439">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="435" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="246" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006440">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006442">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006443">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006444">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006445">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006446">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006447">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006448">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006449">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006450">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006451">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006674">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006810">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006812">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="194" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|2|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006813">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006818">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_006819">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006820">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="215" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="26.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006821">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="232" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006822">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="248" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="59.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_006823">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="263" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="74.4" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007183">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007325">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="18136" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="4775" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1318" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="1220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007326">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="18177" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="1359" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007327">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="18216" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="1398" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007328">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="18255" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="1437" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="1229" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007329">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="38.4" Y="18191" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="252" Y="4823" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="38.4" Y="1373" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.26" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_007330">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007331">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007337">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3883" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="3912" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="853" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1211" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007724">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007725">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007726">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007727">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007741">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007742">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007743">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_007745">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008577">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008578">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008579">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008580">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008581">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008582">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008583">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008584">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008585">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008586">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008587">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008588">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008590">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008591">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008592">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008593">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008595">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008596">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008597">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008598">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008599">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008625">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008626">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="232" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
      </VC>
      <VC ID="INI400_008627">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008628">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008629">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008630">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008631">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008632">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008633">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008634">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008635">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1601" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="2188" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="768" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="7" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="4" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="4" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
      <VC ID="INI400_008636">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="7" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="887" Dock="5" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TGroupBox Name="" ID="45" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="54" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000045">
            <ENU>Load</ENU>
          </Texts>
          <TDoubleInput Name="" ID="76" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="T↓Ed←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TConcreteSectionLibrary Name="" ID="74" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="57" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="" SelectedCS="3" Units="0" ReinfTabsVis="True" TabBG="-2894893" SelTab="-1">
            <CS SelReinf="0" H="500e-3" B="1" Hf="150e-3" Bw="150e-3" />
            <Reinf Ver="1" Stirrup="0" Stirrup_D="8e-3" Stirrup_ss="150e-3" Stirrup_α="90" c_upper="30e-3" D_upper="20e-3" N_upper="2" c_lower="30e-3" D_lower="20e-3" N_lower="2" Dc_upper="30e-3" DD_upper="20e-3" DN_upper="2" Dc_lower="30e-3" DD_lower="20e-3" DN_lower="2" />
          </TConcreteSectionLibrary>
        </TGroupBox>
        <TGroupBox Name="" ID="51" Translate="1" Left="62" Top="-2350" Width="475" AutoWidth="False" AutoHeight="True" TabIndex="55" Dock="0" Anchor="5" Padding="5|13|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000051">
            <ENU>General setting</ENU>
          </Texts>
        </TGroupBox>
        <TCustomLibrary Name="" ID="44" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="53" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="REINF.EC" DataFile="EC_Reinf.xml" Collapsed="True" UseCombo="False" Category="Inclined top branch" Item="B 400 B">
          <Data>
            <Header>
              <PropertySet Symbol="f↓yk←" ESA_ID="fyk" Unit="MPa" Type="Numeric" />
              <PropertySet Symbol="k" ESA_ID="k" Unit="" Type="Numeric" />
              <PropertySet Symbol="f↓tk←" ESA_ID="ftk" Unit="MPa" Type="Numeric" />
              <PropertySet Symbol="f↓yd←" ESA_ID="fyd" Unit="MPa" Type="Numeric" />
              <PropertySet Symbol="ε↓υκ←" ESA_ID="eps_uk" Unit="" Type="Numeric" />
              <PropertySet Symbol="ε↓ud←" ESA_ID="eps_ud" Unit="" Type="Numeric" />
              <PropertySet Symbol="ε↓s1←" ESA_ID="eps_s1" Unit="" Type="Numeric" />
              <PropertySet Symbol="E↓s←" ESA_ID="Es" Unit="MPa" Type="Numeric" />
              <PropertySet Symbol="Class" ESA_ID="Class" Unit="" Type="String" />
              <PropertySet Symbol="Inclined" ESA_ID="Inclined" Unit="" Type="Bool" />
              <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                <StructMembers>
                  <StructMember Symbol="eps" Type="Numeric" Unit="" />
                  <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                </StructMembers>
              </PropertySet>
              <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                <StructMembers>
                  <StructMember Symbol="eps" Type="Numeric" Unit="" />
                  <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                </StructMembers>
              </PropertySet>
              <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                <StructMembers>
                  <StructMember Symbol="eps" Type="Numeric" Unit="" />
                  <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                </StructMembers>
              </PropertySet>
              <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                <StructMembers>
                  <StructMember Symbol="eps" Type="Numeric" Unit="" />
                  <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                </StructMembers>
              </PropertySet>
              <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                <StructMembers>
                  <StructMember Symbol="eps" Type="Numeric" Unit="" />
                  <StructMember Symbol="sig" Type="Numeric" Unit="MPa" />
                </StructMembers>
              </PropertySet>
            </Header>
            <Items>
              <Item>
                <P>Inclined top branch</P>
                <P>B 400 B</P>
                <P>400</P>
                <P>1.08</P>
                <P>432</P>
                <P>347.83</P>
                <P>0.05</P>
                <P>0.045</P>
                <P>0.00173913</P>
                <P>200000</P>
                <P>B</P>
                <P>true</P>
                <P>-0.05;-376.51;</P>
                <P>-0.0017;-347.83;</P>
                <P>0;0;</P>
                <P>0.0017;347.83;</P>
                <P>0.05;376.51;</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TCustomLibrary Name="Concrete.EC" ID="75" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="888" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="CONCRETE.EC" DataFile="EC_Concrete.xml" Collapsed="True" UseCombo="False" Category="Bilinear" Item="C 20/25">
          <Data>
            <Header>
              <PropertySet Symbol="f↓ck←" ESA_ID="fck" Unit="MPa" Type="Numeric" />
              <PropertySet Symbol="f↓ck,cube←" ESA_ID="fckcube" Unit="MPa" Type="Numeric" />
              <PropertySet Symbol="f↓cm←" ESA_ID="fcm" Unit="MPa" Type="Numeric" />
              <PropertySet Symbol="f↓ctm←" ESA_ID="fctm" Unit="MPa" Type="Numeric" />
              <PropertySet Symbol="f↓ctk, 0.05←" ESA_ID="fctk_05" Unit="MPa" Type="Numeric" />
              <PropertySet Symbol="f↓ctk, 0.95←" ESA_ID="fctk_95" Unit="MPa" Type="Numeric" />
              <PropertySet Symbol="E↓cm←" ESA_ID="Ecm" Unit="GPa" Type="Numeric" />
              <PropertySet Symbol="ε↓c1←" ESA_ID="eps_c1" Unit="‰" Type="Numeric" />
              <PropertySet Symbol="ε↓cu1←" ESA_ID="eps_cu1" Unit="‰" Type="Numeric" />
              <PropertySet Symbol="ε↓c2←" ESA_ID="eps_c2" Unit="‰" Type="Numeric" />
              <PropertySet Symbol="ε↓cu2←" ESA_ID="eps_cu2" Unit="‰" Type="Numeric" />
              <PropertySet Symbol="ε↓c3←" ESA_ID="eps_c3" Unit="‰" Type="Numeric" />
              <PropertySet Symbol="ε↓cu3←" ESA_ID="eps_cu3" Unit="‰" Type="Numeric" />
              <PropertySet Symbol="n" ESA_ID="n" Unit="" Type="Numeric" />
              <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                <StructMembers>
                  <StructMember Symbol="eps" Type="Numeric" Unit="" />
                  <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
                </StructMembers>
              </PropertySet>
              <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                <StructMembers>
                  <StructMember Symbol="eps" Type="Numeric" Unit="" />
                  <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
                </StructMembers>
              </PropertySet>
              <PropertySet Symbol="Point" ESA_ID="Diagram.Point" Unit="" Type="Struct">
                <StructMembers>
                  <StructMember Symbol="eps" Type="Numeric" Unit="" />
                  <StructMember Symbol="sig" Type="Numeric" Unit="Pa" />
                </StructMembers>
              </PropertySet>
              <PropertySet Symbol="Bilinear" ESA_ID="Bilinear" Unit="" Type="Bool" />
              <PropertySet Symbol="d↓g←" ESA_ID="dg" Unit="mm" Type="Numeric" />
              <PropertySet Symbol="μ" ESA_ID="μ" Unit="" Type="Numeric" />
              <PropertySet Symbol="ρ" ESA_ID="ρ" Unit="kg/m↑3←" Type="Numeric" />
              <PropertySet Symbol="G" ESA_ID="G" Unit="GPa" Type="Numeric" />
              <PropertySet Symbol="υ" ESA_ID="υ" Unit="" Type="Numeric" />
              <PropertySet Symbol="λ" ESA_ID="λ" Unit="W/m*K" Type="Numeric" />
              <PropertySet Symbol="c" ESA_ID="c" Unit="J/kg*K" Type="Numeric" />
              <PropertySet Symbol="α" ESA_ID="α" Unit="" Type="Numeric" />
            </Header>
            <Items>
              <Item>
                <P>Bilinear</P>
                <P>C 20/25</P>
                <P>20</P>
                <P>25</P>
                <P>28</P>
                <P>2.2</P>
                <P>1.5</P>
                <P>2.9</P>
                <P>30</P>
                <P>2</P>
                <P>3.5</P>
                <P>2</P>
                <P>3.5</P>
                <P>1.75</P>
                <P>3.5</P>
                <P>2</P>
                <P>0;0;</P>
                <P>-0.00175;-13333330;</P>
                <P>-0.0035;-13333330;</P>
                <P>true</P>
                <P>32</P>
                <P>0.2</P>
                <P>2500</P>
                <P>12.5</P>
                <P>0.2</P>
                <P>4500</P>
                <P>0.0006</P>
                <P>1.00E-05</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TGroupBox Name="" ID="77" Translate="1" Height="380" AutoWidth="False" AutoHeight="False" TabIndex="889" Dock="2" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000077">
            <ENU>Parameters for torsion</ENU>
          </Texts>
          <TDoubleInput Name="" ID="95" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="17" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="α↓cc←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="94" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="α↓ct←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="93" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="γ↓c←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="92" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="γ↓s←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="91" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="θ↓max←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="90" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="θ↓min←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="89" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="θ↓inp←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="88" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="t↓ef.inp←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="84" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="u↓k.inp←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TDoubleInput Name="" ID="82" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="A↓k.inp←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
          <TCheckBox Name="" ID="87" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="Auto↓θ←" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000087">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="" ID="85" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="AutoType" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000085">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TCheckBox Name="" ID="80" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="bMaxSpacing" BookMarkID="" ForeColor="-16711423" ChbRight="False">
            <Texts TranslateID="DIALOG_000080">
              <ENU>
              </ENU>
            </Texts>
          </TCheckBox>
          <TComboBox Name="DTypeTorCss" ID="81" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="TypeTorCssInput" VarNameVisible="True" InputColor="-1" DescPos="1" InputWidth="150" Values="1|2|3|4" Index="1">
            <Texts TranslateID="DIALOG_000081">
              <ENU>From torsional stirrup|Inputted cross-section|Effective rectangular|User input</ENU>
            </Texts>
          </TComboBox>
        </TGroupBox>
        <TGroupBox Name="" ID="96" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
          <Texts TranslateID="DIALOG_000096">
            <ENU>National Annex</ENU>
          </Texts>
          <TCustomLibrary Name="" ID="97" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="SetupNA" DataFile="EC_NA.xml" Collapsed="True" UseCombo="True" Category="Eurocode NA" Item="Czech CSN-EN">
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
                  <P>Czech CSN-EN</P>
                  <P>CSN</P>
                  <P>4</P>
                  <P>ČSN EN 1990</P>
                  <P>ČSN EN 1991-1-1</P>
                  <P>ČSN EN 1991-1-2</P>
                  <P>ČSN EN 1991-1-3</P>
                  <P>0</P>
                  <P>NaN</P>
                  <P>False;1;</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>False</P>
                  <P>1.6</P>
                  <P>2.0</P>
                  <P>NaN</P>
                  <P>0.8;NaN;5;15;</P>
                  <P>False</P>
                  <P>False</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>ČSN EN 1991-1-4</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1</P>
                  <P>1</P>
                  <P>0.2;0.5;</P>
                  <P>False</P>
                  <P>NaN</P>
                  <P>False;1;</P>
                  <P>True</P>
                  <P>True</P>
                  <P>1</P>
                  <P>NaN</P>
                  <P>1.25</P>
                  <P>False</P>
                  <P>True</P>
                  <P>NaN</P>
                  <P>ČSN EN 1991-1-5</P>
                  <P>ČSN EN 1991-1-6</P>
                  <P>ČSN EN 1991-1-7</P>
                  <P>ČSN EN 1991-2</P>
                  <P>ČSN EN 1991-3</P>
                  <P>ČSN EN 1991-4</P>
                  <P>ČSN EN 1992-1-1</P>
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
                  <P>0;5;10;</P>
                  <P>40;75;5;</P>
                  <P>0.005</P>
                  <P>0.44;NaN;0.54;NaN;0.7;0.8;</P>
                  <P>NaN</P>
                  <P>1.2</P>
                  <P>0.8;0.9;</P>
                  <P>0.95</P>
                  <P>50;30;</P>
                  <P>0.7</P>
                  <P>0.75;0.85;</P>
                  <P>1.05;0.95;1.1;0.9;1;1;</P>
                  <P>NaN;NaN;0.15;</P>
                  <P>NaN</P>
                  <P>0.380482;0.785398;</P>
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
                  <P>3.4;0.425;</P>
                  <P>1.5;5;</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>32</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>0.25</P>
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
                  <P>NaN</P>
                  <P>10</P>
                  <P>5;8;</P>
                  <P>10000;NaN;</P>
                  <P>0.8;0.8;</P>
                  <P>1.5</P>
                  <P>0.25</P>
                  <P>0.5</P>
                  <P>ČSN EN 1992-1-2</P>
                  <P>ČSN EN 1992-2</P>
                  <P>ČSN EN 1992-3</P>
                  <P>ČSN EN 1993-1-1</P>
                  <P>NaN;NaN;</P>
                  <P>1;1;1.25;</P>
                  <P>ČSN EN 1993-1-2</P>
                  <P>ČSN EN 1993-1-3</P>
                  <P>ČSN EN 1993-1-4</P>
                  <P>ČSN EN 1993-1-5</P>
                  <P>1.20;1.00;</P>
                  <P>ČSN EN 1993-1-6</P>
                  <P>ČSN EN 1993-1-7</P>
                  <P>ČSN EN 1993-1-8</P>
                  <P>1.25;1.25;1.1;1.0;1.0;1.0;1.1;</P>
                  <P>ČSN EN 1993-1-9</P>
                  <P>ČSN EN 1993-1-10</P>
                  <P>ČSN EN 1993-1-11</P>
                  <P>ČSN EN 1993-1-12</P>
                  <P>ČSN EN 1993-2</P>
                  <P>1.0;1.1;1.25;1.25;1.1;1.1;1.1;1.0;1.1;</P>
                  <P>ČSN EN 1993-3-1</P>
                  <P>ČSN EN 1993-3-2</P>
                  <P>ČSN EN 1993-4-1</P>
                  <P>ČSN EN 1993-4-2</P>
                  <P>ČSN EN 1993-4-3</P>
                  <P>ČSN EN 1993-5</P>
                  <P>ČSN EN 1993-6</P>
                  <P>ČSN EN 1994-1-1</P>
                  <P>1;1;</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>1</P>
                  <P>0.000325;0.000500;0.000200;0.000300;</P>
                  <P>0.70</P>
                  <P>NaN</P>
                  <P>1.25;1.25;</P>
                  <P>NaN</P>
                  <P>NaN</P>
                  <P>1.0</P>
                  <P>1.0</P>
                  <P>0.6</P>
                  <P>180</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>0.5</P>
                  <P>1.25</P>
                  <P>1.25</P>
                  <P>ČSN EN 1994-1-2</P>
                  <P>ČSN EN 1994-2</P>
                  <P>ČSN EN 1995-1-1</P>
                  <P>NaN</P>
                  <P>0.67;0.67;1.0;</P>
                  <P>ČSN EN 1995-1-2</P>
                  <P>ČSN EN 1995-2</P>
                  <P>ČSN EN 1996-1-1</P>
                  <P>NaN</P>
                  <P>1</P>
                  <P>NaN</P>
                  <P>True</P>
                  <P>1000</P>
                  <P>NaN;NaN;NaN;</P>
                  <P>NaN</P>
                  <P>ČSN EN 1996-1-2</P>
                  <P>ČSN EN 1996-2</P>
                  <P>ČSN EN 1996-3</P>
                  <P>ČSN EN 1997-1</P>
                  <P>1.1;0.9;1.5;0;</P>
                  <P>1.25;1.25;1.4;1.4;1.0;</P>
                  <P>1.35;1;1.5;0;1;1;1.3;0;</P>
                  <P>1;1;1;1;1;1.25;1.25;1.4;1.4;1;</P>
                  <P>1;1;1.4;1.1;1;1;</P>
                  <P>ČSN EN 1997-2</P>
                  <P>ČSN EN 1998-1</P>
                  <P>ČSN EN 1998-2</P>
                  <P>ČSN EN 1998-3</P>
                  <P>ČSN EN 1998-4</P>
                  <P>ČSN EN 1998-5</P>
                  <P>ČSN EN 1998-6</P>
                  <P>ČSN EN 1999-1-1</P>
                  <P>ČSN EN 1999-1-2</P>
                  <P>ČSN EN 1999-1-3</P>
                  <P>ČSN EN 1999-1-4</P>
                  <P>ČSN EN 1999-1-5</P>
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
    <Item TranslateID="BLOCK_INI400_002915">
      <ENU>"Input data"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_002916">
      <ENU>"Loading"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_002917">
      <ENU>"Materials"</ENU>
    </Item>
    <Item TranslateID="BLOCK_INI400_007330">
      <ENU>"Material characteristics"</ENU>
    </Item>
    <Item TranslateID="STRING_07CE3277">
      <ENU>"Parameters for torsion (value A↓k← and u↓k←) are calculated for effective rectangular Css, which is created from input Css to area and perimeter of effective cross-section were same as area and perimeter of input Css"</ENU>
    </Item>
    <Item TranslateID="STRING_0C210A32">
      <ENU>"Type"</ENU>
    </Item>
    <Item TranslateID="STRING_0D2C4441">
      <ENU>"Solution"</ENU>
    </Item>
    <Item TranslateID="STRING_121BBE10">
      <ENU>"The inputted angle between concrete compression strut and longitudinal member axis is lesser than recommended minimal value. The recommended minimal value will be taken into account."</ENU>
    </Item>
    <Item TranslateID="STRING_14149C28">
      <ENU>"OK*"</ENU>
    </Item>
    <Item TranslateID="STRING_18066461">
      <ENU>"Automatic calculation of angle is switched off, user value is taken into account"</ENU>
    </Item>
    <Item TranslateID="STRING_21CAF8B6">
      <ENU>"List of errors/warnings/notes: "</ENU>
    </Item>
    <Item TranslateID="STRING_24FC525F">
      <ENU>"There are no errors, warnings or notes"</ENU>
    </Item>
    <Item TranslateID="STRING_33D605CD">
      <ENU>"Parameters for torsion (value A↓k← and u↓k←) is not possible to calculate for effective rectangular cross-section"</ENU>
    </Item>
    <Item TranslateID="STRING_48A8D0F5">
      <ENU>"To change angle of compression strut or to increase quality of concrete or  to increase dimensions of the cross-section"</ENU>
    </Item>
    <Item TranslateID="STRING_4C52F360">
      <ENU>"Only minimum shear reinforcement according to detailing provisions has to be inputted"</ENU>
    </Item>
    <Item TranslateID="STRING_4E1DEF1D">
      <ENU>"Automatic calculation of angle is switched on, the calculated value from interaction V+T is taken into account."</ENU>
    </Item>
    <Item TranslateID="STRING_567289C8">
      <ENU>"To set angle of stirrup for torsion to 90 degree"</ENU>
    </Item>
    <Item TranslateID="STRING_5D1C250A">
      <ENU>"Index"</ENU>
    </Item>
    <Item TranslateID="STRING_6F5B6F78">
      <ENU>"The check satisfies, torsional moment carried by concrete, no shear reinforcement is required"</ENU>
    </Item>
    <Item TranslateID="STRING_70641FC0">
      <ENU>"Description"</ENU>
    </Item>
    <Item TranslateID="STRING_71B36BC7">
      <ENU>"The check satisfies, torsional moment can be carried by concrete, no shear reinforcement is required"</ENU>
    </Item>
    <Item TranslateID="STRING_738B6946">
      <ENU>"Parameters for torsion (value A↓k← and u↓k←) are calculated for equivalent thin walled section which is created from input cross-section"</ENU>
    </Item>
    <Item TranslateID="STRING_7521067A">
      <ENU>"Error"</ENU>
    </Item>
    <Item TranslateID="STRING_7A73A2F5">
      <ENU>"Not OK"</ENU>
    </Item>
    <Item TranslateID="STRING_7F7492E5">
      <ENU>"To increase area of shear reinforcement  or  to increase dimensions of the cross-section or quality of shear reinforcement"</ENU>
    </Item>
    <Item TranslateID="STRING_80300792">
      <ENU>"Parameters for torsion (value A↓k← and u↓k←) is not possible to calculate around selected stirrup for torsion"</ENU>
    </Item>
    <Item TranslateID="STRING_84902F5E">
      <ENU>"Parameters for torsion (value A↓k← and u↓k←) are calculated for equivalent thin walled section which is created around selected stirrup for torsion"</ENU>
    </Item>
    <Item TranslateID="STRING_86619943">
      <ENU>"The check does not satisfy, because shear reinforcement (V↓Ed← &gt; V↓Rd,s← + V↓td← + V↓ccd←)."</ENU>
    </Item>
    <Item TranslateID="STRING_8C558D2E">
      <ENU>"The check does not satisfies, because of shear reinforcement but torsional moment can be carried by concrete."</ENU>
    </Item>
    <Item TranslateID="STRING_90E3CC63">
      <ENU>"Only minimum shear reinforcement according to detailing provision has to be inputted"</ENU>
    </Item>
    <Item TranslateID="STRING_942CD98C">
      <ENU>"Note"</ENU>
    </Item>
    <Item TranslateID="STRING_95BBE657">
      <ENU>"Status"</ENU>
    </Item>
    <Item TranslateID="STRING_9C7A2886">
      <ENU>"The inputted angle between concrete compression strut and longitudinal member axis is bigger than recommended minimal value. The recommended minimal value will be taken into account."</ENU>
    </Item>
    <Item TranslateID="STRING_9E6993D8">
      <ENU>"Limit"</ENU>
    </Item>
    <Item TranslateID="STRING_A5D4C009">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="STRING_B40C6B45">
      <ENU>"Parameters for torsion (value A↓k← and u↓k←) is not possible to calculate from input cross-section"</ENU>
    </Item>
    <Item TranslateID="STRING_B9478D83">
      <ENU>"Warning"</ENU>
    </Item>
    <Item TranslateID="STRING_BB08C4BA">
      <ENU>"To select different method for calculation parameters for torsion"</ENU>
    </Item>
    <Item TranslateID="STRING_C5840AC4">
      <ENU>"Parameters for torsion (value t↓ef←, A↓k← and u↓k←) are taken into account from input parameters"</ENU>
    </Item>
    <Item TranslateID="STRING_C7F89319">
      <ENU>"Check of torsion will not be done, because angle of stirrup for torsion is different than 90 degree"</ENU>
    </Item>
    <Item TranslateID="STRING_DA7AAC27">
      <ENU>"The cross-sectional area of shear reinforcement is zero, stirrups will not be taken into account "</ENU>
    </Item>
    <Item TranslateID="STRING_DCA4D374">
      <ENU>"The calculation does not satisfy, because crushing of the compression strut (V↓Ed← &gt; V↓Rd,max← + V↓td← + V↓ccd←)."</ENU>
    </Item>
    <Item TranslateID="STRING_E1757CD5">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="STRING_E28BAB70">
      <ENU>"To remove shear reinforcement (design only minimum shear reinforcement according to detailing provisions) or increase amount of shear reinforcement"</ENU>
    </Item>
    <Item TranslateID="STRING_FA3BABE3">
      <ENU>"To decrease angle between concrete compression strut and longitudinal member axis or to change recommended maximal angle in setting of national annexes"</ENU>
    </Item>
    <Item TranslateID="STRING_FA567154">
      <ENU>"To increase angle between concrete compression strut and longitudinal member axis or to change recommended minimal angle in setting of national annexes"</ENU>
    </Item>
    <Item TranslateID="STRING_FFA86123">
      <ENU>"Check of torsion will not be done , because parameters for torsion ( A↓k← and u↓k←) are zero or thin walled section was not created"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001093">
      <ENU>"Check of torsion according to EN 1992-1-1"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001096">
      <ENU>"Concrete parameters:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_001097">
      <ENU>"γ↓c←= " &amp; γ↓c← &amp; ", "</ENU>
    </Item>
    <Item ID="TEXT_INI400_001098">
      <ENU>"α↓cc←= " &amp; α↓cc← &amp; ", "</ENU>
    </Item>
    <Item ID="TEXT_INI400_001099">
      <ENU>"α↓ct←= " &amp; α↓ct←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001100">
      <ENU>"Reinforcement parameters:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_001101">
      <ENU>"γ↓s←= " &amp; γ↓s←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001102">
      <ENU>"Automatic calculation angle between the concrete compression strut and axis member:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001106">
      <ENU>"- user input value:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_001107">
      <ENU>"θ↓inp← = " &amp; θ↓inp← &amp; "° =&gt; cot(θ↓inp←) = " &amp; cotθ↓inp←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001108">
      <ENU>"- minimum value:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_001109">
      <ENU>"θ↓min← = " &amp; θ↓min← &amp; "° =&gt; cot(θ↓min←) = " &amp; cotθ↓min←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001110">
      <ENU>"- maximum value:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_001111">
      <ENU>"θ↓max← = " &amp; θ↓max← &amp; "° =&gt; cot(θ↓max←) = " &amp; cotθ↓max←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001114">
      <ENU>"Torsional moment:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001140">
      <ENU>"Design con. compressive strength"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001142">
      <ENU>"Design tensile strength of concrete"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001148">
      <ENU>"Diameter of shear reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_INI400_001149">
      <ENU>"ϕ↓s← = " &amp; VAL(1000*ϕ↓s←, 0) &amp; " mm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001150">
      <ENU>"Angle of stirrups from axis of member"</ENU>
    </Item>
    <Item ID="TEXT_INI400_001151">
      <ENU>"α↓s← = " &amp; α↓s← &amp; " °"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001152">
      <ENU>"Characteristic yield strength of shear reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_INI400_001153">
      <ENU>"f↓ywk← = " &amp; VAL(0.000001*f↓ywk←, 0) &amp; " MPa"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001154">
      <ENU>"Cross - sectional area of shear  reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001172">
      <ENU>"Longitudinal reinforcement and stirrup"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001173">
      <ENU>"Concrete"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001194">
      <ENU>"Note: Automatic calculation of angle is switched off, user value is taken into account."</ENU>
    </Item>
    <Item ID="TEXT_INI400_001197">
      <ENU>"θ = θ↓inp← = " &amp; θ↓inp← &amp; " °, cot(θ)= " &amp; cotθ</ENU>
    </Item>
    <Item ID="TEXT_INI400_001200">
      <ENU>"θ &lt; θ↓min← =&gt; θ = θ↓min← = " &amp; θ↓min← &amp; " ° ,cot(θ) = " &amp; cotθ</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001201">
      <ENU>"Note: The angle between the concrete compression strut and axis member &lt;BR&gt;is lesser than minimal value"</ENU>
    </Item>
    <Item ID="TEXT_INI400_001205">
      <ENU>"θ &gt; θ↓max← =&gt; θ = θ↓max← = " &amp; θ↓max← &amp; " ° ,cot(θ) = " &amp; cotθ</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001206">
      <ENU>"Note: The angle between the concrete compression strut and axis member is lesser than minimal value"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001277">
      <ENU>"Centre - to - centre distance of stirrup in longitudinal direction"</ENU>
    </Item>
    <Item ID="TEXT_INI400_001278">
      <ENU>"s↓inp← = " &amp; s↓inp← &amp; " m"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001279">
      <ENU>"Cross - sectional area of shear reinforcement per meter"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001300">
      <ENU>"Minimum shear reinforcement ratio"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001302">
      <ENU>"Maximum longitudinal spacing of shear links"</ENU>
    </Item>
    <Item ID="TEXT_INI400_001693">
      <ENU>"C" &amp; VAL(f↓ck←/1000000, 0) &amp; "/" &amp; VAL(f↓ck,cube←/1000000, 0)</ENU>
    </Item>
    <Item ID="TEXT_INI400_001694">
      <ENU>"B" &amp; VAL(f↓yk←/1000000, 0) &amp; ReinfClass</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_001828">
      <ENU>"Effective wall thickness"</ENU>
    </Item>
    <Item ID="TEXT_INI400_003871">
      <ENU>FListEWN(EWN)</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003911">
      <ENU>"Note: The cross-sectional area of shear reinforcement is zero, stirrups will not be taken into account "</ENU>
    </Item>
    <Item ID="TEXT_INI400_003918">
      <ENU>"T↓Ed← = " &amp; VAL(ABS(T↓Ed←)/1000, 2) &amp; " kNm &gt; T↓Rdmax←  = " &amp; VAL(T↓Rdmax_sum←/1000, 2) &amp; " kNm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003919">
      <ENU>"The check does not satisfy, because crushing of the compression strut"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003920">
      <ENU>"Note: It is necessary to change angle of compression strut or to increase quality of concrete &lt;BR&gt;or  to increase dimensions of the cross-section"</ENU>
    </Item>
    <Item ID="TEXT_INI400_003975">
      <ENU>"T↓Ed← = " &amp; VAL(ABS(T↓Ed←)/1000, 2) &amp; " kNm &lt; T↓Rdc←  = " &amp; VAL(T↓Rdc←/1000, 2) &amp; " kNm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003976">
      <ENU>"The check satisfies, torsional moment carried by concrete (T↓Ed← ≤ T↓Rdc←), no shear reinforcement is required"</ENU>
    </Item>
    <Item ID="TEXT_INI400_003980">
      <ENU>"T↓Ed← = " &amp; VAL(T↓Ed←/1000, 2) &amp; " kNm &lt; T↓Rdc←  = " &amp; VAL(T↓Rdc←/1000, 2) &amp; " kNm and  T↓Ed← = " &amp; VAL(ABS(T↓Ed←)/1000, 2) &amp; " kNm &lt; T↓Rdst← = " &amp; VAL(T↓Rds_sum←/1000, 2) &amp; " kNm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003981">
      <ENU>"The check satisfies, torsional moment can be carried by concrete"</ENU>
    </Item>
    <Item ID="TEXT_INI400_003984">
      <ENU>"T↓Ed← = " &amp; VAL(ABS(T↓Ed←)/1000, 2) &amp; " kNm &lt; T↓Rdc←  = " &amp; VAL(T↓Rdc←/1000, 2) &amp; "kNm and  T↓Ed← = " &amp; VAL(ABS(T↓Ed←)/1000, 2) &amp; " kNm &gt; T↓Rdst← = " &amp; VAL(T↓Rds_sum←/1000, 2) &amp; " kNm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003985">
      <ENU>"The check does not satisfies, because of shear reinforcement, but torsional moment &lt;BR&gt;can be carried by concrete."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003986">
      <ENU>"Note: It is necessary to remove shear reinforcement (design only minimum shear  &lt;BR&gt;reinforcement according to detailing provisions) or increase amount of shear reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_INI400_003990">
      <ENU>"T↓Ed← = " &amp; VAL(ABS(T↓Ed←)/1000, 2) &amp; " kNm &lt; T↓Rdst← = " &amp; VAL(T↓Rds_sum←/1000, 2) &amp; " kNm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003991">
      <ENU>"The check satisfies"</ENU>
    </Item>
    <Item ID="TEXT_INI400_003992">
      <ENU>"T↓Ed← = " &amp; VAL(ABS(T↓Ed←)/1000, 2) &amp; " kNm &gt; T↓Rdst← = " &amp; VAL(T↓Rds_sum←/1000, 2) &amp; " kNm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003993">
      <ENU>"The check does not satisfy, because of shear reinforcement."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003994">
      <ENU>"Note: It is necessary to increase area of shear reinforcement or to increase dimensions of the &lt;BR&gt;cross-section or quality of shear reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_INI400_003997">
      <ENU>"T↓Ed← = " &amp; VAL(ABS(T↓Ed←)/1000, 2) &amp; " kNm ≤ T↓Rdmax←  = " &amp; VAL(T↓Rdmax_sum←/1000, 2) &amp; " kNm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_003998">
      <ENU>"The check satisfies."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_004004">
      <ENU>"The angle between the concrete compression strut and axis member:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_004005">
      <ENU>"Yes"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_004006">
      <ENU>"No"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_004007">
      <ENU>"Check maximum longitudinal spacing of shear links:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_004008">
      <ENU>"Yes"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_004009">
      <ENU>"No"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_004010">
      <ENU>"Note: Only minimum shear reinforcement according to detailing provisions has to be inputted"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_004011">
      <ENU>"Note: Only minimum shear reinforcement according to detailing provisions has to be inputted"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_004157">
      <ENU>"Minimum area of shear reinforcement per meter"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005177">
      <ENU>"Total area of cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005180">
      <ENU>"Total circumference of cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005184">
      <ENU>"The area of longitudinal reinforcement for torsion"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005195">
      <ENU>"The minimum distance between reinf. bars inside stirrup for torsion and edge of Css"</ENU>
    </Item>
    <Item ID="TEXT_INI400_005199">
      <ENU>"T↓Ed← = " &amp; VAL(forces.Mx/1000, 2) &amp; " kNm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005204">
      <ENU>"Design yield strength of shear reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005209">
      <ENU>"Strength reduction factor for concrete cracked in shear - value ν"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005215">
      <ENU>"Coefficient taking into account state of the stress in the compression chord"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005217">
      <ENU>"Maximal design torsional resistance moment"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005221">
      <ENU>"Calculation dimensions of effective rectangular cross-section"</ENU>
    </Item>
    <Item ID="TEXT_INI400_005232">
      <ENU>"y=" &amp; OuterPol[i].X &amp; ", z=" &amp; OuterPol[i].Y</ENU>
    </Item>
    <Item ID="TEXT_INI400_005233">
      <ENU>"y=" &amp; CentreLinePol[i].X &amp; ", z=" &amp; CentreLinePol[i].Y</ENU>
    </Item>
    <Item ID="TEXT_INI400_005234">
      <ENU>"y=" &amp; InnerPol[i].X &amp; ", z=" &amp; InnerPol[i].Y</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005238">
      <ENU>"Perimeter of area and area enclosed by the centre line of effective cross-section "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005279">
      <ENU>"Note: Check of torsion will not be done, because angle of stirrup for torsion is different than 90 degree"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005293">
      <ENU>"Effective wall thickness"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005295">
      <ENU>"Note: Parameters for torsion (value A↓k← and u↓k←) are calculated for effective rectangular Css,&lt;BR&gt;which is created from input Css to area and perimeter of effective cross-section were same &lt;BR&gt;as area and perimeter of input Css"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005296">
      <ENU>"Perimeter of area and area enclosed by the centre line of effective cross-section "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005299">
      <ENU>"Note: Parameters for torsion (value A↓k← and u↓k←) are calculated for equivalent thin walled section&lt;BR&gt;which is created around selected stirrup for torsion"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005302">
      <ENU>"Note: Parameters for torsion (value A↓k← and u↓k←) are calculated for equivalent thin walled section&lt;BR&gt;which is created from input cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005305">
      <ENU>"Perimeter of area and area enclosed by the centre line of effective cross-section "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005306">
      <ENU>"Note: Parameters for torsion (value t↓ef←, A↓k← and u↓k←) are taken into account from input parameters"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005309">
      <ENU>"Perimeter of area and area enclosed by the centre line of effective cross-section "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005324">
      <ENU>"Automatically created equivalent thin walled cross-section for torsion:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005325">
      <ENU>"Yes"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005326">
      <ENU>"No"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005327">
      <ENU>"Type of method for creation equivalent thin walled cross-section:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_005331">
      <ENU>TypeTorCss</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005776">
      <ENU>"Note: Parameters for torsion (value A↓k← and u↓k←) is not possible&lt;BR&gt;to calculate around selected stirrup for torsion"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005779">
      <ENU>"Note: Parameters for torsion (value A↓k← and u↓k←) is not possible&lt;BR&gt;to calculate from input cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005792">
      <ENU>"Note: Parameters for torsion (value A↓k← and u↓k←) is not possible&lt;BR&gt;to calculate for effective rectangular cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005804">
      <ENU>"Note: Check of torsion will not be done , because parameters for torsion ( A↓k← and u↓k←) are zero &lt;BR&gt;or thin walled section was not created"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_005809">
      <ENU>"Note: Automatic calculation of angle is switched on, the calculated value from interaction V+T is taken into account."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006432">
      <ENU>"From torsional stirrup"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006433">
      <ENU>"Inputted cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006434">
      <ENU>"Effective rectangular"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006435">
      <ENU>"User input"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006437">
      <ENU>"- A↓k.inp← = " &amp; VAL(A↓k.inp←*1000000, 2) &amp; " mm↑2←"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006438">
      <ENU>"- u↓k.inp← = " &amp; VAL(u↓k.inp←*1000, 2) &amp; " mm"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006439">
      <ENU>"- t↓ef.inp← = " &amp; VAL(t↓ef.inp←*1000, 2) &amp; " mm"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008582">
      <ENU>"Summary of check"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008584">
      <ENU>"Explanation of errors, warnings and notes"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008586">
      <ENU>"Cross section parameters"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008587">
      <ENU>"Calculation of torsional resistances"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008590">
      <ENU>"Design torsional cracking moment "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008591">
      <ENU>"Design torsional resistance moment of torsional reinforcement "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008592">
      <ENU>"Maximal design torsional resistance moment "</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008593">
      <ENU>"Torsional resistance moment of the member"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008595">
      <ENU>"Torsional check"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008596">
      <ENU>"Check T↓Rdmax←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008597">
      <ENU>"Check T↓Rdc← and T↓Rdst←"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008598">
      <ENU>"Unity check"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008599">
      <ENU>"Parameters of shear/torsion reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008630">
      <ENU>"Calculation of angle between concrete compression strut and member axis"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008632">
      <ENU>IndexEWN</ENU>
    </Item>
  </Texts>
</Root>