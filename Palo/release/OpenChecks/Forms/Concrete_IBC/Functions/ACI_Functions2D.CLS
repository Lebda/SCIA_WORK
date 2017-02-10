<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Root Version="160001" GUID="c5c652d0-1e2e-4ec3-bf57-fc22cadc1b9e">
  <CodeEditor>
    <SourceCode Collapsed="" BreakPoints="">//@b,h - width and height of rectangular shape
private object GetSectionShape(double b, double h) { 
    object Shape →UNK000_015255= new object[]; 
    Shape[0] →UNK000_010789= new Structure("X", -b/2, "Y", -h/2); 
    Shape[1] →UNK000_010790= new Structure("X", b/2, "Y", -h/2); 
    Shape[2] →UNK000_010791= new Structure("X", b/2, "Y", h/2); 
    Shape[3] →UNK000_010792= new Structure("X", -b/2, "Y", h/2); 
    Shape[4] →UNK000_015262= new Structure("X", -b/2, "Y", -h/2); 
    return Shape; 
} 

//@b,h - width and height of rectangular shape
private object GetSectionFibres(double b, double h) { 
    object Fibres →UNK000_015257= new object[]; 
    Fibres[0] →UNK000_010796= new Structure("ComponentID", 0, "Flag", 0, "LCS", new Structure("y", -b/2, "z", -h/2)); 
    Fibres[1] →UNK000_010798= new Structure("ComponentID", 0, "Flag", 0, "LCS", new Structure("y", 0, "z", -h/2)); 
    Fibres[2] →UNK000_010799= new Structure("ComponentID", 0, "Flag", 0, "LCS", new Structure("y", b/2, "z", -h/2)); 
    Fibres[3] →UNK000_010800= new Structure("ComponentID", 0, "Flag", 0, "LCS", new Structure("y", b/2, "z", 0)); 
    Fibres[4] →UNK000_010801= new Structure("ComponentID", 0, "Flag", 0, "LCS", new Structure("y", b/2, "z", h/2)); 
    Fibres[5] →UNK000_010802= new Structure("ComponentID", 0, "Flag", 0, "LCS", new Structure("y", 0, "z", h/2)); 
    Fibres[6] →UNK000_010803= new Structure("ComponentID", 0, "Flag", 0, "LCS", new Structure("y", -b/2, "z", h/2)); 
    Fibres[7] →UNK000_010804= new Structure("ComponentID", 0, "Flag", 0, "LCS", new Structure("y", -b/2, "z", 0)); 
    return Fibres; 
} 


//@Writes data of substitute section of 2D member to IO
public void WriteSectionToDataCache(double h, object ConMat) { 
    double b →UNK000_010797= physconst(1.0, "ft"); //section width
    double FormCode →UNK000_015260= 2003; //rectangular cross-section formcode

    →UNK000_010785IO.Set("CS.Geometry.FormCode", FormCode); 
    →UNK000_010786IO.Set("CS.Component.Material", ConMat); 
    →UNK000_010788IO.Set("CS.Component.Shape.Point", GetSectionShape(b, h)); 
    →UNK000_010795IO.Set("CS.Fibres.Fibre", GetSectionFibres(b, h)); 
    →UNK000_010805IO.Set("Section.Dx", 0); 
} 

//@Returns formatted table of basic 2D forces
public object GetBasicForceTable(object BasicForces) { 
    object fontsColors →UNK000_016192= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\FontsAndColors.CLC"); 
    object FontsAndColors →UNK000_016193= fontsColors.GetFontsAndColors(); 
    double Ncol →UNK000_005286= 9; 
    double Nrow →UNK000_007149= BasicForces.Count+1; 
    object T →UNK000_002858= new Table(Ncol); 
    //header
    T[0][0].Value →UNK000_002941= TR("Case"); 
    T[0][1].Value →UNK000_007864= "m↓x←&lt;BR&gt;[kipft/ft]"; 
    T[0][2].Value →UNK000_010225= "m↓y←&lt;BR&gt;[kipft/ft]"; 
    T[0][3].Value →UNK000_010227= "m↓xy←&lt;BR&gt;[kipft/ft]"; 
    T[0][4].Value →UNK000_007528= "n↓x←&lt;BR&gt;[kip/ft]"; 
    T[0][5].Value →UNK000_015263= "n↓y←&lt;BR&gt;[kip/ft]"; 
    T[0][6].Value →UNK000_007154= "n↓xy←&lt;BR&gt;[kip/ft]"; 
    T[0][7].Value →UNK000_016129= "v↓x←&lt;BR&gt;[kip/ft]"; 
    T[0][8].Value →UNK000_016130= "v↓y←&lt;BR&gt;[kip/ft]"; 
    //values
    FOR(i, 0, Nrow-2) { 
        T[i+1][0].Value →UNK000_007156= BasicForces[i].CombiID; 
        T[i+1][1].Value →UNK000_014731= CUnit(BasicForces[i].mx, "kipft/ft"); 
        T[i+1][2].Value →UNK000_014732= CUnit(BasicForces[i].my, "kipft/ft"); 
        T[i+1][3].Value →UNK000_014734= CUnit(BasicForces[i].mxy, "kipft/ft"); 
        T[i+1][4].Value →UNK000_007534= CUnit(BasicForces[i].nx, "kip/ft"); 
        T[i+1][5].Value →UNK000_007158= CUnit(BasicForces[i].ny, "kip/ft"); 
        T[i+1][6].Value →UNK000_007785= CUnit(BasicForces[i].nxy, "kip/ft"); 
        T[i+1][7].Value →UNK000_007787= CUnit(BasicForces[i].qx, "kip/ft"); 
        T[i+1][8].Value →UNK000_016131= CUnit(BasicForces[i].qy, "kip/ft"); 
    } 
    //format 
    T.Columns[0].Width →UNK000_016136= 100; 
    FOR(i, 0, Ncol-1) { 
        IF(i &gt; 0) { T.Columns[i].Width →UNK000_002977= Convert.ToSingle((FontsAndColors.TableWidth()-100)/(Ncol-1)); } 
        FOR(j, 0, Nrow-1) { 
            T[j][i].Alignment →UNK000_002972= ContentAlignment.MiddleLeft; 
            IF(i == 0 &amp;&amp; j &gt; 0) { T[j][0].BackColor →UNK000_013597= FontsAndColors.ColorTableRow(); } 
        } 
    } 
    T.Padding.All →UNK000_002899= Convert.ToSingle(→UNK000_013730FontsAndColors.PaddingTableOverall()); 
    T.Padding.Left →UNK000_016182= 5; 
    T.Font →UNK000_005290= FontsAndColors.TableCellsFont(); 
    T.BorderPen →UNK000_005292= FontsAndColors.TableBorderPen(); 
    T.GridPen →UNK000_005293= FontsAndColors.TableGridPen(); 
    T[0].Font →UNK000_005291= FontsAndColors.TableHeaderFont(); 
    T[0].BorderPen →UNK000_005294= FontsAndColors.TableBorderPen(); 
    T.Rows[0].BackColor →UNK000_010936= →UNK000_013737FontsAndColors.ColorTableHeader(); 
    return T; 
} 


public object GetCombiKeyTable(object ForcesArr) { 
    object fontsColors →UNK000_016194= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\FontsAndColors.CLC"); 
    object FontsAndColors →UNK000_016195= fontsColors.GetFontsAndColors(); 
    double Ncol →UNK000_016086= 2; 
    double Nrow →UNK000_016167= ForcesArr.Count+1; 
    object T →UNK000_016088= new Table(Ncol); 
    //header
    T[0][0].Value →UNK000_016089= TR("Case"); 
    T[0][1].Value →UNK000_016090= TR("Combination key"); 
    //values
    FOR(i, 0, Nrow-2) { 
        T[i+1][0].Value →UNK000_016097= ForcesArr[i].CombiID; 
        T[i+1][1].Value →UNK000_016098= ForcesArr[i].CombiKey; 
    } 
    //format
    T.Columns[0].Width →UNK000_016163= 100; 
    FOR(i, 0, Ncol-1) { 
        FOR(j, 0, Nrow-1) { 
            IF(i == 0 &amp;&amp; j &gt; 0) { T[j][0].BackColor →UNK000_016166= FontsAndColors.ColorTableRow(); } 
        } 
    } 
    T.Padding.All →UNK000_016183= Convert.ToSingle(→UNK000_016184FontsAndColors.PaddingTableOverall()); 
    T.Padding.Left →UNK000_016185= 5; 
    T.Font →UNK000_016156= FontsAndColors.TableCellsFont(); 
    T.BorderPen →UNK000_016157= FontsAndColors.TableBorderPen(); 
    T.GridPen →UNK000_016158= FontsAndColors.TableGridPen(); 
    T[0].Font →UNK000_016159= FontsAndColors.TableHeaderFont(); 
    T[0].BorderPen →UNK000_016160= FontsAndColors.TableBorderPen(); 
    T.Rows[0].BackColor →UNK000_016161= →UNK000_016162FontsAndColors.ColorTableHeader(); 
    T.Columns[0].Alignment →UNK000_016168= ContentAlignment.MiddleLeft; 
    T.Columns[1].Alignment →UNK000_016169= ContentAlignment.MiddleLeft; 
    return T; 
} 

public object GetConcreteTable(object CONCRETEMAT, object LongReinfMat, object ShearReinfMat) { 
    object fontsColors →UNK000_016275= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\FontsAndColors.CLC"); 
    object FontsAndColors →UNK000_016276= fontsColors.GetFontsAndColors(); 
    double Ncol →UNK000_016241= 3; 
    double Nrow →UNK000_016242= 4; 
    object T →UNK000_016243= new Table(Ncol); 
    //header
    T[0][0].Value →UNK000_016244= TR("Symbol"); 
    T[0][1].Value →UNK000_016245= TR("Value"); 
    T[0][2].Value →UNK000_016262= TR("Description"); 
    //values
    T[1][0].Value →UNK000_016263= "f'↓c←"; 
    T[1][1].Value →UNK000_016264= CUnit(CONCRETEMAT.f↓c←, "psi") &amp; "psi"; 
    T[1][2].Value →UNK000_016265= TR("Specified compressive strength of concrete"); 
    T[2][0].Value →UNK000_016269= "f↓y←"; 
    T[2][1].Value →UNK000_016270= CUnit(LongReinfMat.fy, "psi") &amp; "psi"; 
    T[2][2].Value →UNK000_016271= TR("Specified yield strength of longitudinal reinforcement"); 
    T[3][0].Value →UNK000_016272= "f↓vy←"; 
    T[3][1].Value →UNK000_016273= CUnit(ShearReinfMat.fy, "psi") &amp; "psi"; 
    T[3][2].Value →UNK000_016274= TR("Specified yield strength of shear reinforcement"); 
    //format
    T.Columns[0].Width →UNK000_016248= 50; 
    FOR(i, 0, Ncol-1) { 
        FOR(j, 0, Nrow-1) { 
            IF(i == 0 &amp;&amp; j &gt; 0) { T[j][0].BackColor →UNK000_016249= FontsAndColors.ColorTableRow(); } 
        } 
    } 
    T.Padding.All →UNK000_016250= Convert.ToSingle(→UNK000_016251FontsAndColors.PaddingTableOverall()); 
    T.Padding.Left →UNK000_016252= 5; 
    T.Font →UNK000_016253= FontsAndColors.TableCellsFont(); 
    T.BorderPen →UNK000_016254= FontsAndColors.TableBorderPen(); 
    T.GridPen →UNK000_016255= FontsAndColors.TableGridPen(); 
    T[0].Font →UNK000_016256= FontsAndColors.TableHeaderFont(); 
    T[0].BorderPen →UNK000_016257= FontsAndColors.TableBorderPen(); 
    T.Rows[0].BackColor →UNK000_016258= →UNK000_016259FontsAndColors.ColorTableHeader(); 
    T.Columns[0].Alignment →UNK000_016260= ContentAlignment.MiddleLeft; 
    T.Columns[1].Alignment →UNK000_016261= ContentAlignment.MiddleLeft; 
    return T; 
} 

public object GetExposeTable(object DCover) { 
    object fontsColors →UNK000_016277= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\FontsAndColors.CLC"); 
    object FontsAndColors →UNK000_016278= fontsColors.GetFontsAndColors(); 
    →UNK000_016313string Efactor; 
    double Ncol →UNK000_016279= 3; 
    double Nrow →UNK000_016280= 3; 
    object T →UNK000_016281= new Table(Ncol); 
    //header
    T[0][0].Value →UNK000_016282= TR("Surface"); 
    T[0][1].Value →UNK000_016283= TR("Expose Group"); 
    T[0][2].Value →UNK000_016284= TR("Description"); 
    //values
    T[1][0].Value →UNK000_016285= TR("UppSurface"); 
    T[1][1].Value →UNK000_016286= DCover.Upper.XE; 
    Efactor →UNK000_016312= →UNK000_016311XEDescrip(DCover.Upper.XE); 
    T[1][2].Value →UNK000_016287= Efactor; 
    T[2][0].Value →UNK000_016288= TR("LowerSurface"); 
    T[2][1].Value →UNK000_016289= DCover.Lower.XE; 
    Efactor →UNK000_016314= →UNK000_016315XEDescrip(DCover.Lower.XE); 
    T[2][2].Value →UNK000_016290= Efactor; 
    //format
    T.Columns[0].Width →UNK000_016297= 100; 
    FOR(i, 0, Ncol-1) { 
        FOR(j, 0, Nrow-1) { 
            IF(i == 0 &amp;&amp; j &gt; 0) { T[j][0].BackColor →UNK000_016298= FontsAndColors.ColorTableRow(); } 
        } 
    } 
    T.Padding.All →UNK000_016299= Convert.ToSingle(→UNK000_016300FontsAndColors.PaddingTableOverall()); 
    T.Padding.Left →UNK000_016301= 5; 
    T.Font →UNK000_016302= FontsAndColors.TableCellsFont(); 
    T.BorderPen →UNK000_016303= FontsAndColors.TableBorderPen(); 
    T.GridPen →UNK000_016304= FontsAndColors.TableGridPen(); 
    T[0].Font →UNK000_016305= FontsAndColors.TableHeaderFont(); 
    T[0].BorderPen →UNK000_016306= FontsAndColors.TableBorderPen(); 
    T.Rows[0].BackColor →UNK000_016307= →UNK000_016308FontsAndColors.ColorTableHeader(); 
    T.Columns[0].Alignment →UNK000_016309= ContentAlignment.MiddleLeft; 
    T.Columns[1].Alignment →UNK000_016310= ContentAlignment.MiddleLeft; 
    return T; 
} 

private string XEDescrip(double XE) { 
    SWITCH(XE) { 
        CASE 0 :  { return TR("Concrete permanently exposed to earth"); } 
        CASE 1 :  { return TR("Concrete exposed to earth or weather"); } 
        CASE 2 :  { return TR("Concrete not exposed to weather or earth"); } 
        DEFAULT :  { return TR("Concrete not exposed to weather or earth"); } 
    } 
} 


public object GetCoverTable(object DCover, object DReinf) { 
    object fontsColors →UNK000_016316= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\FontsAndColors.CLC"); 
    object FontsAndColors →UNK000_016317= fontsColors.GetFontsAndColors(); 
    object FUNCT_BAR →REZ006_000008= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\ACI_Functions2D_RebarInfo.CLC"); 
    →UNK000_016358double&lt;in,2&gt; minc; 
    →UNK000_016318string Efactor; 
    double Ncol →UNK000_016319= 6; 
    double Nrow →UNK000_016320= 5; 
    object T →UNK000_016321= new Table(Ncol); 
    //header
    T[0][0].Value →UNK000_016349= TR("Surface /Direction") &amp; " [°]"; 
    T[0][1].Value →UNK000_017399= TR("Bar No."); 
    T[0][2].Value →UNK000_017401= TR("Material"); 
    T[0][3].Value →UNK000_016322= TR("Min. Cover"); 
    T[0][4].Value →UNK000_016323= TR("App. Cover"); 
    T[0][5].Value →UNK000_016324= TR("Check"); 
    →REZ006_000016double TypeCover; 
    //values
    FOR(i, 0, 3) { 
        T[i+1][0].Value →UNK000_016325= DReinf.Layers[i].Surface &amp; " / " &amp; DReinf.Layers[i].Dir
         &amp; " (" &amp; DReinf.Layers[i].α &amp; ")"; 
        double Barno →UNK000_017400= FUNCT_BAR.BarNoCalculation(DReinf.Layers[i].ds); 
        T[i+1][1].Value →UNK000_017398= "#" &amp; Barno; 
        T[i+1][2].Value →UNK000_017402= DReinf.Material.IBC.Category; 
        IF(DReinf.Layers[i].Surface == "Lower") { 
            minc →UNK000_016356= DCover.Lower.c; 
        } ELSE { 
            minc →UNK000_016357= DCover.Upper.c; 
        } 
        T[i+1][3].Value →UNK000_016351= CUnit(minc, "in") &amp; "in"; 
        
        IF(i == 0 || i == 3) { 
            TypeCover →REZ006_000014= DReinf.TypeCover↓lo←; 
        } ELSE { 
            TypeCover →REZ006_000015= DReinf.TypeCover↓up←; 
        } 
        IF(TypeCover == 0) { //Auto 
            Appc →REZ006_000012= minc; 
            T[i+1][4].Value →UNK000_016329= CUnit(minc, "in") &amp; "in"; 
        } ELSE { 
            Appc →REZ006_000013= DReinf.Layers[i].c; 
            T[i+1][4].Value →REZ006_000011= CUnit(DReinf.Layers[i].c, "in") &amp; "in"; 
        } 
        
        IF((minc-Appc) &gt; 0.01*minc) { 
            T[i+1][5].Value →UNK000_016353= TR("Low Cover"); 
            T[i+1][5].BackColor →UNK000_017397= FontsAndColors.ColorNotOK(); 
        } ELSE { 
            T[i+1][5].Value →UNK000_016352= "O.K"; 
            T[i+1][5].BackColor →UNK000_017396= FontsAndColors.ColorOK(); 
        } 
    } 
    
    //format
    T.Columns[0].Width →UNK000_016335= 140; 
    FOR(i, 0, Ncol-1) { 
        FOR(j, 0, Nrow-1) { 
            IF(i == 0 &amp;&amp; j &gt; 0) { T[j][0].BackColor →UNK000_016336= FontsAndColors.ColorTableRow(); } 
        } 
    } 
    T.Padding.All →UNK000_016337= Convert.ToSingle(→UNK000_016338FontsAndColors.PaddingTableOverall()); 
    T.Padding.Left →UNK000_016339= 5; 
    T.Font →UNK000_016340= FontsAndColors.TableCellsFont(); 
    T.BorderPen →UNK000_016341= FontsAndColors.TableBorderPen(); 
    T.GridPen →UNK000_016342= FontsAndColors.TableGridPen(); 
    T[0].Font →UNK000_016343= FontsAndColors.TableHeaderFont(); 
    T[0].BorderPen →UNK000_016344= FontsAndColors.TableBorderPen(); 
    T.Rows[0].BackColor →UNK000_016345= →UNK000_016346FontsAndColors.ColorTableHeader(); 
    T.Columns[0].Alignment →UNK000_016347= ContentAlignment.MiddleLeft; 
    T.Columns[1].Alignment →UNK000_016348= ContentAlignment.MiddleLeft; 
    return T; 
} 


public object CreateDefaultDesignReinfData(object DesignDefaults, double h) { 
    object[] DesignReinfData →UNK000_015071= new object[]; 
    object FUNCT_BAR →REZ006_000009= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\ACI_Functions2D_RebarInfo.CLC"); 
    FOR(i, 0, 3) { 
        double ds →UNK000_016177= DesignDefaults.ReinfLong.Layers[i].ds; 
        double Barno →UNK000_016196= FUNCT_BAR.BarNoCalculation(ds); 
        double c →UNK000_016178= DesignDefaults.ReinfLong.Layers[i].c; 
        double d →UNK000_016179= h-c-ds/2; 
        →UNK000_015072DesignReinfData.Add(new Structure(
        "IsDesigned", False, 
        "ID", i, 
        "Forces_ID", (i &lt; 2) ? i : i+1, 
        "Edge", GetEdgeID(i), 
        "Type", 0, 
        "MainVert", True, 
        "α", DesignDefaults.ReinfLong.Layers[i].α, 
        "ds", ds, 
        "c", c, 
        "d", d, 
        "As_req", 0, 
        "As_req_top", 0, 
        "As_req_bot", 0, 
        "As_det_min", 0, 
        "As_det_max", 0, 
        "As_prov", 0, 
        "Tensile", 1, 
        "Descript", GetReinfLayerDescript(i), 
        "Info", TR("no reinf."))); 
    } 
    return DesignReinfData; 
} 


public object CreateDefaultDesignShearData() { 
    return new Structure(
    "UC_VRdmax", 0, 
    "UC_VRdc", 0, 
    "Aswm_req", 0, 
    "vRdc", 0, 
    "vRd_max", 0, 
    "f↓ywd,req←", 0, 
    "d", 0, 
    "vEd", 0, 
    "z", 0, 
    "Theta", 0
    ); 
} 


void SetCoverToDesignReinfData(object DesignReinfData, object UsingCover) { 
    FOR(i, 0, DesignReinfData.Count-1) { 
        object ReinfLayer →UNK000_016180= DesignReinfData[i]; 
        →UNK000_016181ReinfLayer.Set("c", UsingCover[i]); 
    } 
} 


//@Returns description of reinforcement layer
string GetReinfLayerDescript(double LayerID) { 
    SWITCH(LayerID) { 
        CASE 0 :  { return "[1–]"; } 
        CASE 1 :  { return "[2–]"; } 
        CASE 2 :  { return "[1+]"; } 
        CASE 3 :  { return "[2+]"; } 
    } 
} 


//@Returns ID of cross-section edge belonging to specific reinf. layer
public double GetEdgeID(double ReinfLayerID) { 
    SWITCH(ReinfLayerID) { 
        CASE 0 :  { return 0; } 
        CASE 1 :  { return 0; } 
        CASE 2 :  { return 2; } 
        CASE 3 :  { return 2; } 
    } 
} 

//check if angle are the same (angles from 0 to 180)
→UNK000_015254BLOCK("SameAngle()") { 
    bool SameAngle(double Angle1, double Angle2) { 
        return (→UNK000_014808COMPARE((Angle1-Angle2), 0, 3) == 0); 
    } 
} 

//surface stress
//TypeSurface = 0 - lower surface, 1 = upper surface)
double SurfaceStress(double valueN, double valueM, double h, double TypeSurface) { 
    IF(TypeSurface == 1) { 
        return (valueN/h)-6*valueM/(h*h); 
    } ELSE { 
        return (valueN/h)+6*valueM/(h*h); 
    } 
} 
//calculation of principal values
object PrincipalValue(double valueX, double valueY, double valueXY) { 
    double value1↓pom← →UNK000_005435= (valueX+valueY)/2+0.5*SQRT([valueX-valueY]↑2←+4*valueXY↑2←); 
    double value2↓pom← →UNK000_005436= (valueX+valueY)/2-0.5*SQRT([valueX-valueY]↑2←+4*valueXY↑2←); 
    IF(value1↓pom← &gt;= value2↓pom←) { 
        double value1 →UNK000_005437= value1↓pom←; 
        double value2 →UNK000_005438= value2↓pom←; 
    } ELSE { 
        double value1 →UNK000_005439= value2↓pom←; 
        double value2 →UNK000_005440= value1↓pom←; 
    } 
    return new Structure("value1", value1, "value2", value2); 
} 
//calculatio of first angle of principal value
double PrincipalAngle(double valueX, double valueY, double valueXY) { 
    IF(COMPARE((valueX-valueY), 0, 15) != 0 &amp;&amp; COMPARE(valueXY, 0, 15) != 0) { 
        IF(valueX-valueY &gt; 0) { 
            return 0.5*ARCTG(2*valueXY/(valueX-valueY)); 
        } ELSE { 
            return 0.5*ARCTG(2*valueXY/(valueX-valueY))-90; 
        } 
    } ELSE { 
        IF(COMPARE(valueXY, 0, 15) == 0) { 
            IF(valueX-valueY &gt; 0) { 
                return 0; 
            } ELSE { 
                return -90; 
            } 
        } ELSE { 
            IF(valueXY &gt; 0) { 
                return 45; 
            } ELSE { 
                return -45; 
            } 
        } 
    } 
} 
//recalculation forces to input direction
double RotateValues(double valueX, double valueY, double valueXY, double Alpha) { 
    return valueX*COS(Alpha)↑2←+valueY*SIN(Alpha)↑2←+valueXY*SIN(2*Alpha); 
} 

//recalculation forces to input direction
string SRotateValues(double valueX, string SvalueX, double valueY, string SvalueY, double valueXY, string SvalueXY, double Alpha, string SAlpha, string SFinal, string SUnit, double Coeff) { 
    double valueAlpha →UNK000_005815= RotateValues(valueX, valueY, valueXY, Alpha); 
    string SFormula →UNK000_005816= SvalueX &amp; "∙" &amp; "cos(" &amp; SAlpha &amp; ")↑2←+" &amp; SvalueY &amp; "∙" &amp; "sin(" &amp; SAlpha &amp; ")↑2←+" &amp; SvalueXY &amp; "∙" &amp; "sin(2∙" &amp; SAlpha &amp; ")"; 
    string SVariable →UNK000_005824= SFinal &amp; " = "; 
    string Empty →UNK000_005826= ""; 
    FOR(i, 0, SVariable.Length-2) { 
        Empty →UNK000_005827= Empty &amp; " "; 
    } 
    string SvalueAlpha →UNK000_005821= SFormula &amp; " = " &amp; valueX*COS(Alpha)↑2←+valueY*SIN(Alpha)↑2←+valueXY*SIN(2*Alpha) &amp; " = " &amp; Val(valueAlpha*Coeff, 2) &amp; SUnit; 
    →UNK000_005820TEXT(SVariable &amp; SFormula &amp; " ="); 
    →UNK000_005823TEXT(Empty &amp; "=" &amp; valueX*COS(Alpha)↑2←+valueY*SIN(Alpha)↑2←+valueXY*SIN(2*Alpha) &amp; " = " &amp; Val(valueAlpha*Coeff, 2) &amp; SUnit); 
    return SFormula; 
} 

//function for determination if surafce of the slab is in tension or compression
//TypeSurface = 0 - lower surface, 1 = upper surface)
bool TensileSurface2D(double CssID, double ForceID, double TypeSurface) { 
    double[] FibreIdMax →UNK000_005474= CONCRETE.StressStrain.GetFibrePositionConcrete(CONCRETE.StressStrain.GetFibreExtremeStressMax(CssID, ForceID)); 
    IF(FibreIdMax.Z &gt; 0 &amp;&amp; TypeSurface == 1) { 
        bool pom →UNK000_005475= True; 
    } 
    IF(FibreIdMax.Z &lt;= 0 &amp;&amp; TypeSurface == 1) { 
        bool pom →UNK000_005476= False; 
    } 
    IF(FibreIdMax.Z &gt; 0 &amp;&amp; TypeSurface == 0) { 
        bool pom →UNK000_005477= False; 
    } 
    IF(FibreIdMax.Z &lt;= 0 &amp;&amp; TypeSurface == 0) { 
        bool pom →UNK000_005478= True; 
    } 
    return pom; 
} 
//determination state of stress
string FStatStress(object StressState) { 
    SWITCH(StressState) { 
        CASE CONCRETE.Calculator2D.eStressState.eEP_CircularPress :  { return TR("Circular pressure"); } 
        CASE CONCRETE.Calculator2D.eStressState.eEP_CircularTension :  { return TR("Circular tension"); } 
        CASE CONCRETE.Calculator2D.eStressState.eEP_ElipticPress :  { return TR("Eliptic pressure"); } 
        CASE CONCRETE.Calculator2D.eStressState.eEP_ElipticTension :  { return TR("Eliptic tension"); } 
        CASE CONCRETE.Calculator2D.eStressState.eEP_EqualHyperbolic :  { return TR("Equal hyperbolic"); } 
        CASE CONCRETE.Calculator2D.eStressState.eEP_NoState :  { return TR("No state"); } 
        CASE CONCRETE.Calculator2D.eStressState.eEP_NoStress :  { return TR("No stress"); } 
        CASE CONCRETE.Calculator2D.eStressState.eEP_ParabolicPress :  { return TR("Parabolic pressure"); } 
        CASE CONCRETE.Calculator2D.eStressState.eEP_ParabolicTension :  { return TR("Parabolic tension"); } 
        CASE CONCRETE.Calculator2D.eStressState.eEP_StrongHyperbolic :  { return TR("Strong hyperbolic"); } 
        CASE CONCRETE.Calculator2D.eStressState.eEP_WeakHyperbolic :  { return TR("Weak hyperbolic"); } 
    } 
} 
// functions for creating 1D cross-section form 2D element
object Css1DFrom2D(double ElementID, double CssID, double Alpha) { 
    object CreateCss1D →UNK000_005571= CONCRETE.Calculator2D.CreateCssFrom2Delement(ElementID, CssID, Alpha); 
    double NFibre →UNK000_005781= CONCRETE.StressStrain.GetCountFibresConcrete(CssID); 
    object[] ShapeCss →UNK000_005783= new object[]; 
    FOR(j, 0, NFibre-1) { 
        double CoordFibreX →UNK000_005782= CONCRETE.StressStrain.GetFibrePositionConcrete(CssID, j).Y; 
        double CoordFibreY →UNK000_005791= CONCRETE.StressStrain.GetFibrePositionConcrete(CssID, j).Z; 
        →UNK000_005784ShapeCss.Add(new PointD(CoordFibreX, CoordFibreY)); 
    } 
    object[] ReinfBars →UNK000_005788= new object[]; 
    double NReinf →UNK000_005787= CONCRETE.StressStrain.GetCountFibresReinforcement(CssID); 
    IF(NReinf &gt; 0) { 
        FOR(j, 0, NReinf-1) { 
            object[] ArrayReinf →UNK000_005785= CONCRETE.RegionData.ArrayOfReinforcement(CssID); 
            →UNK000_005790ReinfBars.Add(new ReinfBar(ArrayReinf[j].posY, ArrayReinf[j].posZ, ArrayReinf[j].Diameter, ArrayReinf[j].Area)); 
        } 
    } 
    object CssFor1D →UNK000_005803= new Structure("Index", CssID, "ShapeCss", →UNK000_005792ShapeCss, →UNK000_005793"ReinfBars", →UNK000_005794ReinfBars); 
    return →UNK000_005802CssFor1D; 
} 

double GetSIGN(double val) { 
    double sign →UNK000_006912= 0; 
    IF(val &gt; 0) { 
        sign →UNK000_006913= 1; 
    } 
    IF(val &lt; 0) { 
        sign →UNK000_006914= -1; 
    } 
    return sign; 
} 

// Functions for calculation of single value of shifting moment for a direction
→UNK000_008023BLOCK("Functions for calculation of single value of shifting moment for a direction") { 
    double GetShiftingMoment(double m_shift_min, double m_shift_max) { 
        double m_shift →UNK000_009988= MAX(ABS(m_shift_min), ABS(m_shift_max)); 
        double sign →UNK000_009989= GetSIGN(m_shift_min); 
        IF(m_shift_min*m_shift_max &lt; 0) { 
            IF(ABS(m_shift_max) &gt; ABS(m_shift_min)) { 
                sign →UNK000_009990= GetSIGN(m_shift_max); 
            } 
        } 
        return m_shift*sign; 
    } 
} 

// functions for calculation principal moment and directions
→UNK000_005828BLOCK("Functions for calculation principal moment and directions") { 
    object PrincipalMoments(double m↓x←, double m↓y←, double m↓xy←) { 
        object[] PrincipalMoment →UNK000_005492= PrincipalValue(m↓x←, m↓y←, m↓xy←); 
        double m↓1← →UNK000_005495= PrincipalMoment.value1; 
        double m↓2← →UNK000_005496= PrincipalMoment.value2; 
        double α↓1← →UNK000_005829= 0; 
        IF(ABS(m↓1←) &gt;= ABS(m↓2←)) { 
            double α↓1← →UNK000_005497= PrincipalAngle(m↓x←, m↓y←, m↓xy←); 
        } ELSE { 
            α↓1← →UNK000_005498= PrincipalAngle(m↓x←, m↓y←, m↓xy←)+90; 
        } 
        return new Structure("m↓1←", m↓1←, "m↓2←", m↓2←, "α↓1←", α↓1←); 
    } 
} 

// functions determination reinf
→UNK000_007197BLOCK("Functions for calculation provided area of reinforcement") { 
    double ProvidedReinf2D(double As, double ds, double b, double DistanceStep) { 
        double n →UNK000_007198= As/(0.25*Math.PI*ds*ds); 
        double s →UNK000_007199= 0; 
        double As_prov →UNK000_007207= 0; 
        IF(n &gt; 0) { 
            s →UNK000_007204= DistanceStep*ROUNDDOWN((b/n)/DistanceStep); 
            As_prov →UNK000_007208= 0.25*Math.PI*ds*ds*b/s; 
        } 
        return As_prov; 
    } 
} 

→UNK000_015253BLOCK("IsExtremCombExist()") { 
    bool IsExtremCombExist(double DirID, object ExtremeCombPerDirection) { 
        IF(ExtremeCombPerDirection[DirID][0] == null) { 
            return False; 
        } 
        ELSE { 
            return True; 
        } 
    } 
} 

// functions for check of concrete strut
→UNK000_007209BLOCK("Functions for check of concrete strut") { 
    object CheckConcreteStrut2D(double f↓cd←, double α↓sc←, double x↓c←, double Red↓fcd←, double n↓Ed.sc←) { 
        //Design value of resistance of concrete compressive strut 
        →UNK000_007577TEXT("Check of concrete strut at lower surface, direction α↓sc← ="); 
        →UNK000_007606TEXT(Val(α↓sc←, 2) &amp; " °"); 
        double n↓Rd.sc← →UNK000_007271= 0; 
        double UC↓sc← →UNK000_007276= 0; 
        
        IF(x↓c← &gt; 0) { 
            →UNK000_007578TEXT("Design value of resistance of concrete compressive strut"); 
            n↓Rd.sc← →UNK000_007272= x↓c←*Red↓fcd←*f↓cd←; 
            →UNK000_007579TEXT("Design force in concrete compressive strut"); 
            →UNK000_008022TEXT("n↓Ed.sc← =" &amp; CUnit(n↓Ed.sc←, "kip/ft") &amp; "kip/ft"); 
            →UNK000_007580TEXT("Unity check"); 
            IF(COMPARE(n↓Rd.sc←, 0.0, 15) != 0) { 
                UC↓sc← →UNK000_007278= ABS(n↓Ed.sc←)/n↓Rd.sc←; 
            } ELSE { 
                UC↓sc← →UNK000_008021= 0; 
            } 
        } 
        return new Structure("nRdsc", n↓Rd.sc←, "UC", UC↓sc←); 
    } 
} 

//Draw header for 2D member type
→INI400_013979BLOCK("DrawHeader()") { 
    object DrawHeader(string MemberName, string MemberType, string Position, string NormCode) { 
        object fontsColors →INI400_012730= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\FontsAndColors.CLC"); 
        object FontsAndColors →INI400_012732= fontsColors.GetFontsAndColors(); 
        object HeaderPen →INI400_014933= new Pen(FontsAndColors.ColorTableHeader(), 0); 
        object HeaderBorderPen →INI400_015234= new Pen(Color.Black, 0); 
        object HeaderTable →INI400_009725= new Table(2); 
        object LeftSubTable →INI400_014918= new Table(1); 
        LeftSubTable[0][0].Value →INI400_014919= TR("Member") &amp; " " &amp; MemberName; 
        LeftSubTable[1][0].Value →INI400_014922= NormCode; 
        LeftSubTable[0][0].Font →INI400_014934= FontsAndColors.TableBigHeaderFont(); 
        LeftSubTable[1][0].Font →INI400_014935= FontsAndColors.TableCellsFont(); 
        LeftSubTable.Padding.All →INI400_014924= 0; 
        LeftSubTable.Padding.Left →PAI121_000004= 5; 
        LeftSubTable.Columns[0].Width →PAI121_000005= 300; 
        LeftSubTable.GridPen →PAI121_000013= FontsAndColors.TableGridPen(); 
        LeftSubTable.BorderPen →PAI121_000008= FontsAndColors.WhitePen(); 
        LeftSubTable[0][0].BackColor →INI400_009731= FontsAndColors.ColorTableHeader(); 
        object RightSubTable →INI400_009739= new Table(2); 
        RightSubTable[0][0].Value →INI400_009743= TR("Type"); 
        RightSubTable[0][1].Value →INI400_009752= MemberType; 
        RightSubTable[1][0].Value →INI400_009744= TR("Location"); 
        RightSubTable[1][1].Value →INI400_009753= Position; 
        RightSubTable.Font →INI400_009755= FontsAndColors.TableCellsFont(); 
        RightSubTable.Padding.All →INI400_009745= 0; 
        RightSubTable.Padding.Left →INI400_009751= 5; 
        RightSubTable.Columns[0].Width →INI400_009740= 60; 
        RightSubTable.Columns[1].Width →INI400_009754= 240; 
        RightSubTable[0][1].Font →PAI121_000002= FontsAndColors.TableBigHeaderFont(); 
        RightSubTable.GridPen →INI400_015228= FontsAndColors.TableGridPen(); 
        RightSubTable.BorderPen →INI400_015229= FontsAndColors.WhitePen(); 
        HeaderTable[0][0].Value =  { →INI400_014931LeftSubTable.Draw(); } 
        HeaderTable[0][1].Value =  { →INI400_010037RightSubTable.Draw(); } 
        HeaderTable.Padding.All →INI400_009736= 0; 
        HeaderTable.BorderPen →INI400_009734= FontsAndColors.TableBorderPen(); 
        HeaderTable.GridPen →INI400_009750= FontsAndColors.TableGridPen(); 
        HeaderTable.Columns[0].Width →INI400_007779= 300; 
        HeaderTable.Columns[1].Width →INI400_009729= 300; 
        HeaderTable[0][0].Alignment →INI400_009737= ContentAlignment.TopLeft; 
        →INI400_009867HeaderTable.Draw(); 
    } 
} 

→UNK000_015240BLOCK("DrawHeaderForSEN()") { 
    void DrawHeaderForSEN() { 
        double MeshElemType →UNK000_015238= IO.Member2D.Member.MeshElementType; //TODO
        double MemberType →UNK000_007165= IO.MemberData.ConcreteIBC.MemberType2D; 
        double PointID →UNK000_009933= IO.Point.ID; 
        double ElemID →UNK000_014709= IO.Point.MeshElemID; 
        double x →UNK000_014602= IO.Point.X; 
        double y →UNK000_014603= IO.Point.Y; 
        double z →UNK000_014604= IO.Point.Z; 
        double h →UNK000_014710= IO.Point.H; 
        string sMemberName →UNK000_014601= GetStringOfLimitedLength(IO.Member2D.Member.Name, 15); 
        string sMemberType →UNK000_014711= GetMemberTypeAsString(MemberType) &amp; "  [h=" &amp; CUnit(h, "in") &amp; "in]"; 
        string sPosition →UNK000_014708= GetMeshElementTypeAsString(MeshElemType) &amp; " " &amp; ElemID &amp; "/" &amp; PointID &amp; "  [" &amp; "X=" &amp; CUnit(x, "ft") &amp; "ft" &amp; ", Y=" &amp; CUnit(y, "ft") &amp; "ft" &amp; ", Z=" &amp; CUnit(z, "ft") &amp; "ft]"; 
        string sNormCode →UNK000_014760= "ACI 318-05"; 
        →UNK000_015236DrawHeader(sMemberName, sMemberType, sPosition, sNormCode); 
    } 
} 


→UNK000_014826BLOCK("DrawListOfCombi()") { 
    void DrawListOfCombi(object obArrayForces) { 
        object fontsColors →UNK000_014827= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\FontsAndColors.CLC"); 
        object FontsAndColors →UNK000_014828= fontsColors.GetFontsAndColors(); 
        double Ncolumns →UNK000_014829= 2; 
        double Nrows →UNK000_014830= 2; 
        object T_Area →UNK000_014831= new Table(Ncolumns); 
        //header
        T_Area[0][0].Value →UNK000_014875= TR("Case"); 
        T_Area[0][1].Value →UNK000_014833= TR("Combination key"); 
        FOR(i, obArrayForces[0].Count-1, 0) { 
            T_Area[i+1][0].Value →UNK000_014840= obArrayForces[0][i].CombiID; 
            T_Area[i+1][1].Value →UNK000_014847= obArrayForces[0][i].Combikey; 
            T_Area[i+1][0].BackColor →UNK000_014877= FontsAndColors.ColorTableRow(); 
        } 
        //format 
        T_Area.Columns[1].Wrap →UNK000_014848= True; 
        T_Area.Columns[0].Width →UNK000_014849= 50; 
        FOR(i, 1, Ncolumns-1) { 
            T_Area.Columns[i].Width →UNK000_014851= Convert.ToSingle((FontsAndColors.TableWidth()-50)/(Ncolumns-1)); 
        } 
        T_Area.Padding.All →UNK000_014854= 5; 
        T_Area.Padding.Top →UNK000_014855= Convert.ToSingle(→UNK000_014856FontsAndColors.PaddingTableOverall()); 
        T_Area.Padding.Bottom →UNK000_014857= Convert.ToSingle(→UNK000_014858FontsAndColors.PaddingTableOverall()); 
        T_Area.Font →UNK000_014859= FontsAndColors.TableCellsFont(); 
        T_Area[0].Font →UNK000_014860= FontsAndColors.TableHeaderFont(); 
        T_Area.BorderPen →UNK000_014861= FontsAndColors.TableBorderPen(); 
        T_Area.GridPen →UNK000_014862= FontsAndColors.TableGridPen(); 
        T_Area[0].BorderPen →UNK000_014863= FontsAndColors.TableBorderPen(); 
        T_Area.Rows[0].BackColor →UNK000_014864= →UNK000_014865FontsAndColors.ColorTableHeader(); 
        →UNK000_014866TEXT("List of critical combinations"); 
        →UNK000_014867T_Area.Draw(); 
    } 
} 


→UNK000_015248BLOCK("GetStringOfLimitedLength()") { 
    string GetStringOfLimitedLength(string InputString, double LimitLength) { 
        IF(InputString.Length &gt; LimitLength) { 
            return InputString.Substring(0, LimitLength) &amp; "..."; 
        } 
        ELSE { 
            return InputString; 
        } 
    } 
} 

//Returns member type as a string
→UNK000_013982BLOCK("GetMemberTypeAsString()") { 
    string GetMemberTypeAsString(double MemberType) { 
        SWITCH(MemberType) { 
            CASE 16 :  { return TR("Plate"); } 
            CASE 32 :  { return TR("Wall"); } 
            CASE 64 :  { return TR("Shell"); } 
            DEFAULT :  { return TR("Plate"); } 
        } 
    } 
} 


→UNK000_015239BLOCK("GetMeshElementTypeAsString()") { 
    string GetMeshElementTypeAsString(double MeshElType) { 
        SWITCH(MeshElType) { 
            CASE 0 :  { return TR("Node"); } 
            CASE 1 :  { return TR("Element"); } 
        } 
    } 
} 


//@Functions for creating info about 2D reinforcement
→UNK000_005830BLOCK("InfoReinf2D()") { 
    object InfoReinf2D(double As, double ds, double b) { 
        double DistanceStep →UNK000_013978= 0.01; 
        double n →UNK000_005837= As/(0.25*Math.PI*ds*ds); 
        double s →UNK000_007191= 0; 
        double s_round →UNK000_013980= 0; 
        string Info →UNK000_007194= TR("no reinf."); 
        IF(n &gt; 0) { 
            s →UNK000_005838= b/n; 
            s_round →UNK000_007196= DistanceStep*ROUNDDOWN(s/DistanceStep); 
            Info →UNK000_005839= "ϕ" &amp; (CUnit(ds, "in")).ToString("0") &amp; "/" &amp; (CUnit(s_round, "in")).ToString("0") &amp; " (" &amp; n.ToString("0.0") &amp; "ϕ/ft)"; 
        } 
        return new Structure("n", n, "s", s_round, "Info", Info); 
    } 
} 


→UNK000_014900BLOCK("SetPracticalReinf()") { 
    void SetPracticalReinf(object ReinfDesignData, double SpacingIncr) { 
        object FUNCT_BAR →REZ006_000010= LoadExternCLC(Tools.Dir_Forms &amp; "Concrete_IBC\Functions\ACI_Functions2D_RebarInfo.CLC"); 
        →REZ006_000007TEXT("- Calculate number of rebars(n), space between rebars(s) and provided reinforcement area(As↓prov←)"); 
        FOR(i, 0, 3) { 
            double As_sum →UNK000_014901= MAX(ReinfDesignData[i].As_req, ReinfDesignData[i].As_det_min); 
            double ds →UNK000_014914= ReinfDesignData[i].ds; 
            double Barno →UNK000_016209= FUNCT_BAR.BarNoCalculation(ds); 
            double b →UNK000_016211= physconst(1.0, "ft"); 
            IF(As_sum &gt; 0) { 
                →UNK000_016217TEXT(ReinfDesignData[i].Descript); 
                double n →UNK000_014903= ROUNDUP(As_sum/(0.25*Math.PI*ds*ds)); 
                →UNK000_016213TEXT("n =" &amp; 'As↓req←/(0.25*π*b*ϕ↑2←)' &amp; " = " &amp; n); 
                double s →UNK000_014912= SpacingIncr*ROUNDDOWN(b/n/SpacingIncr); 
                →UNK000_016214TEXT("s =" &amp; 'b/n' &amp; " = " &amp; CUnit(s, "in") &amp; " in"); 
                IF(COMPARE(s, 0, 5) != 0) { 
                    double As_prov →UNK000_014916= 0.25*Math.PI*ds*ds*b/s; 
                } ELSE { 
                    double As_prov →REZ106_000001= 0.25*Math.PI*ds*ds*b/(b/n); 
                } 
                →UNK000_016216TEXT(" As↓prov← = " &amp; '0.25*π*ϕ↑2←*b/s' &amp; " = " &amp; CUnit(As_prov, "in↑2←") &amp; " in↑2←"); 
                →UNK000_014917ReinfDesignData[i].Set("As_prov", As_prov); 
                →UNK000_014913ReinfDesignData[i].Set("Info", 
                "#" &amp; Barno.ToString() &amp; 
                "@" &amp; (CUnit(s, "in")).ToString("0")); 
            } 
        } 
    } 
} 

</SourceCode>
  </CodeEditor>
  <Calculation>
    <Header NormCode="0" Member="1000" Material="0" CSType="-1" LimitState="0" IFFilter="0" LicenceID="10200" Autor="" Autor2="" Version="14" EWNSource="" Icon="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">
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
      <Style Key="%Def" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" />
      <Style Key="Formula 1" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Subchapter 1" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|1|2" />
      <Style Key="Text 1" X="15" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 3" X="30" Y="0" Hor="4" Ver="2" SpX="10" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="None" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Note" X="0" Y="547" Hor="0" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|2|2" Font2="Segoe UI|14|2|2" />
      <Style Key="Remark" X="50" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|2|2" />
      <Style Key="Subchapter 2" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="10" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" />
      <Style Key="Chapter" X="0" Y="0" Hor="0" Ver="4" SpX="0" SpY="30" Font1="Segoe UI|18|0|2" Font2="Segoe UI|18|1|2" />
      <Style Key="Text 2" X="30" Y="0" Hor="0" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 4" X="50" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="NormReference" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 5" X="50" Y="0" Hor="1" Ver="4" SpX="15" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 6" X="175" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" />
      <Style Key="Text 3 (bold)" X="0" Y="0" Hor="4" Ver="2" SpX="5" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|1|2" />
    </Styles>
    <NormRef>
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|11|0|2" Font2="Arial|11|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      <Set Vis="1" Prev="" Style="0" StyleName="" X="600" Y="0" Hor="0" Ver="2" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
    </NormRef>
    <Variables>
      <Variable Modifier="Public" Name="Alpha" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Alpha">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Appc" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Appc">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ArrayReinf" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ArrayReinf">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="As" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_As">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="As_prov" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_As_prov">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="As_sum" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_As_sum">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="As↓req←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_As↓req←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="b" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_b">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Barno" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Barno">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="c" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_c">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Coeff" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Coeff">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CoordFibreX" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_CoordFibreX">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CoordFibreY" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_CoordFibreY">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="CssFor1D" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_CssFor1D">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="d" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_d">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="DistanceStep" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_DistanceStep">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ds" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_ds">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ElemID" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_ElemID">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Empty" ESA_ID="" Type="String">
        <Description TranslateID="VARIABLE_Empty">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="f↓cd←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_f↓cd←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="FontsAndColors" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_FontsAndColors">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="FUNCT_BAR" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_FUNCT_BAR">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="h" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_h">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="HeaderBorderPen" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_HeaderBorderPen">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="HeaderPen" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_HeaderPen">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="HeaderTable" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_HeaderTable">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="i" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_i">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Info" ESA_ID="" Type="String">
        <Description TranslateID="VARIABLE_Info">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="j" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_j">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="LeftSubTable" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_LeftSubTable">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="m_shift" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_m_shift">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="m_shift_max" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_m_shift_max">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="m_shift_min" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_m_shift_min">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="m↓1←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_m↓1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="m↓2←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_m↓2←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="MemberType" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_MemberType">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="minc" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_minc">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_n">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="n↓Rd.sc←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_n↓Rd.sc←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Ncol" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Ncol">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Ncolumns" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Ncolumns">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NFibre" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_NFibre">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="NReinf" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_NReinf">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Nrow" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Nrow">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="Nrows" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Nrows">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="PointID" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_PointID">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="pom" ESA_ID="" Type="Boolean">
        <Description TranslateID="VARIABLE_pom">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="Red↓fcd←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_Red↓fcd←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ReinfBars" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ReinfBars">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="RightSubTable" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_RightSubTable">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="s" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_s">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="s_round" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_s_round">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="SFormula" ESA_ID="" Type="String">
        <Description TranslateID="VARIABLE_SFormula">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="ShapeCss" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_ShapeCss">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="sign" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_sign">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="sMemberName" ESA_ID="" Type="String">
        <Description TranslateID="VARIABLE_sMemberName">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="sMemberType" ESA_ID="" Type="String">
        <Description TranslateID="VARIABLE_sMemberType">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="sNormCode" ESA_ID="" Type="String">
        <Description TranslateID="VARIABLE_sNormCode">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SpacingIncr" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_SpacingIncr">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="sPosition" ESA_ID="" Type="String">
        <Description TranslateID="VARIABLE_sPosition">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SvalueAlpha" ESA_ID="" Type="String">
        <Description TranslateID="VARIABLE_SvalueAlpha">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="SVariable" ESA_ID="" Type="String">
        <Description TranslateID="VARIABLE_SVariable">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="T_Area" ESA_ID="" Type="Object">
        <Description TranslateID="VARIABLE_T_Area">
          <ENU>
          </ENU>
        </Description>
      </Variable>
      <Variable Modifier="Public" Name="UC↓sc←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_UC↓sc←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="val" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_val">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="value1" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_value1">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="value1↓pom←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_value1↓pom←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="value2" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_value2">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="value2↓pom←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_value2↓pom←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="valueAlpha" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_valueAlpha">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="valueX" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_valueX">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="valueXY" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_valueXY">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="valueY" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_valueY">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="x" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_x">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="x↓c←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_x↓c←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="y" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_y">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="z" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_z">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="α↓1←" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_α↓1←">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="π" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_π">
          <ENU>
          </ENU>
        </Description>
        <Unit m="0" kg="0" s="0" A="0" K="0" cd="0" mol="0" Coef="1" Dim="" />
      </Variable>
      <Variable Modifier="Public" Name="ϕ" ESA_ID="" Type="Double" Precision="2">
        <Description TranslateID="VARIABLE_ϕ">
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
          <ENU>Standard</ENU>
        </Names>
      </Layout>
      <Layout Active="True">
        <Names TranslateID="LAYOUT_1">
          <ENU>Detailed</ENU>
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
      <VC ID="">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_007779">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009725">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009729">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009731">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009734">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009736">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009737">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009739">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009740">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009743">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009744">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009745">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009750">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009751">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009752">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009753">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009754">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009755">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_009867">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|11|0|2" Font2="Segoe UI|11|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_010037">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_012730">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_012732">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_013979">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_014918">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_014919">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_014922">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_014924">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_014931">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="INI400_014933">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_014934">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_014935">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="INI400_015228">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_015229">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="INI400_015234">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI121_000002">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="PAI121_000004">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="PAI121_000005">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="PAI121_000008">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="PAI121_000013">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000007">
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000008">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000009">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000010">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000011">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000012">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000013">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000014">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000015">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ006_000016">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="REZ106_000001">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_002858">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_002899">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="UNK000_002941">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_002972">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_002977">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005286">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005290">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005291">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005292">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005293">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005294">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005435">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="23" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005436">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="60.5" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005437">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="87.3" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005438">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="108" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005439">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005440">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005474">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="901" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="901" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005475">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="901" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="901" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005476">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="901" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="901" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005477">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="901" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="901" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005478">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="901" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="901" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005492">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="732" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="732" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005495">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="753" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="753" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005496">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="773" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="773" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005497">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="794" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="376" Y="794" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005498">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005571">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2127" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2124" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005781">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2148" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2145" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2145" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005782">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2314" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2312" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2312" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005783">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2168" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2166" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005784">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2348" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2346" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005785">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1836" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1834" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1834" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005787">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2375" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2373" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2373" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005788">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2355" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2353" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2353" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005790">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="1849" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1847" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="1847" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005791">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="2335" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2333" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005803">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005815">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005816">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005820">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005821">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005823">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="5" Font1="Segoe UI|13|0|2" Font2="Segoe UI|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005824">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005826">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005827">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005828">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005829">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005830">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005837">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005838">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_005839">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_006912">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_006913">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_006914">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007149">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007154">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007156">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007158">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007165">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007191">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007194">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007196">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007197">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007198">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007199">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007204">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007207">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007208">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007209">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007271">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007272">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007276">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007278">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007528">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007534">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007577">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007578">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="1220" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="737" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="737" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="739" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="15" Y="156" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="15" Y="2292" Hor="0" Ver="4" SpX="2" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007579">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007580">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007606">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007785">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007787">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_007864">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_008021">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_008022">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_008023">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_009933">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_009988">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_009989">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_009990">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010225">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010227">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010785">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010786">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010788">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010789">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010790">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010791">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010792">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010795">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010796">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010797">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010798">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010799">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010800">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010801">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010802">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010803">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010804">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010805">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_010936">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_013597">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_013978">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_013980">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_013982">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014601">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014602">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014603">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014604">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014708">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014709">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014710">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014711">
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014731">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014732">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014734">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014760">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014826">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014827">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014828">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014829">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014830">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014831">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014833">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014840">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014847">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014848">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014849">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014851">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014854">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014855">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014857">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="42.5" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014859">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014860">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014861">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014862">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014863">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014864">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014866">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014867">
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="" X="0" Y="0" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Arial|13|0|2" Font2="Arial|13|0|2" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014875">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014877">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014900">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014901">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014903">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014912">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014913">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014914">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014916">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_014917">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015071">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015072">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015236">
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015238">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015239">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015240">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015248">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015253">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015254">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015255">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015257">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015260">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015262">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_015263">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016086">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016088">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016089">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016090">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016097">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016098">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016129">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016130">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016131">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016136">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016156">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016157">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016158">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016159">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016160">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016161">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016163">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016166">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016167">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016168">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016169">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016177">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016178">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016179">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016180">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016181">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016182">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016183">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016185">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016192">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016193">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016194">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016195">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016196">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016209">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016211">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016213">
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Formula 1" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016214">
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016216">
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="Text 3" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016217">
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="1" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016241">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016242">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016243">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016244">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016245">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016248">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016249">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016250">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016252">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016253">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016254">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016255">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016256">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016257">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016258">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016260">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016261">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016262">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016263">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016264">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016265">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016269">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016270">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016271">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016272">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016273">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016274">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016275">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016276">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016277">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016278">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016279">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016280">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016281">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016282">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016283">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016284">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016285">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016286">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016287">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016288">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016289">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016290">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016297">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016298">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016299">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016301">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016302">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016303">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016304">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016305">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016306">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016307">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016309">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016310">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016312">
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016314">
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="2" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016316">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016317">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016319">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016320">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016321">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016322">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016323">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016324">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016325">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016329">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016335">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016336">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016337">
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="23.8" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="" X="0" Y="9.31" Hor="1" Ver="4" SpX="0" SpY="0" Font1="Segoe UI|14|0|2" Font2="Segoe UI|14|0|2" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016339">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016340">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016341">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016342">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016343">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016344">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016345">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016347">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016348">
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016349">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016351">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016352">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016353">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016356">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_016357">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017396">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017397">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017398">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017399">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017400">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017401">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
      <VC ID="UNK000_017402">
        <Set Vis="0" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="0" Prev="" Style="0" StyleName="None" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
        <Set Vis="1" Prev="" Style="0" StyleName="%Def" EqStyle="23" />
      </VC>
    </VisualComponents>
    <Images />
  </Calculation>
  <Dialog>
    <Main Width="500">
      <TEMDLoader Name="" ID="17" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="4|4|4|4" MinSize="465|4" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="2" Font="Microsoft Sans Serif|7.8|0|3" Active="1" PreDef="0" MemberDirectory="" MemberID="Member2D.1" SectionID="-1" CombiID="-1" />
      <TGroupBox Name="" ID="8" Translate="0" Height="4" AutoWidth="False" AutoHeight="False" TabIndex="1" Dock="1" Anchor="5" Padding="5|15|5|5" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|9|1|3" BorderColor="-5192482">
        <Texts>
          <ENU>2D element properties</ENU>
        </Texts>
        <TDoubleInput Name="" ID="16" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="7" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="15" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="6" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="14" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="5" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="13" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="4" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="12" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="3" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="11" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="2" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="10" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="1" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
        <TDoubleInput Name="" ID="9" Translate="1" AutoWidth="False" AutoHeight="True" TabIndex="0" Dock="1" Anchor="5" Padding="3|3|3|3" MinSize="0|0" MaxSize="0|0" BGImage="" BackColor="-1" BorderStyle="0" Font="Microsoft Sans Serif|8.25|0|3" VarName="" VarNameVisible="True" UnitsVisible="True" InputColor="-4128832" InputWidth="75" DimWidth="50" MaxValueWithDim="+Infinity" MinValueWithDim="-Infinity" DescPos="1" />
      </TGroupBox>
    </Main>
    <MemberData Width="500" />
    <Setup Width="500" />
    <Command Width="500" />
  </Dialog>
  <Texts>
    <Item ID="BLOCK_INI400_013979">
      <ENU>"DrawHeader()"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_005828">
      <ENU>"Functions for calculation principal moment and directions"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_005830">
      <ENU>"InfoReinf2D()"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_007197">
      <ENU>"Functions for calculation provided area of reinforcement"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_007209">
      <ENU>"Functions for check of concrete strut"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_008023">
      <ENU>"Functions for calculation of single value of shifting moment for a direction"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_013982">
      <ENU>"GetMemberTypeAsString()"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_014826">
      <ENU>"DrawListOfCombi()"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_014900">
      <ENU>"SetPracticalReinf()"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_015239">
      <ENU>"GetMeshElementTypeAsString()"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_015240">
      <ENU>"DrawHeaderForSEN()"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_015248">
      <ENU>"GetStringOfLimitedLength()"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_015253">
      <ENU>"IsExtremCombExist()"</ENU>
    </Item>
    <Item ID="BLOCK_UNK000_015254">
      <ENU>"SameAngle()"</ENU>
    </Item>
    <Item TranslateID="STRING_02DFBC08">
      <ENU>"Concrete exposed to earth or weather"</ENU>
    </Item>
    <Item TranslateID="STRING_046F672A">
      <ENU>"Concrete not exposed to weather or earth"</ENU>
    </Item>
    <Item TranslateID="STRING_05F134D9">
      <ENU>"no reinf."</ENU>
    </Item>
    <Item TranslateID="STRING_0A1663ED">
      <ENU>"Material"</ENU>
    </Item>
    <Item TranslateID="STRING_0D326B44">
      <ENU>"Bar No."</ENU>
    </Item>
    <Item TranslateID="STRING_0DBD7F5D">
      <ENU>"Wall"</ENU>
    </Item>
    <Item TranslateID="STRING_10116E4C">
      <ENU>"Type"</ENU>
    </Item>
    <Item TranslateID="STRING_1237E10A">
      <ENU>"No stress"</ENU>
    </Item>
    <Item TranslateID="STRING_1BE10D0A">
      <ENU>"Circular tension"</ENU>
    </Item>
    <Item TranslateID="STRING_21322E58">
      <ENU>"Surface /Direction"</ENU>
    </Item>
    <Item TranslateID="STRING_2F4F06A1">
      <ENU>"Specified yield strength of shear reinforcement"</ENU>
    </Item>
    <Item TranslateID="STRING_3887C8DC">
      <ENU>"App. Cover"</ENU>
    </Item>
    <Item TranslateID="STRING_4C875BE5">
      <ENU>"Equal hyperbolic"</ENU>
    </Item>
    <Item TranslateID="STRING_5BEE1FB7">
      <ENU>"UppSurface"</ENU>
    </Item>
    <Item TranslateID="STRING_61DEE415">
      <ENU>"Low Cover"</ENU>
    </Item>
    <Item TranslateID="STRING_6DF930CE">
      <ENU>"LowerSurface"</ENU>
    </Item>
    <Item TranslateID="STRING_6F45EF7A">
      <ENU>"Check"</ENU>
    </Item>
    <Item TranslateID="STRING_708E4F83">
      <ENU>"Shell"</ENU>
    </Item>
    <Item TranslateID="STRING_70E068C6">
      <ENU>"Value"</ENU>
    </Item>
    <Item TranslateID="STRING_797911C9">
      <ENU>"Combination key"</ENU>
    </Item>
    <Item TranslateID="STRING_80762B47">
      <ENU>"Min. Cover"</ENU>
    </Item>
    <Item TranslateID="STRING_8BFD2E8F">
      <ENU>"Concrete permanently exposed to earth"</ENU>
    </Item>
    <Item TranslateID="STRING_915B3BF1">
      <ENU>"Specified yield strength of longitudinal reinforcement"</ENU>
    </Item>
    <Item TranslateID="STRING_91B98CC9">
      <ENU>"Parabolic pressure"</ENU>
    </Item>
    <Item TranslateID="STRING_9606F287">
      <ENU>"No state"</ENU>
    </Item>
    <Item TranslateID="STRING_9B9082F6">
      <ENU>"Surface"</ENU>
    </Item>
    <Item TranslateID="STRING_A17A8601">
      <ENU>"Plate"</ENU>
    </Item>
    <Item TranslateID="STRING_A63C72DC">
      <ENU>"Expose Group"</ENU>
    </Item>
    <Item TranslateID="STRING_AF36707D">
      <ENU>"Location"</ENU>
    </Item>
    <Item TranslateID="STRING_B956322B">
      <ENU>"Description"</ENU>
    </Item>
    <Item TranslateID="STRING_C2EAB732">
      <ENU>"Node"</ENU>
    </Item>
    <Item TranslateID="STRING_C54BE091">
      <ENU>"Specified compressive strength of concrete"</ENU>
    </Item>
    <Item TranslateID="STRING_C89C76A6">
      <ENU>"Eliptic tension"</ENU>
    </Item>
    <Item TranslateID="STRING_CAB5396F">
      <ENU>"Member"</ENU>
    </Item>
    <Item TranslateID="STRING_CD6A73A7">
      <ENU>"Element"</ENU>
    </Item>
    <Item TranslateID="STRING_D6D8BF99">
      <ENU>"Circular pressure"</ENU>
    </Item>
    <Item TranslateID="STRING_E183C52F">
      <ENU>"Symbol"</ENU>
    </Item>
    <Item TranslateID="STRING_E4F9312D">
      <ENU>"Weak hyperbolic"</ENU>
    </Item>
    <Item TranslateID="STRING_E9855441">
      <ENU>"Parabolic tension"</ENU>
    </Item>
    <Item TranslateID="STRING_EC8DBA2D">
      <ENU>"Strong hyperbolic"</ENU>
    </Item>
    <Item TranslateID="STRING_F0B04264">
      <ENU>"Eliptic pressure"</ENU>
    </Item>
    <Item TranslateID="STRING_FEF1B86E">
      <ENU>"Case"</ENU>
    </Item>
    <Item TranslateID="TEXT_REZ006_000007">
      <ENU>"- Calculate number of rebars(n), space between rebars(s) and provided reinforcement area(As↓prov←)"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_005820">
      <ENU>SVariable &amp; SFormula &amp; " ="</ENU>
    </Item>
    <Item ID="TEXT_UNK000_005823">
      <ENU>Empty &amp; "=" &amp; valueX*COS(Alpha)↑2←+valueY*SIN(Alpha)↑2←+valueXY*SIN(2*Alpha) &amp; " = " &amp; Val(valueAlpha*Coeff, 2) &amp; SUnit</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_007577">
      <ENU>"Check of concrete strut at lower surface, direction α↓sc← ="</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_007578">
      <ENU>"Design value of resistance of concrete compressive strut"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_007579">
      <ENU>"Design force in concrete compressive strut"</ENU>
    </Item>
    <Item TranslateID="TEXT_UNK000_007580">
      <ENU>"Unity check"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_007606">
      <ENU>Val(α↓sc←, 2) &amp; " °"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_008022">
      <ENU>"n↓Ed.sc← =" &amp; CUnit(n↓Ed.sc←, "kip/ft") &amp; "kip/ft"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_014866">
      <ENU>"List of critical combinations"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_016213">
      <ENU>"n =" &amp; 'As↓req←/(0.25*π*b*ϕ↑2←)' &amp; " = " &amp; n</ENU>
    </Item>
    <Item ID="TEXT_UNK000_016214">
      <ENU>"s =" &amp; 'b/n' &amp; " = " &amp; CUnit(s, "in") &amp; " in"</ENU>
    </Item>
    <Item ID="TEXT_UNK000_016216">
      <ENU>" As↓prov← = " &amp; '0.25*π*ϕ↑2←*b/s' &amp; " = " &amp; CUnit(As_prov, "in↑2←") &amp; " in↑2←"</ENU>
    </Item>
  </Texts>
</Root>