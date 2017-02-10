<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="8b0788b1-d2b0-432d-b0c6-d4999cfeec9f">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">void UpdateDialog() { 
    Dialog.GetComponentByName("theta").Visible →INI400_006592= designMethod == 2; 
} 

void UpdateMemberDataDialog() { 
    Dialog.GetComponentByName("AngleOfStruts").Visible →INI400_010607= designMethod == 2; 
} 


→INI400_009799BLOCK { 
    π →INI400_009481= math.PI; 
    object[] obEWN →INI400_009694= new object[]; 
    object[] NumberEWN →INI400_009695= new object[]; 
    double Number↓E← →INI400_009696= 0; 
    double Number↓W← →INI400_009697= 0; 
    double Number↓N← →INI400_009698= 0; 
    bool PrintobEWN →INI400_009700= true; 
    object Functions1D →INI400_005799= LoadExternCLC("Functions1D.clc", true); 
    object TableCellsFont →INI400_003272= new Font("Segoe UI", Convert.ToSingle(8.5), FontStyle.Regular); //Table font
    object TableHeaderFont →INI400_003273= new Font("Segoe UI", Convert.ToSingle(8.5), FontStyle.Bold); 
    object TableBorderPen →INI400_003274= new Pen(Color.DimGray, 1); //Pen for outline of the table
    object TableGridPen →INI400_003275= new Pen(Color.LightGray, 1); //Pen for grid inside of the table
    object opTableWhiteGridPen →INI400_008997= new Pen(Color.White, 0); //Pen for grid inside of the table
    double TableWidth →INI400_002849= 585; 
    object tablerowColor →INI400_007741= Color.AliceBlue; 
    object tableHeaderColor →INI400_007742= Color.LightBlue; 
    double IndexEWN →INI400_009800= 6; 
    //pens
    object obEWNBorderPen →INI400_010435= new Pen(Color.White, 0); //Pen for obEWN note
    object obEWNCellsFont →INI400_010436= new Font("Segoe UI", Convert.ToSingle(8.5), FontStyle.Italic); //obEWN note font  
} 
→INI400_000002TEXT("Design of the shear reinforcement for members with axial force, NBR 6118:2014"); 
IF(!IO.IsStandalone) { 
    →INI400_009577BLOCK { 
        double StructuralType →INI400_009778= IO.Beam.Member.StructuralType; 
        SWITCH(StructuralType) { 
            CASE 0 : //general
            { 
                TypeMember →INI400_009779= 0; 
            } 
            CASE 1 : //beam
            { 
                TypeMember →INI400_009780= 0; 
            } 
            CASE 2 : //column
            { 
                TypeMember →INI400_009781= 1; 
            } 
            CASE 13 : //beam as slab
            { 
                TypeMember →INI400_009782= 0; 
            } 
            DEFAULT : 
            { 
                TypeMember →INI400_009783= 1; 
            } 
        } 
        →INI400_009483TEXT("Section on member"); 
        →INI400_006497TEXT("Member:"); 
        →INI400_009557TEXT(IO.Beam.Member.Name &amp; "  -"); 
        IF(TypeMember == 0) { 
            →INI400_008965TEXT("Beam"); 
        } ELSE { 
            →INI400_008966TEXT("Column"); 
        } 
        →INI400_000637TEXT("Number of section on member:"); 
        →INI400_009558TEXT(Val(SecID+1, 0)); 
        →INI400_000638TEXT("Position of section on member from the begin"); 
        →INI400_009559TEXT("= " &amp; dx); 
    } 
    object Shape →INI400_009462= IO.CS.Component.Shape.Point; 
    object ConcreteDiagram →INI400_009463= IO.CONCRETE.NBR.Diagram.Point; 
    object TableNBRReinf →INI400_007161= new CustomDataTable("NBR_Reinf.xml"); 
    SWITCH(ReinfClass) { 
        CASE 25 :  { 
            string Sel →INI400_009021= "".Format("Item = '{0}'", "CA-25"); 
        } 
        CASE 50 :  { 
            string Sel →INI400_009022= "".Format("Item = '{0}'", "CA-50"); 
        } 
        CASE 60 :  { 
            string Sel →INI400_009023= "".Format("Item = '{0}'", "CA-60"); 
        } 
    } 
    object MyReinfMat →INI400_007210= TableNBRReinf.Select(Sel); 
    object ReqReinfMat →INI400_007211= TableNBRReinf.GetStructure(MyReinfMat[0]); 
    string NameReqReinf →INI400_009024= ReqReinfMat.Item; 
    string NameConcrete →INI400_008761= IO.Concrete.Name; 
    
    double f↓ywk← →INI400_009025= ReqReinfMat.fyk; 
    double θ↓min← →INI400_009548= IO.Setup.Theta_min*180.0/Math.PI; 
    double θ↓max← →INI400_009794= IO.Setup.Theta_max*180.0/Math.PI; 
    double γ↓s← →INI400_009549= IO.Setup.gamma_s; 
    double γ↓c← →INI400_009550= IO.Setup.gamma_c; 
    double SecID →INI400_009551= IO.Section.ID; 
    double dx →INI400_009552= IO.Section.Dx; 
    double Index↓load← →INI400_009553= IO.Load.Type; 
    double f↓ck← →INI400_009554= IO.CONCRETE.NBR.fck; 
    double f↓ct,m← →INI400_009555= IO.CONCRETE.NBR.fctm; 
    double f↓ctk,inf← →INI400_009556= 0.7*f↓ct,m←; 
    
    object ShearReinf →INI400_009435= new Structure(); 
    UserScale →INI400_009436= 15; 
    UserDimFont →INI400_009437= 8; 
    UCSPosition →INI400_009438= 4; 
    DrawAxis →INI400_009439= true; 
    double IdCSS →INI400_006376= 0; 
    double ForcesId →INI400_006377= 0; 
    IF(IO.Contains("REINF")) { //if there is reinforcement
        bool bReinforcedBars →INI400_008721= true; 
        IF(IO.REINF.Contains("Bar")) { //If there is longitude reinforcement
            →INI400_005489CONCRETE.CreateCS(IdCSS, IO.CS.Component.Shape.Point, IO.CONCRETE.NBR.Diagram.Point, IO.REINF.Bar, IO.REINF.NBR.Diagram.Point); 
            DrawStirrups →INI400_006015= true; 
        } ELSE { //if there is not longitude reinforcement
            →INI400_006012CONCRETE.CreateCS(IdCSS, IO.CS.Component.Shape.Point, IO.CONCRETE.NBR.Diagram.Point); 
            DrawStirrups →INI400_006014= false; 
        } 
    } ELSE { //if there is not reinforcement
        →INI400_006022CONCRETE.CreateCS(IdCSS, IO.CS.Component.Shape.Point, IO.CONCRETE.NBR.Diagram.Point); 
        DrawStirrups →INI400_006023= false; 
        bool bReinforced →INI400_009545= false; 
    } 
    //}
    
    double N →INI400_009529= IO.InternalForces.N; 
    double V↓sy← →INI400_009530= IO.InternalForces.Vy; 
    double V↓sz← →INI400_009531= IO.InternalForces.Vz; 
    double M↓y← →INI400_009532= IO.InternalForces.My; 
    double M↓z← →INI400_009533= IO.InternalForces.Mz; 
    →INI400_009528CONCRETE.SetForcesId(ForcesId, N, V↓sy←, V↓sz←, 0, M↓y←, M↓z←); 
    double typeOfLoad →INI400_010564= IO.Load.Type; //0 - LC, 1 - CO, 2 class?? 
    double loadID →INI400_010571= IO.Load.ID; 
    IF(typeOfLoad == 1) { 
        double typeOfLimitState →INI400_010565= IO.Load.LimitState; 
        string Combi↓key← →INI400_010567= IO.Load.CombiKey; 
        double typeofCombi →INI400_010569= IO.Load.CombiType; //??
    } ELSE { 
        double typeOfLimitState →INI400_010566= -1; 
        string Combi↓key← →INI400_010568= ""; 
        double typeofCombi →INI400_010570= -1; 
    } 
    
    IF(COMPARE(M↓y←, 0, 15) != -1) { 
        double Wy →INI400_006389= IO.CS.Chars.Wely; 
    } ELSE { 
        double Wy →INI400_006390= IO.CS.Chars.Iy/(CONCRETE.General.GetCssHeight(IdCSS, 90)-IO.CS.Chars.cZUCS); 
    } 
    IF(COMPARE(M↓z←, 0, 15) != -1) { 
        double Wz →INI400_006391= IO.CS.Chars.Welz; 
    } ELSE { 
        double Wz →INI400_006392= IO.CS.Chars.Iz/(CONCRETE.General.GetCssHeight(IdCSS, 0)-IO.CS.Chars.cYUCS); 
    } 
    A↓c← →INI400_006397= IO.CS.Chars.A; 
    
    // if there is just one stirrup zone along a member
    IF(bReinforced) { 
        IF(IO.Beam.Reinforcement.StirrupZone.Contains("ID")) { 
            →INI400_009440ShearReinf.Add("D", IO.Beam.Reinforcement.StirrupZone.Stirrup[0].D); 
            →INI400_009441ShearReinf.Add("Ns", IO.Beam.Reinforcement.StirrupZone.NumCutUser); 
            double ss →INI400_009442= IO.Beam.Reinforcement.StirrupZone.Stirrup[1].DX-IO.Beam.Reinforcement.StirrupZone.Stirrup[0].DX; 
            →INI400_009443ShearReinf.Add("ss", ss); 
            →INI400_009444ShearReinf.Add("Branch", new object[]); 
            //if there is only one shear reinforcement in CSS
            IF(IO.Section.Reinforcement.StirrupZone.StirrupZoneShape.Branch.Contains("Point")) { 
                →INI400_009445ShearReinf.Branch.Add(new Structure()); 
                →INI400_009446ShearReinf.Branch[0].Add("Point", new object[]); 
                FOR(i, 0, IO.Section.Reinforcement.StirrupZone.StirrupZoneShape.Branch.Point.Count-1) { 
                    →INI400_009447ShearReinf.Branch[0].Point.Add(new PointF(IO.Section.Reinforcement.StirrupZone.StirrupZoneShape.Branch.Point[i].X, IO.Section.Reinforcement.StirrupZone.StirrupZoneShape.Branch.Point[i].Y)); 
                } 
            } ELSE { //if there are more shear reinforcement in CSS
                FOR(i, 0, IO.Section.Reinforcement.StirrupZone.StirrupZoneShape.Branch.Count-1) { 
                    →INI400_009448ShearReinf.Branch.Add(new Structure()); 
                    →INI400_009449ShearReinf.Branch[i].Add("Point", new object[]); 
                    FOR(j, 0, IO.Section.Reinforcement.StirrupZone.StirrupZoneShape.Branch[i].Point.Count-1) { 
                        →INI400_009450ShearReinf.Branch[i].Point.Add(new PointF(IO.Section.Reinforcement.StirrupZone.StirrupZoneShape.Branch[i].Point[j].X, IO.Section.Reinforcement.StirrupZone.StirrupZoneShape.Branch[i].Point[j].Y)); 
                    } 
                } 
            } 
        } ELSE { //if there are more stirrup zones along a member, first stirrup zone will be used
            →INI400_009451ShearReinf.Add("D", IO.Beam.Reinforcement.StirrupZone[0].Stirrup[0].D); 
            →INI400_009452ShearReinf.Add("Ns", IO.Beam.Reinforcement.StirrupZone[0].NumCutUser); 
            double ss →INI400_009453= IO.Beam.Reinforcement.StirrupZone[0].Stirrup[1].DX-IO.Beam.Reinforcement.StirrupZone[0].Stirrup[0].DX; 
            →INI400_009454ShearReinf.Add("ss", ss); 
            →INI400_009455ShearReinf.Add("Branch", new object[]); 
            //if there is only one shear reinforcement in CSS
            IF(IO.Section.Reinforcement.StirrupZone[0].StirrupZoneShape.Branch.Contains("Point")) { 
                →INI400_009456ShearReinf.Branch.Add(new Structure()); 
                →INI400_009457ShearReinf.Branch[0].Add("Point", new object[]); 
                FOR(i, 0, IO.Section.Reinforcement.StirrupZone[0].StirrupZoneShape.Branch.Point.Count-1) { 
                    →INI400_009458ShearReinf.Branch[0].Point.Add(new PointF(IO.Section.Reinforcement.StirrupZone[0].StirrupZoneShape.Branch.Point[i].X, IO.Section.Reinforcement.StirrupZone[0].StirrupZoneShape.Branch.Point[i].Y)); 
                } 
            } ELSE { //if there are more shear reinforcement in CSS
                FOR(i, 0, IO.Section.Reinforcement.StirrupZone[0].StirrupZoneShape.Branch.Count-1) { 
                    →INI400_009459ShearReinf.Branch.Add(new Structure()); 
                    →INI400_009460ShearReinf.Branch[i].Add("Point", new object[]); 
                    FOR(j, 0, IO.Section.Reinforcement.StirrupZone[0].StirrupZoneShape.Branch[i].Point.Count-1) { 
                        →INI400_009461ShearReinf.Branch[i].Point.Add(new PointF(IO.Section.Reinforcement.StirrupZone[0].StirrupZoneShape.Branch[i].Point[j].X, IO.Section.Reinforcement.StirrupZone[0].StirrupZoneShape.Branch[i].Point[j].Y)); 
                    } 
                } 
            } 
        } 
    } 
} 
IF(IO.IsStandalone) { 
    →INI400_006668CONCRETE.SetForcesId(ForcesId, N, V↓sy←, V↓sz←, 0, M↓y←, M↓z←); 
} 
→INI400_000639PAGEBREAK(); 
→INI400_000009BLOCK { 
    →INI400_009567TEXT("Concrete"); 
    →INI400_009568TEXT(NameConcrete); 
    →INI400_009033BLOCK { 
        →INI400_008835TEXT(Description("f↓ck←")); 
        →INI400_009578TEXT(Description("γ↓c←")); 
        →INI400_000047TEXT(Description("f↓cd←")); 
        →INI400_009571TEXT(Description("f↓ct,m←")); 
        →INI400_009575TEXT(Description("f↓ctk,inf←")); 
        →INI400_009572TEXT(Description("f↓ctd←")); 
        →INI400_009569TEXT(Description("c")); 
        IF(f↓ck← &lt; 50000000) { 
            →INI400_000024TEXT("Concrete strength, NBR6118/2014 section 17.2.2.e"); 
            →INI400_009031TEXT("f↓ck← &lt; 50 MPa =&gt;"); 
        } ELSE { 
            →INI400_000040TEXT("Concrete strength"); 
            →INI400_009032TEXT("f↓ck← &gt; 50 MPa =&gt;"); 
        } 
    } 
    →INI400_009034BLOCK { 
        →INI400_009581TEXT("f↓ck← = " &amp; f↓ck←); 
        →INI400_009582TEXT("γ↓c← = " &amp; γ↓c←); 
        IF(COMPARE(γ↓c←, 1.4, 6) == 0) { 
            →INI400_009580TEXT("for Regular combinations"); 
        } 
        f↓cd← →INI400_000027= f↓ck←/γ↓c←; 
        f↓ct,m← →INI400_009576= f↓ct,m←; 
        f↓ctk,inf← →INI400_009573= 0.7*f↓ct,m←; 
        f↓ctd← →INI400_009574= f↓ctk,inf←/γ↓c←; 
        →INI400_009570TEXT("c = " &amp; c); 
        IF(f↓ck← &lt; 50000000) { 
            α↓c← →INI400_009037= 0.85; 
            λ →INI400_009038= 0.8; 
        } ELSE { 
            α↓c← →INI400_009041= 0.85*(1-[CUnit(f↓ck←, "MPa")-50]/200); 
            λ →INI400_009042= 0.8-[CUnit(f↓ck←, "MPa")-50]/400; 
        } 
    } 
} 
→INI400_009560PAGEBREAK(); 

→INI400_005903BLOCK { 
    →INI400_009043TEXT("Reinforcement steel"); 
    →INI400_009044TEXT(NameReqReinf); 
    →INI400_009045BLOCK { 
        →INI400_009055TEXT(Description("f↓ywk←")); 
        →INI400_009585TEXT(Description("γ↓s←")); 
        →INI400_000046TEXT(Description("f↓ywd←")); 
    } 
    →INI400_009046BLOCK { 
        →INI400_009056TEXT("f↓ywk← = " &amp; f↓ywk←); 
        →INI400_009586TEXT("γ↓s← = " &amp; γ↓s←); 
        IF(γ↓s← == 1.15) { 
            →INI400_009588TEXT("for Regular combinations"); 
        } 
        f↓ywd← →INI400_000026= f↓ywk←/γ↓s←; 
    } 
} 
→INI400_001334PAGEBREAK(); 

//added
SWITCH(TypeMember) { 
    CASE 0 :  { isColumn →INI400_006222= false; } //member is beam
    CASE 1 :  { isColumn →INI400_006223= true; } //member is column
} 
→INI400_005278BLOCK { 
    →INI400_009484TEXT("Internal forces"); 
    //    →INI400_000615TEXT("Inputted shear forces:"); 
    IF(typeOfLoad == 0) { 
        Combi↓key,out← →INI400_010572= "-"; 
        →INI400_010573TEXT("Load case:"); 
    } ELSE { 
        IF(typeOfLimitState == 1) { 
            →INI400_010574TEXT("ULS combination"); 
        } 
        →INI400_010563TEXT("(" &amp; Combi↓key← &amp; "):"); 
        
    } 
    →INI400_010543TEXT("N = " &amp; N); 
    →INI400_000621TEXT("V↓sy← = " &amp; V↓sy←); 
    →INI400_000130TEXT("V↓sz← = " &amp; V↓sz←); 
    →INI400_010541TEXT("M↓y← = " &amp; M↓y←); 
    →INI400_010542TEXT("M↓z← = " &amp; M↓z←); 
    //determination of type of loading
    //bending 0, tension 1, compression 2
    double TypeOfLoading →INI400_010526= -1; 
    IF(COMPARE(N, 0.0, 15) == 0) { 
        TypeOfLoading →INI400_010527= 0; 
        →INI400_010532TEXT("Type of loading: Simple bending."); 
    } ELSE { 
        IF(N &gt; 0) { 
            TypeOfLoading →INI400_010528= 1; 
            →INI400_010533TEXT("Type of loading: Tension."); 
        } ELSE { 
            TypeOfLoading →INI400_010529= 2; 
            →INI400_010534TEXT("Type of loading: Compression."); 
        } 
    } 
} 


→INI400_000641PAGEBREAK(); 
IF(IO.IsDrawing) { 
    →INI400_009472BLOCK { 
        →INI400_009473TEXT("Cross-section"); 
        →INI400_007963BLOCK { //("Cross-section")
            object oExtCalc_DrawCSSReinf →INI400_007964= LoadExternCLC("Graphics_1_CSS_with_reinforcement.CLC", true); 
            oExtCalc_DrawCSSReinf.Outline →INI400_007965= CONCRETE.General.GetOutline(IdCSS); 
            IF(bReinforced) { 
                object reinf →INI400_007966= CONCRETE.General.GetReinfBars(IdCSS); 
                oExtCalc_DrawCSSReinf.Reinf →INI400_007967= reinf; 
                oExtCalc_DrawCSSReinf.DrawDetReinfText →INI400_007968= true; 
                oExtCalc_DrawCSSReinf.DrawReinfBars →INI400_008668= true; 
            } ELSE { 
                oExtCalc_DrawCSSReinf.DrawDetReinfText →INI400_009406= false; 
                oExtCalc_DrawCSSReinf.DrawReinfBars →INI400_010589= false; 
                oExtCalc_DrawCSSReinf.DrawStirrups →INI400_010590= false; 
            } 
            oExtCalc_DrawCSSReinf.UserScale →INI400_007969= UserScale; 
            oExtCalc_DrawCSSReinf.ShapeCSS →INI400_007970= ShapeCss; 
            oExtCalc_DrawCSSReinf.FormCode →INI400_007973= FormCode; 
            oExtCalc_DrawCSSReinf.UserDimFont →INI400_007974= 8; 
            oExtCalc_DrawCSSReinf.DrawAxis →INI400_007976= true; 
            oExtCalc_DrawCSSReinf.UCSPosition →INI400_007977= UCSPosition; 
            →INI400_007980oExtCalc_DrawCSSReinf.Calculate(false); 
            →INI400_010605oExtCalc_DrawCSSReinf.G.Draw(280, 200, true); 
        } 
    } 
    →INI400_009474PAGEBREAK(); 
} 

object resultValues →INI400_006641= new object[]; 
double ActCombiId →INI400_010593= IO.Load.ID; 
M↓s,max,y← →INI400_010594= IO.Beam.Section[0].InternalForces[ActCombiId].My; 
M↓s,max,z← →INI400_010595= IO.Beam.Section[0].InternalForces[ActCombiId].Mz; 
N↓s,min← →INI400_010602= IO.Beam.Section[0].InternalForces[ActCombiId].N; 
IF(TypeOfLoading == 2) { 
    FOR(i, 1, IO.Beam.Section.Count-1) { 
        IF(ABS(IO.Beam.Section[i].InternalForces[ActCombiId].My) &gt; ABS(M↓s,max,y←)) { 
            M↓s,max,y← →INI400_010596= IO.Beam.Section[i].InternalForces[ActCombiId].My; 
        } 
        IF(ABS(IO.Beam.Section[i].InternalForces[ActCombiId].Mz) &gt; ABS(M↓s,max,z←)) { 
            M↓s,max,z← →INI400_010597= IO.Beam.Section[i].InternalForces[ActCombiId].Mz; 
        } 
        IF(IO.Beam.Section[i].InternalForces[ActCombiId].N &lt; 0.0 &amp;&amp; ABS(IO.Beam.Section[i].InternalForces[ActCombiId].N) &lt; ABS(N↓s,min←)) { 
            N↓s,min← →INI400_010603= IO.Beam.Section[i].InternalForces[ActCombiId].N; 
        } 
    } 
} 

FOR(calc, 0, 1) { 
    IF(calc == 0) { 
        →INI400_006625TEXT("Shear in direction of Y axis"); 
        V↓s← →INI400_006623= ABS(V↓sy←); 
        α↓V← →INI400_009475= 0.0; 
        M↓s,max← →INI400_010598= M↓s,max,z←; 
        W↓0← →INI400_010537= Wy; 
    } 
    IF(calc == 1) { 
        →INI400_006626TEXT("Shear in direction of Z axis"); 
        V↓s← →INI400_006624= ABS(V↓sz←); 
        α↓V← →INI400_000626= 90; 
        M↓s,max← →INI400_010531= M↓s,max,y←; 
        W↓0← →INI400_010538= Wz; 
        
    } 
    M↓0← →INI400_010536= ABS((N↓s,min←*W↓0←)/A↓c←); 
    →INI400_005279BLOCK { 
        →INI400_009486TEXT("Cross section parameters"); 
        b↓w← →INI400_000522= CONCRETE.Shear.WidthCssGeneral(IdCSS, ForcesId, α↓V←+90); 
        h →INI400_000572= CONCRETE.Shear.WidthCssGeneral(IdCSS, ForcesId, α↓V←); 
        
        →INI400_000124TEXT(Description("b↓w←")); 
        →INI400_000117TEXT("b↓w← = " &amp; b↓w←); 
        string DescriptionN →INI400_010465= TR("Value b↓w← is calculated as width of cross-section in center of gravity perpendicular to shear force."); 
        string SolutionN →INI400_010466= ""; 
        string TypeN →INI400_010467= TR("Note"); 
        IF(IO.IsDrawing) { 
            →INI400_010468Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
        } 
        Number↓N← →INI400_010469= Number↓N←+1; 
        →INI400_010470obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        →INI400_000630TEXT(Description("h")); 
        →INI400_000118TEXT("h = " &amp; h); 
        string DescriptionN →INI400_010471= TR("Value h is calculated as width of cross-section in center of gravity in direction of shear force."); 
        string SolutionN →INI400_010472= ""; 
        string TypeN →INI400_010473= TR("Note"); 
        IF(IO.IsDrawing) { 
            →INI400_010474Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
        } 
        Number↓N← →INI400_010475= Number↓N←+1; 
        →INI400_010476obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        
        
        →INI400_000119TEXT(Description("d")); 
        IF(!E0↓1←) { 
            d →INI400_001964= CONCRETE.Shear.EffectiveHeigthProjection(IdCSS, α↓V←, 0.9); 
        } ELSE { 
            d →INI400_003697= h-c-0.5*ϕ↓l←-ϕ↓ω←; 
        } 
    } 
    →INI400_000643PAGEBREAK(); 
    
    →INI400_005280BLOCK { 
        →INI400_009487TEXT("Reinforcement parameters, NBR 6118/2014 section 18.3.3.2"); 
        n↓w.out← →INI400_000631= n↓w←; 
        ϕ↓ω.out← →INI400_000632= ϕ↓ω←; 
        IF(designMethod == 1) { 
            θ →INI400_006498= 45; 
        } 
        θ↓.out← →INI400_000633= θ/57.2957795; 
        //check spacing of stirrups for columns
        IF(isColumn) { 
            IF(!IO.IsStandalone) { 
                →INI400_006248TEXT(Description("s↓max←")); 
                →INI400_006216double minDim; 
                minDim →INI400_006217= MIN(IO.Beam.CrossSection.Geometry.B, IO.Beam.CrossSection.Geometry.H); 
                SWITCH(ReinfClass) { 
                    CASE 50 :  { 
                        s↓max← →INI400_006220= PARMIN(0.2, minDim, 12*ϕ↓l←); 
                    } 
                    CASE 25 :  { 
                        s↓max← →INI400_006221= PARMIN(0.2, minDim, 24*ϕ↓l←); 
                    } 
                    DEFAULT :  { 
                        s↓max← →INI400_006224= PARMIN(0.2, minDim, 24*ϕ↓l←); 
                    } 
                } 
            } 
        } 
        →INI400_000125TEXT(Description("c")); 
        →INI400_000126TEXT("c = " &amp; c); 
        →INI400_000127TEXT(Description("ϕ↓ω←")); 
        //added{
        IF(isColumn) { 
            IF(ϕ↓l← &lt; 0.02) { //NBR6118:2014 18.4.3
                ϕ↓ω← →INI400_006677= 0.005; 
            } 
            IF(COMPARE(ϕ↓l←, 0.02, 15) == 0.0) { 
                ϕ↓ω← →INI400_006678= 0.0063; 
            } ELSE { 
                IF(ϕ↓ω← &lt; ϕ↓l←/4) { 
                    //find minimal possible diameter
                    double[] possibleDiam →INI400_006209= new double[]; //possible diams of shear reinf
                    →INI400_006210possibleDiam.Add(5); 
                    →INI400_006211possibleDiam.Add(6.3); 
                    →INI400_006212possibleDiam.Add(8); 
                    →INI400_006213possibleDiam.Add(10); 
                    →INI400_006496possibleDiam.Add(12); 
                    FOR(i, 0, possibleDiam.Count-1) { //find the minimum possible diameter of stirrup
                        IF(ϕ↓l←/0.004 &lt; possibleDiam[i]) { 
                            ϕ↓ω,possible← →INI400_006214= possibleDiam[i]/1000; 
                            Break(); 
                        } 
                    } 
                    ϕ↓ω,min← →INI400_006251= ϕ↓l←/4; 
                    →INI400_006252TEXT(" &gt; ϕ↓ω← = " &amp; ϕ↓ω← &amp; " =&gt;"); 
                    ϕ↓ω← →INI400_006226= ϕ↓ω,possible←; 
                } 
            } 
        } ELSE { //member is beam
            IF(ϕ↓ω← &lt; 0.005) { 
                ϕ↓ω,min← →INI400_006485= 0.005; 
                →INI400_006486TEXT(" &gt; ϕ↓ω← = " &amp; ϕ↓ω← &amp; " =&gt;"); 
                ϕ↓ω← →INI400_006487= 0.005; 
            } 
            IF(ϕ↓ω← &gt; b↓w←/10) { 
                ϕ↓ω,max← →INI400_006491= b↓w←/10; 
                →INI400_006492TEXT(" &lt; ϕ↓ω← = " &amp; ϕ↓ω← &amp; " =&gt;"); 
                ϕ↓ω← →INI400_006493= ϕ↓ω,max←; 
            } 
        } 
        →INI400_000128TEXT(n↓w← &amp; "x ϕ " &amp; ϕ↓ω← &amp; " =&gt;"); 
        A↓sw← →INI400_000129= n↓w←*π*[ϕ↓ω←/2]↑2←; 
        
        →INI400_009561BLOCK { 
            →INI400_000156TEXT(Description("ϕ↓l←")); 
            →INI400_000145TEXT(Description("α")); 
            →INI400_000158TEXT(Description("θ")); 
        } 
        →INI400_009562BLOCK { 
            →INI400_000155TEXT("ϕ↓l← = " &amp; ϕ↓l←); 
            →INI400_000147TEXT("α = " &amp; α); 
            →INI400_000157TEXT("θ = " &amp; θ); 
        } 
        IF(α &lt; 45.0) { 
            α →INI400_009795= 45.0; 
            string DescriptionN →INI400_006450= TR("Angle of stirups is smaller than 45.0°. Value is set to 45.0°"); 
            string SolutionN →INI400_006451= ""; 
            string TypeN →INI400_006452= TR("Note"); 
            IF(IO.IsDrawing) { 
                →INI400_006453Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
            } 
            Number↓N← →INI400_006454= Number↓N←+1; 
            →INI400_006455obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            //add condition 45&lt;=alpha&lt;=90 out of range alpha equal to limit - obEWN
        } 
        IF(α &gt; 90.0) { 
            α →INI400_009796= 90.0; 
            string DescriptionN →INI400_010438= TR("Angle of stirups is greather than 90.0°. Value is set to 90.0°"); 
            string SolutionN →INI400_010439= ""; 
            string TypeN →INI400_010440= TR("Note"); 
            IF(IO.IsDrawing) { 
                →INI400_010441Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
            } 
            Number↓N← →INI400_010442= Number↓N←+1; 
            →INI400_010443obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            //add condition 45&lt;=alpha&lt;=90 out of range alpha equal to limit - obEWN
        } 
        IF(θ &lt; θ↓min←) { 
            θ →INI400_009797= θ↓min←; 
            string DescriptionN →INI400_010446= TR("Angle of strut is smaller than " &amp; Val(ROUND(θ↓min←, 2), 2) &amp; ". Value is set to  " &amp; Val(ROUND(θ↓min←, 2), 2)); 
            string SolutionN →INI400_010447= ""; 
            string TypeN →INI400_010448= TR("Note"); 
            IF(IO.IsDrawing) { 
                →INI400_010449Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
            } 
            Number↓N← →INI400_010450= Number↓N←+1; 
            →INI400_010451obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
        } 
        IF(θ &gt; θ↓max← &amp;&amp; COMPARE(θ, θ↓max←, 6) != 0) { 
            string DescriptionN →INI400_010453= TR("Angle of strut " &amp; Val(θ, 2) &amp; " is greater than " &amp; Val(ROUND(θ↓max←, 2), 2) &amp; ". Value is set to " &amp; Val(ROUND(θ↓max←, 2), 2)); 
            string SolutionN →INI400_010454= ""; 
            string TypeN →INI400_010455= TR("Note"); 
            IF(IO.IsDrawing) { 
                →INI400_010456Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
            } 
            Number↓N← →INI400_010457= Number↓N←+1; 
            →INI400_010458obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            θ →INI400_009798= θ↓max←; 
        } 
    } 
    →INI400_000644PAGEBREAK(); 
    
    →INI400_000140BLOCK { 
        →INI400_009488TEXT("Coefficient of shear bearing capacity"); 
        →INI400_000137TEXT(Description("α↓v2←")); 
        α↓v2← →INI400_000134= 1-(CUnit(f↓ck←, "MPa")/250); 
    } 
    
    IF(V↓s← == 0) { 
        //→INI400_006655resultValues.Add(new Structure("Ass", A↓ss←, "ϕ↓ω←", ϕ↓ω←, "s", s)); 
        IF(calc == 0) { 
            →INI400_006628TEXT("No shearing force in Y-axis"); 
        } ELSE { 
            →INI400_006640TEXT("No shearing force in Z-axis"); 
        } 
        //continue(); 
    } 
    ε↓min← →INI400_006612= concrete.StressStrain.GetExtremeStrainOfConcreteMin(IdCSS, ForcesId); 
    ε↓max← →INI400_006613= concrete.StressStrain.GetExtremeStrainOfConcreteMax(IdCSS, ForcesId); 
    IF(designMethod == 1) { 
        →INI400_006658TEXT("Design Model I, NBR6118/2014 section 17.4.2.2"); 
        →INI400_000143TEXT("Verification of the diagonal compression of concrete"); 
        V↓Rd2← →INI400_000142= 0.27*α↓v2←*f↓cd←*b↓w←*d; 
        IF(V↓Rd2← &gt; V↓s←) { 
            →INI400_000160TEXT("V↓Rd2← = " &amp; V↓Rd2← &amp; " &gt; V↓s← =" &amp; V↓s← &amp; " =&gt;"); 
            →INI400_009563TEXT("OK"); 
        } ELSE { 
            →INI400_000159TEXT("V↓Rd2← = " &amp; V↓Rd2← &amp; " &lt; V↓s← =" &amp; V↓s← &amp; " =&gt;"); 
            →INI400_009564TEXT("NOT OK"); 
        } 
        →INI400_000146TEXT("Portion of shearing force resisted by complementing mechanism to the truss model"); 
        V↓c0← →INI400_000148= 0.6*f↓ctd←*b↓w←*d; 
        //case of simple bending and in the tensioned-bending with the neutral axis crossing the section
        //original
        //        V↓c← →INI400_000176= V↓c0←; 
        →INI400_006273BLOCK { //added block, determinating of V↓c←, needs completion
            SWITCH(TypeOfLoading) { 
                CASE 0 : //bending
                { 
                    V↓c← →INI400_010519= V↓c0←; 
                } 
                CASE 1 : //tension
                { 
                    V↓c← →INI400_010520= 0; 
                } 
                CASE 2 : //Compression
                { 
                    //finding the maximum
                    IF(COMPARE(M↓s,max←, 0.0, 15) != 0) { 
                        V↓c← →INI400_006257= V↓c0←*[1+(M↓0←/ABS(M↓s,max←))]; 
                        IF(V↓c← &gt; 2*V↓c0←) { 
                            →INI400_006260TEXT("V↓c← = " &amp; V↓c← &amp; " &gt; " &amp; '2*V↓c0←' &amp; " = " &amp; Val(2*V↓c0←/1000, 3) &amp; " kN"); 
                            V↓c← →INI400_006259= 2*V↓c0←; 
                        } 
                    } ELSE { 
                        V↓c← →INI400_010540= 2*V↓c0←; 
                    } 
                } 
            } 
        } 
        →INI400_006664PAGEBREAK(); 
    } ELSE { 
        →INI400_006657TEXT("Design Model II, NBR6118/2014 section 17.4.2.3"); 
        →INI400_006662TEXT("Verification of the diagonal compression of concrete"); 
        V↓Rd2← →INI400_000166= 0.54*α↓v2←*f↓cd←*b↓w←*d*POWER(SIN(θ), 2)*(COTG(α)+COTG(θ)); 
        IF(V↓Rd2← &gt; V↓s←) { 
            →INI400_000173TEXT("V↓Rd2← = " &amp; V↓Rd2← &amp; " &gt; V↓s← = " &amp; V↓s← &amp; " =&gt;"); 
            →INI400_009565TEXT("OK"); 
        } ELSE { 
            →INI400_000172TEXT("V↓Rd2← = " &amp; V↓Rd2← &amp; " &lt; V↓s← = " &amp; V↓s← &amp; " =&gt;"); 
            →INI400_009566TEXT("NOT OK"); 
        } 
        →INI400_006661TEXT("Portion of shearing force resisted by complementing mechanisms to the truss model"); 
        V↓c0← →INI400_000177= 0.6*f↓ctd←*b↓w←*d; 
        →INI400_006272BLOCK { //added block, determinating of V↓c←, needs completion
            IF(COMPARE(V↓s←, V↓Rd2←, 15) == 0) { 
                V↓c1← →INI400_006268= 0; 
            } ELSE { 
                IF(V↓s← &lt; V↓c0←) { 
                    V↓c1← →INI400_009543= V↓c0←; 
                } ELSE { 
                    V↓c1← →INI400_009544= (V↓c0←*(V↓Rd2←-V↓s←))/(V↓Rd2←-V↓c0←); 
                } 
            } 
            SWITCH(TypeOfLoading) { 
                CASE 0 : //bending
                { 
                    V↓c← →INI400_010521= V↓c1←; 
                } 
                CASE 1 : //tension
                { 
                    V↓c← →INI400_010522= 0; 
                } 
                CASE 2 : //Compression
                { 
                    IF(COMPARE(M↓s,max←, 0.0, 15) != 0) { 
                        V↓c← →INI400_010523= V↓c1←*[1+(M↓0←/ABS(M↓s,max←))]; 
                        IF(V↓c← &gt; 2*V↓c1←) { 
                            →INI400_010524TEXT("V↓c← = " &amp; V↓c← &amp; " &gt; " &amp; '2*V↓c0←' &amp; " = " &amp; Val(2*V↓c0←/1000, 3) &amp; " kN"); 
                            V↓c← →INI400_010525= 2*V↓c1←; 
                        } 
                    } ELSE { 
                        V↓c← →INI400_010539= 2*V↓c1←; 
                    } 
                } 
            } 
            IF(COMPARE(V↓s←, V↓Rd2←, 15) == 0) { 
                V↓c1← →INI400_006270= 0; 
                V↓c← →INI400_006271= 0; //because  V↓c← →INI400_006266= V↓c1←*[1+(M↓0←/M↓sd,max←)] = 0*(...) = 0
            } 
        } 
    } 
    →INI400_006666PAGEBREAK(); 
    
    
    →INI400_000206TEXT("Design of required transversal reinforcement"); 
    IF(COMPARE(V↓s←-V↓c←, 0, 15) != 1) { //design minimal shear reinf
        //added{
        →INI400_006341TEXT("V↓s← = " &amp; V↓s← &amp; " ≤ V↓c← = " &amp; V↓c←); 
        IF(isColumn) { //check that tensile stress of concrete is less than f↓ctk←
            IF(!IO.Contains("REINF")) { //in this case, calc stress manually
                
                σ↓c,max← →INI400_006398= (N/A↓c←)+(ABS(M↓y←)/Wy)+(ABS(M↓z←)/Wz); 
                string DescriptionN →INI400_010483= TR("The stress was calculated for cross section without longitudinal reinforcement."); 
                string SolutionN →INI400_010484= ""; 
                string TypeN →INI400_010485= TR("Note"); 
                IF(IO.IsDrawing) { 
                    →INI400_010486Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
                } 
                Number↓N← →INI400_010487= Number↓N←+1; 
                →INI400_010488obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                
            } ELSE { //CSS with reinforcement, use concrete toolbox to calc stress
                IF(IO.IsStandalone) { 
                    σ↓c,max← →INI400_006400= concrete.StressStrain.GetExtremeStrainOfConcreteMax(IdCSS, ForcesId)*IO.CONCRETE.NBR.Ecm; 
                } ELSE { 
                    σ↓c,max← →INI400_006670= concrete.StressStrain.GetExtremeStrainOfConcreteMax(IdCSS, ForcesId)*IO.CONCRETE.NBR.E; 
                    
                } 
                IF(COMPARE(σ↓c,max←, 0, 6) == 0 &amp;&amp; (COMPARE(M↓y←, 0, 15) != 0 || COMPARE(M↓z←, 0, 15) != 0 || COMPARE(N, 0, 15) != 0)) { 
                    string DescriptionN →INI400_010489= TR("The member may be overloaded"); 
                    string SolutionN →INI400_010490= ""; 
                    string TypeN →INI400_010491= TR("Note"); 
                    IF(IO.IsDrawing) { 
                        →INI400_010492Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
                    } 
                    Number↓N← →INI400_010493= Number↓N←+1; 
                    →INI400_010494obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                } 
            } 
            //evaluation
            IF(σ↓c,max← &lt; f↓ctk,inf←) { //adopt the minimum
                →INI400_006402TEXT("σ↓c,max← = " &amp; σ↓c,max← &amp; " &lt; f↓ctk← = " &amp; f↓ctk,inf←); 
                string DescriptionN →INI400_010459= TR("Transversal reinforcement is designed for the minimum of required tranversal reinforcement."); 
                string SolutionN →INI400_010460= ""; 
                string TypeN →INI400_010461= TR("Note"); 
                IF(IO.IsDrawing) { 
                    →INI400_010462Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
                } 
                Number↓N← →INI400_010463= Number↓N←+1; 
                →INI400_010464obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                
                s →INI400_006421= s↓max←; 
                //find minimal possible diameter
                double[] possibleDiam →INI400_006531= new double[]; //possible diams of shear reinf
                →INI400_006532possibleDiam.Add(5); 
                →INI400_006533possibleDiam.Add(6.3); 
                →INI400_006534possibleDiam.Add(8); 
                →INI400_006535possibleDiam.Add(10); 
                →INI400_006536possibleDiam.Add(12); 
                FOR(i, 0, possibleDiam.Count-1) { //find the minimum possible diameter of stirrup
                    IF(COMPARE(ϕ↓l←/0.004, possibleDiam[i], 6) != 1) { 
                        ϕ↓ω,possible← →INI400_006537= possibleDiam[i]/1000; 
                        Break(); 
                    } 
                } 
                ϕ↓ω← →INI400_006541= ϕ↓ω,possible←; 
                A↓ss← →INI400_006542= 1/s*n↓w←*(π*ϕ↓ω←↑2←/4); 
                →INI400_006546TEXT("A↓sw←/s = " &amp; A↓ss← &amp; " =&gt; " &amp; n↓w← &amp; "x ϕ" &amp; ϕ↓ω← &amp; "/" &amp; s); 
            } ELSE { 
                →INI400_006406TEXT("σ↓c,max← = " &amp; σ↓c,max← &amp; " &gt; f↓ctk← = " &amp; f↓ctk,inf←); 
                A↓ss← →INI400_006501= 0; // minimum shear reinforcement will be calculated
            } 
        } ELSE { //beams
            IF(COMPARE(V↓s←, 0.67*V↓Rd2←, 15) != 1) { //calc of s↓max← for beams
                →INI400_009489TEXT("V↓s← ≤ 0.67*V↓Rd2←"); 
                s↓max← →INI400_006515= MIN(0.6*d, 0.3); 
            } ELSE { 
                →INI400_009490TEXT("V↓s← &gt; 0.67*V↓Rd2←"); 
                s↓max← →INI400_006516= MIN(0.3*d, 0.2); 
            } 
            string DescriptionN →INI400_010495= TR("Transversal reinforcement is designed from maximum spacing of transversal reinforcement, NBR 6118/2014 section 18.3.3.2"); 
            string SolutionN →INI400_010496= ""; 
            string TypeN →INI400_010497= TR("Note"); 
            IF(IO.IsDrawing) { 
                →INI400_010498Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
            } 
            Number↓N← →INI400_010499= Number↓N←+1; 
            →INI400_010500obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            s →INI400_006521= s↓max←; 
            IF(COMPARE(V↓s←, 0.2*V↓Rd2←, 15) != 1) { //calc of s↓maxt← for beams
                →INI400_010578TEXT("V↓s← ≤ 0.2*V↓Rd2←"); 
                double s↓max.t← →INI400_010579= MIN(d, 0.8); 
            } ELSE { 
                →INI400_010580TEXT("V↓s← &gt; 0.2*V↓Rd2←"); 
                double s↓max.t← →INI400_010581= MIN(0.6*d, 0.35); 
            } 
            string DescriptionN →INI400_010582= TR("Maximum spacing between stirrups along the transversal axis of the beam, NBR 6118/2014 section 18.3.3.2 "); 
            string SolutionN →INI400_010583= ""; 
            string TypeN →INI400_010584= TR("Note"); 
            IF(IO.IsDrawing) { 
                →INI400_010585Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
            } 
            Number↓N← →INI400_010586= Number↓N←+1; 
            →INI400_010587obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            
            A↓ss← →INI400_006543= 1/s*n↓w←*(π*ϕ↓ω←↑2←/4); 
            →INI400_006522TEXT("A↓sw←/s = " &amp; A↓ss← &amp; " =&gt; " &amp; n↓w← &amp; "x ϕ" &amp; ϕ↓ω← &amp; "/" &amp; s); 
        } 
        
    } ELSE { //(V↓s←-V↓c← &gt; 0
        →INI400_006422TEXT("V↓s← = " &amp; V↓s← &amp; " &gt; V↓c← = " &amp; V↓c←); 
        IF(designMethod == 1) { 
            A↓ss← →INI400_000208= (V↓s←-V↓c←)/(0.9*d*f↓ywd←*(SIN(α)+COS(α))); 
        } ELSE { 
            A↓ss← →INI400_006675= (V↓s←-V↓c←)/(0.9*d*f↓ywd←*(COTG(α)+COTG(θ)*SIN(α))); 
        } 
        s →INI400_000228= A↓sw←/A↓ss←; 
        //added{
        →INI400_006301TEXT("Check of maximum stirrup distance"); 
        IF(!isColumn) { //check for beams
            IF(COMPARE(V↓s←, 0.67*V↓Rd2←, 15) != 1) { //calc of s↓max← for beams
                s↓max← →INI400_006295= MIN(0.6*d, 0.3); 
            } ELSE { 
                s↓max← →INI400_006296= MIN(0.3*d, 0.2); 
            } 
            IF(s &gt; s↓max←) { //not ok
                →INI400_006297TEXT("s = " &amp; s &amp; " &gt; s↓max← = " &amp; s↓max← &amp; " =&gt;"); 
                →INI400_009589TEXT("NOT OK"); 
                s →INI400_006298= s↓max←; 
                A↓ss← →INI400_006299= A↓sw←/s; 
                string DescriptionN →INI400_010501= TR("Designed transversal reinforcement is excessive, it is advised to use smaller dimension."); 
                string SolutionN →INI400_010502= ""; 
                string TypeN →INI400_010503= TR("Note"); 
                IF(IO.IsDrawing) { 
                    →INI400_010504Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
                } 
                Number↓N← →INI400_010505= Number↓N←+1; 
                →INI400_010506obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            } ELSE { //ok
                →INI400_006303TEXT("s = " &amp; s &amp; " &lt; s↓max← = " &amp; s↓max← &amp; " =&gt;"); 
                →INI400_009590TEXT("OK"); 
            } 
        } ELSE { //check for columns
            IF(s &gt; s↓max←) { 
                →INI400_006286TEXT("s = " &amp; s &amp; " &gt; s↓max← = " &amp; s↓max← &amp; " =&gt;"); 
                →INI400_009591TEXT("NOT OK"); 
                s →INI400_006287= s↓max←; 
                A↓ss← →INI400_006294= A↓sw←/s; 
                string DescriptionN →INI400_010507= TR("Designed transversal reinforcement is excessive, it is advised to use smaller dimension."); 
                string SolutionN →INI400_010508= ""; 
                string TypeN →INI400_010509= TR("Note"); 
                IF(IO.IsDrawing) { 
                    →INI400_010510Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
                } 
                Number↓N← →INI400_010511= Number↓N←+1; 
                →INI400_010512obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
            } ELSE { 
                →INI400_006302TEXT("s = " &amp; s &amp; " &lt; s↓max← = " &amp; s↓max← &amp; " =&gt;"); 
                →INI400_009592TEXT("OK"); 
            } 
        } 
        →INI400_000229TEXT("A↓sw←/s = " &amp; A↓ss← &amp; " =&gt; " &amp; n↓w← &amp; "x ϕ" &amp; ϕ↓ω← &amp; "/" &amp; s); 
    } 
    →INI400_000191BLOCK { 
        IF(!isColumn || (isColumn &amp;&amp; COMPARE(A↓ss←, 0, 6) == 0)) { 
            →INI400_000190TEXT("Check of minimum shear reinforcement, NBR6118/2014 section 17.4.1.1.1"); 
            ρ↓sw← →INI400_000187= A↓ss←/(b↓w←*SIN(α)); 
            ρ↓c← →INI400_000192= 0.2*f↓ct,m←/f↓ywk←; 
            IF(COMPARE(ρ↓sw←, (0.2*f↓ct,m←/f↓ywk←), 15) != -1) { 
                →INI400_000189TEXT("ρ↓sw← = " &amp; ρ↓sw← &amp; " ≥ " &amp; '0.2*(f↓ct,m←/f↓ywk←)' &amp; "↓ ←=" &amp; ρ↓c← &amp; " =&gt;"); 
                →INI400_009594TEXT("OK"); 
            } ELSE { 
                →INI400_000188TEXT("ρ↓sw← = " &amp; ρ↓sw← &amp; " &lt; " &amp; '0.2*(f↓ct,m←/f↓ywk←)' &amp; "↓ ←= " &amp; ρ↓c← &amp; " =&gt;"); 
                →INI400_009593TEXT("NOT OK"); 
                A↓ss← →INI400_000224= ρ↓c←*b↓w←*SIN(α); 
                s →INI400_000216= A↓sw←/A↓ss←; 
                string DescriptionN →INI400_010513= TR("Transversal reinforcement was designed from minimal ratio of transversal reinforcement."); 
                string SolutionN →INI400_010514= ""; 
                string TypeN →INI400_010515= TR("Note"); 
                IF(IO.IsDrawing) { 
                    →INI400_010516Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
                } 
                Number↓N← →INI400_010517= Number↓N←+1; 
                →INI400_010518obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 
                
                →INI400_010588resultValues.Add(new Structure("Ass", A↓ss←, "ϕ↓ω←", ϕ↓ω←, "s", s)); 
                →INI400_000225TEXT("A↓sw←/s = " &amp; 'ρ↓c←*b↓w←*SIN(α)' &amp; "↓ ←= " &amp; A↓ss← &amp; " =&gt; " &amp; n↓w← &amp; "x ϕ" &amp; ϕ↓ω← &amp; "/" &amp; s); 
            } 
        } 
    } 
    →INI400_006667PAGEBREAK(); 
    →INI400_000150TEXT("Portion of shearing force resisted by transversal reinforcement"); 
    IF(designMethod == 1) { 
        V↓sw← →INI400_006673= (A↓sw←/s)*0.9*d*f↓ywd←*(SIN(α)+COS(α)); 
    } ELSE { 
        V↓sw← →INI400_000149= (A↓sw←/s)*0.9*d*f↓ywd←*(COTG(α)+COTG(θ)*SIN(α)); 
    } 
    →INI400_000151TEXT("Design resistant shearing force regarding the ruin of diagonal tension"); 
    V↓Rd3← →INI400_000152= V↓c←+V↓sw←; 
    IF(V↓Rd3← &gt; V↓s←) { 
        →INI400_000162TEXT("V↓Rd3← = " &amp; V↓Rd3← &amp; " &gt; V↓s← = " &amp; V↓s← &amp; " =&gt;"); 
        →INI400_009595TEXT("OK"); 
    } ELSE { 
        →INI400_000161TEXT("V↓Rd3← = " &amp; V↓Rd3← &amp; " &lt; V↓s← = " &amp; V↓s← &amp; " =&gt;"); 
        →INI400_009596TEXT("NOT OK"); 
    } 
    IF(designMethod == 1) { 
        IF(V↓c← &lt; V↓s← || COMPARE(V↓c←, V↓s←, 15) == 0) { 
            a↓l← →INI400_009785= d; 
        } ELSE { 
            →INI400_010576TEXT(Description("a↓l,min←")); 
            IF(COMPARE(α, 45.0, 15) == 0) { 
                double a↓l,min← →INI400_009786= 0.2*d; 
            } ELSE { 
                double a↓l,min← →INI400_009787= 0.5*d; 
            } 
            →INI400_010577TEXT(Description("a↓l←")); 
            double fraction →INI400_010600= V↓s←/(2*(V↓s←-V↓c←)); 
            IF(c &lt; 1 || COMPARE(c, 1, 15) == 0) { 
                a↓l← →INI400_009784= d*[((V↓s←*[1+COTG(α)])/(2*[V↓s←-V↓c←]))-COTG(α)]; 
            } ELSE { 
                a↓l← →INI400_010601= d; 
            } 
            IF(a↓l← &gt; d) { 
                a↓l← →INI400_010599= d; 
            } 
            IF(a↓l← &lt; a↓l,min←) { 
                a↓l← →INI400_009788= a↓l,min←; 
            } 
        } 
    } 
    ELSE { 
        IF(COMPARE(α, 45.0, 15) == 0) { 
            double a↓l,min← →INI400_009790= 0.2*d; 
        } ELSE { 
            double a↓l,min← →INI400_009791= 0.5*d; 
        } 
        a↓l← →INI400_009792= 0.5*d*(COTG(θ)-COTG(α)); 
        IF(a↓l← &lt; a↓l,min←) { 
            a↓l← →INI400_009793= a↓l,min←; 
        } 
    } 
    
    →INI400_006627PAGEBREAK(); 
    →INI400_006642resultValues.Add(new Structure("Ass", A↓ss←, "ϕ↓ω←", ϕ↓ω←, "s", s)); 
    
} 

string DescriptionN →INI400_010477= TR("Transversal reinforcement is designed as maximum from Y-axis and Z-axis."); 
string SolutionN →INI400_010478= ""; 
string TypeN →INI400_010479= TR("Note"); 
IF(IO.IsDrawing) { 
    →INI400_010480Functions1D.CreateNoteFromEWN(TypeN, DescriptionN, SolutionN, TableWidth, obEWNCellsFont, TableHeaderFont, obEWNBorderPen, TableGridPen); 
} 
Number↓N← →INI400_010481= Number↓N←+1; 
→INI400_010482obEWN.Add(new Structure("Index", "N" &amp; IndexEWN &amp; "/" &amp; Number↓N←, "Type", TypeN, "Description", DescriptionN, "Solution", SolutionN)); 


double A↓ss,fin← →INI400_009496= MAX(resultValues[0].Ass, resultValues[1].Ass); 
IF(resultValues[0].Ass &gt; resultValues[1].Ass) { 
    double n↓w,fin← →INI400_009507= n↓w←; 
    double ϕ↓ω,fin← →INI400_009508= resultValues[0].ϕ↓ω←; 
    double s↓fin← →INI400_009509= resultValues[0].s; 
    
} ELSE { 
    double n↓w,fin← →INI400_009510= n↓w←; 
    double ϕ↓ω,fin← →INI400_009511= resultValues[1].ϕ↓ω←; 
    double s↓fin← →INI400_009512= resultValues[1].s; 
    
} 
→INI400_009599TEXT("Final designed transverse reinforcement"); 
→INI400_006651TEXT("A↓sw←/s =" &amp; A↓ss,fin← &amp; " =&gt; " &amp; n↓w,fin← &amp; "x ϕ" &amp; ϕ↓ω,fin← &amp; "/" &amp; s↓fin←); 
→INI400_001247BLOCK { 
    /// write errors and warnings
    NumberEWN[0] →INI400_001778= Number↓E←; 
    NumberEWN[1] →INI400_009703= Number↓W←; 
    NumberEWN[2] →INI400_001780= Number↓N←; 
    string slist →INI400_007149= TR("List of errors/warnings/notes: "); 
    string noerror →INI400_007150= TR("There are no errors, warnings and notes"); 
    string EWNMessage →INI400_007151= Functions1D.FListEWN(obEWN, slist, noerror); 
    →INI400_005865TEXT(EWNMessage); 
    IF(IO.IsDrawing) { 
        →INI400_005815Functions1D.TableEWN(NumberEWN, obEWN, PrintEWN, TableWidth, TableCellsFont, TableHeaderFont, TableBorderPen, TableGridPen); 
        →INI400_007177PAGEBREAK(); 
        
    } 
} </SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="2" Member="1000" Material="2" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10000" Autor="V3560-Rodrigo\Rodrigo" Autor2="" Version="165" EWNSource="" Icon="/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/2wBDAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQH/wAARCABkAGQDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD+/iiiigAorxv49/H/AOEv7Mvwx8QfF740+MdM8F+CfD0LmS8vpo/t2sambe5ubLw54b03et3r/ibVltJ00rRNOSa9uzFNKI0tre5nh/ju/bO/4OAf2j/jHcaz4M/Zrtof2fvh4ZpbSPxVplw2r/FPX7WOSxZLyPxFeWVnB4RhnmtbmSCHQ9KtdZjsb77Pdau0isq/G8Wcd8PcHUovNcTKeMqwc8PluEiq2NrRu0p8jlCnQpOSaVbEVKUJOMo03OcXE/pT6P30UPGL6SOPqw4CySjhuHMDiY4XOONeIK1TLuGMsrWhOeGWKhRxGKzPMIUqlOpLLsowmOxVKFWjVxcMLh6sa5/YR8Z/2k/gH+zvo1zr3xu+LvgP4a2Vtp66p5HibxBZWutXunvfRaatzpHhuOSbxDraNfzR2gXR9Lvn84lNmUfb+Z3j3/gvf/wTp8Eard6Vp/jvx98Q2tJrOL7f4C+Heq3WlXMd3YR3zXNpfeJrjwvHPDZvIun3igLcJfrJHFbzQRyXK/wYazres+I9Uvdc8Q6vqeva1qUxudR1jWb+61TVNQuGCq1xe6hfSz3d1MVVVMs80khCqC2AKu6V4T8Va9bveaH4Z8QazaRzNbSXWlaNqOo28dwiRyvbvPZ200SzLFNDI0TMJFSWNyoV1J/B8x8euIcVVcMlyTL8JTveKxLxOZYmUY8123Slg6cVJODcVSnyNNe0kmmv9YOD/wBkz4P5BgIYnxP8UOLuIcW4qNWeSRyXgrJqVaoqDhTiswo8SY2u6c44inGrLH4b6zCrTl9VoTpNT/uJtv8Ag4g/4J9T3FvBLD8d7OKaaKKS8ufhtpb29rHJIqPc3C2fjK6u2hgUmWVbW1ubgorCC3mlKxt9T/Cf/gsF/wAE7fjA+lWehftHeHPDOt6tqCaXb6D8RtJ8R/D+9jvZtQt9PtIpr/xLpNl4dZL17y0nguLbW7i2W2mla5mt5bDVIrH/AD+9X+Cvxk8P/Z/7e+EvxN0T7X532T+1/AfinTftX2fyvP8As/23SofO8nzofO8vd5fmxb9vmJnzm5trizuLizvLea1u7WaW2urW5ikguLa4gkaKe3uIJVSWGaGVWjlikVZI5FZHUMCByUvHHjXB1YvH5XlNWk3Z06mCxuEm9n7lRYtqMrfzU5r3r8r0t9Djv2Wf0YuIsFUhwjx54gYLHQi508Zg+J+F+IcND44J4nBvh+E6lL2lrqljcJJyp8iqxvK/+rRo+taP4h0631jQNW0zXNJvPO+yapo9/a6np119nnltZ/s97ZSz20/kXME1vN5UreXPDLC+2SN1GlX+Zn+zL+3H+0/+yLqkd58Efir4i8PaK+oWOo6n4Gu7+91HwFrs2n3Mt3brq3hh7qO0dGnnlN09k1lcXsMs1pdzzWdxcW8v9fP/AAT1/wCC4Pwa/ax1Cw+GfxutPDvwF+NF4lymkR3GtXZ+Hvjaa0S4u500bXdYtYbfwxqDWKR/YdD1/W7u41S7gvLawvprptPtL39d4Q8XeHeJqlHA4tSyTNarjCnhsXVjPC4mrJ2VPC41RpwlOTaUKWIhQqTk+SlGrJJv/Oz6RX7Ozxl8DsHmHFGQSpeKPAOAjWxOLzrh/BVcNnuTYClHnli8+4YlWxeJpYejCNWeJx2U4rN8DhaFJ4rH1sDTk4U/3Tooor9YP8/QooooAK+cv2qv2oPhj+yD8GfEXxq+K1+9roOkPHpulafBu+2+I/E17bXdxpPh3T2Ecqx3V+tjdSGRkkMdtbXDwQXl0Leyufo2v4Of+C2v7det/tL/ALRWp/CbwvqGp2Hwi+Dc0nh6y0+C+1CLSfF+t+YmoTeLLvSr+x0+7gvHW4htTFcQQxrHY2EH2aeXSodY1H4fxA4vpcG5BWx65Z5hiJPC5XQnFyjUxc4uXtKiTX7rDwTq1LyXNaMFeU0n/Uf0RPo6476Sfi7lnCE3XwvCWUUo5/xzmdCpGjVwnD2Gr0qcsLhako1OXMM2xE6eX4JxpVHSlVqYqcY0cNVnD4c/bk/bk+LX7cvxa1D4gfEDUJrLw3ZTTW3gbwNbTSLo3hbRlklFrDDaiWSJr1opHaednmkEk1wzXFzc3N9fX3yD4c0yz1vxDoOjahrNl4dsNX1rS9MvvEGpLK+naFZ399Ba3Os36QBpnstMhle9ulhUytBBIIwXIFfSX7I37Hvxf/bM+IWq+AvhPo15dnw54Z1PxZ4p11dLv9Q03QdKsIJGto7k2cZV9T1m7T7FomkiaO/1idLmLSoL66t/skninxP+GHjT4O+NNW8A+PtJ/sjxHpH2aSaGO5t72zu7O9t47uw1DT7+0kltryyvLaVJEeNxLBKJrK9htdRtbu0t/wCK8xWd5gv9Zs1pYrF0MxxtWEswrqfscTiKTjKrQVSLXIoxahCMOSMYxlClrSkof9OPBtTww4Rk/A7gDMMh4fzTg3hrA4ijwhlc8P8A2jkmUY+NWlgM0ng60ZrE1KtWDxWIq4j6xWq1a1HFZgnHH0KmI/uN/Y5/4Ixf8E9/AHgDwx40Glx/tQatr1tYeINM+KPjLULpdJm2tfta3PhfwroN/aaVoccK3aRT22ptrOsWep6ZBJNe22o2XlwfsR4V8B+BvAlvJZ+CPBnhTwbaTQ2VtNa+FfDuj+HreW301JYtOt5INIs7OJ4bCKeaOyiZTHapNKkCxrI4P8MH/BKP/grN4m/Yw8TJ8M/jHq2ueKP2bdee3R9PER1S9+G17GZ/N1/w3bwW0mqXMdzDJBb32kie4tp7bT7KztrW0Iiv9P8A7qPCXi3wz488M6J4y8G63p/iPwv4j0+DVNE1vS5xcWWoWVwMpLE4wyOjB4bi3mSO5tLmOa1uoYbmGWJP7B8NM64TzrJqcuH8twGUYvCwhTzDLaNKlHFYep70Y1Z1UnXxVCs1N0sVVnOc05QqtVVOJ/zi/Tb8NPpBeGfiTi6PjBxpxV4h5Dn+JxWL4Q41zHG4+tkecYNOhWq4HD5fKUcsyPM8sTwtPMciwOHw+Fw0oUK+AhUwFTC1pTa/4Y8N+K7OLTvFPh7Q/Emnw3KXsNjr+k2GsWcV5HFNBHdxWuo29zBHcxwXNxCk6oJVinmjVwkrhvjX4/8A/BOn9lL9obTL6DxZ8LfDNjrM/wBmls9Z0/SbVorGfTrO5t9Nhi0aQDT7LTI7i4+2ahb+HV8PajqTNextrEA1fVnvPuaivv8AGZfgcwpTo43B4bFUqi5Zwr0YVE1Zr7UW07NpNNNXdmfyPw9xdxTwljsPmXDHEOc5DjsJU9ph8TlWY4rBTpz5ozbSoVYRkpThCUozjKE3CLlF8qt/Ef8At0/8EKfif8C9N1f4hfA68Txp4H013luNMuL2SW/S1KC00y2s99u99Drmo3FnLdXVrqpHh6O71vS9D0vxVe6mbeyvP5/P+Jjo2o/8vulatpV7/wBN7HUdN1Gxn/7ZXNne2dzF/wBM57eeP+CROP8AVqvbKz1Kzu9O1G0tr/T7+2nsr6xvYIrqzvbO6ieC6tLu1nSSC5trmCR4Z4JkeKaJ3jkRkYg/ys/8FmP+CW15f2mmfGz4KWtlPPZTXumnQ5DEuu6vHPbNqNt4Smvp5Rc6tPpNtpmp3PgrUJzPcTWcmo+HteuRfQaJqesfzp4jeEWHwmHrZ5wrSqU1RXtcVlVNc6a543qYP3oyp8kW5exipuTSVNKT1/2Z+hh+0TzbPs4yzws8fMwwmL/tOawOR8fY2Sw84S9hW5MFxI/ZVaeMeKrKlRWZVp4f2KqTqYypUpxbh3n/AARQ/wCCseq/FS58Mfse/tEa5NqvxAMOoWnwn+IOqzWFvN4istOtL3VYfBmryKljBLe6dpdq9h4dKpLqd0lraWAOpm4H9kf051/lJaJrOqeHNZ0jxDod7NputaDqdhrOj6jbELcafqml3UV9p97bsysomtbuCGeIsrASRqSpHFf6Mf8AwTH/AG04P25f2V/CnxQ1ebSYfifoFzc+C/i7o2lRwWVvY+MtJWORdUtNKTUdRubDSfE+kz2Gt6eLhoU864v7O2jEdgwX6Hwb4+rZ5h58NZvXlWzPL6Cq4DFVZc1TGYCnyU50qspPmqYnCNxftJOU61CfNL3qE5z/AB79pL9EjLPCzOML41+HWWUcv4H4uzSWA4ryLA0FSwfDXFeMdfFYfHYChRiqOEyTP4QrwWEp06WGyzNMP7Gi/Y5phMNhv0Kooor92P8AKU+Iv+Cinxyg/Z8/ZG+LXj13uY7mTQrvQ7BoNOg1OKWe+sL67u9PvbaeeBltta0jTtS0NLi3kjntrzUrSZbrTI0k1fT/APNp1LULzV9Rv9V1Cb7Rf6ne3WoX1x5cUXn3l7PJc3M3lQJFDF5s0rv5cMccSbtsaIgCj+1n/g4r8VXll+yv4W8K6frnlQav4mtbnxH4fiu4n+0WcWueHJ/D+oX+nFneLbf6Zqkek6kYopT5GtWVpcGGXVIJP4zPhx4U/wCE7+IfgPwP532b/hMvGfhfwp9o8zyfI/4SLXLHSPO837NeeV5X2zf5n2S62bd32afHlN/Jfjlj8RjuK8vyeF3SweBoulHmtGeIx9WXM2r8t0qdOHM/eXvR0SV/+hL9lbwllPC3gBxl4j4lQjjeI+Kszjj63sU62HyfhPL6MqMI1HFVHGrPGYzEOjB+yko0Kicpyah/eZ/wRH/ZV079m79iXwZ4nvbG5g+IX7QUdn8V/Gk2oadqOlX9tp1/bPF4G8PPZ6jL5gttI8OSLqEVwlrZpd3mvahcRrPbSW1xJL/wUs/4JoeA/wBrDwVq/iXQNAhh8e2EOr6pbtptlJLqlprd9ZvFP4s8NWlndafLqOpSypbXfivwU93Fpvj9bG1vokh8aWFjdar+tWi6Pp3h7R9J0DR7f7HpOh6ZYaPpdp509x9l07TLWKysbfz7qWe5n8i2gii864mmnk275pZJGZzpV/R1LhTKP9WcLwviMLRrZfh8DRwjg4KznTgufER5rtValbnryn8TqTcm7ts/xdxvj/4hvxuz7x1yjPcwyzjDOOKMw4hjiaeIkpU8NisRP6tk9T2bjCeX4PLVQyqlhlH2MMFQp0IwVOKif5b/AMa/gb8QfgD4xl8GfEHToYLtoRd6XrGmyXF14f8AEFgSFN/omoXFrZy3MMcpMNxDcWtre2kw8u7tIGaPf+q3/BKP/grN4m/Yw8TJ8M/jHq2ueKP2bdee3R9PER1S9+G17GZ/N1/w3bwW0mqXMdzDJBb32kie4tp7bT7KztrW0Iiv9P8A6Yf+Cjv/AATi8DftS+Bte1jR9B/4qX/SdYvrHR7aP+2BrHlsX8YeD0C/8jL1bxB4fUfZfG1r5skcX/CS7l8QfwnfHT4F+Of2f/HN54K8a2f/AD0utB161jk/sfxNo/mFIdU0uZx9I72ykP2rTrrdb3C/6uSX+W+IuHeIfCrP6Oc5NXqvAqo3hsS1KdKVObtLB4+nFxjVo1E1G0mve5dY1o0qs/8AeHwc8ZfB76fnhJmXhr4mZXgIcUvBxWcZLGVHD5hRxeHjz0eJeEsXWp1qmAzLCSi6rdCM/wB17a9OvltbH4HD/wCnx4S8W+GfHnhnRPGXg3W9P8R+F/Eenwapomt6XOLiy1CyuBlJYnGGR0YPDcW8yR3NpcxzWt1DDcwyxJ0VfwOf8Eo/+Crnib9hjxMnwz+Jb654v/Zo8X65bzavpENwb29+Fl7emdNS8ZeDdNeCSe5juZ5LO58R+HLa8trbULa2vL6xs5vEEyPcf3d+CfG3hH4k+EfDvj3wF4i0nxb4M8W6TZ674b8SaFeRX+k6xpN/EJrW9s7qElHjdDtdG2ywSrJBPHFPFJGv9J8D8c5ZxrlqxGGccNmWHjFZllkp81XDTbaVSm2outharV6VaMdL+zqqFWMon+KH0pfosccfRi40lk+dQrZzwZm9atU4L44o4b2OBz3C04wqVMHi6UKleOWZ9gIzVPMMsrVeaXKsbgpYjAVqVd9RXNeMfCej+OvC2veENfh8/SfEOmXOm3e2O1knt/PT9xf2X222vLaHU9MuVh1HS7qW2n+xaja2t2kZkgSulor7WUYzjKE0pRnFxlFq6lGSaaa6pptNdj+YqNarhq1LEUKkqVehVp1qNWD5Z0qtKanTqQktVKE4qUWtmkz/ADev+Ckn7Osn7On7T3jbRLb+z/7F8TarretWkemSM9jY63aa3faT4v060SWK0nXT18Q2l1qmkA2Fnbw6Nq2nWEMYmsLqOH9Kf+Dcn4/6t4H/AGpvHv7P8o+0eGfjp4Gk1tEknlH9neLvhXBqmsadd2sK2V0v+neHdY8TWt+DdaZFP5GmyTz3c9hp9o3tP/ByN8P7Ow8W/Cjx3awXM8+oyxLqN7PdxeVYXmvaPfaQmn2VnH5DtbX+n/C2xvHlnivpbe8tLvF7bQX0Nm34pf8ABNTxNbeEP2+f2S9evdY0/QLG3+Nvgyzv9V1S5srPT7bT9Zvxot8tzdaiVtLdLq01Ca0WaR0eN50a3kjuBE6/xviKX+pni7h1hH7OhDPcI4pSUF9TzVwo4uD5k4Qg6eJxEVFXjCHLFSi43j/0m5Lj/wDiZb9nZnEuI4vF5riPCvPo1alSlLE1P9YeAoV8z4fxUVRqwxGIxMMVkmUVqlWXs6uKxCq1J0a1Oty1v9KCiiiv7KP+a0/mh/4OKtH1GD4T6Dr8tvt0nU4vBuj2V350DefqOh+KvEF7qlv5Cym5j+y23iHR5fOmhjgn+2bLeWaS3ukg/k2+AeoWekfHX4LarqE32ew0z4s/DnUL648uWXyLOy8YaNc3M3lQJLNL5UMTv5cMckr7dsaO5Cn+3v8A4LpfCnUPiR+yFqF7Z2Sak3hqPXJ7Sytgj62dZh/sXxlYz6TFNaTxOg03wHrdlqKQTQ6pdW9+umaZFcTahIYP4Mba5uLO4t7yzuJrW7tZorm1uraWSC4triCRZYLi3niZJYZoZVWSKWNlkjkVXRgwBH8f+M9KeB46w+NcG6U8Jgq9Nv7cqFadSrBOyWkpxW90pK/d/wDRn+zQx+F4q+irnPDMcRTp5hQ4i4myvGRpvXDUMzyvB4HL684uU5p1KOGqTbceWc6c3BWvCH+r1RXzH+xp8f8ATP2nv2Y/g18abG++26h4v8DaDN4sSS2s9PurLxra6db23iu1utLsbm7g0vfrMdzfWFqJdsmj3mm3sC/Zbu3Zvpyv65wuJo43DYfGYeanQxVCliKM1a0qVaEalOWja1jJPRv1P+eHPclzHhvO834ezfDywma5HmeOyjMsNNSUqGOy7E1cJiqTU4xl7lejOKbjFtJOyuFfkt/wUd/4JxeBv2pfA2vaxo+g/wDFS/6TrF9Y6PbR/wBsDWPLYv4w8HoF/wCRl6t4g8PqPsvja182SOL/AISXcviD9aaK5c1yrA5zga+X5hQhXw1eEoThOKlbmTXNG6dmr+jWjume5wHx5xP4bcT5XxdwjmmJyrOcpxNLE4fEYerOlzulUjUVOp7OUXKEnFPdSjJKcGpJM/y3/jf8EvGvwF8ear4G8Z2Mwa1mZtG1+KyvINE8U6W0cE8Gq6Hd3UMcV5CIrmGG/jt5JzpepLc6XduLu1lUfpv/AMEpP+Crfi79hjxdb/Db4k3GreLf2XfFurCXXtBiMt/q3ww1a/lVbjxv4It2Yu9o7kT+KvCsBWLWYlfUtNSLXomXVP6gP+Cjv/BOLwN+1L4G17WNH0H/AIqX/SdYvrHR7aP+2BrHlsX8YeD0C/8AIy9W8QeH1H2Xxta+bJHF/wAJLuXxB/Cd8dPgX45/Z/8AHN54K8a2f/PS60HXrWOT+x/E2j+YUh1TS5nH0jvbKQ/atOut1vcL/q5Jf5D4k4a4g8Lc/o5zk1eqsGq0pYTFxjKVNUpy97A42DbVWhUjanJTfvu13GqqVSX/AET+Cnjb4Q/Tz8I8y8M/ErK8FPiSpl9Knn+QVqlKjjJ43DUP3XFPC+JjThLAZpg63tMXSeFg3h4uo4wr5fPH4Sh/p5eCfG3hH4k+EfDvj3wF4i0nxb4M8W6TZ674b8SaFeRX+k6xpN/EJrW9s7qElHjdDtdG2ywSrJBPHFPFJGvUV/At/wAEpP8Agq34u/YY8XW/w2+JNxq3i39l3xbqwl17QYjLf6t8MNWv5VW48b+CLdmLvaO5E/irwrAVi1mJX1LTUi16Jl1T+8HwT428I/Enwj4d8e+AvEWk+LfBni3SbPXfDfiTQryK/wBJ1jSb+ITWt7Z3UJKPG6Ha6NtlglWSCeOKeKSNf6V4G45y3jbLViMO44bMsNGEcyy2U71MPUeiq0m7OrhKrTdKqldO9Kqo1ItP/Ez6VH0V+Nfow8ayyjN41s54KzmtiKvBXGtLDunhM4wdN88sBj4w5qeX8Q5fTlCOYZfKfLOPLjcFKtgq0Jx/l9/4OTNYt7XSPhRoxkh+3avc+E7mKCWyjuJGsNK/4W4b24trqW3lWwmhu77S4mlt57W9nt7q4tY2lsZdRiP84/7FHgi4+JH7YH7MPgi1v4dLl8RfHj4WWbajcQyXKWVunjLSLq8uVto2ja6mitLedra1M1tHc3Aiglu7SKR7mL9W/wDg4N+Pf/Cw/wBq7T/hTpmrf2lofws0WKKdP7I+w/Y9YuY1tLvSPttxBbXd/wD2Tq9v4kuPPSJ7WX+28RalqVrDYQaT84f8ESPgvrHxd/4KGfBvUbSzuZND+Ejaz8VvEuoron9sadp0Hh3TLm30NNQke5tYNLk1HxNqGkWWmaizTz2uovBcW1nO8DNF/OPFrhxB4u08HhoyxFN53leXzUWrSjQrUfrbjKM2lCmvbNzTi0oSlZNXf+0f0eliPCL9ndi+JM6q0cpxK8MeOuLsPOvTlJ0q2Z5dmEeHoV6FTDRlLE4ycctp06EoV1UliKNPnlGXJD/QWooor+xj/m3PL/jV8OLf4ufCvxt8OrloQvibRntrdbsxiwl1CzuINT0u31USWOpB9GudSsrS31mJLG4nm0qS8it1Wd45E/zS/wBpz4J6x+z38bfHXwu1izubH+w9WuJNMgvYPsl4mkXM0rWUV3YSahqd7YXNnslsJ7TVLkapHLaO17DDK5Qf6glfzh/8Fvf+CeP/AAtzwufj18OdH1a68W6FHqd5c6foemaOLVtRvRpEU+n32yfTp3tvGE9s19bX1ysz6f4wXUGa9vr3xva6S3494xcH1eIskp5lgaTq5lk/PUjCKvOtg5616UVvdNKpFRTcpxinyw5pL/R39nB9I3BeDfiji+DOKcfHBcFeJH1bB18TWkoYbLeIcPeGVZjWk7RVOUZzwVadSpCFLD161SKq11Ro1PhX/ggb/wAFFNP+E3ia8/Y4+MfiHT9H+HPjbUNR8Q/CHXr+zdI9A+IV8bWTWfDGq62k62+neHfEljaT6nY3Go2otLDxBb3CS6jbR6yFX+yav8oz/iY6NqP/AC+6Vq2lXv8A03sdR03UbGf/ALZXNne2dzF/0znt54/4JE4/r5/4Ja/8FyvD/jHS/Bn7PX7aHiKHRfHsM1p4W8I/HjWLiZdL8aCc21p4esviPOtm9po3iBGE1jqXjzUr+z0vVWbSrvXEh1CXXNem+O8IvEnDUMNR4T4hxUcNKg1SybHYiTjSdNysstxFWcrUp0pO2DlPlpOl/szlCVOjGr/SP7RL6E+eZpneY/SB8Hskq5zRzWnLH+JPC2T0FWx9LGU6XPV40yfA4alz4/DY6jD2vEdCh7bGwxt86hTxNDF5jUwH9PVFVrK9s9Ss7TUdOu7a/wBPv7aC9sb6yniurO9s7qJJ7W7tLqB5ILm2uYJEmgnhd4ponSSN2RgTZr+kk01dO6eqa2a7n+KUoyjJxknGUW4yjJNSjJOzTT1TT0aeqejCvyW/4KO/8E4vA37UvgbXtY0fQf8Aipf9J1i+sdHto/7YGseWxfxh4PQL/wAjL1bxB4fUfZfG1r5skcX/AAku5fEH600V52a5Vgc5wNfL8woQr4avCUJwnFStzJrmjdOzV/RrR3TPsOA+POJ/DbifK+LuEc0xOVZzlOJpYnD4jD1Z0ud0qkaip1PZyi5Qk4p7qUZJTg1JJn+XL8dPgX45/Z/8c3ngrxrZ/wDPS60HXrWOT+x/E2j+YUh1TS5nH0jvbKQ/atOut1vcL/q5JfvL/gnx/wAFXvjf+wno/iv4d2XmeOPhF4otr6607wtqUyz3Xw98XXWGbxX4HN6Xsrdr7Drq+gX0cuhX181trc1nLd2t7a6x/RX/AMFrfg3+yHbfCLWfG/xW8Z+EPA/i3U3N7pHhQ3YXxn4h8VX/ANpttP8AFfgPRdLstV1uPUJr6B4vGUp0l/C+rabHe6rrFzZavaXUuufw+V/GfFGVY/wy4qjLJM2jTquFSrhpUK0ZYmjhqr5ZYfG0byfsqidqarK9RQcledKNWX/Sv4E8e8JfTk8A6+H8UfD+pi8FDE4TL87hmmW18Pk2ZZzgY+2pZxw1mPJRjHH4OpHmxcssqcmEeJhSm44XMKmX0+z+InjjWPiV458VePNefzNW8Va1eavd/Lar5f2iQ+Rb/wChWlhbP9ltlhtvNjs7fz/K854lkkev7H/+DeT9kef4VfA3xh+0t4t0T7J4s+Of9naZ4Pu7tdRgvrT4a6RNLeqLaCaJNMudM8T6m+n6zHqtjcXb3JsYNNuI7C40idLr+cn/AIJqf8E+/HX7fHxug8NWtte6N8H/AAX9n1j4teP2huo7DSdOkYjT/DemXUcDQ3vizxHMrDT9GF1ZTtpVprGpm9s4tPM4/wBEvw54e0bwl4e0Lwp4c0+HSfD3hnRtL8PaDpVsZDb6Zo2i2MGm6Xp9uZXklMNnY20FtEZJJJDHGu92bLH7/wAE+EsTjcxxHGmaU5ulSlXp5ZOtH3sXjcRzwxmNjzJXjRjKdGNRXjOtWqqLU6ErfyP+0++kFkfDXBmT/Rk4FxWGhi8bSyrGccYXLayVLh/hrJ1ha/DPC9ZUpSVOtmVahhsyrYObhWw+W5dl86sZYfNafNs0UUV/Tx/heFVr2ys9Ss7vTtRtLa/0+/tp7K+sb2CK6s72zuongurS7tZ0kguba5gkeGeCZHimid45EZGINmihpNNNXT0aezXZjjKUZKUW4yi1KMotqUZJ3TTWqaeqa1T1R/Kr/wAFV/8AgjLeeJddvfjd+zbYQW89/wDbL3xPo8638lpHFZ2dxfXD61cWVpqFzbm2trWT+zvF95CbOe2jGmeNb+0vrax8Sa5/KT4n8KeJfBes3nh7xZoep+HtasJri3utO1W0ms7hJLW6uLGdkWVQs8K3drcwLcwNLbyyQSCKVwpNf6sFfnN+1Z/wS7/ZU/au0uRPEvgfTPCviSOEQ6d4k8N6fHaPpw3WKL9ls7GfTJ7CGGG1mlj0/QNT0PS9Q1S7k1LxLY+ISptpPwjjvwbw+dV6+a8O1KOBzCs5VK+Cq3hg8TVdryhKKl7CpN3lJqPI222m3c/1b+il+0nznwwyzKuAfGTB5jxXwfl9Ojgss4kwPLieI8kwVN1FGjiKVapS/tbCYeDp06NOVVYmnThClSqRpwUX/ER+y7/wUr/bJ/ZBs30T4O/F3U08HPgjwD4ytbfxp4Ktm83Tmkk0vRddFwNBmmt9NhsZZtAuNLlNnLOiukrpNH+2Pw4/4Oa/FFulzD8Xf2VdA1aUwq1nqHw4+Iuo+HUW4W4m3xXOj+J9A8UNJDLaSQBbiLXI5ILi0mY21zFqKLpfi3x6/wCDdv8AaC8OXuoan8FfFHhnxVo62d9q7aVqN9OY9MjW/uZU0ez1BLVPFGtXlrpCARW1p4Kvbi+uI7OK2u7271O4ttJ/OPxN/wAEk/8AgoZ4bR50/Zj+IniK0jhhlluPDOlyajIkk1wbcWyaZOLPWrmaMmOaZrPTLi3it5RM1wFhuvs/5hh5eMPBlsJhaee/VaStToxwqznBKnFyS9hCpRxao0/ebapxotaOSTSt/dWcUv2cH0mHLiLPMV4WLPcwbnjMwr55U8NOJnjKvsZSWa4jCZjw9LMsb+7hCFTGVcyjO9SGHqVFVqc/7o3P/Bzl4FS3uGs/2QvFs92sMrWsFz8YdHtbea4CMYIri6i+H15LbQyShUluI7O6khQtIltOyiJvg342/wDBxH+2L8SNCv8AQvhr4X+HvwM+3211Ytrvh2C68V+JILW+s4oJ5rW/8UJPZ2erWs6SzaTqdjplp9giup0mtr29isNRsvzq0L/gmb+354l/s59F/ZM+M93batbJe6dqUnhSey0e7s5rU3sF3FrV9JbaSba6ttstpO16sV35kKWzyyTwo/2P8GP+CBv7f3xS/su98V+GPBnwU0PUPtvnXnxH8V2smsWH2T+1Yo/tPhjwpH4h1dPtV3p9tFD5yW+611Wx1CPzbUXJg3lxL405/bB0aefQVSLi3hMlhliam4JyljY4PDulbmj7/wBYpqMZOV1FtnlUfBP9mT4SuXEWZY7wmxVTB1Y1oU8/8TMTxvNVMPCtUVKjwvPiPN4Zg5exqv6u8mxk61WEaShOfs6Z+RHxD+JHj34s+LNT8d/EvxbrnjfxhrTpJqviPxFfzajql9IgxvuLmYlnd2LzStw01zLPdTF7ieaWT9CP2Af+CV3x/wD25vFOl3sOmat8MfghFciTxH8YPEPh3Uzp09hFAlxPaeBra5jsLLxbrkv2iwgit4tUtrO2S/XUJ7iS3sruIf0k/suf8G+X7Kfwgl0PxH8dNV1b9ofxZYW1vcXWkapFN4a+HQ1iazeG/jfw9YX8t9ruk2dw0UujQ6rfxbpY7i41e2v4bq10/Sv3wsrKz02ztNO060trDT7C2gsrGxsoIrWzsrO1iSC1tLS1gSOC2traCNIYIIUSKGJEjjRUUAfTcKeCOOxOKWZ8a4n3XVjWlllDESxGJxc5Nzqf2hjoytTUpWU1hqlarVvJ+3otJy/D/H/9qHwvkuRz4H+jDkbVSlgquWUON80yejlGSZBh6UI4fCPhDhatS5sXKjRUnh6mdYLLsDgnToxWU5hTnJUfF/2dP2dPhL+yr8JfDPwX+C/hmHw14M8NQliWMdxrPiLWbiOJdV8VeKtVWKGXWvE2tSwxy6jqMsccaRx22nadbWGj6fpum2fuNFFf0pQoUMLQpYbDUqdDD0KcKNChRhGnSpUqcVGFOnCKUYQhFKMYxSSSSSP8Ts2zbM8+zPMM6zrMMZm2b5tjMRmGZ5nmOIq4vHZhjsXVlXxWMxmKrynWxGIxFac6tatVnKc5ycpNthRRRWp54UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAf/2Q==">
      <Prereq />
      <Languages>
        <Language Code="ENU" LangName="English" />
      </Languages>
      <Document TranslateID="Document">
        <ENU>http://www.scia-online.com/</ENU>
      </Document>
      <CalculationName TranslateID="CalculationName">
        <ENU>Shear design</ENU>
      </CalculationName>
    </Header>
    <Styles>
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" />
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|1|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
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
      <Variable Modifier="Public" Name="A↓c←" ESA_ID="" Type="Double" Value="100e-3" Precision="3">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="a↓l,min←" ESA_ID="" Type="Double" Value="227.5e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="a↓l←" ESA_ID="" Type="Double" Value="955e-3" Precision="2">
        <Description TranslateID="VARIABLE_a↓l←">
          <ENU>Lenght to be increased  in tension banzo force diagram</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="A↓ss,fin←" ESA_ID="Result.1" Type="Double" Value="1.158588e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="140" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←/m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓ss←" ESA_ID="" Type="Double" Value="1.158588e-3" Precision="2">
        <Description TranslateID="VARIABLE_A↓ss←">
          <ENU>Required tranversal reinforcement per meter</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←/m" />
      </Variable>
      <Variable Modifier="Public" Name="A↓sw←" ESA_ID="" Type="Double" Value="39.26991e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-6" Dim="mm↑2←" />
      </Variable>
      <Variable Modifier="Public" Name="ActCombiId" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="b↓w←" ESA_ID="Result.8" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_b↓w←">
          <ENU>Cross section width for calculation shear</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="120" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="cm" />
      </Variable>
      <Variable Modifier="Public" Name="bReinforced" ESA_ID="" Type="Boolean" Value="0">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="bReinforcedBars" ESA_ID="" Type="Boolean" Value="1">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="c" ESA_ID="MemberData.c" Type="Double" Value="30e-3" Precision="2">
        <Description TranslateID="VARIABLE_c">
          <ENU>Concrete cover, NBR6118/2014 Table 7.2</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="calc" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Combi↓key,out←" ESA_ID="" Type="String" Value="-">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Combi↓key←" ESA_ID="" Type="String" Value="1.40*LC1+1.40*LC4">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ConcreteDiagram" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="Result.9" Type="Double" Value="955e-3" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>Effective height</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="120" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="cm" />
      </Variable>
      <Variable Modifier="Public" Name="DescriptionN" ESA_ID="" Type="String" Value="Transversal reinforcement is designed as maximum from Y-axis and Z-axis.">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="designMethod" ESA_ID="MemberData.designMethod" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_designMethod">
          <ENU>Model of calculation</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DrawAxis" ESA_ID="" Type="Boolean" Value="1">
        <Description TranslateID="VARIABLE_DrawAxis">
          <ENU>Draw axis</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="DrawStirrups" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_DrawStirrups">
          <ENU>Draw stirrups</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="dx" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="E0↓1←" ESA_ID="" Type="Boolean" Value="1">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="EWNMessage" ESA_ID="" Type="String" Value="List of errors/warnings/notes: N6/1, N6/2, N6/3, N6/4, N6/5, N6/6, N6/7, N6/8, N6/9, N6/10">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="f↓cd←" ESA_ID="" Type="Double" Value="21.42857e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓cd←">
          <ENU>Design value of compressive strength, NBR6118/2014 section 12.3.3</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ck←" ESA_ID="" Type="Double" Value="30e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ck←">
          <ENU>Characteristic value of compressive strength, NBR6118/2014 section 8.2.4</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ct,m←" ESA_ID="" Type="Double" Value="2.89647e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ct,m←">
          <ENU>Mean tensile strength, NBR6118/2014 section 8.2.5</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctd←" ESA_ID="" Type="Double" Value="1.448235e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ctd←">
          <ENU>Tensile strenght, NBR6118/2014 section 17.4.2.2</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ctk,inf←" ESA_ID="" Type="Double" Value="2.027529e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ctk,inf←">
          <ENU>Lower characteristic resistance, NBR6118/2014 section 8.2.5</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ywd←" ESA_ID="" Type="Double" Value="434.7826e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ywd←">
          <ENU>Vertical stirrups strength, NBR6118/2014 section 17.4.2.2</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="f↓ywk←" ESA_ID="" Type="Double" Value="500e6" Precision="2">
        <Description TranslateID="VARIABLE_f↓ywk←">
          <ENU>Characteristic yield strength, NBR 7480/2007 Table B.3</ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="ForcesId" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="FormCode" ESA_ID="" Type="Double" Value="2003" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="fraction" ESA_ID="" Type="Double" Value="-159.8562e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Functions1D" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="G" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>height of cross-section</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="cm" />
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="IdCSS" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Index↓load←" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="IndexEWN" ESA_ID="" Type="Double" Value="6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="isColumn" ESA_ID="" Type="Boolean" Value="0">
        <Description TranslateID="VARIABLE_isColumn">
          <ENU>The member is</ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="j" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="loadID" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓0←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓s,max,y←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓s,max,z←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="M↓s,max←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓y←" ESA_ID="" Type="Double" Value="-36437.3" Precision="2">
        <Description TranslateID="VARIABLE_M↓y←">
          <ENU>Moment in y-direction</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="M↓z←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_M↓z←">
          <ENU>Moment in z-direction</ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="minDim" ESA_ID="" Type="Double" Value="500e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="m" />
      </Variable>
      <Variable Modifier="Public" Name="My" ESA_ID="" Type="Double" Value="0" Precision="4">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="MyReinfMat" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Mz" ESA_ID="" Type="Double" Value="0" Precision="4">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="2" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kNm" />
      </Variable>
      <Variable Modifier="Public" Name="N" ESA_ID="" Type="Double" Value="7558.28" Precision="4">
        <Description TranslateID="VARIABLE_N">
          <ENU>Normal force</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="N↓s,min←" ESA_ID="" Type="Double" Value="NaN" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="n↓w,fin←" ESA_ID="" Type="Double" Value="2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓w.out←" ESA_ID="Result.11" Type="Double" Value="2" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="81" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓w←" ESA_ID="MemberData.nw" Type="Double" Value="2" Precision="0">
        <Description TranslateID="VARIABLE_n↓w←">
          <ENU>Number of branch</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NameConcrete" ESA_ID="" Type="String" Value="C30">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="NameReqReinf" ESA_ID="" Type="String" Value="CA-50">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="noerror" ESA_ID="" Type="String" Value="There are no errors, warnings and notes">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Number↓E←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Number↓N←" ESA_ID="" Type="Double" Value="10" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Number↓W←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NumberEWN" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="obEWN" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="obEWNBorderPen" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="obEWNCellsFont" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="oExtCalc_DrawCSSReinf" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="opTableWhiteGridPen" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Outline" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="possibleDiam" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintEWN" ESA_ID="" Type="Boolean" Value="1">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="PrintobEWN" ESA_ID="" Type="Boolean" Value="1">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="reinf" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Reinf" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ReinfClass" ESA_ID="MemberData.ReinfClass" Type="Double" Value="50" Precision="2">
        <Description TranslateID="VARIABLE_ReinfClass">
          <ENU>Class of shear reinforcement</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ReqReinfMat" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="resultValues" ESA_ID="" Type="Object">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="s" ESA_ID="Result.13" Type="Double" Value="33.89463e-3" Precision="2">
        <Description TranslateID="VARIABLE_s">
          <ENU>Stirrup distance</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="0" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="cm" />
      </Variable>
      <Variable Modifier="Public" Name="s↓fin←" ESA_ID="" Type="Double" Value="33.89463e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="s↓max.t←" ESA_ID="" Type="Double" Value="800e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="s↓max←" ESA_ID="" Type="Double" Value="300e-3" Precision="2">
        <Description TranslateID="VARIABLE_s↓max←">
          <ENU>Maximum stirrup distance</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="cm" />
      </Variable>
      <Variable Modifier="Public" Name="SecID" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Sel" ESA_ID="" Type="String" Value="Item = 'CA-50'">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Shape" ESA_ID="" Type="Object">
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
      <Variable Modifier="Public" Name="slist" ESA_ID="" Type="String" Value="List of errors/warnings/notes: ">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SolutionN" ESA_ID="" Type="String" Value="">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ss" ESA_ID="" Type="Double" Value="271.429e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="StructuralType" ESA_ID="" Type="Double" Value="1" Precision="2">
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
      <Variable Modifier="Public" Name="TableNBRReinf" ESA_ID="" Type="Object">
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
      <Variable Modifier="Public" Name="TypeMember" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_TypeMember">
          <ENU>The member is</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TypeN" ESA_ID="" Type="String" Value="Note">
        <Description>
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="typeofCombi" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="typeOfLimitState" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="typeOfLoad" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="TypeOfLoading" ESA_ID="" Type="Double" Value="1" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UCSPosition" ESA_ID="" Type="Double" Value="4" Precision="2">
        <Description TranslateID="VARIABLE_UCSPosition">
          <ENU>UCSPosition</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UserDimFont" ESA_ID="" Type="Double" Value="8" Precision="2">
        <Description TranslateID="VARIABLE_UserDimFont">
          <ENU>Dimension font in px</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="UserScale" ESA_ID="" Type="Double" Value="15" Precision="2">
        <Description TranslateID="VARIABLE_UserScale">
          <ENU>Graphics scale in 1:x</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="V↓c←" ESA_ID="Result.3" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="49" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="V↓c0←" ESA_ID="Result.7" Type="Double" Value="829838.7" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="49" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="V↓c1←" ESA_ID="" Type="Double" Value="79073.63" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Rd2←" ESA_ID="Result.5" Type="Double" Value="4.862314e6" Precision="2">
        <Description TranslateID="VARIABLE_V↓Rd2←">
          <ENU>Diagonal compression of concrete</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="49" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="V↓Rd3←" ESA_ID="Result.6" Type="Double" Value="432959.3" Precision="2">
        <Description TranslateID="VARIABLE_V↓Rd3←">
          <ENU>Design resistant of diagonal tension</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="49" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="V↓s←" ESA_ID="Result.2" Type="Double" Value="47932.9" Precision="4">
        <Description TranslateID="VARIABLE_V↓s←">
          <ENU>Shear force</ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="49" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="V↓sw←" ESA_ID="Result.4" Type="Double" Value="432959.3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="49" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="V↓sy←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description TranslateID="VARIABLE_V↓sy←">
          <ENU>Shear force in y- direction</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="V↓sz←" ESA_ID="" Type="Double" Value="47932.9" Precision="2">
        <Description TranslateID="VARIABLE_V↓sz←">
          <ENU>Shear force in z- direction</ENU>
        </Description>
        <Unit m="1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1000" Dim="kN" />
      </Variable>
      <Variable Modifier="Public" Name="W↓0←" ESA_ID="" Type="Double" Value="3.33333e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="3" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-9" Dim="mm↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="Wy" ESA_ID="" Type="Double" Value="8.33332e-3" Precision="4">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="3" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-9" Dim="mm↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="Wz" ESA_ID="" Type="Double" Value="3.33333e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="3" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-9" Dim="mm↑3←" />
      </Variable>
      <Variable Modifier="Public" Name="α" ESA_ID="MemberData.α" Type="Double" Value="90" Precision="2">
        <Description TranslateID="VARIABLE_α">
          <ENU>Angle of stirrups</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="α↓c←" ESA_ID="" Type="Double" Value="850e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓V←" ESA_ID="" Type="Double" Value="90" Precision="2">
        <Description TranslateID="VARIABLE_α↓V←">
          <ENU>Resultnat of shear force</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="α↓v2←" ESA_ID="" Type="Double" Value="880e-3" Precision="2">
        <Description TranslateID="VARIABLE_α↓v2←">
          <ENU>Coefficient of shear strength, NBR6118/2014 section 17.4.2.2/3</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓c←" ESA_ID="" Type="Double" Value="1.4" Precision="2">
        <Description TranslateID="VARIABLE_γ↓c←">
          <ENU>Partial safety factor, NBR6118/2014 Table 12.1</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="γ↓s←" ESA_ID="" Type="Double" Value="1.15" Precision="2">
        <Description TranslateID="VARIABLE_γ↓s←">
          <ENU>Partial safety factor, NBR6118/2014 Table 12.1</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ε↓min←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="θ" ESA_ID="MemberData.θ" Type="Double" Value="45" Precision="2">
        <Description TranslateID="VARIABLE_θ">
          <ENU>Angle of struts</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="θ↓.out←" ESA_ID="Result.10" Type="Double" Value="785.3982e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="57" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="θ↓max←" ESA_ID="" Type="Double" Value="44.99999" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="°" />
      </Variable>
      <Variable Modifier="Public" Name="θ↓min←" ESA_ID="" Type="Double" Value="30.00001" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="λ" ESA_ID="" Type="Double" Value="800e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
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
      <Variable Modifier="Public" Name="ρ↓c←" ESA_ID="" Type="Double" Value="1.158588e-3" Precision="2">
        <Description TranslateID="VARIABLE_ρ↓c←">
          <ENU>Minimum shear reinforcement</ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="ρ↓sw←" ESA_ID="" Type="Double" Value="130.8997e-6" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="10e-3" Dim="%" />
      </Variable>
      <Variable Modifier="Public" Name="σ↓c,max←" ESA_ID="" Type="Double" Value="0" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="-1" kg="1" s="-2" A="0" K="0" cd="0" mol="0" Coef="1e6" Dim="MPa" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓l←" ESA_ID="MemberData.diameter1" Type="Double" Value="20e-3" Precision="2">
        <Description TranslateID="VARIABLE_ϕ↓l←">
          <ENU>Longitudinal diameter</ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓ω,fin←" ESA_ID="" Type="Double" Value="5e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓ω,max←" ESA_ID="" Type="Double" Value="30e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓ω,min←" ESA_ID="" Type="Double" Value="7.5e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓ω,possible←" ESA_ID="" Type="Double" Value="5e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓ω.out←" ESA_ID="Result.12" Type="Double" Value="5e-3" Precision="2">
        <Description>
          <ENU>
          </ENU>
        </Description>
        <ResultProperties ESAColor="1" ESAStyle="0" ESAUnit="84" Reference="" Extrem="0" HideZeros="False" ReverseAxis="False" DrawDirection="2" DrawLimitMax="1" DrawLimitMin="250e-3" />
        <Unit m="1" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1e-3" Dim="mm" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ↓ω←" ESA_ID="MemberData.diameter" Type="Double" Value="5e-3" Precision="5">
        <Description TranslateID="VARIABLE_ϕ↓ω←">
          <ENU>Stirrups diameter</ENU>
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
          <ENU>Full</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
        <Names TranslateID="LAYOUT_1">
          <ENU>Standard</ENU>
        </Names>
      </Layout>
      <Layout Active="False">
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
      <VC ID="INI400_000002">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
      </VC>
      <VC ID="INI400_000009">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_000024">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000026">
        <Set Vis="1" Prev="INI400_009586" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="INI400_009586" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="INI400_009586" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="INI400_009586" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="INI400_009586" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="INI400_009586" Style="1" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_000027">
        <Set Vis="1" Prev="INI400_009582" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="INI400_009582" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="INI400_009582" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="INI400_009582" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="INI400_009582" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="INI400_009582" Style="1" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_000040">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000046">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="16" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="16" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="16" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="16" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="16" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000047">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="15" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000117">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000118">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000119">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000124">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000125">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000126">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_000127">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000128">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000129">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_000130">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_000134">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000137">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000140">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_000142">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000143">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000145">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000146">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000147">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_000148">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000149">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000150">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000151">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000152">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000155">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_000156">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000157">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_000158">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000159">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000160">
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000161">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000162">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000166">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="31" />
      </VC>
      <VC ID="INI400_000172">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
      </VC>
      <VC ID="INI400_000173">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
      </VC>
      <VC ID="INI400_000177">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000187">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000188">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000189">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000190">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000191">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_000192">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000206">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000208">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000216">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000224">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000225">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000228">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000229">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000522">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="387" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="387" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="387" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="387" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="387" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="387" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|12.9|0|2" Font2="Arial|12.9|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000572">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="528" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="528" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="528" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="528" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="528" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="200" Y="528" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000621">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000626">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_000630">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000631">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="650" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="650" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="650" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="650" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="650" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="650" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000632">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="668" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="668" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="668" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="668" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="668" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="668" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000633">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="684" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="684" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="684" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="684" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="684" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="250" Y="684" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_000637">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000638">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_000639">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_000641">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_000643">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_000644">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_001247">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_001334">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_001778">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="173" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="185" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="173" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="173" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="880" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_001780">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="204" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="185" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="204" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="204" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="880" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_001964">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
      </VC>
      <VC ID="INI400_002849">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_003272">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_003273">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_003274">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_003275">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_003697">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_005278">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_005279">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_005280">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_005489">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_005799">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="34.6" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="231" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="7.99" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="212" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005815">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005865">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_005903">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006012">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006014">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006015">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006022">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006023">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006209">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006210">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006211">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006212">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006213">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006214">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006216">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006217">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006220">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006221">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006222">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006223">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006224">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006226">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
      </VC>
      <VC ID="INI400_006248">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006251">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006252">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_006257">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006259">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006260">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006268">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006270">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006271">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006272">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006273">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006286">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006287">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
      </VC>
      <VC ID="INI400_006294">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006295">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006296">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006297">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006298">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
      </VC>
      <VC ID="INI400_006299">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006301">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006302">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006303">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006341">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="31" />
      </VC>
      <VC ID="INI400_006376">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006377">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006389">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006390">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006391">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006392">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006397">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006398">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006400">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006402">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006406">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006421">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
      </VC>
      <VC ID="INI400_006422">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006450">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006451">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006452">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006453">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006454">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006455">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006485">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006486">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_006487">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
      </VC>
      <VC ID="INI400_006491">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006492">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_006493">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
      </VC>
      <VC ID="INI400_006496">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006497">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006498">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="516" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="516" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="516" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="516" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="516" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="516" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006501">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006515">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006516">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006521">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
      </VC>
      <VC ID="INI400_006522">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006531">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006532">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006533">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006534">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006535">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006536">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006537">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006541">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_006542">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006543">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006546">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006592">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006612">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006613">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006623">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
      </VC>
      <VC ID="INI400_006624">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
      </VC>
      <VC ID="INI400_006625">
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
      </VC>
      <VC ID="INI400_006626">
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Chapter" EqStyle="23" />
      </VC>
      <VC ID="INI400_006627">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006628">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006640">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
      </VC>
      <VC ID="INI400_006641">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006642">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006651">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="22" />
      </VC>
      <VC ID="INI400_006657">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006658">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006661">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006662">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006664">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006666">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006667">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_006668">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_006670">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_006673">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006675">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_006677">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
      </VC>
      <VC ID="INI400_006678">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
      </VC>
      <VC ID="INI400_007149">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007150">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007151">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007161">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007177">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007210">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007211">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007741">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007742">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007963">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_007964">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007965">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007966">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007967">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007968">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007969">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007970">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007973">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007974">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007976">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007977">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007980">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008668">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008721">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008761">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_008835">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_008965">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_008966">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_008997">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="24" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009021">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009022">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009023">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009024">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009025">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009031">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009032">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009033">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_009034">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="2" SpX="15" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009037">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
      </VC>
      <VC ID="INI400_009038">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="20" />
      </VC>
      <VC ID="INI400_009041">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_009042">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_009043">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009044">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009045">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_009046">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="2" SpX="15" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009055">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009056">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_009406">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009435">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009436">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009437">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009438">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009439">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009440">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009441">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009442">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009443">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009444">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009445">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009446">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009447">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009448">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009449">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009450">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009451">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009452">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009453">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009454">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009455">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009456">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009457">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009458">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009459">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009460">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009461">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009462">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="14.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="14.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="14.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="14.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="14.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="14.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009463">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="29" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="29" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="29" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="29" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="29" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="29" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009472">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_009473">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009474">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_009475">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
      </VC>
      <VC ID="INI400_009481">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009483">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009484">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009486">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009487">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009488">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009489">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009490">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009496">
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="22" />
        <Set Vis="0" Prev="" Style="1" StyleName="Formula 1" EqStyle="22" />
      </VC>
      <VC ID="INI400_009507">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
      </VC>
      <VC ID="INI400_009508">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009509">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009510">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009511">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009512">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009528">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="422" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009529">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009530">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009531">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009532">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009533">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009543">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
      </VC>
      <VC ID="INI400_009544">
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009545">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009548">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009549">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009550">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009551">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009552">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009553">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009554">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009555">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009556">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009557">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009558">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009559">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009560">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_009561">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_009562">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="30" Y="0" Hor="4" Ver="2" SpX="15" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009563">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009564">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009565">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009566">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009567">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009568">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009569">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="14" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="12" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009570">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_009571">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="14" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009572">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="13" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009573">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_009574">
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_009575">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="6" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="6" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="6" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="6" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="6" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009576">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="20" />
      </VC>
      <VC ID="INI400_009577">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_009578">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="6" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009580">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009581">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_009582">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_009585">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="7" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009586">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 4" EqStyle="23" />
      </VC>
      <VC ID="INI400_009588">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="50" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009589">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009590">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009591">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009592">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009593">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009594">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009595">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009596">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_009599">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_009694">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="324" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="324" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="324" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="324" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="324" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="324" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009695">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009696">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009697">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009698">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009700">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009703">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="188" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="185" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="188" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="30" Y="188" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="880" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009778">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009779">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009780">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009781">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009782">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009783">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009784">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009785">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009786">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009787">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009788">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009790">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009791">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009792">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009793">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009794">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009795">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009796">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009797">
        <Set Vis="0" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009798">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009799">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_009800">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010435">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="232" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="43.1" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010436">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="198" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="8.79" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010438">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010439">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010440">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010441">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010442">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010443">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010446">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010447">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010448">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010449">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010450">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010451">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010453">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010454">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010455">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010456">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010457">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010458">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010459">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010460">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010461">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010462">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010463">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010464">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010465">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010466">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010467">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010468">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010469">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010470">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010471">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010472">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010473">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010474">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010475">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010476">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010477">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010478">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010479">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010480">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010481">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010482">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010483">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010484">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010485">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010486">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010487">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010488">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010489">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010490">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010491">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010492">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010493">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010494">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010495">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010496">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010497">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010498">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010499">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010500">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010501">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010502">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010503">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010504">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010505">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010506">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010507">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010508">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010509">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010510">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010511">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010512">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010513">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010514">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010515">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010516">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010517">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010518">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010519">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010520">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010521">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010522">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="20" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010523">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010524">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010525">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010526">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010527">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010528">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010529">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010531">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010532">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010533">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010534">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010536">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010537">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="21" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010538">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010539">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010540">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010541">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_010542">
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_010543">
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010563">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 3" EqStyle="23" />
      </VC>
      <VC ID="INI400_010564">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010565">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010566">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010567">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010568">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010569">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010570">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010571">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010572">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="360" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="360" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="360" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="360" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="360" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="360" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010573">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010574">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010576">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010577">
        <Set Vis="1" Prev="" Style="0" StyleName="Subchapter 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010578">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010579">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010580">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010581">
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Formula 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010582">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010583">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010584">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010585">
        <Set Vis="1" Prev="" Style="0" StyleName="Remark" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010586">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1112" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="203" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="427" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010587">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1120" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="625" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="211" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="420" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010588">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010589">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010590">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010593">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010594">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010595">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010596">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010597">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010598">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010599">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010600">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010601">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010602">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010603">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010605">
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="Text 1" EqStyle="23" />
      </VC>
      <VC ID="INI400_010606">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_010607">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="501">
      <TPanel Name="TPanel" ID="0" Translate="0" AutoWidth="False" AutoHeight="False" TabIndex="0" Dock="5" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9.75|0|3" Collapsible="False" CaptionBGColor="-1" CaptionColor="-16777216" Collapsed="False">
        <Texts>
          <ENU>
          </ENU>
        </Texts>
        <TDoubleInput Name="UserScale" ID="36" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="UserScale" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="UserDimFont" ID="37" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="UserDimFont" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TCheckBox Name="DrawStirrups" ID="20" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="DrawStirrups" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000020">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TCheckBox Name="DrawAxis" ID="38" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="DrawAxis" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000038">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TCheckBox Name="DrawAdditionalDim" ID="21" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000021">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TDoubleInput Name="UserX" ID="41" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="" VarNameVisible="False" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="UserY" ID="40" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="" VarNameVisible="False" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TComboBox Name="UCSPosition" ID="33" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="UCSPosition" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1|2|3|4|5|6|7|8|9" Index="4">
          <Texts TranslateID="DIALOG_000033">
            <ENU>Bottom left|Bottom Centre|Bottom Right|Middle Left|Centre of gravity|Middle Right|Top Left|Top Centre|Top Right|User Defined</ENU>
          </Texts>
        </TComboBox>
        <TCheckBox Name="" ID="39" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="22" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="150|23" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="" BookMarkID="" ForeColor="-16711423" ChbRight="False">
          <Texts TranslateID="DIALOG_000039">
            <ENU>
            </ENU>
          </Texts>
        </TCheckBox>
        <TLabel Name="" ID="35" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="21" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|13.9|1|2" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000035">
            <ENU>Graphics setup</ENU>
          </Texts>
        </TLabel>
        <TDoubleInput Name="TDoubleInput" ID="23" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="V↓Rd3←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="22" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="V↓Rd2←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TLabel Name="TLabel" ID="19" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|13.9|1|2" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000019">
            <ENU>Cross section bearing capacity</ENU>
          </Texts>
        </TLabel>
        <TDoubleInput Name="TDoubleInput" ID="18" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="γ↓s←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="γ↓c←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TLabel Name="TLabel" ID="16" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|13.9|1|2" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000016">
            <ENU>Coefficients</ENU>
          </Texts>
        </TLabel>
        <TDoubleInput Name="" ID="53" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="23" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="ϕ↓l←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="ϕ↓ω←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="5e-3" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="n↓w←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="c" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TLabel Name="TLabel" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|13.9|1|2" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000012">
            <ENU>Reinforcement design</ENU>
          </Texts>
        </TLabel>
        <TDoubleInput Name="TDoubleInput" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="f↓ywk←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="f↓ctk,inf←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="f↓ck←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TLabel Name="TLabel" ID="8" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="13" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|13.9|1|2" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000008">
            <ENU>Material Characteristics</ENU>
          </Texts>
        </TLabel>
        <TDoubleInput Name="TDoubleInput" ID="7" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="14" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="b↓w←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="TDoubleInput" ID="6" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="15" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="h" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TLabel Name="TLabel" ID="5" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="16" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|13.9|1|2" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000005">
            <ENU>Cross section dimensions</ENU>
          </Texts>
        </TLabel>
        <TDoubleInput Name="" ID="55" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="25" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="M↓z←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="54" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="24" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="M↓y←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="52" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="V↓sz←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="51" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="V↓sy←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="56" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="N" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TLabel Name="TLabel" ID="2" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="18" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|13.9|1|2" Alignment="16" ForeColor="-16711423" BookMarkID="">
          <Texts TranslateID="DIALOG_000002">
            <ENU>Loading</ENU>
          </Texts>
        </TLabel>
        <TDoubleInput Name="theta" ID="58" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="θ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="45" MinValueWithDim="30" DescPos="1" />
        <TComboBox Name="" ID="60" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="designMethod" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="250" Values="1|2" Index="0">
          <Texts TranslateID="DIALOG_000060">
            <ENU>Design Model I (θ = 45°)|Design Model II (choose θ from 30° to 45°)</ENU>
          </Texts>
        </TComboBox>
        <TComboBox Name="" ID="1" Translate="0" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="ReinfClass" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="12|24" Index="-1">
          <Texts>
            <ENU>CA-50|CA-25</ENU>
          </Texts>
        </TComboBox>
        <TComboBox Name="" ID="44" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|10.7|0|2" VarName="TypeMember" VarNameVisible="False" InputColor="-1" DescPos="1" InputWidth="150" Values="0|1" Index="0">
          <Texts TranslateID="DIALOG_000044">
            <ENU>Beam|Column</ENU>
          </Texts>
        </TComboBox>
        <TConcreteSectionLibrary Name="" ID="32" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="1" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="" SelectedCS="1" Units="0" ReinfTabsVis="True" TabBG="-2894893" SelTab="-1">
          <CS SelReinf="0" H="500e-3" B="300e-3" />
          <Reinf Ver="1" Stirrup="0" Stirrup_D="8e-3" Stirrup_ss="150e-3" Stirrup_α="90" c_upper="25e-3" D_upper="18e-3" N_upper="2" c_lower="25e-3" D_lower="18e-3" N_lower="2" />
        </TConcreteSectionLibrary>
        <TCustomLibrary Name="" ID="34" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="20" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" TargetNodeURL="REINF.NBR" DataFile="EC_Reinf.xml" Collapsed="True" UseCombo="False" Category="Inclined top branch" Item="B 400 A">
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
                <P>B 400 A</P>
                <P>400</P>
                <P>1.05</P>
                <P>420</P>
                <P>347.83</P>
                <P>0.025</P>
                <P>0.0225</P>
                <P>0.00173913</P>
                <P>200000</P>
                <P>A</P>
                <P>true</P>
                <P>-0.025;-365.68;</P>
                <P>-0.0017;-347.83;</P>
                <P>0;0;</P>
                <P>0.0017;347.83;</P>
                <P>0.025;365.68;</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TCustomLibrary Name="TCustomLibrary" ID="31" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="19" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="200|0" MaxSize="0|0" BGImage="" BackColor="16777215" BorderStyle="0" Font="Microsoft Sans Serif|7.84|0|3" TargetNodeURL="CONCRETE.NBR" DataFile="EC_Concrete.xml" Collapsed="True" UseCombo="False" Category="Bilinear" Item="C 60/75">
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
                <P>C 60/75</P>
                <P>60</P>
                <P>75</P>
                <P>68</P>
                <P>4.4</P>
                <P>3.1</P>
                <P>5.7</P>
                <P>39</P>
                <P>2.6</P>
                <P>3</P>
                <P>2.3</P>
                <P>2.9</P>
                <P>1.9</P>
                <P>2.9</P>
                <P>1.6</P>
                <P>0;0;</P>
                <P>-0.0019;-40000000;</P>
                <P>-0.0029;-40000000;</P>
                <P>true</P>
                <P>32</P>
                <P>0.2</P>
                <P>2500</P>
                <P>16.3</P>
                <P>0.2</P>
                <P>4500</P>
                <P>0.0006</P>
                <P>1.00E-05</P>
              </Item>
            </Items>
          </Data>
        </TCustomLibrary>
        <TEMDLoader Name="" ID="61" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="26" Dock="1" Anchor="5" Padding="0|0|0|0" MinSize="350|4" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="2" Font="Microsoft Sans Serif|8.25|0|3" Active="1" PreDef="0" MemberDirectory="" MemberID="Beam.46" SectionID="-1" CombiID="-1" />
      </TPanel>
    </Main>
    <MemberData Width="500">
      <TDoubleInput Name="AngleOfStruts" ID="56" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="12" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="θ" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="45" MinValueWithDim="30" DescPos="1" />
      <TComboBox Name="" ID="55" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="11" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="designMethod" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="250" Values="1|2" Index="0">
        <Texts TranslateID="DIALOG_000055">
          <ENU>Design Model I (θ = 45°)|Design Model II (choose θ from 30° to 45°)</ENU>
        </Texts>
      </TComboBox>
      <TDoubleInput Name="" ID="54" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="10" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="ϕ↓ω←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="100" MinValueWithDim="5e-3" DescPos="1" />
      <TDoubleInput Name="" ID="53" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="9" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="n↓w←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="10" MinValueWithDim="2" DescPos="1" />
      <TDoubleInput Name="" ID="52" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="8" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="ϕ↓l←" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="100" MinValueWithDim="5e-3" DescPos="1" />
      <TDoubleInput Name="" ID="51" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="c" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="1000" MinValueWithDim="5e-3" DescPos="1" />
      <TDoubleInput Name="" ID="49" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="α" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="180" MinValueWithDim="0" DescPos="1" />
      <TComboBox Name="" ID="142" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="ReinfClass" VarNameVisible="False" InputColor="-4128832" DescPos="1" InputWidth="150" Values="25|50|60" Index="1">
        <Texts TranslateID="DIALOG_000142">
          <ENU>CA-25|CA-50|CA-60</ENU>
        </Texts>
      </TComboBox>
    </MemberData>
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item TranslateID="STRING_17D4AFD3">
      <ENU>"The stress was calculated for cross section without longitudinal reinforcement."</ENU>
    </Item>
    <Item TranslateID="STRING_202A0D90">
      <ENU>"Value b↓w← is calculated as width of cross-section in center of gravity perpendicular to shear force."</ENU>
    </Item>
    <Item TranslateID="STRING_21CAF8B6">
      <ENU>"List of errors/warnings/notes: "</ENU>
    </Item>
    <Item TranslateID="STRING_26BCF502">
      <ENU>"Maximum spacing between stirrups along the transversal axis of the beam, NBR 6118/2014 section 18.3.3.2 "</ENU>
    </Item>
    <Item TranslateID="STRING_3B01D460">
      <ENU>"Transversal reinforcement is designed from maximum spacing of transversal reinforcement, NBR 6118/2014 section 18.3.3.2"</ENU>
    </Item>
    <Item TranslateID="STRING_4B047846">
      <ENU>"Angle of stirups is smaller than 45.0°. Value is set to 45.0°"</ENU>
    </Item>
    <Item TranslateID="STRING_4CF06187">
      <ENU>"Angle of stirups is greather than 90.0°. Value is set to 90.0°"</ENU>
    </Item>
    <Item TranslateID="STRING_789225D2">
      <ENU>"Transversal reinforcement was designed from minimal ratio of transversal reinforcement."</ENU>
    </Item>
    <Item TranslateID="STRING_819B77E9">
      <ENU>"Angle of strut is smaller than " &amp; VAL(θ↓min←, 2) &amp; ". Value is set to  " &amp; VAL(θ↓min←, 2)</ENU>
    </Item>
    <Item TranslateID="STRING_942CD98C">
      <ENU>"Note"</ENU>
    </Item>
    <Item TranslateID="STRING_9772F1D9">
      <ENU>"The member may be overloaded"</ENU>
    </Item>
    <Item TranslateID="STRING_A69EF1BA">
      <ENU>"Angle of strut " &amp; VAL(θ, 2) &amp; " is greater than " &amp; VAL(ROUND(θ↓max←, 2), 2) &amp; ". Value is set to " &amp; VAL(ROUND(θ↓max←, 2), 2)</ENU>
    </Item>
    <Item TranslateID="STRING_AC50E23D">
      <ENU>"Transversal reinforcement is designed from maximum spacing of transversal reinforcement, NBR 6118/2014 section 18.3.3.2"</ENU>
    </Item>
    <Item TranslateID="STRING_AFEE4F88">
      <ENU>"Angle of strut is smaller than " &amp; VAL(ROUND(θ↓min←, 2), 2) &amp; ". Value is set to  " &amp; VAL(ROUND(θ↓min←, 2), 2)</ENU>
    </Item>
    <Item TranslateID="STRING_B0573277">
      <ENU>"Angle of strut " &amp; VAL(θ, 2) &amp; " is greater than " &amp; VAL(ROUND(θ↓max←, 2), 2) &amp; ". Value is set to " &amp; VAL(θ↓max←, 2)</ENU>
    </Item>
    <Item TranslateID="STRING_C7DCBA8C">
      <ENU>"Value h is calculated as width of cross-section in center of gravity in direction of shear force."</ENU>
    </Item>
    <Item TranslateID="STRING_CA1A872B">
      <ENU>"Angle of strut  " &amp; VAL(θ, 2) &amp; " is greather than " &amp; VAL(θ↓max←, 2) &amp; ". Value is set to " &amp; VAL(θ↓max←, 2)</ENU>
    </Item>
    <Item TranslateID="STRING_D214D1FB">
      <ENU>"Transversal reinforcement is designed as maximum from Y-axis and Z-axis."</ENU>
    </Item>
    <Item TranslateID="STRING_D295BBF7">
      <ENU>"Maximum spacing between stirrups along the transversal axis of the beam, NBR 6118/2014 section 18.3.3.2 "</ENU>
    </Item>
    <Item TranslateID="STRING_E6B27A8E">
      <ENU>"Designed transversal reinforcement is excessive, it is advised to use smaller dimension."</ENU>
    </Item>
    <Item TranslateID="STRING_EB640CED">
      <ENU>"Angle of stirups is greather than 90.0°. Value is set to 90.0°"</ENU>
    </Item>
    <Item TranslateID="STRING_F0462CCC">
      <ENU>"Transversal reinforcement is designed for the minimum of required tranversal reinforcement."</ENU>
    </Item>
    <Item TranslateID="STRING_FC1112EC">
      <ENU>"There are no errors, warnings and notes"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000002">
      <ENU>"Design of the shear reinforcement for members with axial force, NBR 6118:2014"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000024">
      <ENU>"Concrete strength, NBR6118/2014 section 17.2.2.e"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000040">
      <ENU>"Concrete strength"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000046">
      <ENU>Description("f↓ywd←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000047">
      <ENU>Description("f↓cd←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000117">
      <ENU>"b↓w← = " &amp; b↓w←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000118">
      <ENU>"h = " &amp; h</ENU>
    </Item>
    <Item ID="TEXT_INI400_000119">
      <ENU>Description("d")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000124">
      <ENU>Description("b↓w←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000125">
      <ENU>Description("c")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000126">
      <ENU>"c = " &amp; c</ENU>
    </Item>
    <Item ID="TEXT_INI400_000127">
      <ENU>Description("ϕ↓ω←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000128">
      <ENU>n↓w← &amp; "x ϕ " &amp; ϕ↓ω← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000130">
      <ENU>"V↓sz← = " &amp; V↓sz←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000137">
      <ENU>Description("α↓v2←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000143">
      <ENU>"Verification of the diagonal compression of concrete"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000145">
      <ENU>Description("α")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000146">
      <ENU>"Portion of shearing force resisted by complementing mechanism to the truss model"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000147">
      <ENU>"α = " &amp; α</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000150">
      <ENU>"Portion of shearing force resisted by transversal reinforcement"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000151">
      <ENU>"Design resistant shearing force regarding the ruin of diagonal tension"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000155">
      <ENU>"ϕ↓l← = " &amp; ϕ↓l←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000156">
      <ENU>Description("ϕ↓l←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000157">
      <ENU>"θ = " &amp; θ</ENU>
    </Item>
    <Item ID="TEXT_INI400_000158">
      <ENU>Description("θ")</ENU>
    </Item>
    <Item ID="TEXT_INI400_000159">
      <ENU>"V↓Rd2← = " &amp; V↓Rd2← &amp; " &lt; V↓s← =" &amp; V↓s← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000160">
      <ENU>"V↓Rd2← = " &amp; V↓Rd2← &amp; " &gt; V↓s← =" &amp; V↓s← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000161">
      <ENU>"V↓Rd3← = " &amp; V↓Rd3← &amp; " &lt; V↓s← = " &amp; V↓s← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000162">
      <ENU>"V↓Rd3← = " &amp; V↓Rd3← &amp; " &gt; V↓s← = " &amp; V↓s← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000172">
      <ENU>"V↓Rd2← = " &amp; V↓Rd2← &amp; " &lt; V↓s← = " &amp; V↓s← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000173">
      <ENU>"V↓Rd2← = " &amp; V↓Rd2← &amp; " &gt; V↓s← = " &amp; V↓s← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000188">
      <ENU>"ρ↓sw← = " &amp; ρ↓sw← &amp; " &lt; " &amp; '0.2*(f↓ct,m←/f↓ywk←)' &amp; "↓ ←= " &amp; ρ↓c← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000189">
      <ENU>"ρ↓sw← = " &amp; ρ↓sw← &amp; " ≥ " &amp; '0.2*(f↓ct,m←/f↓ywk←)' &amp; "↓ ←=" &amp; ρ↓c← &amp; " =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000190">
      <ENU>"Check of minimum shear reinforcement, NBR6118/2014 section 17.4.1.1.1"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000206">
      <ENU>"Design of required transversal reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_INI400_000225">
      <ENU>"A↓sw←/s = " &amp; 'ρ↓c←*b↓w←*SIN(α)' &amp; "↓ ←= " &amp; A↓ss← &amp; " =&gt; " &amp; n↓w← &amp; "x ϕ" &amp; ϕ↓ω← &amp; "/" &amp; s</ENU>
    </Item>
    <Item ID="TEXT_INI400_000229">
      <ENU>"A↓sw←/s = " &amp; A↓ss← &amp; " =&gt; " &amp; n↓w← &amp; "x ϕ" &amp; ϕ↓ω← &amp; "/" &amp; s</ENU>
    </Item>
    <Item ID="TEXT_INI400_000621">
      <ENU>"V↓sy← = " &amp; V↓sy←</ENU>
    </Item>
    <Item ID="TEXT_INI400_000630">
      <ENU>Description("h")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000637">
      <ENU>"Number of section on member:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_000638">
      <ENU>"Position of section on member from the begin"</ENU>
    </Item>
    <Item ID="TEXT_INI400_005865">
      <ENU>EWNMessage</ENU>
    </Item>
    <Item ID="TEXT_INI400_006248">
      <ENU>Description("s↓max←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_006252">
      <ENU>" &gt; ϕ↓ω← = " &amp; ϕ↓ω← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006260">
      <ENU>"V↓c← = " &amp; V↓c← &amp; " &gt; " &amp; '2*V↓c0←' &amp; " = " &amp; Val(2*V↓c0←/1000, 3) &amp; " kN"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006286">
      <ENU>"s = " &amp; s &amp; " &gt; s↓max← = " &amp; s↓max← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006297">
      <ENU>"s = " &amp; s &amp; " &gt; s↓max← = " &amp; s↓max← &amp; " =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006301">
      <ENU>"Check of maximum stirrup distance"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006302">
      <ENU>"s = " &amp; s &amp; " &lt; s↓max← = " &amp; s↓max← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006303">
      <ENU>"s = " &amp; s &amp; " &lt; s↓max← = " &amp; s↓max← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006341">
      <ENU>"V↓s← = " &amp; V↓s← &amp; " ≤ V↓c← = " &amp; V↓c←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006402">
      <ENU>"σ↓c,max← = " &amp; σ↓c,max← &amp; " &lt; f↓ctk← = " &amp; f↓ctk,inf←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006406">
      <ENU>"σ↓c,max← = " &amp; σ↓c,max← &amp; " &gt; f↓ctk← = " &amp; f↓ctk,inf←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006422">
      <ENU>"V↓s← = " &amp; V↓s← &amp; " &gt; V↓c← = " &amp; V↓c←</ENU>
    </Item>
    <Item ID="TEXT_INI400_006486">
      <ENU>" &gt; ϕ↓ω← = " &amp; ϕ↓ω← &amp; " =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006492">
      <ENU>" &lt; ϕ↓ω← = " &amp; ϕ↓ω← &amp; " =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006497">
      <ENU>"Member:"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006522">
      <ENU>"A↓sw←/s = " &amp; A↓ss← &amp; " =&gt; " &amp; n↓w← &amp; "x ϕ" &amp; ϕ↓ω← &amp; "/" &amp; s</ENU>
    </Item>
    <Item ID="TEXT_INI400_006546">
      <ENU>"A↓sw←/s = " &amp; A↓ss← &amp; " =&gt; " &amp; n↓w← &amp; "x ϕ" &amp; ϕ↓ω← &amp; "/" &amp; s</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006625">
      <ENU>"Shear in direction of Y axis"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006626">
      <ENU>"Shear in direction of Z axis"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006628">
      <ENU>"No shearing force in Y-axis"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006640">
      <ENU>"No shearing force in Z-axis"</ENU>
    </Item>
    <Item ID="TEXT_INI400_006651">
      <ENU>"A↓sw←/s =" &amp; A↓ss,fin← &amp; " =&gt; " &amp; n↓w,fin← &amp; "x ϕ" &amp; ϕ↓ω,fin← &amp; "/" &amp; s↓fin←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006657">
      <ENU>"Design Model II, NBR6118/2014 section 17.4.2.3"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006658">
      <ENU>"Design Model I, NBR6118/2014 section 17.4.2.2"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006661">
      <ENU>"Portion of shearing force resisted by complementing mechanisms to the truss model"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_006662">
      <ENU>"Verification of the diagonal compression of concrete"</ENU>
    </Item>
    <Item ID="TEXT_INI400_008835">
      <ENU>Description("f↓ck←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008965">
      <ENU>"Beam"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_008966">
      <ENU>"Column"</ENU>
    </Item>
    <Item ID="TEXT_INI400_009031">
      <ENU>"f↓ck← &lt; 50 MPa =&gt;"</ENU>
    </Item>
    <Item ID="TEXT_INI400_009032">
      <ENU>"f↓ck← &gt; 50 MPa =&gt;"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009043">
      <ENU>"Reinforcement steel"</ENU>
    </Item>
    <Item ID="TEXT_INI400_009044">
      <ENU>NameReqReinf</ENU>
    </Item>
    <Item ID="TEXT_INI400_009055">
      <ENU>Description("f↓ywk←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_009056">
      <ENU>"f↓ywk← = " &amp; f↓ywk←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009473">
      <ENU>"Cross-section"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009483">
      <ENU>"Section on member"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009484">
      <ENU>"Internal forces"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009486">
      <ENU>"Cross section parameters"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009487">
      <ENU>"Reinforcement parameters, NBR 6118/2014 section 18.3.3.2"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009488">
      <ENU>"Coefficient of shear bearing capacity"</ENU>
    </Item>
    <Item ID="TEXT_INI400_009489">
      <ENU>"V↓s← ≤ 0.67*V↓Rd2←"</ENU>
    </Item>
    <Item ID="TEXT_INI400_009490">
      <ENU>"V↓s← &gt; 0.67*V↓Rd2←"</ENU>
    </Item>
    <Item ID="TEXT_INI400_009557">
      <ENU>IO.Beam.Member.Name &amp; "  -"</ENU>
    </Item>
    <Item ID="TEXT_INI400_009558">
      <ENU>VAL(SecID+1, 0)</ENU>
    </Item>
    <Item ID="TEXT_INI400_009559">
      <ENU>"= " &amp; dx</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009563">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009564">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009565">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009566">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009567">
      <ENU>"Concrete"</ENU>
    </Item>
    <Item ID="TEXT_INI400_009568">
      <ENU>NameConcrete</ENU>
    </Item>
    <Item ID="TEXT_INI400_009569">
      <ENU>Description("c")</ENU>
    </Item>
    <Item ID="TEXT_INI400_009570">
      <ENU>"c = " &amp; c</ENU>
    </Item>
    <Item ID="TEXT_INI400_009571">
      <ENU>Description("f↓ct,m←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_009572">
      <ENU>Description("f↓ctd←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_009575">
      <ENU>Description("f↓ctk,inf←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_009578">
      <ENU>Description("γ↓c←")</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009580">
      <ENU>"for Regular combinations"</ENU>
    </Item>
    <Item ID="TEXT_INI400_009581">
      <ENU>"f↓ck← = " &amp; f↓ck←</ENU>
    </Item>
    <Item ID="TEXT_INI400_009582">
      <ENU>"γ↓c← = " &amp; γ↓c←</ENU>
    </Item>
    <Item ID="TEXT_INI400_009585">
      <ENU>Description("γ↓s←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_009586">
      <ENU>"γ↓s← = " &amp; γ↓s←</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009588">
      <ENU>"for Regular combinations"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009589">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009590">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009591">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009592">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009593">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009594">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009595">
      <ENU>"OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009596">
      <ENU>"NOT OK"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_009599">
      <ENU>"Final designed transverse reinforcement"</ENU>
    </Item>
    <Item ID="TEXT_INI400_010524">
      <ENU>"V↓c← = " &amp; V↓c← &amp; " &gt; " &amp; '2*V↓c0←' &amp; " = " &amp; Val(2*V↓c0←/1000, 3) &amp; " kN"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010532">
      <ENU>"Type of loading: Simple bending."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010533">
      <ENU>"Type of loading: Tension."</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010534">
      <ENU>"Type of loading: Compression."</ENU>
    </Item>
    <Item ID="TEXT_INI400_010541">
      <ENU>"M↓y← = " &amp; M↓y←</ENU>
    </Item>
    <Item ID="TEXT_INI400_010542">
      <ENU>"M↓z← = " &amp; M↓z←</ENU>
    </Item>
    <Item ID="TEXT_INI400_010543">
      <ENU>"N = " &amp; N</ENU>
    </Item>
    <Item ID="TEXT_INI400_010563">
      <ENU>"(" &amp; Combi↓key← &amp; "):"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010573">
      <ENU>"Load case:"</ENU>
    </Item>
    <Item TranslateID="TEXT_INI400_010574">
      <ENU>"ULS combination"</ENU>
    </Item>
    <Item ID="TEXT_INI400_010576">
      <ENU>Description("a↓l,min←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_010577">
      <ENU>Description("a↓l←")</ENU>
    </Item>
    <Item ID="TEXT_INI400_010578">
      <ENU>"V↓s← ≤ 0.2*V↓Rd2←"</ENU>
    </Item>
    <Item ID="TEXT_INI400_010580">
      <ENU>"V↓s← &gt; 0.2*V↓Rd2←"</ENU>
    </Item>
  </Texts>
</Root>